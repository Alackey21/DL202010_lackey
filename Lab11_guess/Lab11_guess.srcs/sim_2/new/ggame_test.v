`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module ggame_test();

    reg btnU, btnR, btnD, btnL, btnC;
    reg clk;
    reg [15:0] sw;
    wire [6:0] seg;
    wire [3:0] an;
    wire [15:0] led;
    
    guessing_game gg(.btnU(btnU), .btnR(btnR), .btnD(btnD), .btnL(btnL), .btnC(btnC), .clk(clk), .sw(sw), .seg(seg), .an(an), .led(led));
    
    always  begin
        #5 clk = ~clk;
    end
    
    initial  begin
        clk =0;  btnC =0; btnU = 0; btnR = 0;
         btnD = 0; btnL = 0; 
         sw[15:0] = 16'b0000000000000000; #5;
        btnC =1;  #5;
        btnC =0; #5;
        
        btnD = 0; #2;
        btnD = 1; #10;
        
        btnD = 0; #330;
        
        sw[0] = 1'b1;
        
        btnD = 1; #40;
        
        btnD = 0; #100;
        
        
        /*btnR = 1; #7;
        
        btnR =0; #3;
        
        btnD = 1; #7;
        
        btnD = 0; #3;
        
        btnL = 1; #7;
        
        btnL = 0; #3;*/
        
        
        
        
        
        $finish;
    end
    
endmodule    