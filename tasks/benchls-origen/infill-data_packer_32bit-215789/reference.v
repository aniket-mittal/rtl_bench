module origen_215789(
    input [7:0] mux_in_1,
    input [7:0] mux_in_2,
    input clk,
    input rst,
    output reg [31:0] ext_data_1,
    output reg [31:0] ext_data_2
);

reg [7:0] data_1_1, data_1_2, data_1_3, data_1_4;
reg [7:0] data_2_1, data_2_2, data_2_3, data_2_4;

always @(posedge clk) begin
    if (rst) begin
        data_1_1 <= 8'b0;
        data_1_2 <= 8'b0;
        data_1_3 <= 8'b0;
        data_1_4 <= 8'b0;
        data_2_1 <= 8'b0;
        data_2_2 <= 8'b0;
        data_2_3 <= 8'b0;
        data_2_4 <= 8'b0;
        ext_data_1 <= 32'b0;
        ext_data_2 <= 32'b0;
    end
    else begin
        if (data_1_1 == 8'b0) data_1_1 <= mux_in_1;
        if (data_1_2 == 8'b0) data_1_2 <= mux_in_1;
        if (data_1_3 == 8'b0) data_1_3 <= mux_in_1;
        if (data_1_4 == 8'b0) data_1_4 <= mux_in_1;

        if (data_2_1 == 8'b0) data_2_1 <= mux_in_2;
        if (data_2_2 == 8'b0) data_2_2 <= mux_in_2;
        if (data_2_3 == 8'b0) data_2_3 <= mux_in_2;
        if (data_2_4 == 8'b0) data_2_4 <= mux_in_2;

        if (data_1_4 != 8'b0) begin
            ext_data_1 <= {data_1_1, data_1_2, data_1_3, data_1_4};
            data_1_1 <= 8'b0;
            data_1_2 <= 8'b0;
            data_1_3 <= 8'b0;
            data_1_4 <= 8'b0;
        end

        if (data_2_4 != 8'b0) begin
            ext_data_2 <= {data_2_1, data_2_2, data_2_3, data_2_4};
            data_2_1 <= 8'b0;
            data_2_2 <= 8'b0;
            data_2_3 <= 8'b0;
            data_2_4 <= 8'b0;
        end
    end
end

endmodule