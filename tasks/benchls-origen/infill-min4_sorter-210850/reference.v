module origen_210850(
    input clk,
    input reset,
    input [7:0] in_data,
    input isData,
    output reg [7:0] out0,
    output reg [7:0] out1,
    output reg [7:0] out2,
    output reg [7:0] out3
);

reg [1:0] count;
reg [7:0] swap;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        out0 <= 8'hFF;
        out1 <= 8'hFF;
        out2 <= 8'hFF;
        out3 <= 8'hFF;
        count <= 0;
    end
    else if (isData) begin
        if (count < 4) begin
            if (in_data < out0) begin
                swap <= out0;
                out0 <= in_data;
            end
            else if (in_data < out1) begin
                swap <= out1;
                out1 <= in_data;
            end
            else if (in_data < out2) begin
                swap <= out2;
                out2 <= in_data;
            end
            else if (in_data < out3) begin
                swap <= out3;
                out3 <= in_data;
            end
            count <= count + 1;
        end
    end
    else begin
        out0 <= 8'hFF;
        out1 <= 8'hFF;
        out2 <= 8'hFF;
        out3 <= 8'hFF;
        count <= 0;
    end
end

endmodule