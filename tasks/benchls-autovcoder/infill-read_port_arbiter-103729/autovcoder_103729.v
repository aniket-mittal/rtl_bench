module autovcoder_103729 (
    port0_rd_en,
    port0_rd_addr,

    port1_rd_en,
    port1_rd_addr,

    port2_rd_en,
    port2_rd_addr,

    port_rd_data,

    rd_addr,
    rd_data
);

  input port0_rd_en;
  input [8:0] port0_rd_addr;

  input port1_rd_en;
  input [8:0] port1_rd_addr;

  input port2_rd_en;
  input [8:0] port2_rd_addr;

  input [127:0] rd_data;
  output [127:0] port_rd_data;
  output [8:0] rd_addr;

  reg [8:0] rd_addr;

  assign port_rd_data = rd_data;

  [MASKED]

endmodule

