module origen_159171(
    input clk,
    input reset,
    input [7:0] X,
    output [9:0] Y
);

reg [71:0] XS;
reg [19:0] sum;
reg [9:0] xavg;
reg [7:0] xappro;

// Function to compute the absolute value of a signed number
function [7:0] abs_val;
    input [7:0] a;
    begin
        if (a[7] == 1'b1)
            abs_val = -a;
        else
            abs_val = a;
    end
endfunction

always @(posedge clk or posedge reset) begin
    if (reset) begin
        XS <= 72'b0;
        sum <= 20'b0;
        xavg <= 10'b0;
        xappro <= 8'b0;
    end else begin
        // Shift the input X into the shift register XS
        XS <= {XS[63:0], X};

        // Calculate the sum of the last 9 values of X
        sum <= XS[71:64] + XS[63:56] + XS[55:48] + XS[47:40] + XS[39:32] +
              XS[31:24] + XS[23:16] + XS[15:8] + XS[7:0];

        // Compute the approximation of the average of the last 9 values of X
        xavg <= (sum + 9) >> 4;

        // Find the value in XS that is closest to the approximated average xavg
        xappro <= XS[71:64];
        if (abs_val(XS[63:56] - xavg) < abs_val(xappro - xavg)) xappro <= XS[63:56];
        if (abs_val(XS[55:48] - xavg) < abs_val(xappro - xavg)) xappro <= XS[55:48];
        if (abs_val(XS[47:40] - xavg) < abs_val(xappro - xavg)) xappro <= XS[47:40];
        if (abs_val(XS[39:32] - xavg) < abs_val(xappro - xavg)) xappro <= XS[39:32];
        if (abs_val(XS[31:24] - xavg) < abs_val(xappro - xavg)) xappro <= XS[31:24];
        if (abs_val(XS[23:16] - xavg) < abs_val(xappro - xavg)) xappro <= XS[23:16];
        if (abs_val(XS[15:8] - xavg) < abs_val(xappro - xavg)) xappro <= XS[15:8];
        if (abs_val(XS[7:0] - xavg) < abs_val(xappro - xavg)) xappro <= XS[7:0];
    end
end

// Compute the output Y as a weighted sum of sum and xappro
assign Y = (sum + (xappro << 3)) >> 3;

endmodule