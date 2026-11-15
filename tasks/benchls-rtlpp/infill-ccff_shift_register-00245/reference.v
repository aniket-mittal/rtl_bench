module rtlpp_00245(prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);

input [0:0] prog_clk;
input [0:0] ccff_head;
output [0:0] ccff_tail;
output [0:2] mem_out;
output [0:2] mem_outb;

reg [0:2] mem_out;
wire [0:2] mem_outb;

assign mem_outb = ~mem_out;

always @(posedge prog_clk) begin
    mem_out[0] <= ccff_head;
    mem_out[1] <= mem_out[0];
    mem_out[2] <= mem_out[1];
end

assign ccff_tail[0] = mem_out[2];

endmodule