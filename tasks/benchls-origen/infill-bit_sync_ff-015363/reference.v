`timescale 1ns / 1ps

module origen_015363 #(
    parameter SIZE = 1
) (
    input  wire [SIZE-1:0] siga,
    input  wire            rstb,
    input  wire            clkb,
    output reg  [SIZE-1:0] sigb
);

`ifdef SIMULATION
    reg [SIZE-1:0] q1a, q1b;
    reg [SIZE-1:0] y1;
    reg [1:0] DLY;

    always @(posedge clkb or posedge rstb) begin
        if (rstb) begin
            q1a <= {SIZE{1'b0}};
            q1b <= {SIZE{1'b0}};
            sigb <= {SIZE{1'b0}};
            DLY <= 2'b00;
        end else begin
            q1a <= siga;
            q1b <= q1a;
            sigb <= y1;
            DLY <= DLY + 1;
        end
    end

    always @(*) begin
        case (DLY)
            2'b00: y1 = q1a;
            2'b01: y1 = q1b;
            2'b10: y1 = q1a;
            2'b11: y1 = q1b;
        endcase
    end

`else

    reg [SIZE-1:0] q1;

    always @(posedge clkb or posedge rstb) begin
        if (rstb) begin
            q1 <= {SIZE{1'b0}};
            sigb <= {SIZE{1'b0}};
        end else begin
            q1 <= siga;
            sigb <= q1;
        end
    end

`endif

endmodule