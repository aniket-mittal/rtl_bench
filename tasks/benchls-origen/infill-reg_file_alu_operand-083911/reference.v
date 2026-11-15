module origen_083911(
    input [31:0] rs, rt,
    input [4:0] shamt,
    input [21:0] immt,
    input [2:0] opcode,
    input [3:0] fcode,
    output reg [31:0] inp1, inp2
);

    reg [31:0] r [0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            r[i] = 32'b0;
        end
    end

    always @(*) begin
        case (opcode)
            3'b001: begin // Immediate-type instructions
                inp1 = rs;
                inp2 = {{10{immt[21]}}, immt};
                r[0] = r[1] + 1;
            end
            3'b000: begin // Register-type instructions
                case (fcode)
                    4'd0, 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9, 4'd10, 4'd11: begin
                        inp1 = rs;
                        inp2 = rt;
                        if (fcode == 4'd0 || fcode == 4'd1 || fcode == 4'd2 || fcode == 4'd3 || fcode == 4'd4 || fcode == 4'd5) begin
                            r[0] = r[1] + 1;
                        end
                    end
                    4'd12, 4'd13, 4'd14, 4'd15: begin
                        inp1 = rs;
                        inp2 = {27'b0, shamt};
                    end
                    default: begin
                        inp1 = 32'b0;
                        inp2 = 32'b0;
                    end
                endcase
            end
            default: begin // Other instructions
                inp1 = 32'b0;
                inp2 = 32'b0;
            end
        endcase
    end

endmodule