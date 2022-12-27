`timescale 1ns / 1ps
module controlUnit(
 input [31:0] Instruction,
 input [4:0] mrn, //mDestReg wire (exemem register) NEW
 input mm2reg, //NEW
 input mwreg, //NEW
 input [4:0] ern, //eDestReg wire (idexe register) NEW
 input em2reg, //NEW
 input ewreg, //NEW
 output reg wreg,
 output reg m2reg,
 output reg wmem,
 output reg [3:0] aluc,
 output reg aluimm,
 output reg regrt,
 output reg [1:0] fwdb, //NEW
 output reg [1:0] fwda //NEW
 );
reg [5:0] op;
reg [5:0] func;
reg [5:0] rs;
reg [5:0] rt;
reg [5:0] rd;
always @(Instruction) begin
    op = Instruction[31:26];
    func = Instruction[5:0];
    rs = Instruction[25:21];
    rt = Instruction[20:16];
    rd = Instruction[15:11];
end

always @(*) begin

    fwda = 2'b00;
    fwdb = 2'b00;
    if (rs == ern) begin
        fwda = 2'b01;
    end else if (rt == mrn) begin
        fwdb = 2'b10;
    end else if (rt == ern) begin
        fwdb = 2'b01;
    end else if (rs == mrn) begin
        fwda = 2'b10;
    end

    case (op)
        6'b000000:
        begin
            case (func)
                6'b100000: begin // ADD instruction
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0010;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                6'b100010: begin // SUB instruction (Review)
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0110;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                6'b100101: begin // OR instruction (Review)
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0001;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                6'b100110: begin // XOR instruction (Review)
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b1010;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                6'b100100: begin // AND instruction (Review)
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0000;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
            endcase
        end
        6'b100011: begin // lw -- load word
            wreg = 1'b1;
            m2reg = 1'b1;
            wmem = 1'b0;
            aluc = 4'b0010;
            aluimm = 1'b1;
            regrt = 1'b1;
        end
    endcase
end

endmodule