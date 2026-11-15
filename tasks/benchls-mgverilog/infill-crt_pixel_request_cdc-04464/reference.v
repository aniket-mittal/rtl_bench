module mg_04464 (input mclock,input reset_n,input pixclk,input crt_clock,input crt_gnt,input crt_req,input [20:0] crt_org,input [4:0] crt_page,input [11:0] crt_ptch,input [9:0] crt_x,input [11:0] crt_y,output reg crt_ready,output reg crt_arb_req,output reg [4:0] crt_arb_page,output reg [20:0] crt_arb_addr);
reg capt_req; 
  reg [20:0] capt_org; 
  reg [11:0] capt_ptch; 
  reg [9:0] capt_x; 
  reg [11:0] capt_y; 
  reg [4:0] capt_page; 
  reg req_sync_m1, req_sync_1, req_sync_2, req_sync_3; 
  reg gnt_sync_1, gnt_sync_2, gnt_sync_3; 
  reg [20:0] pmult, int_add; 
  reg final_grant; 
  reg [1:0] requests; 
  reg hold_req; 
  wire req_toggle; 
  always @ (posedge pixclk or negedge reset_n) begin 
  if(!reset_n) begin 
  crt_ready <= 1'b1; 
  capt_req <= 1'b0; 
  capt_org <= 21'h0; 
  capt_ptch <= 12'b0; 
  capt_x <= 10'b0; 
  capt_y <= 12'b0; 
  capt_page <= 5'b0; 
  gnt_sync_1<= 1'b0; 
  gnt_sync_2<= 1'b0; 
  gnt_sync_3<= 1'b0; 
  end else if (crt_clock) begin 
  if (crt_req) begin 
  capt_req <= ~capt_req; 
  capt_org <= crt_org; 
  capt_ptch <= crt_ptch; 
  capt_x <= crt_x; 
  capt_y <= crt_y; 
  capt_page <= crt_page - 5'b1; 
  crt_ready <= 1'b0; 
  end 
  gnt_sync_1 <= final_grant; 
  gnt_sync_2 <= gnt_sync_1; 
  gnt_sync_3 <= gnt_sync_2; 
  if(gnt_sync_2 ^ gnt_sync_3) crt_ready <= 1'b1; 
  end 
  end 
  assign req_toggle = req_sync_2 ^ req_sync_3; 
  always @ (posedge mclock or negedge reset_n) begin 
  if(!reset_n) begin 
  crt_arb_req <= 1'b0; 
  final_grant <= 1'b0; 
  requests <= 2'b0; 
  hold_req <= 1'b0; 
  pmult <= 21'b0; 
  int_add <= 21'b0; 
  req_sync_m1 <= 1'b0; 
  req_sync_1 <= 1'b0; 
  req_sync_2 <= 1'b0; 
  req_sync_3 <= 1'b0; 
  crt_arb_req <= 1'b0; 
  crt_arb_page <= 5'b0; 
  crt_arb_addr <= 21'b0; 
  end else begin 
  case ({crt_gnt, req_toggle}) 
  2'b01: requests <= requests + 2'b1; 
  2'b10: requests <= requests - 2'b1; 
  endcase 
  pmult <= (capt_y * {{4{capt_ptch[11]}}, capt_ptch}); 
  int_add <= (capt_org + {{11{capt_x[9]}}, capt_x}); 
  req_sync_m1 <= capt_req; 
  req_sync_1 <= req_sync_m1; 
  req_sync_2 <= req_sync_1; 
  req_sync_3 <= req_sync_2; 
  if (hold_req && ~&requests[1]) begin 
  hold_req <= 0; 
  crt_arb_req <= 1'b1; 
  crt_arb_page <= capt_page; 
  crt_arb_addr <= pmult + int_add; 
  end else if(req_toggle && ~&requests[1]) begin 
  crt_arb_req <= 1'b1; 
  crt_arb_page <= capt_page; 
  crt_arb_addr <= pmult + int_add; 
  end else if(req_toggle && (&requests[1])) begin 
  hold_req <= 1; 
  end 
  if(crt_gnt) begin 
  crt_arb_req <= 1'b0; 
  final_grant <= ~final_grant; 
  end 
  end 
  end 
 endmodule