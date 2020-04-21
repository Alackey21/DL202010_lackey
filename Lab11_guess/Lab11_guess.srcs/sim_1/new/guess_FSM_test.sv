`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guess_FSM_test();

    reg clk, reset;
    reg [3:0] b;
    wire [3:0]y;
    wire win, lose;
    
    guess_FSM #(.N(4)) gFSM (.clk(clk), .reset(reset),.b(clk), .y(y), .win(win), .lose(lose));

    //integer i;
    
    always  begin
        #5 clk = ~clk;
    end
    
    initial  begin
        clk =0;  reset =0; b=4'b0000;  #5;
        reset =1;  #3;
        reset =0; #5;
        
        b[0] = 1; #5;
        
        b=4'b0000;  #10;
        /*b[1] = 1; #5;
        b=4'b0000;  #10;
        b[2] = 1; #5;
        b=4'b0000;  #10;
        b[3] = 1; #5;*/
        b=4'b0000;  #100;
        
        // hold  input = 0 for a while
        //b = 4'b0000; #200;
        $finish;
    end
endmodule
