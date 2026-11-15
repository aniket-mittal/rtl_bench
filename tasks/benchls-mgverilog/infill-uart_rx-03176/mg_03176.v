module mg_03176 (input rst_n,input clk,input rxd,output valid,output [7:0] data);
reg [2:0] reg_rxd; 
  reg [1:0] sample_count; 
  reg [2:0] bit_count; 
  reg [7:0] rx_data; 
  reg [3:0] state; 
  localparam S_IDLE = 4'd0; 
  localparam S_START = 4'd1; 
  localparam S_DATA = 4'd2; 
  localparam S_STOP = 4'd3; 
  localparam S_LAST = 4'd4; 
  wire detect_startbit, sample_point; 
  always @(posedge clk or negedge rst_n) begin 
  if(!rst_n) begin 
  reg_rxd[2:0] <= 3'd0; 
  end else begin 
  reg_rxd[2:0] <= {reg_rxd[1:0], rxd}; 
  end 
  end 
  assign detect_startbit = (state == S_IDLE) && (reg_rxd[2] == 1'b1) && (reg_rxd[1] == 1'b0); 
  always @(posedge clk or negedge rst_n) begin 
  if(!rst_n) begin 
  sample_count[1:0] <= 2'd0; 
  end else begin 
  if(detect_startbit == 1'b1) begin 
  sample_count[1:0] <= 2'd0; 
  end else begin 
  sample_count[1:0] <= sample_count[1:0] + 2'd1; 
  end 
  end 
  end 
  assign sample_point = (sample_count[1:0] == 2'd0)?1'b1:1'b0; 
  [MASKED] 
  assign valid = (state == S_LAST)?1'b1:1'b0; 
  assign data[7:0] = rx_data[7:0]; 
 endmodule