`timescale 1ns / 1ps

module guess_FSM(input clk, reset,
    input in,
    output reg out,
    output reg tick
    );
    
    localparam[2:0]
        so = 3'b000;
        s1 = 3'b001;
        s2 = 3'b010;
        s3 = 3'b011;
        swin = 3'b100;
        slose = 3'b101;
    
    reg [2:0] state, state_next;
    
    
    case (state)
    s0: begin
        y0 = 1;
        if
    end
    
    s1: begin
    
    end
    
    s2: begin
    
    end
    
    s3: begin
    
    end
    
    swin: begin
    
    end
    
    slose: begin
    
    end
    
    
endmodule
