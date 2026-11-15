module origen_167241 #(
    parameter max_num = 100,
    parameter unit_interval = 10
)(
    input Sys_CLK,
    input Sys_RST,
    input Recording,
    input Key_In,
    input [4:0] Length,
    input [1:0] Light,
    output reg [4:0] Index,
    output reg [7:0] opList
);

reg [9:0] cnt;
reg [6:0] number;

always @(posedge Sys_CLK or negedge Sys_RST) begin
    if (~Sys_RST) begin
        cnt <= 0;
        number <= 0;
    end
    else if (~Recording || Key_In) begin
        cnt <= 0;
        number <= 0;
    end
    else begin
        if (cnt == unit_interval - 1) begin
            cnt <= 0;
            if (number < max_num)
                number <= number + 1;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
end

always @(posedge Sys_CLK or negedge Sys_RST) begin
    if (~Sys_RST) begin
        Index <= 0;
        opList <= 0;
    end
    else if (Key_In) begin
        Index <= Length + 1;
        opList <= {Light[1] & Light[0], number};
    end
    else if (~Recording) begin
        Index <= 0;
    end
end

endmodule