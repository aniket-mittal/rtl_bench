module origen_161526(
    input clk,
    input rst,
    input period_flag,
    input signI,
    input [2:0] vc_level,
    input [7:0] vc1,
    input [7:0] vc2,
    output reg [3:0] Fo
);

reg [3:0] Fo_1;

initial begin
    Fo_1 = 4'b1010;
end

always @(posedge clk) begin
    if (rst) begin
        Fo <= Fo_1;
    end else if (period_flag) begin
        Fo_1 <= Fo;
        case (vc_level)
            3'b000: Fo <= 4'b0101;
            3'b001: begin
                if (signI == 1'b0 && vc2 > vc1) begin
                    Fo <= 4'b0111;
                end else if (signI == 1'b0 && vc2 <= vc1) begin
                    Fo <= 4'b0001;
                end else if (signI == 1'b1 && vc2 > vc1) begin
                    Fo <= 4'b1101;
                end else if (signI == 1'b1 && vc2 <= vc1) begin
                    Fo <= 4'b0111;
                end
            end
            3'b010: Fo <= 4'b0000;
            3'b011: begin
                if (signI == 1'b0 && vc2 < vc1) begin
                    Fo <= 4'b1011;
                end else if (signI == 1'b0 && vc2 >= vc1) begin
                    Fo <= 4'b1110;
                end else if (signI == 1'b1 && vc2 < vc1) begin
                    Fo <= 4'b0010;
                end else if (signI == 1'b1 && vc2 >= vc1) begin
                    Fo <= 4'b1000;
                end
            end
            3'b100: Fo <= 4'b1010;
            default: Fo <= Fo;
        endcase
    end
end

endmodule