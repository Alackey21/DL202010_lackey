`timescale 1ns / 1ps
// ELC 2137,  Ashlie Lackey, 2020 -04 -21
module guessing_game(input btnU, btnR, btnD, btnL, btnC,
    input clk, 
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led);
    
    wire [3:0] dbo;
    wire t1, t2, t3, t4;
    debounce #(.N(4)) db1(.clk(clk) , .reset(btnC), .in(btnU), .out(dbo[0]) , .tick(t1));
    debounce #(.N(4)) db2(.clk(clk) , .reset(btnC), .in(btnR), .out(dbo[1]) , .tick(t2));
    debounce #(.N(4)) db3(.clk(clk) , .reset(btnC), .in(btnD), .out(dbo[2]) , .tick(t3));
    debounce #(.N(4)) db4(.clk(clk) , .reset(btnC), .in(btnL), .out(dbo[3]) , .tick(t4));
    
    counter #(.N(1)) counter1 (.clk(), .rst(), .en(),.count(),.tick());
    
    mux
    
    guess_FSM #(.N(4)) topmod (.clk(), .reset(btnC), .b(dbo),.y(),.win(led[15]),.lose(led[0]));
endmodule
