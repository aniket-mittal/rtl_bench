module origen_212282 (
    input clk,
    input rst,
    input [31:0] pass_data,
    input aes_en,
    input [3:0] div_bits,
    output reg [7:0] out_data,
    output reg out_valid
);

    reg [1:0] pass_count;
    reg [7:0] out;
    reg valid;
    reg [127:0] out_mem;
    reg [3:0] clk_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pass_count <= 2'b00;
            out_mem <= 128'b0;
            clk_count <= 4'b0;
            out <= 8'b0;
            valid <= 1'b0;
        end
        else begin
            if (aes_en) begin
                case (pass_count)
                    2'b00: out_mem[31:0] <= pass_data;
                    2'b01: out_mem[63:32] <= pass_data;
                    2'b10: out_mem[95:64] <= pass_data;
                    2'b11: out_mem[127:96] <= pass_data;
                endcase
                pass_count <= pass_count + 2'b01;
            end

            if (clk_count == {4{1'b1}} >> (4 - div_bits)) begin
                out <= out_mem[(clk_count * 8) +: 8];
                valid <= 1'b1;
                clk_count <= 4'b0;
            end
            else begin
                clk_count <= clk_count + 4'b0001;
                valid <= 1'b0;
            end
        end
    end

    always @(*) begin
        out_data = out;
        out_valid = valid;
    end

endmodule