module mg_04220(input wire clk,input wire reset,input wire write_req,input wire read_req,input wire [31:0] data_write,output reg [31:0] data_read,input wire [25:0] address,output wire busy,output wire rj45_led_sck,output wire rj45_led_sin,output wire rj45_led_lat,output wire rj45_led_blk);
localparam IDLE = 3'd0, 
  READ = 3'd1, 
  WRITE = 4'd2; 
 localparam CLK_DIV = 3; 
 wire update_out; 
 reg [CLK_DIV:0] clk_div1; 
 reg [CLK_DIV:0] clk_div2; 
 reg clk_enable; 
 reg [15:0] output_shifter; 
 reg [4:0] write_counter; 
 reg latch; 
 reg [2:0] state; 
 reg busy_int; 
 reg [31:0] value_cache; 
 assign rj45_led_sck = clk_div2[CLK_DIV] & clk_enable; 
 assign rj45_led_sin = output_shifter[15]; 
 assign rj45_led_lat = latch; 
 assign rj45_led_blk = 0; 
 assign update_out = ~clk_div1[CLK_DIV] & clk_div2[CLK_DIV]; 
 assign busy = busy_int | read_req | write_req; 
 always @( posedge clk ) begin 
  if ( reset ) begin 
  clk_div1 <= 0; 
  clk_div2 <= 0; 
  end 
  else begin 
  clk_div2 <= clk_div1; 
  clk_div1 <= clk_div1 + 1; 
  end 
 end 
 always @( posedge clk ) begin 
  if ( reset ) begin 
  state <= IDLE; 
  clk_enable <= 0; 
  output_shifter <= 16'h0000; 
  write_counter <= 5'h00; 
  latch <= 0; 
  busy_int <= 1; 
  value_cache <= 32'd0; 
  end 
  else begin 
  case ( state ) 
  IDLE: begin 
  data_read <= 32'd0; 
  if ( write_req ) begin 
  state <= WRITE; 
  busy_int <= 1; 
  output_shifter <= {1'b0, data_write[0], 1'b0, data_write[1], 
  1'b0, data_write[2], 1'b0, data_write[3], 
  1'b0, data_write[4], 1'b0, data_write[5], 
  1'b0, data_write[6], 1'b0, data_write[7]}; 
  value_cache <= {24'd0, data_write[7:0]}; 
  write_counter <= 0; 
  end 
  else if ( read_req ) begin 
  state <= READ; 
  busy_int <= 1; 
  end 
  else begin 
  busy_int <= 0; 
  end 
  end 
  WRITE: begin 
  if ( update_out ) begin 
  write_counter <= write_counter + 5'd1; 
  if ( write_counter == 0 ) begin 
  clk_enable <= 1; 
  end 
  else if ( write_counter < 5'd16) begin 
  output_shifter <= {output_shifter[14:0], 1'b0}; 
  end 
  else if ( write_counter == 5'd16 ) begin 
  clk_enable <= 0; 
  latch <= 1; 
  end 
  else begin 
  state <= IDLE; 
  latch <= 0; 
  busy_int <= 0; 
  end 
  end 
  end 
  READ: begin 
  state <= IDLE; 
  busy_int <= 0; 
  data_read <= value_cache; 
  end 
  endcase 
  end 
 end 
 endmodule