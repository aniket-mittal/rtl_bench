module origen_040036 (
    input wire NADV,
    input wire A18, A17, A16,
    input wire [15:0] AD_IN,
    output reg [18:0] ADDR
);
    always @(posedge NADV) begin
        ADDR <= {A18, A17, A16, AD_IN};
    end
endmodule

module SELECT_ADDR (
    input wire [18:0] ADDR,
    output reg [2:0] ch,
    output reg [3:0] REG_FLAG
);
    always @(*) begin
        if (ADDR[18:7] == 12'hA00) begin
            ch = ADDR[6:4];
            REG_FLAG = ADDR[3:0];
        end else begin
            ch = 3'b000;
            REG_FLAG = 4'b0000;
        end
    end
endmodule

module SELECT_CHANNEL (
    input wire [2:0] CH,
    output reg CH_1, CH_2, CH_3
);
    always @(*) begin
        case (CH)
            3'b001: {CH_1, CH_2, CH_3} = 3'b100;
            3'b010: {CH_1, CH_2, CH_3} = 3'b010;
            3'b100: {CH_1, CH_2, CH_3} = 3'b001;
            default: {CH_1, CH_2, CH_3} = 3'b000;
        endcase
    end
endmodule

module BUFF_SEND_DATA (
    input wire READ, EN,
    inout wire [15:0] DATA,
    output reg FINISH
);
    reg [15:0] buffer;
    reg output_active;

    always @(negedge READ) begin
        if (EN) buffer <= DATA;
    end

    always @(posedge READ) begin
        if (EN) begin
            output_active <= 0;
            FINISH <= ~FINISH;
        end
    end

    assign DATA = (output_active && EN) ? buffer : 16'bz;
endmodule

module BUFF (
    input wire write, EN,
    input wire [15:0] DATA_IN,
    output reg FINISH
);
    reg [15:0] buffer;

    always @(posedge write) begin
        if (EN) begin
            buffer <= DATA_IN;
            FINISH <= ~FINISH;
        end
    end
endmodule

module HighSpeedSync (
    input wire CLK_EN, int_clk,
    input wire [31:0] DATA_IN,
    output reg [31:0] DATA_OUT
);
    always @(posedge CLK_EN) begin
        if (!int_clk) DATA_OUT <= DATA_IN;
    end
endmodule

module counter_8 (
    input wire int_clk,
    output reg [7:0] count
);
    always @(posedge int_clk) begin
        count <= count + 1;
    end
endmodule