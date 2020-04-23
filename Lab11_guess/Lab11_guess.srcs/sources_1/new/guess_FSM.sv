`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guess_FSM#(parameter N = 21)(input clk, reset,
    input reg [3:0] b,
    output reg [3:0] y,
    output reg win,
    output reg lose
    );
    
    localparam [2:0]
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        swin = 3'b100,
        slose = 3'b101;
    
    reg [2:0] state, state_next;
    
    always_ff @(posedge clk or posedge reset)
        if(reset) begin
            state <= s0;
        end
        else begin
            state <= state_next;
        end
        
    always_comb  begin
    //  default  behavior
    state_next = state;
    //y = 4'b0000; 
    
        case (state)
            s0: begin
                win = 0;
                lose = 0;
                y = 4'b0001;
                if (~b[3] & ~b[2] & ~b[1] & b[0])
                    state_next = swin;
                else if (b[3] | b[2] | b[1])
                    state_next = slose;
                else if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s1;
            end
            
            s1: begin
                y = 4'b0010;
                if (~b[3] & ~b[2] & b[1] & ~b[0])
                    state_next = swin;
                else if (b[3] | b[2] | b[0])
                    state_next = slose;
                else if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s2;
            end
            
            s2: begin
                y = 4'b0100;
                if (~b[3] & b[2] & ~b[1] & ~b[0])
                    state_next = swin;
                else if (b[3] | b[1] | b[0])
                    state_next = slose;
                else if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s3;
            end
            
            s3: begin
                y = 4'b1000;
                if (b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = swin;
                else if (b[2] | b[1] | b[0])
                    state_next = slose;
                else if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s0;
            end
            
            swin: begin
                win = 1;
                if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s0;
                else if (b[3] | b[2] | b[1] | b[0])
                    state_next = swin;
            end
            
            slose: begin
                lose = 1;
                if (~b[3] & ~b[2] & ~b[1] & ~b[0])
                    state_next = s0;
                else if (b[3] | b[2] | b[1] | b[0])
                    state_next = slose;
            end
        endcase
    end
endmodule
