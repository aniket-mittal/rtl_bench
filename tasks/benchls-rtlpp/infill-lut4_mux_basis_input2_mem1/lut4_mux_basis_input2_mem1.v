module lut4_mux_basis_input2_mem1(
    input   [0:1] in,
    input   [0:0] mem,
    input   [0:0] mem_inv,
    output  [0:0] out
);

wire out_t0, out_t1;

// Implementing TGATE logic inline
assign out_t0 = (mem) ? in[0] : 1'bZ;
[MASKED]

assign out = out_t0 | out_t1;

endmodule