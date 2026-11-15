module origen_034088(
    input clk,
    input nCR,
    input [11:0] code,
    output ctrl_clk,
    output [2:0] BCD1,
    output [6:0] BCD2
);

reg [1:0] clk_div;
reg [9:0] counter;
reg [11:0] code_reg;

always @(posedge clk or negedge nCR) begin
    if (!nCR) begin
        clk_div <= 2'b00;
        counter <= 10'd0;
        code_reg <= 12'd0;
    end else begin
        clk_div <= clk_div + 1'b1;
        if (clk_div == 2'b10) begin
            if (counter == 10'd999) begin
                counter <= 10'd0;
                code_reg <= code;
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end
end

assign ctrl_clk = clk_div[1];

bcd_1 bcd_inst (
    .in(code_reg),
    .CP(ctrl_clk),
    .nCR(nCR),
    .BCD1(BCD1),
    .BCD2(BCD2)
);

endmodule

module bcd_1(
    input [11:0] in,
    input CP,
    input nCR,
    output reg [2:0] BCD1,
    output [6:0] BCD2
);

wire CP2;
reg [2:0] cnt1;
reg [3:0] bcd2;

divide1 div_inst (
    .CP(CP),
    .nCR(nCR),
    .OUT(CP2)
);

always @(posedge CP2 or negedge nCR) begin
    if (!nCR) begin
        cnt1 <= 3'd0;
        BCD1 <= 3'd0;
    end else begin
        if (cnt1 == 3'd7) begin
            cnt1 <= 3'd0;
        end else begin
            cnt1 <= cnt1 + 1'b1;
        end
        BCD1 <= cnt1;
    end
end

always @(*) begin
    case (cnt1)
        3'd0: bcd2 = in[3:0];
        3'd1: bcd2 = in[7:4];
        3'd2: bcd2 = in[11:8];
        default: bcd2 = 4'd0;
    endcase
end

bcd bcd_inst (
    .bcd2(bcd2),
    .BCD2(BCD2)
);

endmodule

module divide1(
    input CP,
    input nCR,
    output reg OUT
);

reg [12:0] counter;

always @(posedge CP or negedge nCR) begin
    if (!nCR) begin
        counter <= 13'd0;
        OUT <= 1'b0;
    end else begin
        if (counter == 13'd2500) begin
            counter <= 13'd0;
            OUT <= ~OUT;
        end else begin
            counter <= counter + 1'b1;
        end
    end
end

endmodule

module bcd(
    input [3:0] bcd2,
    output reg [6:0] BCD2
);

always @(*) begin
    case (bcd2)
        4'b0000: BCD2 = 7'b1111110; // 0
        4'b0001: BCD2 = 7'b0110000; // 1
        4'b0010: BCD2 = 7'b1101101; // 2
        4'b0011: BCD2 = 7'b1111001; // 3
        4'b0100: BCD2 = 7'b0110011; // 4
        4'b0101: BCD2 = 7'b1011011; // 5
        4'b0110: BCD2 = 7'b1011111; // 6
        4'b0111: BCD2 = 7'b1110000; // 7
        4'b1000: BCD2 = 7'b1111111; // 8
        4'b1001: BCD2 = 7'b1111011; // 9
        default: BCD2 = 7'b0000000; // Off
    endcase
end

endmodule