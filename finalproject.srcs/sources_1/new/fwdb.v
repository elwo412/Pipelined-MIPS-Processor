`timescale 1ns / 1ps

module fwdb(
    input [1:0] fwdb_signal,
    input [31:0] qb,
    input [31:0] alur,
    input [31:0] emr,
    input [31:0] mdo,
    output reg [31:0] b
    );
    
always @(*) begin
    case (fwdb_signal)
        2'b00: //No hazards
        begin
            b = qb;
        end
        2'b01:
        begin
            b = alur;
        end
        2'b10:
        begin
            b = emr;
        end
        2'b11:
        begin
            b = mdo;
        end
    
    endcase
end

endmodule
