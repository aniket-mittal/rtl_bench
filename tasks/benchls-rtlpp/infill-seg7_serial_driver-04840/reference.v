module rtlpp_04840(clk, 
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

    // Embedded P2S module logic
    reg [63:0] shift_reg;
    reg [5:0] bit_count;
    assign seg_clk = clk;
    assign seg_clrn = rst;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 64'b0;
            bit_count <= 6'b0;
        end else if (Start) begin
            if (bit_count < 64) begin
                shift_reg <= {shift_reg[62:0], XLXN_14[63 - bit_count]};
                bit_count <= bit_count + 1;
            end
        end
    end
    
    assign seg_sout = shift_reg[63];
    assign SEG_PEN = (bit_count < 64);

    // Embedded HexTo8SEG8 module logic
    function [7:0] hex_to_7seg(input [3:0] hex);
        case (hex)
            4'h0: hex_to_7seg = 8'b11000000;
            4'h1: hex_to_7seg = 8'b11111001;
            4'h2: hex_to_7seg = 8'b10100100;
            4'h3: hex_to_7seg = 8'b10110000;
            4'h4: hex_to_7seg = 8'b10011001;
            4'h5: hex_to_7seg = 8'b10010010;
            4'h6: hex_to_7seg = 8'b10000010;
            4'h7: hex_to_7seg = 8'b11111000;
            4'h8: hex_to_7seg = 8'b10000000;
            4'h9: hex_to_7seg = 8'b10010000;
            4'hA: hex_to_7seg = 8'b10001000;
            4'hB: hex_to_7seg = 8'b10000011;
            4'hC: hex_to_7seg = 8'b11000110;
            4'hD: hex_to_7seg = 8'b10100001;
            4'hE: hex_to_7seg = 8'b10000110;
            4'hF: hex_to_7seg = 8'b10001110;
        endcase
    endfunction

    integer i;
    reg [63:0] seg_txt;
    always @* begin
        for (i = 0; i < 8; i = i + 1) begin
            seg_txt[8*i +: 8] = hex_to_7seg(Hexs[4*i +: 4]);
            if (flash) seg_txt[8*i +: 8] = seg_txt[8*i +: 8] | (LES[i] ? 8'b11111101 : 8'b00000000);
            seg_txt[8*i + 7] = seg_txt[8*i + 7] | (!point[i]);
        end
    end
    assign XLXN_16 = seg_txt;

    // Embedded MUX2T1_64 module logic
    assign XLXN_14 = (SW0) ? XLXN_16 : XLXN_15;

    // Embedded SSeg_map module logic
    assign XLXN_15 = {Hexs, Hexs};

endmodule