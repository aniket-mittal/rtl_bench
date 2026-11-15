module origen_149670(
    input in,
    output reg out,
    input rst,
    input clk
);

    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;
    reg [2:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= s0;
            out <= 1'b0;
        end
        else begin
            case (state)
                s0: begin
                    if (in) begin
                        state <= s1;
                    end
                    else begin
                        state <= s0;
                    end
                    out <= 1'b0;
                end
                s1: begin
                    if (in) begin
                        state <= s2;
                    end
                    else begin
                        state <= s0;
                    end
                    out <= 1'b0;
                end
                s2: begin
                    if (in) begin
                        state <= s3;
                    end
                    else begin
                        state <= s0;
                    end
                    out <= 1'b0;
                end
                s3: begin
                    if (in) begin
                        state <= s3;
                    end
                    else begin
                        state <= s4;
                    end
                    out <= 1'b0;
                end
                s4: begin
                    if (in) begin
                        state <= s1;
                    end
                    else begin
                        state <= s5;
                    end
                    out <= 1'b0;
                end
                s5: begin
                    if (in) begin
                        state <= s6;
                    end
                    else begin
                        state <= s0;
                    end
                    out <= 1'b0;
                end
                s6: begin
                    if (in) begin
                        state <= s1;
                    end
                    else begin
                        state <= s0;
                    end
                    out <= 1'b1;
                end
                default: begin
                    state <= s0;
                    out <= 1'b0;
                end
            endcase
        end
    end

endmodule