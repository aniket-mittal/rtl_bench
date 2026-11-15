module origen_126816(
    input wire clk,
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [7:0] ctrl,
    output reg [15:0] out,
    output reg n,
    output reg z,
    output reg c,
    output reg v
);

    wire [16:0] add_result;
    wire [16:0] sub_result;

    assign add_result = a + b;
    assign sub_result = a - b;

    always @(posedge clk) begin
        case (ctrl[2:0])
            3'b000: out <= a & b;
            3'b001: out <= a | b;
            3'b010: out <= add_result[15:0];
            3'b011: out <= sub_result[15:0];
            3'b100: out <= {15'b0, $signed(a) < $signed(b)};
            3'b101: out <= a << b[3:0];
            3'b110: out <= a >> b[3:0];
            3'b111: out <= $signed(a) >>> b[3:0];
            default: out <= 16'b0;
        endcase

        n <= out[15];
        z <= (out == 16'b0);
        
        case (ctrl[2:0])
            3'b010: begin
                c <= add_result[16];
                v <= (a[15] == b[15]) && (a[15] != out[15]);
            end
            3'b011: begin
                c <= sub_result[16];
                v <= (a[15] != b[15]) && (b[15] == out[15]);
            end
            default: begin
                c <= 1'b0;
                v <= 1'b0;
            end
        endcase
    end
endmodule

