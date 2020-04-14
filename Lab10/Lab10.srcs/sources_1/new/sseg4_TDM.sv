`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137 , 2020 -04 -13

module sseg4_TDM(
    input [15:0] data,
    input hex_dec, sign, reset, clock,
    output reg [7:0] seg,
    output reg dp,
    output reg [3:0] an);
    
    wire [17:0] count_dontcare; 
    wire tick_out;
    counter #(.N(18)) timer(.clk(clock),.en(1), .rst(reset), 
        .count(count_dontcare), .tick(tick_out) );
    
    wire [1:0] digit_sel;
    wire tick_dontcare;
    counter #(.N(2)) counter2(.clk(clock),.en(tick_out), .rst(reset),
         .count(digit_sel), .tick(tick_dontcare) );
    
    wire [15:0] bcd11out ;
    bcd11 TDM_bcd11 (.B(data [10:0]) , .Boutfinal(bcd11out) ) ;
    
    wire [15:0] mux2_1_out ;
    mux2 #(. N (16) ) TDM_mux2_1 (.in0(data [15:0]) , .in1(bcd11out) , .sel(
    hex_dec) , .out(mux2_1_out) );
    
    wire [3:0] mux4_out;
    mux4 TDM_mux4 (. in0 ( mux2_1_out [3:0]) , . in1 ( mux2_1_out [7:4]) ,. in2 (
    mux2_1_out [11:8]) , . in3 ( mux2_1_out [15:12]) , . sel ( digit_sel ) , . out (
    mux4_out ) ) ;
    
    wire [6:0] sseg_decoder_out ;
    sseg_decoder TDM_decode (. num ( mux4_out ) , . sseg ( sseg_decoder_out ) ) ;
    
    wire [3:0] decoder_out ;
    an_decode an_decode_TDM (. in ( digit_sel ) , . out ( decoder_out ) ) ;
    
    wire mux22_in ;
    assign mux22_in = ~ decoder_out [3] & sign ;
    mux2 #(.N(7)) TDM_mux2_2 (.in0( sseg_decoder_out ) , .in1(7'b0111111 ) , .sel ( mux22_in ) , . out ( seg ) ) ;
    
    assign dp = 1;
    assign an = decoder_out ;
endmodule
