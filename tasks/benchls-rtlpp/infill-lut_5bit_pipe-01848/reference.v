module rtlpp_01848 (
  input        clk,
  input  [4:0] table_in,
  output reg [4:0] table_out
);     
  
  reg [3:0] lsbs;
  reg [1:0] msbs0;
  reg [4:0] table0out00, table0out01;

  always @(posedge clk) begin
    lsbs[0] <= table_in[0];
    lsbs[1] <= table_in[1];
    lsbs[2] <= table_in[2];
    lsbs[3] <= table_in[3];
    msbs0[0] <= table_in[4];
    msbs0[1] <= msbs0[0];
  end 

  always @(posedge clk) begin 
    case (msbs0[1])
      1'b0 : table_out <= table0out00;
      1'b1 : table_out <= table0out01;
      default : ;
    endcase
  end

  always @(posedge clk) begin 
    case (lsbs) 
      4'b0000 : table0out00 <= 5'b00000;
      4'b0001 : table0out00 <= 5'b00001;
      4'b0010 : table0out00 <= 5'b00011;
      4'b0011 : table0out00 <= 5'b00100;
      4'b0100 : table0out00 <= 5'b00101;
      4'b0101 : table0out00 <= 5'b00110;
      4'b0110 : table0out00 <= 5'b01000;
      4'b0111 : table0out00 <= 5'b01001;
      4'b1000 : table0out00 <= 5'b00111;
      4'b1001 : table0out00 <= 5'b01000;
      4'b1010 : table0out00 <= 5'b01010;
      4'b1011 : table0out00 <= 5'b01011;
      4'b1100 : table0out00 <= 5'b01100;
      4'b1101 : table0out00 <= 5'b01101;
      4'b1110 : table0out00 <= 5'b01111;
      4'b1111 : table0out00 <= 5'b10000;
      default : table0out00 <= 5'b00000;
    endcase  
  end             

  always @(posedge clk) begin 
    case (lsbs)
      4'b0000 : table0out01 <= 5'b01001;
      4'b0001 : table0out01 <= 5'b01010;
      4'b0010 : table0out01 <= 5'b01100;
      4'b0011 : table0out01 <= 5'b01101;
      4'b0100 : table0out01 <= 5'b01110;
      4'b0101 : table0out01 <= 5'b01111;
      4'b0110 : table0out01 <= 5'b10001;
      4'b0111 : table0out01 <= 5'b10010;
      4'b1000 : table0out01 <= 5'b10000;
      4'b1001 : table0out01 <= 5'b10001;
      4'b1010 : table0out01 <= 5'b10011;
      4'b1011 : table0out01 <= 5'b10100;
      4'b1100 : table0out01 <= 5'b10101;
      4'b1101 : table0out01 <= 5'b10110;
      4'b1110 : table0out01 <= 5'b11000;
      4'b1111 : table0out01 <= 5'b11001;
      default : table0out01 <= 5'b00000;
    endcase      
  end              

endmodule