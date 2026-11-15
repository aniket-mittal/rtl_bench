module origen_184381(
    input clk,
    input [1:0] state,
    input [31:0] multiplicand,
    input [31:0] multiplier,
    output reg op_done,
    output reg [31:0] U,
    output reg [31:0] V
);

    reg [3:0] data_count;
    reg [31:0] X;
    reg X_1;
    reg [31:0] Y;

    always @(posedge clk) begin
        case (state)
            2'b00: begin // IDLE
                data_count <= 4'b0;
                X <= multiplier;
                X_1 <= 1'b0;
                Y <= multiplicand;
                U <= 32'b0;
                V <= 32'b0;
                op_done <= 1'b0;
            end
            2'b01: begin // EXEC
                if (X[0] & ~X_1) begin
                    U <= U + Y;
                    V <= V + Y << 1;
                end
                else if (~X[0] & X_1) begin
                    U <= U - Y;
                    V <= V - Y << 1;
                end
                X <= X >> 1;
                X_1 <= X[0];
                data_count <= data_count + 1;
                if (data_count == 4'b1000) begin
                    op_done <= 1'b1;
                end
            end
            2'b11: begin // DONE
                op_done <= 1'b0;
            end
            default: begin
                // Undefined state
            end
        endcase
    end

endmodule