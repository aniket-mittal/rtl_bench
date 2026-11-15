module mg_01229(clk,nrst,start,n,wraddr,wren,rdaddr,vexaddr);
input clk; 
 input nrst; 
 input start; 
 input [15:0]n; 
 output [10:0]wraddr; 
 output [10:0]rdaddr; 
 output [13:0]vexaddr; 
 output wren; 
 reg [15:0]counter1; 
 reg [15:0]counter2; 
 reg [15:0]counter3; 
 reg [15:0]counter4; 
 reg [15:0]timer1; 
 reg [15:0]timer2; 
 reg [15:0]timer3; 
 reg [29:0]t1_exp_dly; 
 reg [29:0]t2_exp_dly; 
 reg [29:0]start_dly; 
 wire t1_expire = timer1[15]; 
 wire t2_expire = timer2[15]; 
 wire t3_expire = timer3[15]; 
 assign rdaddr = counter1[10:0]; 
 assign vexaddr = counter3[13:0]; 
 assign wraddr = counter4[10:0]; 
 always @(posedge clk) 
  if (~nrst) timer1 <= -1; 
  else if(start) timer1 <= {1'b0,n[14:0]}; 
  else if(!t1_expire && t2_expire) timer1 <= timer1 - 1; 
 wire [15:0] t2_startval = {3'b0, n[15:2]} - 1; 
 wire [15:0] t1_minus = timer1 - 5; 
 always @(posedge clk) 
  if (~nrst) timer2 <= -1; 
  else if(start) timer2 <= t2_startval; 
  else if(!t1_expire && t2_expire && !t3_expire) timer2 <= {3'b0, t1_minus[15:2]}; 
  else if(!t1_expire && t2_expire && t3_expire) timer2 <= 30; 
  else if(!t1_expire && !t2_expire) timer2 <= timer2 - 1; 
 always @(posedge clk) 
  if(~nrst) timer3 <= -1; 
  else if(start) timer3 <= n-128; 
  else if(!t3_expire && t2_expire) timer3 <= timer3 - 1; 
 always@(posedge clk) 
  if (~nrst) t1_exp_dly <= 0; 
  else t1_exp_dly <= {t1_exp_dly[28:0], t1_expire}; 
 always@(posedge clk) 
  if(~nrst) t2_exp_dly <= 0; 
  else t2_exp_dly <= {t2_exp_dly[28:0], t2_expire}; 
 always@(posedge clk) 
  if(~nrst) start_dly <= 0; 
  else start_dly <= {start_dly[28:0], start}; 
 wire sig_a = t1_exp_dly[24]; 
 wire sig_b = t2_exp_dly[24]; 
 wire sig_c = start_dly[24]; 
 wire sig_d = t1_exp_dly[29]; 
 wire sig_e = t2_exp_dly[29]; 
 wire sig_f = start_dly[29]; 
 assign wren = !sig_d; 
 always @(posedge clk) 
  if (~nrst) counter1 <= -1; 
  else if(start) counter1 <= 0; 
  else if(!t1_expire && t2_expire) counter1 <= 0; 
  else if(!t1_expire && !t2_expire) counter1 <= counter1 + 1; 
 always @(posedge clk) 
  if(~nrst) counter2 <= -1; 
  else if(sig_c) counter2 <= 0; 
  else if(!sig_a && sig_b) counter2 <= counter2 + 1; 
 always @(posedge clk) 
  if(~nrst) counter3 <= -1; 
  else if(sig_c) counter3 <= 0; 
  else if(!sig_a && sig_b) counter3 <= counter2 + 1; 
  else if(!sig_a && !sig_b) counter3 <= counter3 + 8; 
 always @(posedge clk) 
  if (~nrst) counter4 <= -1; 
  else if(sig_f) counter4 <= 0; 
  else if(!sig_d && sig_e) counter4 <= 0; 
  else if(!sig_d && !sig_e) counter4 <= counter4 + 1; 
 endmodule