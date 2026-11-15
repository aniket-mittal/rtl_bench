module HexTo7Segment(hex, les, point, seg);
    input [3:0] hex;
    input les;
    input point;
    output [7:0] seg;
    
    reg [7:0] seg;

    always @(*) begin
        case (hex)
            4'h0: seg = 8'b11000000;
            4'h1: seg = 8'b11111001;
            4'h2: seg = 8'b10100100;
            4'h3: seg = 8'b10110000;
            // ... (additional cases for other hex values)
            4'hF: seg = 8'b10001110;
            default: seg = 8'b11111111;
        endcase
        
        if (les) 
            seg = ~seg;

        if (point) 
            seg[7] = 0;
    end
endmodule

module rtlpp_10506(clk, 
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

    // Internal functionality of P2S
    reg [63:0] shift_reg;
    reg [6:0] bit_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 64'h0;
            bit_counter <= 7'h0;
        end else if (Start) begin
            shift_reg <= XLXN_14;
            bit_counter <= 7'h40;
        end else if (bit_counter != 0) begin
            shift_reg <= {shift_reg[62:0], 1'b0};
            bit_counter <= bit_counter - 1;
        end
    end

    assign seg_sout = shift_reg[63];
    assign seg_clk = clk;
    assign seg_clrn = ~rst;
    assign SEG_PEN = (bit_counter != 0);

    // Internal functionality of HexTo8SEG8
    wire [63:0] hex_to_7seg_out;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: hex_to_7seg_loop
            HexTo7Segment hex_to_7seg_inst (
                .hex(Hexs[4*i +: 4]),
                .les(LES[i]),
                .point(point[i]),
                .seg(hex_to_7seg_out[8*i +: 8])
            );
        end
    endgenerate

    assign XLXN_16 = flash ? 64'hFFFFFFFFFFFFFFFF : hex_to_7seg_out;

    // Internal functionality of MUX2T1_64
    assign XLXN_14 = SW0 ? XLXN_16 : XLXN_15;

    // Internal functionality of SSeg_map
    assign XLXN_15 = {Hexs, Hexs};

endmodule