`timescale 1ns / 1ps

module instructionMemory(
    input [31:0] pc,
    output reg [31:0] instOut
    );

reg [31:0] memory [0:63];

initial
    begin
        memory[0] = 32'hA00000AA;
        memory[1] = 32'h10000011;
        memory[2] = 32'h20000022;
        memory[3] = 32'h30000033;
        memory[4] = 32'h40000044;
        memory[5] = 32'h50000055;
        memory[6] = 32'h60000066;
        memory[7] = 32'h70000077;
        memory[8] = 32'h80000088;
        memory[9] = 32'h90000099;

        memory[25] = {
            6'b000000, // r-type (add $3 $1 $2)
            5'b00001, // rs - $1
            5'b00010, //rt - $2
            5'b00011, //rd - $3
            5'b00000,
            6'b100000 //add       
            
        };
        memory[26] = {
            6'b000000, // r-type (sub $4 $9 $3)
            5'b01001, // rs - $9
            5'b00011, //rt - $3
            5'b00100, //rd - $4
            5'b00000,
            6'b100010 //sub       
            
        };
        memory[27] = {
            6'b000000, // r-type (or $5 $3 $9)
            5'b00011, // rs - $3
            5'b01001, //rt - $9
            5'b00101, //rd - $5
            5'b00000,
            6'b100101 //or       
            
        };
        memory[28] = {
            6'b000000, // r-type (xor $6 $3 $9)
            5'b00011, // rs - $3
            5'b01001, //rt - $9
            5'b00110, //rd - $6
            5'b00000,
            6'b100110 //xor       
            
        };
        memory[29] = {
            6'b000000, // r-type (and $7 $3 $9)
            5'b00011, // rs - $3
            5'b01001, //rt - $9
            5'b00111, //rd - $7
            5'b00000,
            6'b100100 //and       
            
        };
        
    end

always @(*) begin
    instOut = memory[pc[7:2]];
end

endmodule
