module rtlpp_00544 (
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
  input  [31:0] MonDReg;
  input  [31:0] break_readreg;
  input         dbrk_hit0_latch;
  input         dbrk_hit1_latch;
  input         dbrk_hit2_latch;
  input         dbrk_hit3_latch;
  input         debugack;
  input  [1:0]  ir_in;
  input         jtag_state_rti;
  input         monitor_error;
  input         monitor_ready;
  input         reset_n;
  input         resetlatch;
  input         tck;
  input         tdi;
  input         tracemem_on;
  input  [35:0] tracemem_trcdata;
  input         tracemem_tw;
  input  [6:0]  trc_im_addr;
  input         trc_on;
  input         trc_wrap;
  input         trigbrktype;
  input         trigger_state_1;
  input         vs_cdr;
  input         vs_sdr;
  input         vs_uir;

  reg     [2:0]  DRsize;
  wire           debugack_sync;
  reg     [1:0]  ir_out;
  wire           jrst_n;
  wire           monitor_ready_sync;
  reg     [37:0] sr;
  wire           st_ready_test_idle;
  wire           tdo;
  wire           unxcomplemented_resetxx1;
  wire           unxcomplemented_resetxx2;

  always @(posedge tck)
  begin
    if (vs_cdr)
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
    
    if (vs_sdr)
      case (DRsize)
        3'b000: begin
          sr <= {tdi, sr[37:2], tdi};
        end 
        
        3'b001: begin
          sr <= {tdi, sr[37:9], tdi, sr[7:1]};
        end 
        
        3'b010: begin
          sr <= {tdi, sr[37:17], tdi, sr[15:1]};
        end 
        
        3'b011: begin
          sr <= {tdi, sr[37:33], tdi, sr[31:1]};
        end 
        
        3'b100: begin
          sr <= {tdi, sr[37], tdi, sr[35:1]};
        end 
        
        3'b101: begin
          sr <= {tdi, sr[37:1]};
        end 
        
        default: begin
          sr <= {tdi, sr[37:2], tdi};
        end 
      endcase 
    
    if (vs_uir)
      case (ir_in)
        2'b00: begin
          DRsize <= 3'b100;
        end 
        
        2'b01: begin
          DRsize <= 3'b101;
        end 
        
        2'b10: begin
          DRsize <= 3'b101;
        end 
        
        2'b11: begin
          DRsize <= 3'b010;
        end 
      endcase 
  end

  assign tdo = sr[0];
  assign st_ready_test_idle = jtag_state_rti;
  assign unxcomplemented_resetxx1 = jrst_n;

  // Instantiate altera_std_synchronizer logic directly
  reg [1:0] debugack_sync_reg;
  reg [1:0] monitor_ready_sync_reg;

  always @(posedge tck or negedge unxcomplemented_resetxx1)
  begin
    if (!unxcomplemented_resetxx1) begin
      debugack_sync_reg <= 2'b0;
    end else begin
      debugack_sync_reg <= {debugack_sync_reg[0], debugack};
    end
  end
  assign debugack_sync = debugack_sync_reg[1];

  assign unxcomplemented_resetxx2 = jrst_n;

  always @(posedge tck or negedge unxcomplemented_resetxx2)
  begin
    if (!unxcomplemented_resetxx2) begin
      monitor_ready_sync_reg <= 2'b0;
    end else begin
      monitor_ready_sync_reg <= {monitor_ready_sync_reg[0], monitor_ready};
    end
  end
  assign monitor_ready_sync = monitor_ready_sync_reg[1];

  always @(posedge tck or negedge jrst_n)
  begin
    if (!jrst_n)
      ir_out <= 2'b0;
    else 
      ir_out <= {debugack_sync, monitor_ready_sync};
  end

  assign jrst_n = reset_n;

endmodule