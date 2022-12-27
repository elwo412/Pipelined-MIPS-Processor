`timescale 1ns / 1ps

module fwda(
    input [1:0] fwda_signal,
    input [31:0] qa,
    input [31:0] alur,
    input [31:0] emr,
    input [31:0] mdo,
    output reg [31:0] a
    );

always @(*) begin
    case (fwda_signal)
        2'b00: //No hazards
        begin
            a = qa;
        end
        2'b01:
        begin
            a = alur;
        end
        2'b10:
        begin
            a = emr;
        end
        2'b11:
        begin
            a = mdo;
        end
    
    endcase
end

endmodule
