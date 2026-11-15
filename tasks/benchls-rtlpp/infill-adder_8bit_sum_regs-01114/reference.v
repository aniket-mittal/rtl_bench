module rtlpp_01114(
    input wire [7:0] d,
    input wire [15:0] y,
    input wire enable,
    input wire clock,
    input wire reset,
    output wire done_errorcheck,
    output wire [7:0] z,
    output wire [7:0] e
);

wire [7:0] q;
wire [7:0] y_8bitconv;
wire [15:0] y_8bit;
wire [7:0] untukmemory_z;
wire [7:0] untukmemory_e;
wire done_e;
wire done_z;

assign y_8bit = (y[15] == 1'b0) ? {7'b0000000, y[15:8]} : {7'b1111111, y[15:8]};
assign y_8bitconv = y_8bit[7:0];

// Implement c_addsub_1 functionality directly
assign q = d + y_8bit[7:0];

// Memory module functionality
reg [7:0] memory_e_reg;
reg [7:0] memory_z_reg;

assign e = memory_e_reg;
assign z = memory_z_reg;

reg done_e_reg;
reg done_z_reg;

assign done_e = done_e_reg;
assign done_z = done_z_reg;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        memory_e_reg <= 8'b0;
        memory_z_reg <= 8'b0;
        done_e_reg <= 1'b0;
        done_z_reg <= 1'b0;
    end else if (enable) begin
        memory_e_reg <= q;
        memory_z_reg <= d;
        done_e_reg <= 1'b1;
        done_z_reg <= 1'b1;
    end
end

assign done_errorcheck = done_e & done_z;

endmodule