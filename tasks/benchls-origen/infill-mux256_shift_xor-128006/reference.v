module origen_128006 (
    input wire [255:0] mux_in,
    input wire [7:0] mux_sel,
    input wire [7:0] shift_in,
    input wire clk,
    input wire reset,
    output wire [7:0] final_out
);

    wire mux_out;
    wire [7:0] shift_out;

    // 256-to-1 Multiplexer
    mux_256to1 mux (
        .in(mux_in),
        .sel(mux_sel),
        .out(mux_out)
    );

    // 8-bit Shift Register (Ring Counter)
    shift_register_8bit shift_reg (
        .in(shift_in),
        .clk(clk),
        .reset(reset),
        .out(shift_out)
    );

    // XOR operation for final output
    assign final_out = {8{mux_out}} ^ shift_out;

endmodule

module mux_256to1 (
    input wire [255:0] in,
    input wire [7:0] sel,
    output wire out
);

    wire [15:0] mux16_out;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux16_gen
            mux_16to1 mux16 (
                .in(in[16*i+15:16*i]),
                .sel(sel[3:0]),
                .out(mux16_out[i])
            );
        end
    endgenerate

    mux_16to1 final_mux (
        .in(mux16_out),
        .sel(sel[7:4]),
        .out(out)
    );

endmodule

module mux_16to1 (
    input wire [15:0] in,
    input wire [3:0] sel,
    output wire out
);

    wire [3:0] mux4_out;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : mux4_gen
            mux_4to1 mux4 (
                .in(in[4*i+3:4*i]),
                .sel(sel[1:0]),
                .out(mux4_out[i])
            );
        end
    endgenerate

    mux_4to1 final_mux (
        .in(mux4_out),
        .sel(sel[3:2]),
        .out(out)
    );

endmodule

module mux_4to1 (
    input wire [3:0] in,
    input wire [1:0] sel,
    output wire out
);

    assign out = in[sel];

endmodule

module shift_register_8bit (
    input wire [7:0] in,
    input wire clk,
    input wire reset,
    output reg [7:0] out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= in;
        else
            out <= {out[6:0], out[7]};
    end

endmodule