module origen_063918 (
    input wire rst_n,
    input wire [4:0] input_addr,
    input wire [4:0] input_expro_addr,
    input wire [4:0] input_mempro_addr,
    input wire [31:0] input_data,
    input wire [31:0] input_expro_data,
    input wire [31:0] input_mempro_data,
    input wire input_control,
    output reg [31:0] output_data,
    output reg output_stop
);

always @(*) begin
    if (!rst_n) begin
        output_data = 32'b0;
        output_stop = 1'b0;
    end
    else if (input_control) begin
        output_stop = 1'b0;
        if (input_addr == 5'b0)
            output_data = 32'b0;
        else if (input_addr == input_expro_addr)
            output_data = input_expro_data;
        else if (input_addr == input_mempro_addr)
            output_data = input_mempro_data;
        else
            output_data = input_data;
    end
    else begin
        if (input_addr == 5'b0) begin
            output_data = 32'b0;
            output_stop = 1'b0;
        end
        else if (input_addr == input_expro_addr) begin
            output_data = 32'b0;
            output_stop = 1'b1;
        end
        else if (input_addr == input_mempro_addr) begin
            output_data = input_mempro_data;
            output_stop = 1'b0;
        end
        else begin
            output_data = input_data;
            output_stop = 1'b0;
        end
    end
end

endmodule