module mg_02824(input rst, clk,input isDispatch,input isSW,input RegDest,input [5:0] PR_old_DP,input [5:0] PR_new_DP,input [4:0] rd_DP,input complete,input [3:0] rob_number,input [31:0] jb_addr,input changeFlow,input hazard_stall,output [3:0] rob_num_dp,output [5:0] PR_old_RT,output RegDest_retire,output retire_reg,output retire_ST,output [3:0] retire_rob,output full, empty,output RegDest_out,output [5:0] PR_old_flush,output [5:0] PR_new_flush,output [4:0] rd_flush,output [3:0] out_rob_num,output reg changeFlow_out,output reg [31:0] changeFlow_addr,output reg recover);
reg [18:0] rob [0:15]; 
 reg [15:0] complete_array; 
 reg [3:0] head, tail; 
 reg dec_tail; 
 assign rob_num_dp = tail; 
 wire read, write; 
 assign write = isDispatch && !full && !recover && !hazard_stall; 
 assign read = retire_reg && !empty && !recover && !hazard_stall; 
 always @(posedge clk or negedge rst) begin 
  if (!rst) begin 
  head <= 4'h0; 
  end 
  else if (read) begin 
  head <= head + 1; 
  end 
 end 
 assign retire_reg = complete_array[head]; 
 assign PR_old_RT = rob[head][11:6]; 
 assign retire_ST = rob[head][17]; 
 assign RegDest_retire = rob[head][18]; 
 assign retire_rob = head; 
 always @(posedge clk or negedge rst) begin 
  if (!rst) 
  tail <= 4'h0; 
  else if (dec_tail) 
  tail <= tail - 1; 
  else if (write) begin 
  tail <= tail + 1; 
  rob[tail] <= {RegDest, isSW, rd_DP, PR_old_DP, PR_new_DP}; 
  complete_array[tail] <= 0; 
  end 
 end 
 reg [4:0] status_cnt; 
 always @(posedge clk or negedge rst) begin 
  if (!rst) 
  status_cnt <= 4'h0; 
  else if (write && !read) 
  status_cnt <= status_cnt + 1; 
  else if (read && !write) 
  status_cnt <= status_cnt - 1; 
  else if (dec_tail) 
  status_cnt <= status_cnt - 1; 
 end 
 assign full = status_cnt[4]; 
 assign empty = ~(|status_cnt); 
 reg [3:0] branch_rob; 
 reg store_jb_addr; 
 always @(posedge clk or negedge rst) begin 
  if (!rst) 
  complete_array <= 0; 
  else if (complete) 
  complete_array[rob_number] <= 1'b1; 
 end 
 always @(posedge clk or negedge rst) begin 
  if (!rst) begin 
  changeFlow_addr <= 0; 
  branch_rob <= 0; 
  end 
  else if (store_jb_addr) begin 
  changeFlow_addr <= jb_addr; 
  branch_rob <= rob_number; 
  end 
 end 
 assign out_rob_num = tail; 
 localparam IDLE = 1'b0; 
 localparam REC = 1'b1; 
 reg state, nstate; 
 always @(posedge clk or negedge rst) begin 
  if (!rst) 
  state <= IDLE; 
  else 
  state <= nstate; 
 end 
 wire recover_end = (branch_rob + 1 == tail); 
 always @(*) begin 
  nstate = IDLE; 
  dec_tail = 0; 
  recover = 0; 
  store_jb_addr = 0; 
  changeFlow_out = 0; 
  case (state) 
  IDLE: begin 
  if(complete && changeFlow) begin 
  nstate = REC; 
  dec_tail = 1; 
  recover = 1; 
  store_jb_addr = 1; 
  end 
  else 
  nstate = IDLE; 
  end 
  default: begin 
  if(recover_end) begin 
  nstate = IDLE; 
  changeFlow_out = 1; 
  end 
  else begin 
  nstate = REC; 
  dec_tail = 1; 
  recover = 1; 
  end 
  end 
  endcase 
 end 
 assign rd_flush = rob[tail-1][16:12]; 
 assign PR_old_flush = rob[tail-1][11:6]; 
 assign PR_new_flush = rob[tail-1][5:0]; 
 assign RegDest_out = rob[tail-1][18]; 
 endmodule