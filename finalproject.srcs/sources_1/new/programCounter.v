`timescale 1ns / 1ps
module programCounter(
 input clk,
 input [31:0] nextPC,
 output reg [31:0] pc
 );
initial
 begin
 pc = 32'd100;
 end
 
always @(posedge clk) begin
 pc = nextPC;
end
endmodule
