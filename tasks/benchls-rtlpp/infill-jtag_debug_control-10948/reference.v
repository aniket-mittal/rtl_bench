module rtlpp_10948 (
                                           clk,
                                           ir_in,
                                           sr,
                                           vs_udr,
                                           vs_uir,
                                           jdo,
                                           take_action_break_a,
                                           take_action_break_b,
                                           take_action_break_c,
                                           take_action_ocimem_a,
                                           take_action_ocimem_b,
                                           take_action_tracectrl,
                                           take_no_action_break_a,
                                           take_no_action_break_b,
                                           take_no_action_break_c,
                                           take_no_action_ocimem_a
                                        );

  output  [37:0] jdo;
  output         take_action_break_a;
  output         take_action_break_b;
  output         take_action_break_c;
  output         take_action_ocimem_a;
  output         take_action_ocimem_b;
  output         take_action_tracectrl;
  output         take_no_action_break_a;
  output         take_no_action_break_b;
  output         take_no_action_break_c;
  output         take_no_action_ocimem_a;
  input          clk;
  input   [1:0]  ir_in;
  input   [37:0] sr;
  input          vs_udr;
  input          vs_uir;

  reg            enable_action_strobe;
  reg     [1:0]  ir;
  reg     [37:0] jdo;
  reg            jxuir;
  reg            sync2_udr;
  reg            sync2_uir;
  wire           sync_udr;
  wire           sync_uir;
  wire           take_action_break_a;
  wire           take_action_break_b;
  wire           take_action_break_c;
  wire           take_action_ocimem_a;
  wire           take_action_ocimem_b;
  wire           take_action_tracectrl;
  wire           take_no_action_break_a;
  wire           take_no_action_break_b;
  wire           take_no_action_break_c;
  wire           take_no_action_ocimem_a;
  wire           unxunused_resetxx3;
  wire           unxunused_resetxx4;
  reg            update_jdo_strobe;

  assign unxunused_resetxx3 = 1'b1;
  assign unxunused_resetxx4 = 1'b1;

  // Synchronizer logic:
  reg sync_udr_d1, sync_udr_d2;
  reg sync_uir_d1, sync_uir_d2;
  always @(posedge clk) begin
    sync_udr_d1 <= vs_udr;
    sync_udr_d2 <= sync_udr_d1;
  end
  assign sync_udr = sync_udr_d2;

  always @(posedge clk) begin
    sync_uir_d1 <= vs_uir;
    sync_uir_d2 <= sync_uir_d1;
  end
  assign sync_uir = sync_uir_d2;

  always @(posedge clk) begin
    sync2_udr <= sync_udr;
    update_jdo_strobe <= sync_udr & ~sync2_udr;
    enable_action_strobe <= update_jdo_strobe;
    sync2_uir <= sync_uir;
    jxuir <= sync_uir & ~sync2_uir;
  end

  assign take_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && 
    ~jdo[35] && jdo[34];

  assign take_no_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && 
    ~jdo[35] && ~jdo[34];

  assign take_action_ocimem_b = enable_action_strobe && (ir == 2'b00) && 
    jdo[35];

  assign take_action_break_a = enable_action_strobe && (ir == 2'b10) && 
    ~jdo[36] && 
    jdo[37];

  assign take_no_action_break_a = enable_action_strobe && (ir == 2'b10) && 
    ~jdo[36] && 
    ~jdo[37];

  assign take_action_break_b = enable_action_strobe && (ir == 2'b10) && 
    jdo[36] && ~jdo[35] &&
    jdo[37];

  assign take_no_action_break_b = enable_action_strobe && (ir == 2'b10) && 
    jdo[36] && ~jdo[35] &&
    ~jdo[37];

  assign take_action_break_c = enable_action_strobe && (ir == 2'b10) && 
    jdo[36] &&  jdo[35] &&
    jdo[37];

  assign take_no_action_break_c = enable_action_strobe && (ir == 2'b10) && 
    jdo[36] &&  jdo[35] &&
    ~jdo[37];

  assign take_action_tracectrl = enable_action_strobe && (ir == 2'b11) &&  
    jdo[15];

  always @(posedge clk) begin
    if (jxuir)
      ir <= ir_in;
    if (update_jdo_strobe)
      jdo <= sr;
  end

endmodule