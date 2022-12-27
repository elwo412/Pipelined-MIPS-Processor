`timescale 1ns / 1ps
module aLUMod(
 input [31:0] eqa,
 input [31:0] b,
 input [3:0] ealuc,
 output reg [31:0] r
 );
always @(*) begin
 case (ealuc)
 4'b0000 : r = eqa & b; //AND
 4'b0001 : r = eqa | b; //OR
 4'b0010 : r = eqa + b; //ADD
 4'b0110 : r = eqa - b; //SUB
 4'b0111 : r = eqa < b ? 1 : 0; //set-less-than
 4'b1100 : r = ~(eqa | b); //NOR
 4'b1010 : r = eqa ^ b; //XOR
 //default : r = 32'dx; //I think this is valid
 endcase
end
endmodule
