module rtlpp_10504(clk, 
               flash, 
               Hexs, 
               LES, 
               point, 
               rst, 
               Start, 
               SW0, 
               seg_clk, 
               seg_clrn, 
               SEG_PEN, 
               seg_sout);

    input clk;
    input flash;
    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input rst;
    input Start;
    input SW0;
    output seg_clk;
    output seg_clrn;
    output SEG_PEN;
    output seg_sout;
    
    wire [63:0] XLXN_14;
    wire [63:0] XLXN_15;
    wire [63:0] XLXN_16;

    // HexTo8SEG8 module embedded logic
    function [7:0] HexTo7Seg;
        input [3:0] hex_digit;
        case (hex_digit)
            4'h0: HexTo7Seg = 8'b11000000;
            4'h1: HexTo7Seg = 8'b11111001;
            4'h2: HexTo7Seg = 8'b10100100;
            4'h3: HexTo7Seg = 8'b10110000;
            4'h4: HexTo7Seg = 8'b10011001;
            4'h5: HexTo7Seg = 8'b10010010;
            4'h6: HexTo7Seg = 8'b10000010;
            4'h7: HexTo7Seg = 8'b11111000;
            4'h8: HexTo7Seg = 8'b10000000;
            4'h9: HexTo7Seg = 8'b10010000;
            4'hA: HexTo7Seg = 8'b10001000;
            4'hB: HexTo7Seg = 8'b10000011;
            4'hC: HexTo7Seg = 8'b11000110;
            4'hD: HexTo7Seg = 8'b10100001;
            4'hE: HexTo7Seg = 8'b10000110;
            4'hF: HexTo7Seg = 8'b10001110;
            default: HexTo7Seg = 8'b11111111;
        endcase
    endfunction

    // SSeg_map logic
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : map
            assign XLXN_15[8*i +: 8] = HexTo7Seg(Hexs[4*i +: 4]);
        end
    endgenerate
    
    // HexTo8SEG8 logic
    generate
        for (i = 0; i < 8; i = i + 1) begin : hex_loop
            assign XLXN_16[8*i +: 8] = (flash && (LES[i] || point[i])) ? 8'b11111111 : HexTo7Seg(Hexs[4*i +: 4]);
        end
    endgenerate

    // MUX2T1_64 logic
    assign XLXN_14 = SW0 ? XLXN_16 : XLXN_15;

    // P2S module logic
    reg [63:0] shift_reg = 64'b0;
    assign seg_sout = shift_reg[63];
    assign seg_clk = clk;
    assign seg_clrn = ~rst;
    assign SEG_PEN = Start;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 64'b0;
        else if (Start)
            shift_reg <= XLXN_14;
        else
            shift_reg <= {shift_reg[62:0], 1'b0};
    end

endmodule