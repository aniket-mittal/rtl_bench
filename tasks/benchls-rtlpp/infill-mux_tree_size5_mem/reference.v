module mux_tree_size5_mem(prog_clk,
                          ccff_head,
                          ccff_tail,
                          mem_out);
    input [0:0] prog_clk;
    input [0:0] ccff_head;
    output [0:0] ccff_tail;
    output [0:2] mem_out;
    
    reg [0:2] mem_out;

    assign ccff_tail[0] = mem_out[2];

    always @(posedge prog_clk[0]) begin
        mem_out[0] <= ccff_head[0];
        mem_out[1] <= mem_out[0];
        mem_out[2] <= mem_out[1];
    end

endmodule