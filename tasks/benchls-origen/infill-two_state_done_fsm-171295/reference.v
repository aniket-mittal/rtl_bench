module origen_171295(
    input clk,
    input [7:0] in,
    input reset,
    output reg done
);

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
reg [1:0] state, next;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= s1;
    end else begin
        state <= next;
    end
end

always @(*) begin
    case (state)
        s0: begin
            if (in[4]) begin
                next = s2;
            end else begin
                next = s1;
            end
        end
        s1: begin
            if (in[4]) begin
                next = s2;
            end else begin
                next = s1;
            end
        end
        s2: begin
            next = s3;
        end
        s3: begin
            next = s0;
        end
        default: begin
            next = s1;
        end
    endcase
end

always @(posedge clk) begin
    if (state == s0) begin
        done = 1'b1;
    end else begin
        done = 1'b0;
    end
end

endmodule