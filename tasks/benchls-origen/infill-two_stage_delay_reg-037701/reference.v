module origen_037701 #(
    parameter WIDTH = 1
) (
    input wire clk,
    input wire reset,
    input wire [WIDTH-1:0] d_in,
    output reg [WIDTH-1:0] d_out
);
    reg [WIDTH-1:0] r;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r <= 0;
            d_out <= 0;
        end else begin
            r <= d_in;
            d_out <= r;
        end
    end
endmodule

module mdetect_3 (
    input wire a,
    input wire b,
    input wire c,
    output wire out
);
    assign out = (a & b) | (a & c) | (b & c);
endmodule

module mdetect_3_arr #(
    parameter COUNT = 8
) (
    input wire [COUNT-1:0] a,
    input wire [COUNT-1:0] b,
    input wire [COUNT-1:0] c,
    output wire [COUNT-1:0] out
);
    genvar i;
    generate
        for (i = 0; i < COUNT; i = i + 1) begin : mdetect_instances
            mdetect_3 mdetect_inst (
                .a(a[i]),
                .b(b[i]),
                .c(c[i]),
                .out(out[i])
            );
        end
    endgenerate
endmodule