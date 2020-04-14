`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137, 2020 -04 -08
module sseg4_TDM_test();
    reg [15:0] data;
    reg hex_dec, sign, reset, clock;
    wire [7:0] seg;
    wire dp;
    wire [3:0] an;

    sseg4_TDM TDM_test(.data(data), 
        .hex_dec(hex_dec), .sign(sign), .reset(reset), 
        .clock(clock),.seg(seg),.dp(dp),.an(an));
        
    // clock  runs  continuously
    always  begin
    clock = ~clock; #5;
    end 
    
    //integer i;
    
    initial begin
        data = 16'h0000; clock = 0; reset =0; #7;
        reset = 1; #3; //  reset
        /*data = 16'h1234;*/ reset = 0; hex_dec = 0; sign = 0; #5;
        /*for ( i =0; i <= 60000; i = i +1)begin 
            hex_dec = 0; sign = 1; #5; 
        end*/
        hex_dec = 0; sign = 0; #1000000
        $finish;
    end

endmodule