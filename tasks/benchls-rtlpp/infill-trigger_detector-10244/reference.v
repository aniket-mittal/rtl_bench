module rtlpp_10244 (
    input rst,
    input clk,
    input in_data_valid,
    input [15:0] in_data,
    input [31:0] in_dma_master_address,
    input [15:0] trigger_level,
    output reg [31:0] out_data_offset,
    output reg [15:0] trigger_response,
    output wire trigger
);

parameter DATA_WIDTH = 16;
parameter MEMORY_ADDR_LEN = 32;
parameter TWOS_COMPLEMENT = 0;

wire [DATA_WIDTH-1:0] trigger_level_value;
reg [15:0] cnt;
reg trigger_cnt_rst;
reg unsigned_data_valid;
reg trigger_acq_en;
wire [DATA_WIDTH-1:0] unsigned_in_data;
reg [DATA_WIDTH-1:0] unsigned_in_data_conv;
reg [31:0] data_offset;
reg tg_test;

assign unsigned_in_data = (TWOS_COMPLEMENT == 1) ? unsigned_in_data_conv : in_data;
assign trigger_level_value = (trigger_level == 0) ? 2000 : trigger_level;
assign trigger = (cnt == 5) ? 1 : 0;

always @(posedge clk) begin
    if (rst) begin
        unsigned_data_valid <= 1'b1;
        unsigned_in_data_conv <= 0;
    end else begin
        if (in_data_valid) begin
            unsigned_data_valid <= 1'b1;
            if (in_data >= 16'h8000) begin
                unsigned_in_data_conv <= ~in_data + 16'b1;
            end else begin
                unsigned_in_data_conv <= in_data + 16'h8000;
            end
        end else begin
            unsigned_data_valid <= 1'b0;
        end
    end 
end

always @(posedge clk) begin
    if (rst) begin
        trigger_acq_en <= 1'b1;
        trigger_response <= 16'd0;
        trigger_cnt_rst <= 1'b0;
        data_offset <= 0;
        tg_test <= 0;
    end else begin
        trigger_response <= 16'd1;
        if (unsigned_data_valid) begin
            if (unsigned_in_data >= trigger_level_value && trigger_acq_en) begin
                data_offset <= in_dma_master_address;
                trigger_acq_en <= 1'b0;
                tg_test <= 1'b1;
            end else if (unsigned_in_data < trigger_level_value) begin
                tg_test <= 1'b0;
                trigger_acq_en <= 1'b1;
            end
        end
    end
end

always @(posedge clk) begin
    if (rst) begin
        cnt <= 16'd0;
        out_data_offset <= 0;
    end else begin
        if (tg_test) begin
            if (unsigned_in_data) begin
                if (cnt == 6) begin
                    cnt <= 6;
                    if (unsigned_in_data >= trigger_level_value) begin
                        out_data_offset <= data_offset;
                    end
                end else begin
                    cnt <= cnt + 1;
                end
            end
        end else begin
            cnt <= 0;
        end
    end
end

endmodule