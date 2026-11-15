module mg_07453 (input clk,input reset,input [31:0] mulreq_msg_a,input [31:0] mulreq_msg_b,output [63:0] mulresp_msg_result,output sign,output [31:0] b_data,input sign_en,input result_en,input a_mux_sel,input b_mux_sel,input [4:0] op_shamt,input result_mux_sel,input add_mux_sel,input sign_mux_sel);
localparam op_x = 1'dx; 
  localparam op_load = 1'd0; 
  localparam op_next = 1'd1; 
  localparam add_x = 1'dx; 
  localparam add_old = 1'd0; 
  localparam add_next = 1'd1; 
  localparam sign_x = 1'dx; 
  localparam sign_u = 1'd0; 
  localparam sign_s = 1'd1; 
  reg sign_reg; 
  wire [63:0] a_shift_out; 
  wire [31:0] b_shift_out; 
  wire [63:0] result_mux_out; 
  wire [63:0] signed_result_mux_out; 
  wire sign_next = mulreq_msg_a[31] ^ mulreq_msg_b[31]; 
  assign sign = sign_reg; 
  wire [31:0] unsigned_a 
  = ( mulreq_msg_a[31] ) ? ~mulreq_msg_a + 1'b1 
  : mulreq_msg_a; 
  wire [31:0] unsigned_b 
  = ( mulreq_msg_b[31] ) ? ~mulreq_msg_b + 1'b1 
  : mulreq_msg_b; 
  wire [63:0] a_mux_out 
  = ( a_mux_sel == op_load ) ? { 32'b0, unsigned_a } 
  : ( a_mux_sel == op_next ) ? a_shift_out 
  : 64'bx; 
  wire [31:0] b_mux_out 
  = ( b_mux_sel == op_load ) ? unsigned_b 
  : ( b_mux_sel == op_next ) ? b_shift_out 
  : 32'bx; 
  reg [63:0] a_reg; 
  reg [31:0] b_reg; 
  reg [63:0] result_reg; 
  always @ ( posedge clk ) begin 
  if ( sign_en ) begin 
  sign_reg <= sign_next; 
  end 
  if ( result_en ) begin 
  result_reg <= result_mux_out; 
  end 
  a_reg <= a_mux_out; 
  b_reg <= b_mux_out; 
  end 
  assign b_data = b_reg; 
  assign a_shift_out = a_reg << op_shamt; 
  assign b_shift_out = b_reg >> op_shamt; 
  wire [63:0] add_out = result_reg + a_reg; 
  wire [63:0] add_mux_out 
  = ( add_mux_sel == add_old ) ? result_reg 
  : ( add_mux_sel == add_next ) ? add_out 
  : 64'bx; 
  assign result_mux_out 
  = ( result_mux_sel == op_load ) ? 64'b0 
  : ( result_mux_sel == op_next ) ? add_mux_out 
  : 64'bx; 
  assign signed_result_mux_out 
  = ( sign_mux_sel == sign_u ) ? result_reg 
  : ( sign_mux_sel == sign_s ) ? ~result_reg + 1'b1 
  : 64'bx; 
  assign mulresp_msg_result = signed_result_mux_out; 
 endmodule