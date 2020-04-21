`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guess_FSM_test();

    reg clk, reset;
    reg [3:0] b;
    wire [3:0]y;
    wire win, lose;
    
    guess_FSM#(.N(2)) gFSM (.clk(clk), .reset(reset),.b(clk), .y(y), .win(win), .lose(lose));

//module  debounce_test ();
    //reg clk , reset , in;
    //wire out , tick;
    integer i;
    //debounce  #(.N(2)) db (.clk(clk), .reset(reset), .in(in), .out(out),.tick(tick));
    
    always  begin
        #5 clk = ~clk;
    end
    
    initial  begin
        clk =0;  reset =0; b=4'b0000;  #5;
        reset =1;  #10;
        reset =0; #5;
        
        //  cycle through states
        for (i=0; i<4; i=i+1)  begin
            #20 y[i]=~y[i];
        end
        
        b[0] = 1; #200;
        
        b[1] = 1; #200;
        
        b[2] = 1; #200;
        
        b[3] = 1; #200;
        
        for (i=0; i<4; i=i+1)  begin
            #20 y[i]=~y[i];
        end
        
        // hold  input = 0 for a while
        b = 4'b0000; #200;
        $finish;
    end
endmodule
