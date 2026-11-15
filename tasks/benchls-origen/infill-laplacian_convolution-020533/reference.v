module origen_020533(
    input i_clk,
    input [71:0] i_pixel_data,
    input i_pixel_data_valid,
    output reg [7:0] o_convolved_data,
    output reg o_convolved_data_valid
);

reg [7:0] kernel1 [8:0];
reg [7:0] kernel2 [8:0];
reg [15:0] multData1 [8:0];
reg [15:0] multData2 [8:0];
reg [15:0] sumData1, sumData2;
reg [31:0] convolved_data_int1, convolved_data_int2;
reg [31:0] convolved_data_int;
reg mult_valid, sum_valid, square_valid;

integer i;

initial begin
    kernel1[0] = -1; kernel1[1] = -1; kernel1[2] = -1;
    kernel1[3] = -1; kernel1[4] =  8; kernel1[5] = -1;
    kernel1[6] = -1; kernel1[7] = -1; kernel1[8] = -1;

    kernel2[0] = -1; kernel2[1] = -1; kernel2[2] = -1;
    kernel2[3] = -1; kernel2[4] =  8; kernel2[5] = -1;
    kernel2[6] = -1; kernel2[7] = -1; kernel2[8] = -1;
end

always @(posedge i_clk) begin
    for (i = 0; i < 9; i = i + 1) begin
        multData1[i] <= $signed(i_pixel_data[i*8 +: 8]) * $signed(kernel1[i]);
        multData2[i] <= $signed(i_pixel_data[i*8 +: 8]) * $signed(kernel2[i]);
    end
    mult_valid <= i_pixel_data_valid;
end

always @(posedge i_clk) begin
    sumData1 <= multData1[0] + multData1[1] + multData1[2] + multData1[3] + multData1[4] + 
                multData1[5] + multData1[6] + multData1[7] + multData1[8];
    sumData2 <= multData2[0] + multData2[1] + multData2[2] + multData2[3] + multData2[4] + 
                multData2[5] + multData2[6] + multData2[7] + multData2[8];
    sum_valid <= mult_valid;
end

always @(posedge i_clk) begin
    convolved_data_int1 <= sumData1 * sumData1;
    convolved_data_int2 <= sumData2 * sumData2;
    square_valid <= sum_valid;
end

always @(posedge i_clk) begin
    convolved_data_int <= convolved_data_int1 + convolved_data_int2;
    o_convolved_data <= (convolved_data_int > 4000) ? 8'hFF : 8'h00;
    o_convolved_data_valid <= square_valid;
end

endmodule