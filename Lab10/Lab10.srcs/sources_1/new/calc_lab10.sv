`timescale 1ns / 1ps

module calc_lab10(input btnU, btnD,
    input [15:0] sw,
    input clk, btnC,
    output [15:0] led,
    output dp ,
    output [3:0] an,
    output [6:0] seg);


    top_lab9 calc_unit(.btnU(btnU), .btnD(btnD),.sw(sw),.clk(clk), .btnC(btnC),.led(led));
    
    sseg4_TDM disp_unit(.data({8'b00000000, led[15:8]}),.hex_dec(sw[15]), .sign(sw[14]),
     .reset(btnC), .clock(clk),.seg(seg),.dp(dp),.an(an));
endmodule
