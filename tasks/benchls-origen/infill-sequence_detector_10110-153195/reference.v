module origen_153195(
    input clk,
    input rst,
    input inp,
    output reg out
);

reg [2:0] state;
localparam [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= S0;
        out <= 1'b0;
    end
    else begin
        case (state)
            S0: begin
                if (inp) state <= S1;
                else state <= S0;
                out <= 1'b0;
            end
            S1: begin
                if (inp) state <= S1;
                else state <= S2;
                out <= 1'b0;
            end
            S2: begin
                if (inp) state <= S3;
                else state <= S0;
                out <= 1'b0;
            end
            S3: begin
                if (inp) state <= S4;
                else state <= S2;
                out <= 1'b0;
            end
            S4: begin
                if (inp) state <= S1;
                else state <= S2;
                out <= 1'b1;
            end
            default: begin
                state <= S0;
                out <= 1'b0;
            end
        endcase
    end
end

endmodule