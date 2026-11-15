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

    [MASKED]

endmodule