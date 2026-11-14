module origen_142621(
    input [2:0] decoder_in,
    input [1023:0] mux_in,
    input [7:0] mux_sel,
    output [3:0] final_out
);

    wire [3:0] decoder_out;
    wire [3:0] mux_out;

    // 3:4 Decoder
    decoder_3to4 dec (
        .in(decoder_in),
        .out(decoder_out)
    );

    // 256-to-1 Multiplexer (4-bit wide)
    barrel_mux_256to1 mux (
        .in(mux_in),
        .sel(mux_sel),
        .out(mux_out)
    );

    // Adder for final output
    adder_4bit add (
        .a(decoder_out),
        .b(mux_out),
        .sum(final_out)
    );

endmodule

module decoder_3to4(
    input [2:0] in,
    output reg [3:0] out
);

    always @(*) begin
        case(in)
            3'b000: out = 4'b0001;
            3'b001: out = 4'b0010;
            3'b010: out = 4'b0100;
            3'b011: out = 4'b1000;
            3'b100: out = 4'b0001;
            3'b101: out = 4'b0010;
            3'b110: out = 4'b0100;
            3'b111: out = 4'b1000;
        endcase
    end

endmodule

module barrel_mux_256to1(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);

    wire [3:0] stage1 [255:0];
    wire [3:0] stage2 [63:0];
    wire [3:0] stage3 [15:0];
    wire [3:0] stage4 [3:0];

    genvar i;

    // Stage 1: Group input bits into 4-bit sets
    generate
        for (i = 0; i < 256; i = i + 1) begin : stage1_gen
            assign stage1[i] = in[i*4 +: 4];
        end
    endgenerate

    // Stage 2: 4:1 mux
    generate
        for (i = 0; i < 64; i = i + 1) begin : stage2_gen
            assign stage2[i] = stage1[{sel[1:0], i[5:0]}];
        end
    endgenerate

    // Stage 3: 4:1 mux
    generate
        for (i = 0; i < 16; i = i + 1) begin : stage3_gen
            assign stage3[i] = stage2[{sel[3:2], i[3:0]}];
        end
    endgenerate

    // Stage 4: 4:1 mux
    generate
        for (i = 0; i < 4; i = i + 1) begin : stage4_gen
            assign stage4[i] = stage3[{sel[5:4], i[1:0]}];
        end
    endgenerate

    // Final stage: 4:1 mux
    assign out = stage4[sel[7:6]];

endmodule

module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum
);

    assign sum = a + b;

endmodule