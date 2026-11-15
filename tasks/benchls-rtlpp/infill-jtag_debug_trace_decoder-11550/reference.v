module rtlpp_11550 (
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

  output  [37:0] jdo;
  output         take_action_break_a;
  output         take_action_break_b;
  output         take_action_break_c;
  output         take_action_ocimem_a;
  output         take_action_ocimem_b;
  output         take_action_tracectrl;
  output         take_action_tracemem_a;
  output         take_action_tracemem_b;
  output         take_no_action_break_a;
  output         take_no_action_break_b;
  output         take_no_action_break_c;
  output         take_no_action_ocimem_a;
  output         take_no_action_tracemem_a;
  input          clk;
  input   [1:0]  ir_in;
  input   [37:0] sr;
  input          vs_udr;
  input          vs_uir;

  reg     [1:0]  ir;
  reg     [37:0] jdo;
  reg            jxdr;
  reg            jxuir;
  reg            prejxdr;
  wire           take_action_break_a;
  wire           take_action_break_b;
  wire           take_action_break_c;
  wire           take_action_ocimem_a;
  wire           take_action_ocimem_b;
  wire           take_action_tracectrl;
  wire           take_action_tracemem_a;
  wire           take_action_tracemem_b;
  wire           take_no_action_break_a;
  wire           take_no_action_break_b;
  wire           take_no_action_break_c;
  wire           take_no_action_ocimem_a;
  wire           take_no_action_tracemem_a;
  reg            udr_sync1;
  reg            udr_sync2;
  reg            udr_sync3;
  reg            uir_sync1;
  reg            uir_sync2;
  reg            uir_sync3;

  always @(posedge clk) begin
    udr_sync1 <= vs_udr;
    udr_sync2 <= udr_sync1;
    udr_sync3 <= udr_sync2;
    prejxdr <= udr_sync2 & ~udr_sync3;
    jxdr <= prejxdr;
    uir_sync1 <= vs_uir;
    uir_sync2 <= uir_sync1;
    uir_sync3 <= uir_sync2;
    jxuir <= uir_sync2 & ~uir_sync3;
  end

  assign take_action_ocimem_a = jxdr && (ir == 2'b00) && ~jdo[35] && jdo[34];
  assign take_no_action_ocimem_a = jxdr && (ir == 2'b00) && ~jdo[35] && ~jdo[34];
  assign take_action_ocimem_b = jxdr && (ir == 2'b00) && jdo[35];
  assign take_action_tracemem_a = jxdr && (ir == 2'b01) && ~jdo[37] && jdo[36];
  assign take_no_action_tracemem_a = jxdr && (ir == 2'b01) && ~jdo[37] && ~jdo[36];
  assign take_action_tracemem_b = jxdr && (ir == 2'b01) && jdo[37];
  assign take_action_break_a = jxdr && (ir == 2'b10) && ~jdo[36] && jdo[37];
  assign take_no_action_break_a = jxdr && (ir == 2'b10) && ~jdo[36] && ~jdo[37];
  assign take_action_break_b = jxdr && (ir == 2'b10) && jdo[36] && ~jdo[35] && jdo[37];
  assign take_no_action_break_b = jxdr && (ir == 2'b10) && jdo[36] && ~jdo[35] && ~jdo[37];
  assign take_action_break_c = jxdr && (ir == 2'b10) && jdo[36] && jdo[35] && jdo[37];
  assign take_no_action_break_c = jxdr && (ir == 2'b10) && jdo[36] && jdo[35] && ~jdo[37];
  assign take_action_tracectrl = jxdr && (ir == 2'b11) && jdo[15];

  always @(posedge clk) begin
    if (jxuir)
      ir <= ir_in;
    if (prejxdr)
      jdo <= sr;
  end

endmodule