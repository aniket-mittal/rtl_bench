module origen_127899(
    input [255:0] data_in,
    input [7:0] select,
    input a, b,
    input clk,
    output reg final_out
);

    wire mux_out;
    wire xor_out;

    // 256-to-1 multiplexer
    mux_256to1 mux (
        .data_in(data_in),
        .select(select),
        .out(mux_out)
    );

    // XOR gate
    xor_gate xor_g (
        .a(a),
        .b(b),
        .clk(clk),
        .out(xor_out)
    );

    // Final output
    always @(posedge clk) begin
        final_out <= mux_out ^ xor_out;
    end

endmodule

module mux_256to1(
    input [255:0] data_in,
    input [7:0] select,
    output out
);

    wire [15:0] level1;
    wire [3:0] level2;

    genvar i, j;

    // First level: 16 16-to-1 muxes
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux16
            mux_16to1 mux16 (
                .data_in(data_in[16*i+15:16*i]),
                .select(select[3:0]),
                .out(level1[i])
            );
        end
    endgenerate

    // Second level: 4 4-to-1 muxes
    generate
        for (j = 0; j < 4; j = j + 1) begin : mux4
            mux_4to1 mux4 (
                .data_in(level1[4*j+3:4*j]),
                .select(select[5:4]),
                .out(level2[j])
            );
        end
    endgenerate

    // Final level: 1 4-to-1 mux
    mux_4to1 final_mux (
        .data_in(level2),
        .select(select[7:6]),
        .out(out)
    );

endmodule

module mux_16to1(
    input [15:0] data_in,
    input [3:0] select,
    output out
);

    assign out = data_in[select];

endmodule

module mux_4to1(
    input [3:0] data_in,
    input [1:0] select,
    output out
);

    assign out = data_in[select];

endmodule

module xor_gate(
    input a, b,
    input clk,
    output reg out
);

    reg and1, and2, or1;

    always @(posedge clk) begin
        and1 = a & (~b);
        and2 = (~a) & b;
        or1 = and1 | and2;
        out <= or1;
    end

endmodule