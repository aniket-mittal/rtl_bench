module rtlpp_10537(
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

    // P2S module logic
    reg [63:0] p2s_data;
    reg p2s_sout;
    reg p2s_s_clk;
    reg p2s_s_clrn;
    reg [6:0] p2s_bit_count;
    
    [MASKED]
    
    assign seg_sout = p2s_sout;
    assign seg_clk = p2s_s_clk;
    assign seg_clrn = p2s_s_clrn;
    assign SEG_PEN = Start;

    // HexTo8SEG8 module logic
    reg [63:0] hex8seg_data;

    always @(*) begin
        integer i;
        hex8seg_data = 64'b0;
        for (i = 0; i < 8; i = i + 1) begin
            if (flash) begin
                hex8seg_data[(i*8) +: 8] = (point[i]) ? ~Hexs[(i*4) +: 4] : Hexs[(i*4) +: 4];
            end else begin
                hex8seg_data[(i*8) +: 8] = (LES[i]) ? Hexs[(i*4) +: 4] : ~Hexs[(i*4) +: 4];
            end
        end
    end
  
    assign XLXN_16 = hex8seg_data;

    // MUX2T1_64 module logic
    assign XLXN_14 = (SW0) ? XLXN_16 : XLXN_15;

    // SSeg_map module logic
    assign XLXN_15 = {Hexs, Hexs};

endmodule