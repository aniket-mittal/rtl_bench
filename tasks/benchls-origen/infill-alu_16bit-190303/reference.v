module origen_190303(
    input [3:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
);

reg [31:0] sum;

always @(*) begin
    case (alufn)
        4'b0000: begin // Addition
            sum = $signed(a) + $signed(b);
            out = sum[15:0];
            z = (sum[15:0] == 16'b0);
            v = (a[15] == b[15]) && (a[15] != out[15]);
            n = out[15];
        end
        4'b0001: begin // Subtraction
            sum = $signed(a) - $signed(b);
            out = sum[15:0];
            z = (sum[15:0] == 16'b0);
            v = (a[15] != b[15]) && (a[15] != out[15]);
            n = out[15];
        end
        4'b0010: begin // Multiplication
            sum = $signed(a) * $signed(b);
            out = sum[15:0];
            z = (sum[15:0] == 16'b0);
            v = (sum[31:16] != sum[15]);
            n = out[15];
        end
        4'b0011: begin // Division
            sum = $signed(a) / $signed(b);
            out = sum[15:0];
            z = (sum[15:0] == 16'b0);
            v = (b == 16'b0);
            n = out[15];
        end
        default: begin
            sum = 32'b0;
            out = 16'b0;
            z = 1'b0;
            v = 1'b0;
            n = 1'b0;
        end
    endcase
end

endmodule