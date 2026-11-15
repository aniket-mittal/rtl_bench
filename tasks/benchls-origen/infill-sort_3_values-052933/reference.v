module origen_052933 (
    input wire clk,
    input wire rst,
    input wire [7:0] data1,
    input wire [7:0] data2,
    input wire [7:0] data3,
    output reg [7:0] min,
    output reg [7:0] middle,
    output reg [7:0] max
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        min <= 8'b0;
        middle <= 8'b0;
        max <= 8'b0;
    end else begin
        if (data1 < data2) begin
            if (data2 < data3) begin
                min <= data1;
                middle <= data2;
                max <= data3;
            end else if (data3 < data1) begin
                min <= data3;
                middle <= data1;
                max <= data2;
            end else begin
                min <= data1;
                middle <= data3;
                max <= data2;
            end
        end else begin
            if (data1 < data3) begin
                min <= data2;
                middle <= data1;
                max <= data3;
            end else if (data3 < data2) begin
                min <= data3;
                middle <= data2;
                max <= data1;
            end else begin
                min <= data2;
                middle <= data3;
                max <= data1;
            end
        end
    end
end

endmodule