module rtlpp_00539 (
    MonDReg,
    break_readreg,
    dbrk_hit0_latch,
    dbrk_hit1_latch,
    dbrk_hit2_latch,
    dbrk_hit3_latch,
    debugack,
    ir_in,
    jtag_state_rti,
    monitor_error,
    monitor_ready,
    reset_n,
    resetlatch,
    tck,
    tdi,
    tracemem_on,
    tracemem_trcdata,
    tracemem_tw,
    trc_im_addr,
    trc_on,
    trc_wrap,
    trigbrktype,
    trigger_state_1,
    vs_cdr,
    vs_sdr,
    vs_uir,

    ir_out,
    jrst_n,
    sr,
    st_ready_test_idle,
    tdo
);

  output  [1:0] ir_out;
  output        jrst_n;
  output  [37:0] sr;
  output        st_ready_test_idle;
  output        tdo;
  input   [31:0] MonDReg;
  input   [31:0] break_readreg;
  input          dbrk_hit0_latch;
  input          dbrk_hit1_latch;
  input          dbrk_hit2_latch;
  input          dbrk_hit3_latch;
  input          debugack;
  input   [1:0]  ir_in;
  input          jtag_state_rti;
  input          monitor_error;
  input          monitor_ready;
  input          reset_n;
  input          resetlatch;
  input          tck;
  input          tdi;
  input          tracemem_on;
  input   [35:0] tracemem_trcdata;
  input          tracemem_tw;
  input   [6:0]  trc_im_addr;
  input          trc_on;
  input          trc_wrap;
  input          trigbrktype;
  input          trigger_state_1;
  input          vs_cdr;
  input          vs_sdr;
  input          vs_uir;

  reg     [2:0] DRsize;
  reg     [1:0] ir_out;
  reg     [37:0] sr;
  wire           debugack_sync;
  wire           monitor_ready_sync;
  wire           st_ready_test_idle;
  wire           tdo;
  wire           unxcomplemented_resetxx1;
  wire           unxcomplemented_resetxx2;

  // Synchronizer logic for debugack_sync
  reg debugack_sync_reg1, debugack_sync_reg2;
  always @(posedge tck or negedge reset_n) begin
      if (!reset_n) begin
          debugack_sync_reg1 <= 1'b0;
          debugack_sync_reg2 <= 1'b0;
      end else begin
          debugack_sync_reg1 <= debugack;
          debugack_sync_reg2 <= debugack_sync_reg1;
      end
  end
  assign debugack_sync = debugack_sync_reg2;

  // Synchronizer logic for monitor_ready_sync
  reg monitor_ready_sync_reg1, monitor_ready_sync_reg2;
  always @(posedge tck or negedge reset_n) begin
      if (!reset_n) begin
          monitor_ready_sync_reg1 <= 1'b0;
          monitor_ready_sync_reg2 <= 1'b0;
      end else begin
          monitor_ready_sync_reg1 <= monitor_ready;
          monitor_ready_sync_reg2 <= monitor_ready_sync_reg1;
      end
  end
  assign monitor_ready_sync = monitor_ready_sync_reg2;

  // Main sequential logic
  always @(posedge tck or negedge jrst_n) begin
      if (!jrst_n) begin
          ir_out <= 2'b0;
      end else begin
          ir_out <= {debugack_sync, monitor_ready_sync};
      end
  end

  always @(posedge tck) begin
      if (vs_cdr) begin
          case (ir_in)
              2'b00: begin
                  sr[35] <= debugack_sync;
                  sr[34] <= monitor_error;
                  sr[33] <= resetlatch;
                  sr[32:1] <= MonDReg;
                  sr[0] <= monitor_ready_sync;
              end
              2'b01: begin
                  sr[35:0] <= tracemem_trcdata;
                  sr[37] <= tracemem_tw;
                  sr[36] <= tracemem_on;
              end
              2'b10: begin
                  sr[37] <= trigger_state_1;
                  sr[36] <= dbrk_hit3_latch;
                  sr[35] <= dbrk_hit2_latch;
                  sr[34] <= dbrk_hit1_latch;
                  sr[33] <= dbrk_hit0_latch;
                  sr[32:1] <= break_readreg;
                  sr[0] <= trigbrktype;
              end
              2'b11: begin
                  sr[15:2] <= trc_im_addr;
                  sr[1] <= trc_wrap;
                  sr[0] <= trc_on;
              end
          endcase
      end
      if (vs_sdr) begin
          case (DRsize)
              3'b000: sr <= {tdi, sr[37:2], tdi};
              3'b001: sr <= {tdi, sr[37:9], tdi, sr[7:1]};
              3'b010: sr <= {tdi, sr[37:17], tdi, sr[15:1]};
              3'b011: sr <= {tdi, sr[37:33], tdi, sr[31:1]};
              3'b100: sr <= {tdi, sr[37], tdi, sr[35:1]};
              3'b101: sr <= {tdi, sr[37:1]};
              default: sr <= {tdi, sr[37:2], tdi};
          endcase
      end
      if (vs_uir) begin
          case (ir_in)
              2'b00: DRsize <= 3'b100;
              2'b01: DRsize <= 3'b101;
              2'b10: DRsize <= 3'b101;
              2'b11: DRsize <= 3'b010;
          endcase
      end
  end

  assign tdo = sr[0];
  assign st_ready_test_idle = jtag_state_rti;
  assign jrst_n = reset_n;

endmodule