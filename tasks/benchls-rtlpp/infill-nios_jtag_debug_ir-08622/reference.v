module rtlpp_08622 (
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
  take_action_tracemem_a,
  take_action_tracemem_b,
  take_no_action_break_a,
  take_no_action_break_b,
  take_no_action_break_c,
  take_no_action_ocimem_a,
  take_no_action_tracemem_a
);
  output [37:0] jdo;
  output take_action_break_a;
  output take_action_break_b;
  output take_action_break_c;
  output take_action_ocimem_a;
  output take_action_ocimem_b;
  output take_action_tracectrl;
  output take_action_tracemem_a;
  output take_action_tracemem_b;
  output take_no_action_break_a;
  output take_no_action_break_b;
  output take_no_action_break_c;
  output take_no_action_ocimem_a;
  output take_no_action_tracemem_a;
  input clk;
  input [1:0] ir_in;
  input [37:0] sr;
  input vs_udr;
  input vs_uir;

  reg enable_action_strobe;
  reg [1:0] ir;
  reg [37:0] jdo;
  reg jxuir;
  reg sync2_udr;
  reg sync2_uir;
  wire sync_udr;
  wire sync_uir;
  wire take_action_break_a;
  wire take_action_break_b;
  wire take_action_break_c;
  wire take_action_ocimem_a;
  wire take_action_ocimem_b;
  wire take_action_tracectrl;
  wire take_action_tracemem_a;
  wire take_action_tracemem_b;
  wire take_no_action_break_a;
  wire take_no_action_break_b;
  wire take_no_action_break_c;
  wire take_no_action_ocimem_a;
  wire take_no_action_tracemem_a;
  reg update_jdo_strobe;

  // Synchronizer logic block
  reg [1:0] sync_udr_reg;
  reg [1:0] sync_uir_reg;

  always @(posedge clk) begin
    // UDR Synchronization
    sync_udr_reg <= {sync_udr_reg[0], vs_udr};
    sync2_udr <= sync_udr_reg[1];
    update_jdo_strobe <= sync_udr_reg[1] & ~sync2_udr;

    // UIR Synchronization
    sync_uir_reg <= {sync_uir_reg[0], vs_uir};
    sync2_uir <= sync_uir_reg[1];
    jxuir <= sync_uir_reg[1] & ~sync2_uir;
  end

  assign sync_udr = sync_udr_reg[1];
  assign sync_uir = sync_uir_reg[1];

  // Actions assignments
  assign take_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && 
    ~jdo[35] && jdo[34];

  assign take_no_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && 
    ~jdo[35] && ~jdo[34];

  assign take_action_ocimem_b = enable_action_strobe && (ir == 2'b00) && 
    jdo[35];

  assign take_action_tracemem_a = enable_action_strobe && (ir == 2'b01) &&
    ~jdo[37] && 
    jdo[36];

  assign take_no_action_tracemem_a = enable_action_strobe && (ir == 2'b01) &&
    ~jdo[37] && 
    ~jdo[36];

  assign take_action_tracemem_b = enable_action_strobe && (ir == 2'b01) &&
    jdo[37];

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
    enable_action_strobe <= update_jdo_strobe;
  end

endmodule