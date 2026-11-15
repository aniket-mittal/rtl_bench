module mg_05896(clk,sck,mosi,miso,ssel,rst_n);
input clk; 
 input rst_n; 
 input sck,mosi,ssel; 
 output miso; 
 reg recived_status; 
 reg[2:0] sckr; 
 reg[2:0] sselr; 
 reg[1:0] mosir; 
 reg[2:0] bitcnt; 
 reg[7:0] bytecnt; 
 reg byte_received; 
 reg [7:0] byte_data_received; 
 wire ssel_active; 
 wire sck_risingedge; 
 wire sck_fallingedge; 
 wire mosi_data; 
 always @(posedge clk or negedge rst_n)begin 
  if(!rst_n) 
  sckr <= 3'h0; 
  else 
  sckr <= {sckr[1:0],sck}; 
 end 
 assign sck_risingedge = (sckr[2:1] == 2'b01) ? 1'b1 : 1'b0; 
 assign sck_fallingedge = (sckr[2:1] == 2'b10) ? 1'b1 : 1'b0; 
 always @(posedge clk or negedge rst_n)begin 
  if(!rst_n) 
  sselr <= 3'h0; 
  else 
  sselr <= {sselr[1:0],ssel}; 
 end 
 assign ssel_active = (~sselr[1]) ? 1'b1 : 1'b0; 
 always @(posedge clk or negedge rst_n)begin 
  if(!rst_n) 
  mosir <= 2'h0; 
  else 
  mosir <={mosir[0],mosi}; 
 end 
 assign mosi_data = mosir[1]; 
 always @(posedge clk or negedge rst_n)begin 
  if(!rst_n)begin 
  bitcnt <= 3'b000; 
  byte_data_received <= 8'h0; 
  end 
  else begin 
  if(~ssel_active) 
  bitcnt <= 3'b000; 
  else begin 
  if(sck_risingedge)begin 
  bitcnt <= bitcnt + 3'b001; 
  byte_data_received <= {byte_data_received[6:0], mosi_data}; 
  end 
  else begin 
  bitcnt <= bitcnt; 
  byte_data_received <= byte_data_received; 
  end 
  end 
  end 
 end 
 always @(posedge clk or negedge rst_n) begin 
  if(!rst_n) 
  byte_received <= 1'b0; 
  else 
  byte_received <= ssel_active && sck_risingedge && (bitcnt==3'b111); 
 end 
 assign miso = mosi_data; 
 endmodule