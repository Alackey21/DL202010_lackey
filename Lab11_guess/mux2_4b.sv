// Ashlie Lackey and Chris Jones , ELC 2137, 2020 -2-26
module mux2_4b(
        input [3:0]in0,
        input [3:0]in1,
        input sel,
        output [3:0]out 
    );
   
    assign out = sel?in1:in0;
endmodule
