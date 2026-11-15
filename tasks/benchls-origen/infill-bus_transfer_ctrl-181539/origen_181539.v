module origen_181539(
    input clk,
    input reset,
    output [15:0] mem_bus_in,
    input [15:0] mem_bus_out,
    output mem_data_strobe,
    output mem_bus_rw,
    output [15:0] bus_in,
    input [15:0] bus_out,
    output data_strobe,
    output bus_rw
);

reg [15:0] Count1, Count2;
reg [15:0] row, col;
reg [7:0] state;
reg [7:0] next_state;
reg [15:0] data;
reg [15:0] result;
reg mem_rw, bus_rw_reg;
reg mem_data_strobe_reg, data_strobe_reg;
integer fd1, fd2;

[MASKED]

assign mem_bus_in = data;
assign mem_data_strobe = mem_data_strobe_reg;
assign mem_bus_rw = mem_rw;
assign bus_in = result;
assign data_strobe = data_strobe_reg;
assign bus_rw = bus_rw_reg;

endmodule