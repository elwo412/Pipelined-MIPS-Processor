`timescale 1ns / 1ps
module regrtMultiplexer(
 input [4:0] rt,
 input [4:0] rd,
 input regrt,
 output reg [4:0] destReg
 );
always @(*) begin
 if (regrt == 0) begin
 destReg = rd;
 end else begin
 destReg = rt;
 end
end
endmodule
