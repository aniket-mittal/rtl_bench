module origen_004895 (
    input wire clk,
    input wire rst,
    input wire [7:0] data_1,
    input wire [7:0] data_2,
    input wire [7:0] data_3,
    output reg [7:0] data_min,
    output reg [7:0] data_middle,
    output reg [7:0] data_max
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_min <= 8'b0;
            data_middle <= 8'b0;
            data_max <= 8'b0;
        end else begin
            if (data_1 <= data_2) begin
                if (data_3 <= data_1) begin
                    data_min <= data_3;
                    data_middle <= data_1;
                    data_max <= data_2;
                end else if (data_3 <= data_2) begin
                    data_min <= data_1;
                    data_middle <= data_3;
                    data_max <= data_2;
                end else begin
                    data_min <= data_1;
                    data_middle <= data_2;
                    data_max <= data_3;
                end
            end else begin
                if (data_3 <= data_2) begin
                    data_min <= data_3;
                    data_middle <= data_2;
                    data_max <= data_1;
                end else if (data_3 <= data_1) begin
                    data_min <= data_2;
                    data_middle <= data_3;
                    data_max <= data_1;
                end else begin
                    data_min <= data_2;
                    data_middle <= data_1;
                    data_max <= data_3;
                end
            end
        end
    end

endmodule