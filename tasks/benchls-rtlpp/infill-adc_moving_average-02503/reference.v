module rtlpp_02503 (
    clk,
    rstn,
    sample,
    raw_data_in,
    ave_data_out,
    data_out_valid
);

parameter ADC_WIDTH = 8;
parameter LPF_DEPTH_BITS = 4;

input clk;
input rstn;
input sample;
input [ADC_WIDTH-1:0] raw_data_in;

output [ADC_WIDTH-1:0] ave_data_out;
output data_out_valid;

reg [ADC_WIDTH-1:0] ave_data_out;
reg [ADC_WIDTH+LPF_DEPTH_BITS-1:0] accum;
reg [LPF_DEPTH_BITS-1:0] count;
reg [ADC_WIDTH-1:0] raw_data_d1;

reg sample_d1, sample_d2;
reg result_valid;
wire accumulate;
wire latch_result;

always @(posedge clk or negedge rstn)
begin
    if (~rstn) begin
        sample_d1 <= 0;
        sample_d2 <= 0;
        raw_data_d1 <= 0;
        result_valid <= 0;
    end else begin
        sample_d1 <= sample;
        sample_d2 <= sample_d1;
        raw_data_d1 <= raw_data_in;
        result_valid <= latch_result;
    end
end

assign accumulate = sample_d1 && !sample_d2;
assign latch_result = accumulate && (count == 0);

always @(posedge clk or negedge rstn)
begin
    if (~rstn) begin
        count <= 0;
    end else begin
        if (accumulate) count <= count + 1;
    end
end

always @(posedge clk or negedge rstn)
begin
    if (~rstn) begin
        accum <= 0;
    end else begin
        if (accumulate)
            if (count == 0)
                accum <= raw_data_d1;
            else
                accum <= accum + raw_data_d1;
    end
end

always @(posedge clk or negedge rstn)
begin
    if (~rstn) begin
        ave_data_out <= 0;
    end else if (latch_result) begin
        ave_data_out <= accum >> LPF_DEPTH_BITS;
    end
end

assign data_out_valid = result_valid;

endmodule