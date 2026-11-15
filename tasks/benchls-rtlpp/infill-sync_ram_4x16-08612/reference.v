module rtlpp_08612 (
    input [3:0] address,
    input clock,
    input [3:0] data,
    input wren,
    output [3:0] q
);

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;

reg [3:0] memory [0:15];
reg [3:0] q_reg;

always @(posedge clock) begin
    if (wren) begin
        memory[address] <= data;
    end
    q_reg <= memory[address];
end

assign q = q_reg;

endmodule