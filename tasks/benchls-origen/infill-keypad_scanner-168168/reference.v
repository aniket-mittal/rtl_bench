module origen_168168(
    input [3:0] key,
    input [2:0] columns,
    output reg [3:0] rows
);

always @(*) begin
    rows = 4'b0000;

    case (key)
        4'b0000: begin
            case (columns)
                3'b000: rows[0] = 1'b1;
                3'b001: rows[0] = 1'b1;
                3'b010: rows[0] = 1'b1;
                3'b011: rows[0] = 1'b1;
            endcase
        end
        4'b0001: begin
            case (columns)
                3'b000: rows[1] = 1'b1;
                3'b001: rows[1] = 1'b1;
                3'b010: rows[1] = 1'b1;
                3'b011: rows[1] = 1'b1;
            endcase
        end
        4'b0010: begin
            case (columns)
                3'b000: rows[2] = 1'b1;
                3'b001: rows[2] = 1'b1;
                3'b010: rows[2] = 1'b1;
                3'b011: rows[2] = 1'b1;
            endcase
        end
        4'b0011: begin
            case (columns)
                3'b000: rows[3] = 1'b1;
                3'b001: rows[3] = 1'b1;
                3'b010: rows[3] = 1'b1;
                3'b011: rows[3] = 1'b1;
            endcase
        end
        4'b0100: begin
            case (columns)
                3'b100: rows[0] = 1'b1;
                3'b101: rows[0] = 1'b1;
                3'b110: rows[0] = 1'b1;
                3'b111: rows[0] = 1'b1;
            endcase
        end
        4'b0101: begin
            case (columns)
                3'b100: rows[1] = 1'b1;
                3'b101: rows[1] = 1'b1;
                3'b110: rows[1] = 1'b1;
                3'b111: rows[1] = 1'b1;
            endcase
        end
        4'b0110: begin
            case (columns)
                3'b100: rows[2] = 1'b1;
                3'b101: rows[2] = 1'b1;
                3'b110: rows[2] = 1'b1;
                3'b111: rows[2] = 1'b1;
            endcase
        end
        4'b0111: begin
            case (columns)
                3'b100: rows[3] = 1'b1;
                3'b101: rows[3] = 1'b1;
                3'b110: rows[3] = 1'b1;
                3'b111: rows[3] = 1'b1;
            endcase
        end
        4'b1000: begin
            case (columns)
                3'b000: rows[0] = 1'b1;
                3'b001: rows[1] = 1'b1;
                3'b010: rows[2] = 1'b1;
                3'b011: rows[3] = 1'b1;
            endcase
        end
        4'b1001: begin
            case (columns)
                3'b100: rows[0] = 1'b1;
                3'b101: rows[1] = 1'b1;
                3'b110: rows[2] = 1'b1;
                3'b111: rows[3] = 1'b1;
            endcase
        end
        default: rows = 4'b0000;
    endcase
end

endmodule