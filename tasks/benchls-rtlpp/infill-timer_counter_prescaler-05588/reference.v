module rtlpp_05588
  (input  clk_i,
   input  res_i,
   input  en_clk_i,
   input  t1_i,
   input  [2:0] clk_mstate_i,
   input  [7:0] data_i,
   input  read_timer_i,
   input  write_timer_i,
   input  start_t_i,
   input  start_cnt_i,
   input  stop_tcnt_i,
   output [7:0] data_o,
   output overflow_o);
  
  reg [7:0] counter_q;
  reg overflow_q;
  reg n4503_o;
  reg [1:0] inc_sel_q;
  reg t1_q;
  reg [4:0] prescaler_q;

  wire increment_s = n4503_o;
  wire t1_inc_s = n4485_o;
  wire pre_inc_s = n4492_o;
  
  wire n4474_o = (clk_mstate_i == 3'b100);
  wire n4476_o = n4474_o & 1'b1;
  wire n4478_o = 1'b0 | n4476_o;
  
  wire n4479_o = ~t1_i;
  wire n4480_o = n4479_o & t1_q;
  wire n4483_o = n4480_o ? 1'b1 : 1'b0;
  wire n4485_o = n4478_o ? n4483_o : 1'b0;
  
  wire n4489_o = (clk_mstate_i == 3'b100);
  wire n4491_o = (prescaler_q == 5'b11111);
  wire n4492_o = n4491_o & n4489_o;
  
  wire n4495_o = (inc_sel_q == 2'b00);
  wire n4497_o = (inc_sel_q == 2'b01);
  wire n4499_o = (inc_sel_q == 2'b10);
  wire [2:0] n4500_o = {n4499_o, n4497_o, n4495_o};

  always @*
    case (n4500_o)
      3'b100: n4503_o = t1_inc_s;
      3'b010: n4503_o = pre_inc_s;
      3'b001: n4503_o = 1'b0;
      default: n4503_o = 1'b0;
    endcase
  
  wire n4507_o = ~res_i;

  wire [7:0] n4510_o = counter_q + 8'b00000001;
  wire n4512_o = (counter_q == 8'b11111111);
  wire n4515_o = n4512_o ? 1'b1 : 1'b0;
  wire [7:0] n4516_o = increment_s ? n4510_o : counter_q;
  wire n4518_o = increment_s ? n4515_o : 1'b0;
  wire [7:0] n4519_o = write_timer_i ? data_i : n4516_o;
  wire n4521_o = write_timer_i ? 1'b0 : n4518_o;
  
  wire n4524_o = (clk_mstate_i == 3'b011);
  wire n4526_o = n4524_o & 1'b1;
  wire n4528_o = 1'b0 | n4526_o;
  
  wire n4531_o = (clk_mstate_i == 3'b010);

  wire [4:0] n4533_o = prescaler_q + 5'b00001;
  wire [4:0] n4534_o = n4531_o ? n4533_o : prescaler_q;
  wire [4:0] n4536_o = start_t_i ? 5'b00000 : n4534_o;

  wire [1:0] n4538_o = stop_tcnt_i ? 2'b00 : inc_sel_q;
  wire [1:0] n4540_o = start_cnt_i ? 2'b10 : n4538_o;
  wire [1:0] n4542_o = start_t_i ? 2'b01 : n4540_o;

  wire n4546_o = en_clk_i & n4528_o;
  wire [7:0] n4564_o = read_timer_i ? counter_q : 8'b11111111;
  wire n4573_o = overflow_q ? 1'b1 : 1'b0;
  wire [7:0] n4574_o = en_clk_i ? n4519_o : counter_q;

  always @(posedge clk_i or posedge n4507_o)
    if (n4507_o)
      counter_q <= 8'b00000000;
    else
      counter_q <= n4574_o;

  wire n4576_o = en_clk_i ? n4521_o : overflow_q;

  always @(posedge clk_i or posedge n4507_o)
    if (n4507_o)
      overflow_q <= 1'b0;
    else
      overflow_q <= n4576_o;

  wire [1:0] n4578_o = en_clk_i ? n4542_o : inc_sel_q;

  always @(posedge clk_i or posedge n4507_o)
    if (n4507_o)
      inc_sel_q <= 2'b00;
    else
      inc_sel_q <= n4578_o;

  wire n4580_o = n4546_o ? t1_i : t1_q;

  always @(posedge clk_i or posedge n4507_o)
    if (n4507_o)
      t1_q <= 1'b0;
    else
      t1_q <= n4580_o;

  wire [4:0] n4582_o = en_clk_i ? n4536_o : prescaler_q;

  always @(posedge clk_i or posedge n4507_o)
    if (n4507_o)
      prescaler_q <= 5'b00000;
    else
      prescaler_q <= n4582_o;

  assign data_o = n4564_o;
  assign overflow_o = n4573_o;
  
endmodule