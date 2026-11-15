module origen_156578(
    input clk,
    input reset,
    input in,
    output reg out
);

reg [2:0] state;
localparam s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= s0;
        out <= 1'b0;
    end
    else begin
        case (state)
            s0: begin
                if (in) state <= s1;
                else state <= s0;
                out <= 1'b0;
            end
            s1: begin
                if (in) state <= s2;
                else state <= s0;
                out <= 1'b0;
            end
            s2: begin
                if (~in) state <= s3;
                else state <= s2;
                out <= 1'b0;
            end
            s3: begin
                if (in) state <= s4;
                else state <= s0;
                out <= 1'b0;
            end
            s4: begin
                if (in) state <= s2;
                else state <= s0;
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