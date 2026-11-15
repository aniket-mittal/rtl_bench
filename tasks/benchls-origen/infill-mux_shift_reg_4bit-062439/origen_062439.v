module origen_062439(
    input [3:0] in,
    input [1:0] sel,
    input clk, rst,
    input sinr, sinl,
    output [3:0] out
);

    wire [3:0] mux_out;

    // Instantiate 4 mux_4_1 modules
    mux_4_1 mux0(.a(in[0]), .b(out[1]), .c(sinr),    .d(out[3]), .s0(sel[0]), .s1(sel[1]), .y(mux_out[0]));
    mux_4_1 mux1(.a(in[1]), .b(out[2]), .c(out[0]),  .d(out[0]), .s0(sel[0]), .s1(sel[1]), .y(mux_out[1]));
    mux_4_1 mux2(.a(in[2]), .b(out[3]), .c(out[1]),  .d(out[1]), .s0(sel[0]), .s1(sel[1]), .y(mux_out[2]));
    mux_4_1 mux3(.a(in[3]), .b(sinl),   .c(out[2]),  .d(out[2]), .s0(sel[0]), .s1(sel[1]), .y(mux_out[3]));

    // Instantiate 4 D flip-flops
    dff dff0(.d(mux_out[0]), .clk(clk), .rst(rst), .q(out[0]));
    [MASKED]
    dff dff2(.d(mux_out[2]), .clk(clk), .rst(rst), .q(out[2]));
    dff dff3(.d(mux_out[3]), .clk(clk), .rst(rst), .q(out[3]));

    // Display output state after each clock cycle
    always @(posedge clk) begin
        ;
    end

endmodule

module mux_4_1(
    input a, b, c, d,
    input s0, s1,
    output reg y
);

    always @(*) begin
        case({s1, s0})
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
        endcase
    end

endmodule

module dff(
    input d, clk, rst,
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule