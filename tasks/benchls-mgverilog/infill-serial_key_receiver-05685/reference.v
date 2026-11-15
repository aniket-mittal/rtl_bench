module mg_05685(input clk,input extdata,input extclk,input extcs,output reg [7:0] keys1,output reg [7:0] keys2);
reg [7:0] inputbyte; 
  reg [3:0] bytestate; 
  reg [2:0] bitcounter; 
  reg byte_rec; 
  reg [2:0] extclk_r; 
  reg [2:0] extcs_r; 
  reg [1:0] extdata_r; 
  always@ (posedge clk) begin 
  extclk_r <= {extclk_r[1:0], extclk}; 
  extcs_r <= {extcs_r[1:0], extcs}; 
  extdata_r <= {extdata_r[0], extdata}; 
  end 
  wire extclk_rising = (extclk_r[2:1] == 2'b01); 
  wire cs_active = ~extcs_r[1]; 
  wire extdata_in = extdata_r[1]; 
  initial begin; 
  inputbyte = 8'b00000000; 
  bytestate = 4'b0000; 
  bitcounter = 3'b000; 
  byte_rec = 0; 
  keys1 = 0; 
  keys2 = 0; 
  end 
  always@ (posedge clk) begin 
  if (~cs_active) 
  bitcounter <= 0; 
  else 
  if (extclk_rising) begin 
  inputbyte <= {inputbyte[6:0], extdata_in}; 
  bitcounter <= bitcounter + 1; 
  end 
  end 
  always@ (posedge clk) begin 
  byte_rec <= extclk_rising && bitcounter == 3'b111; 
  end 
  always@ (posedge clk) begin 
  if (byte_rec) begin 
  if (inputbyte[7]) begin 
  bytestate = 4'b0000; 
  end 
  case (bytestate) 
  4'b0000: begin 
  keys1[7] = inputbyte[1]; 
  keys1[6] = inputbyte[2]; 
  keys1[5] = inputbyte[0]; 
  keys1[4] = inputbyte[3]; 
  keys1[3] = inputbyte[4]; 
  bytestate = 4'b0001; 
  end 
  4'b0001: begin 
  keys1[1] = inputbyte[2]; 
  keys1[0] = inputbyte[1]; 
  bytestate = 4'b0010; 
  end 
  4'b0010: begin 
  keys1[2] = inputbyte[0] | inputbyte[2]; 
  bytestate = 4'b0000; 
  end 
  endcase 
  end 
  end 
 endmodule