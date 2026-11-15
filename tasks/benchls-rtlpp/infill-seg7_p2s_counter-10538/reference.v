module rtlpp_10538(
    input clk,
    input flash,
    input [31:0] Hexs,
    input [7:0] LES,
    input [7:0] point,
    input rst,
    input Start,
    input SW0,
    output seg_clk,
    output seg_clrn,
    output SEG_PEN,
    output seg_sout
);

    wire [63:0] XLXN_14;
    wire [63:0] XLXN_15;
    wire [63:0] XLXN_16;

    // P2S Module Implementation
    reg [63:0] PData;
    reg [5:0] Count = 6'b0;
    reg S_CLK = 1'b0;
    reg S_CLRN = 1'b1;
    reg SOUT;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Count <= 6'b0;
            S_CLK <= 1'b0;
            S_CLRN <= 1'b1;
            SOUT <= 1'b0;
        end else if (Start) begin
            if (Count < 64) begin
                PData <= XLXN_14;
                SOUT <= PData[63-Count];
                S_CLK <= ~S_CLK;
                Count <= Count + 1;
            end
            S_CLRN <= 1'b0;
        end else begin
            Count <= 6'b0;
            SOUT <= 1'b0;
            S_CLK <= 1'b0;
            S_CLRN <= 1'b1;
        end
    end

    assign seg_clk = S_CLK;
    assign seg_clrn = S_CLRN;
    assign seg_sout = SOUT;

    // HexTo8SEG8 Module Implementation
    reg [63:0] SEG_TXT;
    always @(*) begin
        integer i;
        for (i = 0; i < 8; i = i + 1) begin
            case (Hexs[i*4 +:4])
                4'h0: SEG_TXT[i*8 +:8] = 8'b11000000;
                4'h1: SEG_TXT[i*8 +:8] = 8'b11111001;
                4'h2: SEG_TXT[i*8 +:8] = 8'b10100100;
                4'h3: SEG_TXT[i*8 +:8] = 8'b10110000;
                4'h4: SEG_TXT[i*8 +:8] = 8'b10011001;
                4'h5: SEG_TXT[i*8 +:8] = 8'b10010010;
                4'h6: SEG_TXT[i*8 +:8] = 8'b10000010;
                4'h7: SEG_TXT[i*8 +:8] = 8'b11111000;
                4'h8: SEG_TXT[i*8 +:8] = 8'b10000000;
                4'h9: SEG_TXT[i*8 +:8] = 8'b10010000;
                4'hA: SEG_TXT[i*8 +:8] = 8'b10001000;
                4'hB: SEG_TXT[i*8 +:8] = 8'b10000011;
                4'hC: SEG_TXT[i*8 +:8] = 8'b11000110;
                4'hD: SEG_TXT[i*8 +:8] = 8'b10100001;
                4'hE: SEG_TXT[i*8 +:8] = 8'b10000110;
                4'hF: SEG_TXT[i*8 +:8] = 8'b10001110;
                default: SEG_TXT[i*8 +:8] = 8'b11111111;
            endcase

            if (flash) SEG_TXT[i*8 +:8] = SEG_TXT[i*8 +:8] & ~8'b00000001;
            if (LES[i]) SEG_TXT[i*8 +:8] = SEG_TXT[i*8 +:8] & ~8'b10000000;
            if (point[i]) SEG_TXT[i*8 +:8] = SEG_TXT[i*8 +:8] & ~8'b01000000;
        end
    end

    assign XLXN_16 = SEG_TXT;

    // MUX2T1_64 Module Implementation
    assign XLXN_14 = SW0 ? XLXN_16 : XLXN_15;

    // SSeg_map Module Implementation
    reg [63:0] Seg_map;
    always @(*) begin
        Seg_map = {Hexs, Hexs};
    end

    assign XLXN_15 = Seg_map;

    // Assign SEG_PEN (you may need to define the condition for SEG_PEN)
    assign SEG_PEN = Start;

endmodule