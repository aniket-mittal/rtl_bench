module sync_bits #(

  // Number of bits to synchronize
  parameter NUM_OF_BITS = 1,
  // Whether input and output clocks are asynchronous, if 0 the synchronizer will
  // be bypassed and the output signal equals the input signal.
  parameter ASYNC_CLK = 1
) (
  input [NUM_OF_BITS-1:0] in_bits,
  input out_resetn,
  input out_clk,
  output [NUM_OF_BITS-1:0] out_bits
);

  generate if (ASYNC_CLK == 1) begin
    reg [NUM_OF_BITS-1:0] cdc_sync_stage1 = 'h0;
    reg [NUM_OF_BITS-1:0] cdc_sync_stage2 = 'h0;

    always @(posedge out_clk)
    begin
      if (out_resetn == 1'b0) begin
        cdc_sync_stage1 <= 'b0;
        cdc_sync_stage2 <= 'b0;
      end else begin
        cdc_sync_stage1 <= in_bits;
        cdc_sync_stage2 <= cdc_sync_stage1;
      end
    end

    assign out_bits = cdc_sync_stage2;
  end else begin
    assign out_bits = in_bits;
  end endgenerate

endmodule

module jesd204_up_ilas_mem #(
  parameter DATA_PATH_WIDTH = 4
) (
  input up_clk,

  input up_rreq,
  input [1:0] up_raddr,
  output reg [31:0] up_rdata,

  input core_clk,
  input core_reset,

  input core_ilas_config_valid,
  input [1:0] core_ilas_config_addr,
  input [DATA_PATH_WIDTH*8-1:0] core_ilas_config_data,

  output up_ilas_ready
);

  localparam ILAS_DATA_LENGTH = (DATA_PATH_WIDTH == 4) ? 4 : 2;

  reg [DATA_PATH_WIDTH*8-1:0] mem[0:ILAS_DATA_LENGTH-1];
  reg core_ilas_captured = 1'b0;

  sync_bits i_cdc_ilas_ready (
    .in_bits(core_ilas_captured),
    .out_resetn(1'b1),
    .out_clk(up_clk),
    .out_bits(up_ilas_ready));

  always @(posedge core_clk) begin
    if (core_reset == 1'b1) begin
      core_ilas_captured <= 1'b0;
    end else begin
      if (core_ilas_config_valid == 1'b1 && core_ilas_config_addr == ILAS_DATA_LENGTH-1) begin
        core_ilas_captured <= 1'b1;
      end
    end
  end

  generate
  if(DATA_PATH_WIDTH == 4)  begin : dp_4_gen
  always @(posedge up_clk) begin
    if (up_rreq == 1'b1) begin
      up_rdata <= mem[up_raddr];
    end
  end
  end else if(DATA_PATH_WIDTH == 8) begin : dp_8_gen
  always @(posedge up_clk) begin
    if (up_rreq == 1'b1) begin
      up_rdata <= mem[up_raddr[1]] >> (up_raddr[0]*32);
    end
  end
  end
  endgenerate

  always @(posedge core_clk) begin
    if (core_ilas_config_valid == 1'b1) begin
      mem[core_ilas_config_addr] <= core_ilas_config_data;
    end
  end

  /*
   * Shift register with variable tap for accessing the stored data.
   *
   * This has slightly better utilization on Xilinx based platforms than the dual
   * port RAM approach, but there is no equivalent primitive on Intel resulting
   * in increased utilization since it needs to be implemented used registers and
   * muxes.
   *
   * We might make this a device dependent configuration option at some point.

  reg [3:0] mem[0:31];

  generate
  genvar i;
  for (i = 0; i < 32; i = i + 1) begin: gen_ilas_mem
    assign up_rdata[i] = mem[i][~up_raddr];

    always @(posedge core_clk) begin
      if (core_ilas_config_valid == 1'b1) begin
        mem[i] <= {mem[i][2:0],core_ilas_config_data[i]};
      end
    end
  end
  endgenerate
  */

endmodule