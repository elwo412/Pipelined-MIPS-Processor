`timescale 1ns / 1ps
module pcAdder(
 input [31:0] pc,
 output reg [31:0] nextPC
 );
localparam [2:0] a = 3'b100;
always @(*) begin
 nextPC = pc + a;
end
endmodule