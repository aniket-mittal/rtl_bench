module origen_184053(
    input in,
    input clk,
    input rst,
    output reg out
);

reg [1:0] state;
localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

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
                    out <= 1'b0;
                end
                else begin
                    state <= s0;
                    out <= 1'b0;
                end
            end
            s1: begin
                if (in) begin
                    state <= s0;
                    out <= 1'b1;
                end
                else begin
                    state <= s2;
                    out <= 1'b0;
                end
            end
            s2: begin
                if (in) begin
                    state <= s2;
                    out <= 1'b1;
                end
                else begin
                    state <= s1;
                    out <= 1'b0;
                end
            end
        endcase
    end
end

endmodule