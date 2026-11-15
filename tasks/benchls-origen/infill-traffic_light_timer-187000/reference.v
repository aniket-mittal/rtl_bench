module origen_187000 (
    input clk,
    input reset,
    input [1:0] time_parameter_selector,
    input [3:0] time_value,
    input prog_sync,
    input [1:0] interval_code,
    output reg [3:0] value
);

reg [3:0] time_base, time_yel, time_ext;
reg [3:0] temp_base, temp_yel, temp_ext;

initial begin
    time_base = 4'b0110;
    time_yel = 4'b0010;
    time_ext = 4'b0011;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        time_base <= 4'b0110;
        time_yel <= 4'b0010;
        time_ext <= 4'b0011;
    end
    else begin
        if (prog_sync) begin
            time_base <= temp_base;
            time_yel <= temp_yel;
            time_ext <= temp_ext;
        end
        else begin
            case (time_parameter_selector)
                2'b00: temp_base <= time_value;
                2'b01: temp_yel <= time_value;
                2'b10: temp_ext <= time_value;
                default: ;
            endcase
        end
    end
end

always @(*) begin
    case (interval_code)
        2'b00: value = time_base;
        2'b01: value = time_yel;
        2'b10: value = time_ext;
        2'b11: value = time_base + time_ext;
        default: value = 4'b0000;
    endcase
end

endmodule