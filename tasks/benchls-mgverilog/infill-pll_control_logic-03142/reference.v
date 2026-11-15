module mg_03142 (rin,clk,clr,ena,padder,devpor,devclrn,ctrlout);
input rin; 
 input clk; 
 input clr; 
 input ena; 
 input [6:0] padder; 
 input devpor; 
 input devclrn; 
 output [6:0] ctrlout; 
 parameter runtime_control = "false"; 
 parameter use_core_control = "false"; 
 parameter use_both_compares = "false"; 
 parameter pull_adder = 0; 
 parameter power_down = "true"; 
 parameter left_shift = "false"; 
 parameter test_mode = "false"; 
 reg rin_reg_n; 
 reg [6:0] counter1; 
 reg pdetect_reg_n; 
 reg pdetect_reg_1; 
 reg pdetect_reg_2; 
 wire pdetect_out; 
 wire pre_adder_reg_n_ena; 
 reg [6:0] pre_adder_reg_n; 
 wire pre_adder_reg_ena; 
 reg [6:0] pre_adder_reg; 
 wire [6:0] adder_in; 
 wire [6:0] adder1; 
 initial 
 begin 
  rin_reg_n = 1'b0; 
  counter1 = 7'b1000000; 
  pdetect_reg_n = 1'b0; 
  pdetect_reg_1 = 1'b0; 
  pdetect_reg_2 = 1'b0; 
  pre_adder_reg_n = 7'b0100000; 
  pre_adder_reg = 7'b0100000; 
 end 
 assign ctrlout = (use_core_control == "true") ? padder : adder1; 
 always @(negedge clk or posedge clr) 
 begin 
  if (clr === 1'b1) 
  rin_reg_n <= 1'b0; 
  else 
  rin_reg_n <= rin; 
 end 
 always @(posedge clk or posedge clr) 
 begin 
  if (clr === 1'b1) 
  counter1 <= 7'b1000000; 
  else if (ena === 1'b1) 
  begin 
  if (rin_reg_n === 1'b0 && counter1 > 7'b000000) 
  counter1 <= counter1 - 7'b0000001; 
  else if (rin_reg_n === 1'b1 && counter1 < 7'b1111111) 
  counter1 <= counter1 + 7'b0000001; 
  end 
 end 
 assign pdetect_out = ((pdetect_reg_2 === 1'b0) && (pdetect_reg_1 === 1'b1))? 1'b1 : 1'b0; 
 always @(negedge clk) 
  pdetect_reg_n <= rin_reg_n; 
 always @(posedge clk) 
 begin 
  pdetect_reg_1 <= rin_reg_n; 
  pdetect_reg_2 <= pdetect_reg_1; 
 end 
 assign pre_adder_reg_n_ena = (test_mode === "true") ? ena 
  : (ena && pdetect_out); 
 always @(negedge clk or posedge clr) 
 begin 
  if (clr === 1'b1) 
  pre_adder_reg_n <= 7'b0100000; 
  else if (pre_adder_reg_n_ena === 1'b1) 
  pre_adder_reg_n <= counter1; 
 end 
 assign adder_in = (left_shift === "false") ? pre_adder_reg_n 
  : (pre_adder_reg_n << 1); 
 assign adder1 = adder_in + pull_adder; 
 endmodule