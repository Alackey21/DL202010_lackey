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
        clk =0;  reset =0; in=0;  #5;
        reset =1;  #10;
        reset =0; #5;
        //  bounce
        for (i=0; i<10; i=i+1)  begin
            #20 in=~in;
        end
        // hold  input = 1 for a while
        in = 1; #200;
        //  bounce
        for (i=0; i<10; i=i+1)  begin
            #20 in=~in;
        end
        // hold  input = 0 for a while
        in = 0; #200;
        $finish;
    end
endmodule
