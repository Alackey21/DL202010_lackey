`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guessing_game(input btnU, btnR, btnD, btnL, btnC,
    input clk, 
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led);
    
    wire [3:0] dbo;
    wire t1, t2, t3, t4;
    debounce #(.N(2)) db1(.clk(clk) , .reset(btnC), .in(btnU), .out(dbo[0]) , .tick(t1));
    debounce #(.N(2)) db2(.clk(clk) , .reset(btnC), .in(btnR), .out(dbo[1]) , .tick(t2));
    debounce #(.N(2)) db3(.clk(clk) , .reset(btnC), .in(btnD), .out(dbo[2]) , .tick(t3));
    debounce #(.N(2)) db4(.clk(clk) , .reset(btnC), .in(btnL), .out(dbo[3]) , .tick(t4));
    
    wire newclock;
    wire countdc;
    counter #(.N(2)) counter1 (.clk(clk), .rst(btnC), .en(1) ,.count(countdc),.tick(newclock));
    
    wire muxout;
    mux2_4b (.in0(clk),
 .in1(newclock), .sel(sw[0]),
 .out(muxout));
    
    wire [3:0] yout;
    guess_FSM #(.N(4)) topmod (.clk(muxout), .reset(btnC), .b(dbo), .y(yout), .win(led[15]), .lose(led[0]));
    
    assign seg[0] = ~yout[0];
    assign seg[1] = ~yout[1];
    assign seg[5] = ~yout[2];
    assign seg[6] = ~yout[3];
    assign seg[4:2] = 3'b111;
    assign an[3:1] = 3'b111;
    assign an[0] = 0;
    assign led[14:1] = 0;
    
endmodule
