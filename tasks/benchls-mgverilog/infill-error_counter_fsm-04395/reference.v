module mg_04395(input clk,input status_in,output reg RST_state,output reg TRAININGDONE_state,output reg IDLE_state,output reg FIFOFULL_state,output reg error_state);
reg ambiguity; 
  reg [3:0] error_cnt; 
  reg [7:0] shift_reg; 
  parameter IDLE = 4'b0001; 
  parameter RST = 4'b0010; 
  parameter FIFOFULL = 4'b0100; 
  parameter TRAININGDONE = 4'b1000; 
  reg [3:0] INT_SAT; 
  initial shift_reg <= 8'h00; 
  always@(posedge clk) shift_reg <= {shift_reg[6:0], status_in}; 
  initial begin 
  ambiguity <= 1'b0; 
  INT_SAT <= IDLE; 
  end 
  always@(posedge clk) begin 
  ambiguity <= 1'b0; 
  if ( shift_reg == 8'h55 | shift_reg == 8'hAA) begin 
  INT_SAT <= RST; 
  end else if ( shift_reg == 8'hF0 | shift_reg == 8'h87 | shift_reg == 8'hC3 | shift_reg == 8'hE1 | shift_reg == 8'h78 | shift_reg == 8'h3C | shift_reg == 8'h1E | shift_reg == 8'h0F ) begin 
  INT_SAT <= FIFOFULL; 
  end else if ( shift_reg == 8'h33 | shift_reg == 8'h66 | shift_reg == 8'hCC | shift_reg == 8'h99 ) begin 
  INT_SAT <= TRAININGDONE; 
  end else if ( shift_reg == 8'h00) begin 
  INT_SAT <= IDLE; 
  end else begin 
  INT_SAT <= INT_SAT; 
  ambiguity <= 1'b1; 
  end 
  end 
  initial 
  error_cnt <= 4'b0000; 
  always@(posedge clk) begin 
  if (ambiguity) begin 
  if (error_cnt != 4'b1000) 
  error_cnt <= error_cnt + 4'b0001; 
  else 
  error_cnt <= error_cnt; 
  end else begin 
  error_cnt <= 4'b0000; 
  end 
  end 
  always@(posedge clk) begin 
  error_state <= (error_cnt == 4'b1000) ? 1'b1 : 1'b0; 
  end 
  initial begin 
  RST_state <= 1'b0; 
  TRAININGDONE_state <= 1'b0; 
  FIFOFULL_state <= 1'b0; 
  IDLE_state <= 1'b1; 
  end 
  always@(posedge clk) begin 
  if (INT_SAT == RST) begin 
  RST_state <= 1'b1; 
  TRAININGDONE_state <= 1'b0; 
  FIFOFULL_state <= 1'b0; 
  IDLE_state <= 1'b0; 
  end else if ( INT_SAT == FIFOFULL ) begin 
  RST_state <= 1'b0; 
  TRAININGDONE_state <= 1'b1; 
  FIFOFULL_state <= 1'b1; 
  IDLE_state <= 1'b0; 
  end else if ( INT_SAT == TRAININGDONE ) begin 
  RST_state <= 1'b0; 
  TRAININGDONE_state <= 1'b1; 
  FIFOFULL_state <= 1'b0; 
  IDLE_state <= 1'b0; 
  end else if ( INT_SAT == IDLE ) begin 
  RST_state <= 1'b0; 
  TRAININGDONE_state <= 1'b0; 
  FIFOFULL_state <= 1'b0; 
  IDLE_state <= 1'b1; 
  end else begin 
  RST_state <= 1'b0; 
  TRAININGDONE_state <= 1'b0; 
  FIFOFULL_state <= 1'b0; 
  IDLE_state <= 1'b1; 
  end 
  end 
 endmodule