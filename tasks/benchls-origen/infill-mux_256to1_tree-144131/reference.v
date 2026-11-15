module origen_144131 (
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);

    wire [255:0] decoded;
    wire [3:0] level1 [127:0];
    wire [3:0] level2 [63:0];
    wire [3:0] level3 [31:0];
    wire [3:0] level4 [15:0];
    wire [3:0] level5 [7:0];
    wire [3:0] level6 [3:0];
    wire [3:0] level7 [1:0];

    // 8-to-256 decoder
    decoder_8to256 dec (
        .in(sel),
        .out(decoded)
    );

    // Level 1: 128 4-bit 2-to-1 muxes
    genvar i;
    generate
        for (i = 0; i < 128; i = i + 1) begin : mux_level1
            mux_2to1_4bit mux (
                .in0(in[i*8+3:i*8]),
                .in1(in[i*8+7:i*8+4]),
                .sel(decoded[i*2+1]),
                .out(level1[i])
            );
        end
    endgenerate

    // Level 2: 64 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 64; i = i + 1) begin : mux_level2
            mux_2to1_4bit mux (
                .in0(level1[i*2]),
                .in1(level1[i*2+1]),
                .sel(decoded[i*4+2]),
                .out(level2[i])
            );
        end
    endgenerate

    // Level 3: 32 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 32; i = i + 1) begin : mux_level3
            mux_2to1_4bit mux (
                .in0(level2[i*2]),
                .in1(level2[i*2+1]),
                .sel(decoded[i*8+4]),
                .out(level3[i])
            );
        end
    endgenerate

    // Level 4: 16 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux_level4
            mux_2to1_4bit mux (
                .in0(level3[i*2]),
                .in1(level3[i*2+1]),
                .sel(decoded[i*16+8]),
                .out(level4[i])
            );
        end
    endgenerate

    // Level 5: 8 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 8; i = i + 1) begin : mux_level5
            mux_2to1_4bit mux (
                .in0(level4[i*2]),
                .in1(level4[i*2+1]),
                .sel(decoded[i*32+16]),
                .out(level5[i])
            );
        end
    endgenerate

    // Level 6: 4 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 4; i = i + 1) begin : mux_level6
            mux_2to1_4bit mux (
                .in0(level5[i*2]),
                .in1(level5[i*2+1]),
                .sel(decoded[i*64+32]),
                .out(level6[i])
            );
        end
    endgenerate

    // Level 7: 2 4-bit 2-to-1 muxes
    generate
        for (i = 0; i < 2; i = i + 1) begin : mux_level7
            mux_2to1_4bit mux (
                .in0(level6[i*2]),
                .in1(level6[i*2+1]),
                .sel(decoded[i*128+64]),
                .out(level7[i])
            );
        end
    endgenerate

    // Final level: 1 4-bit 2-to-1 mux
    mux_2to1_4bit final_mux (
        .in0(level7[0]),
        .in1(level7[1]),
        .sel(decoded[128]),
        .out(out)
    );

endmodule

module decoder_8to256 (
    input [7:0] in,
    output reg [255:0] out
);
    always @(*) begin
        out = 256'b0;
        out[in] = 1'b1;
    end
endmodule

module mux_2to1_4bit (
    input [3:0] in0,
    input [3:0] in1,
    input sel,
    output [3:0] out
);
    assign out = sel ? in1 : in0;
endmodule