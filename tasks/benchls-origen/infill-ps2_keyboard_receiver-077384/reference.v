module origen_077384(
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire clk_in,
    output reg [4:0] oControl
);

reg r1, r2;
wire ps2_clk_n;
reg [7:0] ps2_data;
reg [4:0] i;
reg done_flag;
reg f0_flag;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r1 <= 1'b0;
        r2 <= 1'b0;
    end else begin
        r1 <= clk_in;
        r2 <= r1;
    end
end

assign ps2_clk_n = r2 & ~r1;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i <= 5'd0;
        ps2_data <= 8'd0;
        done_flag <= 1'b0;
        f0_flag <= 1'b0;
        oControl <= 5'b00000;
    end else begin
        case (i)
            5'd0: begin
                if (ps2_clk_n) begin
                    ps2_data[0] <= data_in;
                    i <= i + 1'b1;
                end
            end
            5'd1, 5'd2, 5'd3, 5'd4, 5'd5, 5'd6, 5'd7: begin
                if (ps2_clk_n) begin
                    ps2_data[i] <= data_in;
                    i <= i + 1'b1;
                end
            end
            5'd8: begin
                if (ps2_clk_n) i <= i + 1'b1;
            end
            5'd9: begin
                if (ps2_clk_n) i <= i + 1'b1;
            end
            5'd10: begin
                if (ps2_clk_n) i <= i + 1'b1;
            end
            5'd11: begin
                if (ps2_data == 8'hF0) begin
                    f0_flag <= 1'b1;
                    i <= 5'd0;
                end else begin
                    if (f0_flag) begin
                        f0_flag <= 1'b0;
                        i <= 5'd23;
                    end else begin
                        i <= 5'd23;
                    end
                end
            end
            5'd23: begin
                done_flag <= 1'b1;
                i <= i + 1'b1;
            end
            5'd24: begin
                done_flag <= 1'b0;
                i <= 5'd0;
            end
            default: i <= 5'd0;
        endcase

        if (done_flag) begin
            case (ps2_data)
                8'h1D: oControl <= f0_flag ? 5'b00000 : 5'b10000;
                8'h1B: oControl <= f0_flag ? 5'b00000 : 5'b01000;
                8'h1C: oControl <= f0_flag ? 5'b00000 : 5'b00100;
                8'h23: oControl <= f0_flag ? 5'b00000 : 5'b00010;
                8'h5A: oControl <= f0_flag ? 5'b00000 : 5'b00001;
                default: oControl <= 5'b00000;
            endcase
        end
    end
end

endmodule