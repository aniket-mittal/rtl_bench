module origen_072459(
    input clk,
    input rst,
    input [7:2] DEV_Add,
    input [15:0] Input,
    output reg [3:0] ds,
    output reg [7:0] seg
);

    reg [3:0] num;
    wire [3:0] num0, num1, num2, num3;

    assign num0 = Input[3:0];
    assign num1 = Input[7:4];
    assign num2 = Input[11:8];
    assign num3 = Input[15:12];

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            ds <= 4'b0001;
            num <= num0;
        end else begin
            case (ds)
                4'b0001: begin ds <= 4'b0010; num <= num1; end
                4'b0010: begin ds <= 4'b0100; num <= num2; end
                4'b0100: begin ds <= 4'b1000; num <= num3; end
                4'b1000: begin ds <= 4'b0001; num <= num0; end
                default: begin ds <= 4'b0001; num <= num0; end
            endcase
        end
    end

    always @(*) begin
        case (num)
            4'h0: seg = 8'b11111100;
            4'h1: seg = 8'b01100000;
            4'h2: seg = 8'b11011010;
            4'h3: seg = 8'b11110010;
            4'h4: seg = 8'b01100110;
            4'h5: seg = 8'b10110110;
            4'h6: seg = 8'b10111110;
            4'h7: seg = 8'b11100000;
            4'h8: seg = 8'b11111110;
            4'h9: seg = 8'b11110110;
            4'hA: seg = 8'b11101110;
            4'hB: seg = 8'b00111110;
            4'hC: seg = 8'b10011100;
            4'hD: seg = 8'b01111010;
            4'hE: seg = 8'b10011110;
            4'hF: seg = 8'b10001110;
            default: seg = 8'b00000000;
        endcase
    end

endmodule