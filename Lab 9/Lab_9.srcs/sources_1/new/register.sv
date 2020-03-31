`timescale 1ns / 1ps
module  register  #( parameter N=1)
        (input clk , rst , en ,
        input [N -1:0] D,
        output  reg [N -1:0] Q);

    always @(posedge clk , posedge  rst)
    begin
    if (rst ==1)
        Q <= 0 ;
    else if (en==1)
        Q <= D ;
    end

// Notes:
// - Reset  is  asynchronous , so this
//    block  needs  to  execute  when  rst
//    goes  high.
// - We want  enable  to be  synchronous
//    (i.e. only  happens  on  rising
//    edge of clk), so it is left  out
//    of "sensitivity" list.
endmodule
