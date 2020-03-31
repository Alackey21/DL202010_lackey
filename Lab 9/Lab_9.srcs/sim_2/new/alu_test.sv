`timescale 1ns / 1ps
module alu_test();
    alu #(.N(8))(.out(), .in0(), .in1(), .op());

endmodule