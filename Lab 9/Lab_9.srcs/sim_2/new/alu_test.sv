`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137, 2020 -03 -26
module alu_test();
    wire[7:0] aluout;
    reg [7:0] aluin0;
    reg [7:0] aluin1; 
    reg  [3:0] aluop;
    alu #(.N(8)) alutest(.out(aluout), .in0(aluin0), .in1(aluin1), .op(aluop));
    
    initial  begin
        aluin0 = 8'h6; aluin1 = 8'h7; #10;
        aluin0 = 8'h0; aluin1 = 8'h2; aluop = 4'h0; #10;
        aluin0 = 8'hC; aluin1 = 8'h4; aluop = 4'h1; #10;
        aluin0 = 8'hA; aluin1 = 8'hA; aluop = 4'h2; #10;
        aluin0 = 8'h0; aluin1 = 8'h3; aluop = 4'h3; #10;
        aluin0 = 8'h1; aluin1 = 8'h0; aluop = 4'h4; #10; 
        $finish;
    end

endmodule