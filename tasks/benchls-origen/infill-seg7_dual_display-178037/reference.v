module origen_178037(
    input [6:0] seg01,
    input [6:0] seg02,
    input [6:0] seg11,
    input [6:0] seg12,
    input clk,
    input rst,
    output reg [6:0] seg0,
    output reg [6:0] seg1,
    output reg cat0,
    output reg cat1
);

reg [1:0] shift;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        shift <= 2'b00;
        seg0 <= 7'b1111111;
        seg1 <= 7'b1111111;
        cat0 <= 1'b1;
        cat1 <= 1'b1;
    end
    else begin
        shift <= shift + 2'b01;
        case (shift)
            2'b00: begin
                seg0 <= seg01;
                cat0 <= 1'b0;
                cat1 <= 1'b1;
            end
            2'b01: begin
                seg0 <= seg02;
                cat0 <= 1'b0;
                cat1 <= 1'b1;
            end
            2'b10: begin
                seg1 <= seg11;
                cat0 <= 1'b1;
                cat1 <= 1'b0;
            end
            2'b11: begin
                seg1 <= seg12;
                cat0 <= 1'b1;
                cat1 <= 1'b0;
            end
        endcase
    end
end

endmodule