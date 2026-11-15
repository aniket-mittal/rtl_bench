`timescale 1ns / 1ps

module origen_085524 #(
    parameter EXTEND_RATE = 8'd100
)(
    input wire clk,
    input wire reset,
    input wire [5:0] userin,
    input wire [7:0] count,
    output reg [5:0] userinOut
);

    reg [5:0] ps, ns;

    always @(posedge clk or negedge reset) begin
        if (!reset)
            ps <= 6'b0;
        else
            ps <= ns;
    end

    always @(*) begin
        if (userin != 6'b0 && ps == 6'b0)
            ns = userin;
        else if (count == EXTEND_RATE)
            ns = 6'b0;
        else
            ns = ps;
    end

    always @(*) begin
        userinOut = ps;
    end

endmodule

module inputExtenderCounter #(
    parameter EXTEND_RATE = 8'd100
)(
    input wire clk,
    input wire reset,
    input wire [5:0] userin,
    output reg [7:0] count
);

    always @(posedge clk or negedge reset) begin
        if (!reset)
            count <= 8'b0;
        else if (count == EXTEND_RATE)
            count <= 8'b0;
        else if (userin != 6'b0 || count > 8'b0)
            count <= count + 1'b1;
        else
            count <= 8'b0;
    end

endmodule