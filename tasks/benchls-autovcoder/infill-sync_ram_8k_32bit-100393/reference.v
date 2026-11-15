module autovcoder_100393 (
    input         clock,
    input  [ 9:0] io_addr,
    input  [31:0] io_dataIn,
    input         io_we,
    output [31:0] io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif  // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif  // RANDOMIZE_REG_INIT
  reg [31:0] syncRAM[0:8191];  // @[Memory.scala 23:28]
  wire syncRAM_io_dataOut_MPORT_en;  // @[Memory.scala 23:28]
  wire [12:0] syncRAM_io_dataOut_MPORT_addr;  // @[Memory.scala 23:28]
  wire [31:0] syncRAM_io_dataOut_MPORT_data;  // @[Memory.scala 23:28]
  wire [31:0] syncRAM_MPORT_data;  // @[Memory.scala 23:28]
  wire [12:0] syncRAM_MPORT_addr;  // @[Memory.scala 23:28]
  wire syncRAM_MPORT_mask;  // @[Memory.scala 23:28]
  wire syncRAM_MPORT_en;  // @[Memory.scala 23:28]
  reg syncRAM_io_dataOut_MPORT_en_pipe_0;
  reg [12:0] syncRAM_io_dataOut_MPORT_addr_pipe_0;
  assign syncRAM_io_dataOut_MPORT_en = syncRAM_io_dataOut_MPORT_en_pipe_0;
  assign syncRAM_io_dataOut_MPORT_addr = syncRAM_io_dataOut_MPORT_addr_pipe_0;
  assign syncRAM_io_dataOut_MPORT_data = syncRAM[syncRAM_io_dataOut_MPORT_addr]; // @[Memory.scala 23:28]
  assign syncRAM_MPORT_data = io_dataIn;
  assign syncRAM_MPORT_addr = {{3'd0}, io_addr};
  assign syncRAM_MPORT_mask = 1'h1;
  assign syncRAM_MPORT_en = io_we;
  assign io_dataOut = syncRAM_io_dataOut_MPORT_data;  // @[Memory.scala 25:17 29:18]
  always @(posedge clock) begin
    if (syncRAM_MPORT_en & syncRAM_MPORT_mask) begin
      syncRAM[syncRAM_MPORT_addr] <= syncRAM_MPORT_data;  // @[Memory.scala 23:28]
    end
    if (io_we) begin
      syncRAM_io_dataOut_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      syncRAM_io_dataOut_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_we ? 1'h0 : 1'h1) begin
      syncRAM_io_dataOut_MPORT_addr_pipe_0 <= {{3'd0}, io_addr};
    end
  end
  // Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
  `define RANDOMIZE
`endif
`ifndef RANDOM
  `define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
  `FIRRTL_BEFORE_INITIAL
`endif
  initial begin
`ifdef RANDOMIZE
`ifdef INIT_RANDOM
    `INIT_RANDOM
`endif
`ifndef VERILATOR
`ifdef RANDOMIZE_DELAY
    #`RANDOMIZE_DELAY begin
    end
`else
    #0.002 begin
    end
`endif
`endif
`ifdef RANDOMIZE_MEM_INIT
    _RAND_0 = {1{`RANDOM}};
    for (initvar = 0; initvar < 8192; initvar = initvar + 1) syncRAM[initvar] = _RAND_0[31:0];
`endif  // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
    _RAND_1 = {1{`RANDOM}};
    syncRAM_io_dataOut_MPORT_en_pipe_0 = _RAND_1[0:0];
    _RAND_2 = {1{`RANDOM}};
    syncRAM_io_dataOut_MPORT_addr_pipe_0 = _RAND_2[12:0];
`endif  // RANDOMIZE_REG_INIT
`endif  // RANDOMIZE
  end  // initial
`ifdef FIRRTL_AFTER_INITIAL
  `FIRRTL_AFTER_INITIAL
`endif
`endif  // SYNTHESIS
endmodule

