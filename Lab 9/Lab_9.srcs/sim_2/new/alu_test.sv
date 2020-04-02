`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137, 2020 -03 -26
module alu_test();
    wire[7:0] aluout;
    reg [7:0] aluin0;
    reg [7:0] aluin1; 
    reg  [3:0] aluop;
    alu #(.N(8)) alutest(.out(aluout), .in0(aluin0), .in1(aluin1), .op(aluop));
    
    initial  begin
        aluin0 = 8'h14; aluin1 = 8'h7A; #10;
        aluin0 = 8'h14; aluin1 = 8'h7A; aluop = 4'h0; #10;
        aluin0 = 8'h14; aluin1 = 8'h7A; aluop = 4'h1; #10;
        aluin0 = 8'h14; aluin1 = 8'h7A; aluop = 4'h2; #10;
        aluin0 = 8'h14; aluin1 = 8'h7A; aluop = 4'h3; #10;
        aluin0 = 8'h14; aluin1 = 8'h7A; aluop = 4'h4; #10; 
        $finish;
    end

endmodule