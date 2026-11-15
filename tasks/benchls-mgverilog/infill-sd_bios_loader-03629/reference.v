module mg_03629 (input wire clk,input wire rst,output reg [27:0] address,output reg [3:0] byteenable,output reg write,output reg [31:0] writedata,output reg read,input wire [31:0] readdata,input wire waitrequest);
parameter PIO_OUTPUT_ADDR = 32'h00008860; 
  parameter DRIVER_SD_ADDR = 32'h00000000; 
  parameter BIOS_SECTOR = 72; 
  parameter BIOS_SIZE = (64*1024); 
  parameter BIOS_ADDR = 32'hF0000 | 32'h8000000; 
  parameter VBIOS_SECTOR = 8; 
  parameter VBIOS_SIZE = (32*1024); 
  parameter VBIOS_ADDR = 32'hC0000 | 32'h8000000; 
  parameter CTRL_READ = 2; 
  reg [31:0] state; 
  always @(posedge clk) begin 
  if(rst) state <= 1; 
  else if(state != 0 && (!(waitrequest && write))) state <= state + 1; 
  end 
  always @(posedge clk) begin 
  if(rst) begin 
  write <= 0; 
  read <= 0; 
  writedata <= 0; 
  address <= 0; 
  byteenable <= 4'b0000; 
  end else if(!(waitrequest && write))begin 
  case(state) 
  20000000: begin 
  address <= PIO_OUTPUT_ADDR; 
  writedata <= 32'h1; 
  write <= 1; 
  end 
  20001000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR; 
  writedata <= BIOS_ADDR; 
  end 
  20002000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 4; 
  writedata <= BIOS_SECTOR; 
  end 
  20003000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 8; 
  writedata <= BIOS_SIZE / 512; 
  end 
  20004000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 12; 
  writedata <= CTRL_READ; 
  end 
  40004000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR; 
  writedata <= VBIOS_ADDR; 
  end 
  40005000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 4; 
  writedata <= VBIOS_SECTOR; 
  end 
  40006000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 8; 
  writedata <= VBIOS_SIZE / 512; 
  end 
  40007000: begin 
  write <= 1; 
  address <= DRIVER_SD_ADDR + 12; 
  writedata <= CTRL_READ; 
  end 
  60007000: begin 
  address <= PIO_OUTPUT_ADDR; 
  writedata <= 32'h0; 
  write <= 1; 
  end 
  default: begin 
  write <= 0; 
  writedata <= 0; 
  address <= 0; 
  end 
  endcase 
  end 
  end 
 endmodule