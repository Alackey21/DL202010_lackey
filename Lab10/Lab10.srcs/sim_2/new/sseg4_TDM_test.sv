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
        data = 16'b0000010100110001; #5
        clk =0; en =0; rst =0; D =4 ' h0 ; #7;
        rst = 1; #3; // reset
        D = 4 ' hA ; en = 1; rst = 0; #10;
        D = 4 ' h3 ; #2;
        en = 0; #5;
        en = 1; #3;
        D = 4 ' h0 ; #2;
        en = 0; #10;
        en = 1; #2;
        D = 4 ' h6 ; #11;
        $finish;
    end

endmodule