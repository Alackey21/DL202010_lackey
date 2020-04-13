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
    initial begin
        data = 16'b0000010100110001; clock = 0; reset =0; #7;
        reset = 1; #3; //  reset
        hex_dec = 0; sign = 0; #5;
        hex_dec = 1; sign = 1; #5;
        hex_dec = 0; sign = 0; #5;
        hex_dec = 1; sign = 1; #5;
        $finish;
    end

endmodule