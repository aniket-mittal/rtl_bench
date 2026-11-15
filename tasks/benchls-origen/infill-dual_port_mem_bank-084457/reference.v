module origen_084457 #(
    parameter DW = 8,
    parameter OUT_DW = DW,
    parameter MEM_SIZE = 14,
    parameter MEM_ADDR = 4
)(
    input signed [DW:0] data_in,
    input clk,
    input reset,
    input write_en,
    input read_en,
    input chiprd_en,
    input [MEM_ADDR-1:0] in_address,
    input [MEM_ADDR-1:0] out_address,
    output reg signed [OUT_DW:0] data_out,
    output reg signed [(OUT_DW+1)*MEM_SIZE-1:0] result_out
);

    reg signed [DW:0] mem [0:MEM_SIZE-1];
    integer i;

    always @(negedge reset or posedge clk) begin
        if (!reset) begin
            for (i = 0; i < MEM_SIZE; i = i + 1) begin
                mem[i] <= 0;
            end
        end else if (write_en) begin
            mem[in_address] <= data_in;
        end
    end

    always @(*) begin
        if (read_en) begin
            if (out_address < MEM_SIZE) begin
                data_out = mem[out_address];
            end else begin
                data_out = 0;
            end
        end else begin
            data_out = 0;
        end
    end

    always @(*) begin
        if (chiprd_en) begin
            for (i = 0; i < MEM_SIZE; i = i + 1) begin
                result_out[(i+1)*(OUT_DW+1)-1 -: OUT_DW+1] = mem[i];
            end
        end else begin
            result_out = 0;
        end
    end

endmodule