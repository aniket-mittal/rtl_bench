module mg_04160 (input clk,input reset,input i_clock,input i_data,output scan_ready,output [7:0] scan_code);
reg [9:0] buffer; 
  reg [3:0] counter; 
  reg sample_timer_active; 
  reg read_data; 
  reg [31:0] sample_timer; 
  reg ready; 
  wire parity; 
  assign scan_code = buffer[9:2]; 
  assign parity = buffer[1]; 
  assign scan_ready = ready; 
  always @(negedge i_clock) begin 
  sample_timer_active <= 1; 
  read_data <= 0; 
  end 
  always @(posedge clk or posedge reset) begin 
  if (reset) begin 
  sample_timer_active <= 0; 
  sample_timer <= 0; 
  read_data <= 0; 
  end else begin 
  if (sample_timer_active) begin 
  if (sample_timer == 32'b1000) begin 
  sample_timer_active <= 0; 
  sample_timer <= 0; 
  read_data <= 1; 
  end else begin 
  sample_timer <= sample_timer + 32'b1; 
  end 
  end 
  end 
  end 
  always @(posedge clk or posedge reset) begin 
  if (reset) begin 
  buffer <= 8'b0; 
  counter <= 4'd0; 
  end else begin 
  if (read_data) begin 
  buffer <= {buffer[8:0], i_data}; 
  read_data <= 0; 
  if (counter == 4'd11) begin 
  counter <= 4'd0; 
  buffer <= 8'b0; 
  end else begin 
  counter <= counter + 4'd1; 
  end 
  end 
  end 
  end 
  always @(posedge clk) begin 
  if (counter == 4'd11) begin 
  if (!parity == ^scan_code) begin 
  ready <= 1'b1; 
  end 
  end else begin 
  ready <= 1'b0; 
  end 
  end 
 endmodule