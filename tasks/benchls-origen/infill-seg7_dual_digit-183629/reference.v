module origen_183629 (
    input  wire        CLK,
    input  wire [3:0]  Ten_Data,
    input  wire [3:0]  One_Data,
    output reg [7:0]   Ten_SMG_Data,
    output reg [7:0]   One_SMG_Data
);

    parameter _0 = 8'b11000000;
    parameter _1 = 8'b11111001;
    parameter _2 = 8'b10100100;
    parameter _3 = 8'b10110000;
    parameter _4 = 8'b10011001;
    parameter _5 = 8'b10010010;
    parameter _6 = 8'b10000010;
    parameter _7 = 8'b11111000;
    parameter _8 = 8'b10000000;
    parameter _9 = 8'b10010000;

    always @(posedge CLK) begin
        case (Ten_Data)
            4'd0: Ten_SMG_Data <= _0;
            4'd1: Ten_SMG_Data <= _1;
            4'd2: Ten_SMG_Data <= _2;
            4'd3: Ten_SMG_Data <= _3;
            4'd4: Ten_SMG_Data <= _4;
            4'd5: Ten_SMG_Data <= _5;
            4'd6: Ten_SMG_Data <= _6;
            4'd7: Ten_SMG_Data <= _7;
            4'd8: Ten_SMG_Data <= _8;
            4'd9: Ten_SMG_Data <= _9;
            default: Ten_SMG_Data <= 8'b11111111;
        endcase
    end

    always @(posedge CLK) begin
        case (One_Data)
            4'd0: One_SMG_Data <= _0;
            4'd1: One_SMG_Data <= _1;
            4'd2: One_SMG_Data <= _2;
            4'd3: One_SMG_Data <= _3;
            4'd4: One_SMG_Data <= _4;
            4'd5: One_SMG_Data <= _5;
            4'd6: One_SMG_Data <= _6;
            4'd7: One_SMG_Data <= _7;
            4'd8: One_SMG_Data <= _8;
            4'd9: One_SMG_Data <= _9;
            default: One_SMG_Data <= 8'b11111111;
        endcase
    end

endmodule