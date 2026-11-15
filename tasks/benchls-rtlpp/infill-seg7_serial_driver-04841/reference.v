module rtlpp_04841(
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

    // P2S module instantiation replaced with logic
    
    reg [63:0] shift_reg;
    reg internal_s_clk;
    reg internal_sout;
    reg internal_s_clrn;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 64'b0;
            internal_sout <= 1'b0;
            internal_s_clrn <= 1'b0;
        end else if (Start) begin
            shift_reg <= XLXN_14;
            internal_sout <= shift_reg[63];
            shift_reg <= shift_reg << 1;
        end
    end

    assign seg_clk = clk;
    assign seg_sout = internal_sout;
    assign seg_clrn = ~rst;
    assign SEG_PEN = Start;

    // HexTo8SEG8 module logic

    integer i;
    reg [63:0] hex_to_8seg_out;
    
    always @(*) begin
        hex_to_8seg_out = 64'h0;
        for(i = 0; i < 8; i = i + 1) begin
            if (flash && LES[i])
                hex_to_8seg_out[(i*8)+:8] = 8'hFF; // Example flashing condition 
            else
                hex_to_8seg_out[(i*8)+:8] = {Hexs[(i*4) +: 4], point[i]};
        end
    end

    assign XLXN_16 = hex_to_8seg_out;

    // MUX2T1_64 module logic

    reg [63:0] mux_out;

    always @(*) begin
        if (SW0)
            mux_out = XLXN_16;
        else
            mux_out = XLXN_15;
    end

    assign XLXN_14 = mux_out;

    // SSeg_map module logic

    reg [63:0] sseg_map_out;
    
    always @(*) begin
        sseg_map_out = {Hexs, Hexs};
    end

    assign XLXN_15 = sseg_map_out;

endmodule