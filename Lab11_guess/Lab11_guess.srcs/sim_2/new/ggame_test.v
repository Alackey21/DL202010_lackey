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
        
        btnD = 0; #10;
        btnD = 1; #100;
        
        btnD = 0; #100;
        
        btnU = 1; #100;
        
        sw[0] = 1'b1;
        
        btnU = 0; #40;
        
        btnD = 0; #100;
        
        
        
        
        
        
        
        $finish;
    end
    
endmodule    