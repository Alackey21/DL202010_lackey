`timescale 1ns / 1ps
// Ashlie Lackey, ELC 2137, 2020 -04 -08
module counter_test();
    reg clk , en , rst;
    wire [3:0] count;
    wire tick;
    
    counter #(.N(4)) c(.clk(clk),.en(en), .rst(rst), .count(count), .tick(tick) );
    // clock  runs  continuously
    always  begin
        clk = ~clk; #5;
    end
    // this  block  only  runs  once
    initial  begin
        clk=0; en=0; rst =0; #7;
        rst = 1; #3; //  reset
        en = 1; rst = 0; #5;
        en = 0; #5;
        en = 1; #5;
        en = 0; #5;
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5; 
        en = 1; #5;
        en = 0; #5;
        en = 1; #5;  
        $finish;
    end
endmodule
