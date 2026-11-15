module origen_059647 (
    input wire resetn,
    input wire compare_work,
    input wire clk,
    input wire [20:0] mad_1, mad_2, mad_3, mad_4, mad_5, mad_6, mad_7, mad_8,
    input wire compare_refresh,
    output reg [3:0] vector_x,
    output reg [3:0] vector_y
);

    reg [20:0] mad_12_larger, mad_34_larger, mad_56_larger, mad_78_larger;
    reg [20:0] mad_1234_larger, mad_5678_larger;
    reg [20:0] mad;
    reg [20:0] comparefile;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            comparefile <= 21'b111111111111111111111;
        end else if (compare_refresh) begin
            comparefile <= 21'b111111111111111111111;
        end else if (mad < comparefile) begin
            comparefile <= mad;
        end
    end

    always @(*) begin
        if (compare_work) begin
            mad_12_larger = (mad_1[20:8] < mad_2[20:8]) ? mad_1 : mad_2;
            mad_34_larger = (mad_3[20:8] < mad_4[20:8]) ? mad_3 : mad_4;
            mad_56_larger = (mad_5[20:8] < mad_6[20:8]) ? mad_5 : mad_6;
            mad_78_larger = (mad_7[20:8] < mad_8[20:8]) ? mad_7 : mad_8;

            mad_1234_larger = (mad_12_larger[20:8] < mad_34_larger[20:8]) ? mad_12_larger : mad_34_larger;
            mad_5678_larger = (mad_56_larger[20:8] < mad_78_larger[20:8]) ? mad_56_larger : mad_78_larger;

            mad = (mad_1234_larger[20:8] < mad_5678_larger[20:8]) ? mad_1234_larger : mad_5678_larger;
        end else begin
            mad_12_larger = 21'b111111111111111111111;
            mad_34_larger = 21'b111111111111111111111;
            mad_56_larger = 21'b111111111111111111111;
            mad_78_larger = 21'b111111111111111111111;
            mad_1234_larger = 21'b111111111111111111111;
            mad_5678_larger = 21'b111111111111111111111;
            mad = 21'b111111111111111111111;
        end
    end

    always @(posedge clk) begin
        if (compare_refresh) begin
            vector_x <= 4'd7 - comparefile[3:0];
            vector_y <= comparefile[7:4] - 4'd8;
        end
    end

endmodule