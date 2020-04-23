`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guess_FSM_test();

    reg clk, reset;
    reg [3:0] b;
    reg [3:0] y;
    wire win, lose;
    
    guess_FSM #(.N(4)) gFSM (.clk(clk), .reset(reset),.b(b), .y(y), .win(win), .lose(lose));
    
    always  begin
        #5 clk = ~clk;
    end
    
    if
    
    initial  begin
        clk =0;  reset =0; b=4'b0000; #5;
        reset =1;  #5;
        reset =0; #10;
        
        
        b = 4'b0001; #10;
        b = 4'b0000;  #17;
        
        b = 4'b0010; #10;
        b=4'b0000;  #35;
        
        b = 4'b0100; #10;
        b = 4'b0000; #35;
        
        b = 4'b1000; #10;
        b = 4'b0000; #13;
        
        b = 4'b0010; #10;
        b = 4'b0000; #20;
     
        b = 4'b0100; #10;
        b = 4'b0000; #10;
        
        b = 4'b1000; #10;
        b = 4'b0000; #10;
        b = 4'b0001; #15; 
        $finish;
    end
endmodule
