module origen_216513 #(
    parameter DDR_CLK_EDGE = "SAME_EDGE",
    parameter INIT = 1'b0,
    parameter IS_C_INVERTED = 1'b0,
    parameter IS_D1_INVERTED = 1'b0,
    parameter IS_D2_INVERTED = 1'b0,
    parameter SRTYPE = "SYNC"
) (
    input C,
    input CE,
    input D1,
    input D2,
    input R,
    input S,
    output reg Q
);

    reg q0_out, q1_out;

    initial begin
        q0_out = INIT;
        q1_out = INIT;
        Q = INIT;
    end

    always @(posedge C, posedge R, posedge S) begin
        if (R) begin
            q0_out <= 1'b0;
            q1_out <= 1'b0;
        end
        else if (S) begin
            q0_out <= 1'b1;
            q1_out <= 1'b1;
        end
        else if (CE) begin
            q0_out <= IS_D1_INVERTED ? ~D1 : D1;
            q1_out <= IS_D2_INVERTED ? ~D2 : D2;
        end
    end

    always @(*) begin
        case (DDR_CLK_EDGE)
            "SAME_EDGE": begin
                Q = IS_C_INVERTED ? q1_out : q0_out;
            end
            "OPPOSITE_EDGE": begin
                Q = IS_C_INVERTED ? q0_out : q1_out;
            end
            default: begin
                Q = INIT;
            end
        endcase
    end

endmodule