module origen_116763 #(parameter WIDTH = 8) (
    input wire reset_n,
    input wire clk,
    input wire enable,
    input wire [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        dout <= 0;
    end else if (enable) begin
        dout <= din;
    end
end

endmodule

module mult_shift_reg #(parameter WIDTH = 8) (
    input wire reset_n,
    input wire clk,
    input wire enable,
    input wire shift,
    input wire shift_in,
    input wire [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        dout <= 0;
    end else if (enable) begin
        dout <= din;
    end else if (shift) begin
        dout <= {shift_in, dout[WIDTH-1:1]};
    end
end

endmodule

module up_counter (
    input wire reset_n,
    input wire enable,
    input wire clk,
    output wire done
);

reg [7:0] cntInc;

always @(posedge clk) begin
    if (reset_n) begin
        cntInc <= 8'b0;
    end else if (enable) begin
        cntInc <= cntInc + 1'b1;
    end
end

assign done = (cntInc == 8'd32);

endmodule