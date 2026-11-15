module origen_076670 (
    input wire clk,
    input wire rst_n,
    input wire [11:0] bin,
    output reg [3:0] one,
    output reg [3:0] ten,
    output reg [3:0] hun,
    output reg [2:0] tho,
    output reg done
);

reg [3:0] count;
reg [26:0] shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 4'd0;
        shift_reg <= 27'd0;
        one <= 4'd0;
        ten <= 4'd0;
        hun <= 4'd0;
        tho <= 3'd0;
        done <= 1'b0;
    end else begin
        case (count)
            4'd0: begin
                shift_reg <= {15'd0, bin};
                count <= count + 1'b1;
                done <= 1'b0;
            end
            4'd13: begin
                one <= shift_reg[3:0];
                ten <= shift_reg[7:4];
                hun <= shift_reg[11:8];
                tho <= shift_reg[14:12];
                done <= 1'b1;
                count <= 4'd0;
            end
            default: begin
                if (shift_reg[15:12] > 4'd4) shift_reg[15:12] <= shift_reg[15:12] + 4'd3;
                if (shift_reg[19:16] > 4'd4) shift_reg[19:16] <= shift_reg[19:16] + 4'd3;
                if (shift_reg[23:20] > 4'd4) shift_reg[23:20] <= shift_reg[23:20] + 4'd3;
                if (shift_reg[26:24] > 3'd4) shift_reg[26:24] <= shift_reg[26:24] + 3'd3;
                shift_reg <= {shift_reg[25:0], 1'b0};
                count <= count + 1'b1;
            end
        endcase
    end
end

endmodule