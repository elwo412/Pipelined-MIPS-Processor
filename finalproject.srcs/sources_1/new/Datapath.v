`timescale 1ns / 1ps
module Datapath(
 clk,
 pc_internal,
 dinstOut_internal,
 ewreg,
 em2reg,
 ewmem,
 ealuc,
 ealuimm,
 edestReg,
 eqa,
 eqb,
 eimm32,
 wwreg,
 wm2reg,
 wdestReg,
 wr,
 wdo
 );
 
input clk;
output wire [31:0] pc_internal;
output wire [31:0] dinstOut_internal;
output wire ewreg;
output wire em2reg;
output wire ewmem;
output wire [3:0] ealuc;
output wire ealuimm;
output wire [4:0] edestReg;
output wire [31:0] eqa;
output wire [31:0] eqb;
output wire [31:0] eimm32;
output wire wwreg;
output wire wm2reg;
output wire [4:0] wdestReg;
output wire [31:0] wr;
output wire [31:0] wdo;
wire [31:0] nextpc_internal;
wire [31:0] instOut_internal;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [31:0] imm32_internal;
wire [31:0] qb_internal;
wire [31:0] qa_internal;
wire [4:0] destReg_internal;
wire aluimm_internal;
wire [3:0] aluc_internal;
wire wmem_internal;
wire m2reg_internal;
wire wreg_internal;
wire regrt;
wire [31:0] b;
wire [31:0] r;
wire mwreg;
wire mm2reg;
wire mwmem;
wire [4:0] mdestReg;
wire [31:0] mr;
wire [31:0] mqb;
wire [31:0] mdo;
wire [31:0] wbData;
//begin new
wire [1:0] fwda_signal;
wire [1:0] fwdb_signal;
wire [31:0] fwdaOut;
wire [31:0] fwdbOut;
//end new

programCounter pcMod(clk, nextpc_internal, pc_internal);
pcAdder pcAddMod(pc_internal, nextpc_internal);
instructionMemory instMemMod(pc_internal, instOut_internal);
ifidPipelineRegister ifidRegMod(instOut_internal, clk, dinstOut_internal);
controlUnit controlMod(dinstOut_internal, mdestReg, mm2reg, mwreg, edestReg, em2reg, ewreg, wreg_internal, m2reg_internal, 
wmem_internal, aluc_internal, aluimm_internal, regrt, fwdb_signal, fwda_signal);
assign rs = dinstOut_internal[25:21];
assign rt = dinstOut_internal[20:16];
assign rd = dinstOut_internal[15:11];
regrtMultiplexer rgMultMod(dinstOut_internal[20:16], 
dinstOut_internal[15:11], regrt, destReg_internal);
fwda fwdaMod(fwda_signal, qa_internal, r, mr, mdo, fwdaOut);
fwdb fwdbMod(fwdb_signal, qb_internal, r, mr, mdo, fwdbOut);
registerFile regfileMod(dinstOut_internal[25:21], dinstOut_internal[20:16], 
wdestReg, wbData, wwreg, clk, qa_internal, qb_internal); //NEW EDITS
immediateExtender ieMod(dinstOut_internal[15:0], imm32_internal);
idexePipelineRegister idexePipeRegMod(wreg_internal, m2reg_internal, 
wmem_internal, aluc_internal, aluimm_internal, destReg_internal, 
fwdaOut, fwdbOut, imm32_internal, clk, ewreg, em2reg, ewmem, ealuc, 
ealuimm, edestReg, eqa, eqb, eimm32);
aluMultMod aluMultiplexer(eqb, eimm32, ealuimm, b);
aLUMod alu(eqa, b, ealuc, r);
exememRegMod exememPipelineRegister(ewreg, em2reg, ewmem, edestReg, r, eqb, 
clk, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
dataMemMod dataMemory(mr, mqb, mwmem, clk, mdo);
memwbReg memwbPipelineRegister(mwreg, mm2reg, mdestReg, mr, mdo, clk, wwreg, 
wm2reg, wdestReg, wr, wdo);
wbMux wbMuxModule(wr, wdo, wm2reg, wbData);
 
 
endmodule
