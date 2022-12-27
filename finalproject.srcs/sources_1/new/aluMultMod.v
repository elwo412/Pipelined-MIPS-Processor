`timescale 1ns / 1ps
module aluMultMod(
 input [31:0] eqb,
 input [31:0] eimm32,
 input ealuimm,
 output reg [31:0] b
 );
 
always @(*) begin
 if (ealuimm == 0) begin
 b = eqb;
 end else begin
 b = eimm32;
 end
end
endmodule

