module origen_150813 (
    input clk,
    input rst,
    input ps_clk,
    input ps_data,
    output reg [7:0] dataout,
    output reg [7:0] led
);

reg [3:0] num;
reg [7:0] data_buffer;
reg [7:0] data_reg1;
reg [7:0] result;
reg isDone;

always @(negedge ps_clk) begin
    data_buffer <= ps_data;
end

always @(posedge ps_clk or negedge rst) begin
    if (!rst) begin
        num <= 0;
    end else begin
        if (num < 10) begin
            num <= num + 1;
        end else begin
            num <= 0;
        end
    end
end

always @(posedge ps_clk or negedge rst) begin
    if (!rst) begin
        data_reg1 <= 0;
        isDone <= 0;
        result <= 0;
    end else begin
        if (num == 9) begin
            data_reg1 <= data_buffer;
        end else if (num == 10) begin
            if (data_reg1 == 8'hF0) begin
                result <= 8'hFF;
            end else begin
                isDone <= 1;
                result <= data_reg1;
            end
        end else begin
            result <= 0;
        end
    end
end

reg [7:0] dataout_temp;

always @* begin
    dataout_temp = result;
    led = ~result;
end

[MASKED]

endmodule