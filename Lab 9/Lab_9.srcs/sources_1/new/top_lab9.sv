`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137, 2020 -03 -26
module top_lab9(input btnU, btnD,
    input [11:0] sw,
    input clk, btnC,
    output [15:0] led);
    
    wire [7:0] regout1;
    register #(.N(8)) reg1(.D(sw[7:0]), .clk(clk), .en(btnD), .rst(btnC), .Q(regout1));
    
    wire [7:0] aluout;
    alu #(.N(8)) alutest(.out(aluout), .in0(sw[7:0]), .in1(regout1), .op(sw[11:8]));
    
    register #(.N(8)) reg2(.D(aluout), .clk(clk), .en(btnU), .rst(btnC), .Q(led[15:8]));
    
    assign led[7:0] = regout1;
endmodule
