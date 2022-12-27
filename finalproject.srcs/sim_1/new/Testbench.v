`timescale 1ns / 1ps
module testbench();
reg clk; 
wire [31:0] pc_tb;
wire [31:0] dinstOut;
wire ewreg;
wire em2reg;
wire ewmem;
wire ealuimm;
wire [3:0] ealuc;
wire [4:0] edestReg;
wire [31:0] eqa;
wire [31:0] eqb;
wire [31:0] eimm32;
wire wwreg;
wire wm2reg;
wire [4:0] wdestReg;
wire [31:0] wr;
wire [31:0] wdo;
initial begin
 clk = 0;
 //#5
 //clk = ~clk;
end
Datapath DP( .clk (clk), .pc_internal (pc_tb), .dinstOut_internal (dinstOut), .ewreg (ewreg), .em2reg (em2reg), .ewmem (ewmem), 
.ealuc (ealuc), .ealuimm (ealuimm), .edestReg (edestReg), .eqa (eqa), .eqb (eqb), .eimm32 (eimm32), .wwreg (wwreg), .wm2reg (wm2reg), 
.wdestReg (wdestReg), .wr (wr), .wdo (wdo));
always begin
 #5
 clk = ~clk;
end
endmodule
