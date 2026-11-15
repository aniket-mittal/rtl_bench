module mg_08035(CLK, TYPE, DIS, AN, display);
input CLK, TYPE, DIS; 
  output reg [3:0] AN; 
  output reg [7:0] display; 
  reg [31:0] counter; 
  reg [31:0] move_counter; 
  parameter [31:0] MAX_COUNTER = 5_0000; 
  parameter [31:0] MAX_MOVE_COUNTER = 1_0000_0000; 
  parameter [31:0] ID = 32'H16340040; 
  reg [15:0] num; 
  reg [4:0] tmp; 
  initial begin 
  AN = 4'B0111; 
  display = 8'B0000_0000; 
  counter = 0; 
  move_counter = MAX_MOVE_COUNTER + 1; 
  num = ID[15:0]; 
  end 
  always@(AN) begin 
  case(AN) 
  4'B0111: tmp = num[15:12]; 
  4'B1011: tmp = num[11:8]; 
  4'B1101: tmp = num[7:4]; 
  4'B1110: tmp = num[3:0]; 
  endcase 
  case(tmp) 
  4'H0: display = 8'B0000_0011; 
  4'H1: display = 8'B1001_1111; 
  4'H2: display = 8'B0010_0101; 
  4'H3: display = 8'B0000_1101; 
  4'H4: display = 8'B1001_1001; 
  4'H5: display = 8'B0100_1001; 
  4'H6: display = 8'B0100_0001; 
  4'H7: display = 8'B0001_1111; 
  4'H8: display = 8'B0000_0001; 
  4'H9: display = 8'B0000_1001; 
  4'Hf: display = 8'B1111_1111; 
  endcase 
  end 
  [MASKED] 
 endmodule