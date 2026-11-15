module origen_197959(
    input clk,
    input reset,
    input signed [2:0] X,
    input signed [2:0] Y,
    input signed [2:0] Z,
    output reg signed [4:0] T,
    output reg [3:0] state,
    output reg [1:0] i,
    output reg signed [4:0] R
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 4'd0;
        i <= 2'd3;
        T <= 5'd0;
        R <= 5'd0;
    end
    else begin
        case (state)
            4'd1: begin
                R <= 5'd0;
                state <= 4'd2;
            end
            4'd2: begin
                i <= 2'd3;
                state <= 4'd3;
            end
            4'd3: begin
                T <= {T[3:0], 1'b0};
                state <= 4'd11;
            end
            4'd11: begin
                R <= T - Z;
                state <= 4'd4;
            end
            4'd4: begin
                if (R[4] == 1'b0) begin
                    if (Y[i] == 1'b1)
                        state <= 4'd6;
                    else
                        state <= 4'd13;
                end
                else begin
                    if (Y[i] & R[4])
                        state <= 4'd6;
                    else
                        state <= 4'd13;
                end
            end
            4'd5: begin
                if (Y[i] == 1'b1)
                    state <= 4'd6;
                else
                    state <= 4'd13;
            end
            4'd6: begin
                T <= T + X;
                state <= 4'd12;
            end
            4'd12: begin
                R <= T - Z;
                state <= 4'd7;
            end
            4'd7: begin
                if (R[4] == 1'b1)
                    state <= 4'd13;
                else
                    state <= 4'd8;
            end
            4'd8: begin
                state <= 4'd13;
            end
            4'd13: begin
                i <= i - 1;
                state <= 4'd9;
            end
            4'd9: begin
                if (i != 2'd3)
                    state <= 4'd3;
                else
                    state <= 4'd10;
            end
            4'd10: begin
                state <= 4'd10;
            end
        endcase
    end
end

endmodule