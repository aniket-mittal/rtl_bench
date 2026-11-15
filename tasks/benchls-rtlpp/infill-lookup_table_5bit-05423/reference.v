module rtlpp_05423
 (
  input        clk,
  input  [4:0] table_in,
  output reg [4:0] table_out
 );     

  reg [3:0] lsbs;
  reg [1:0] msbs0;
  reg [4:0] table0out00, table0out01;

  always @(posedge clk) begin
    lsbs[0] = table_in[0];
    lsbs[1] = table_in[1];
    lsbs[2] = table_in[2];
    lsbs[3] = table_in[3];
    msbs0[0] = table_in[4];
    msbs0[1] = msbs0[0];
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
      4'b0000 : table0out00 = 5'd0;
      4'b0001 : table0out00 = 5'd1;
      4'b0010 : table0out00 = 5'd3;
      4'b0011 : table0out00 = 5'd4;
      4'b0100 : table0out00 = 5'd5;
      4'b0101 : table0out00 = 5'd6;
      4'b0110 : table0out00 = 5'd8;
      4'b0111 : table0out00 = 5'd9;
      4'b1000 : table0out00 = 5'd7;
      4'b1001 : table0out00 = 5'd8;
      4'b1010 : table0out00 = 5'd10;
      4'b1011 : table0out00 = 5'd11;
      4'b1100 : table0out00 = 5'd12;
      4'b1101 : table0out00 = 5'd13;
      4'b1110 : table0out00 = 5'd15;
      4'b1111 : table0out00 = 5'd16;
      default : ;
    endcase  
  end             

  always @(posedge clk) begin 
    case (lsbs)
      4'b0000 : table0out01 = 5'd9;
      4'b0001 : table0out01 = 5'd10;
      4'b0010 : table0out01 = 5'd12;
      4'b0011 : table0out01 = 5'd13;
      4'b0100 : table0out01 = 5'd14;
      4'b0101 : table0out01 = 5'd15;
      4'b0110 : table0out01 = 5'd17;
      4'b0111 : table0out01 = 5'd18;
      4'b1000 : table0out01 = 5'd16;
      4'b1001 : table0out01 = 5'd17;
      4'b1010 : table0out01 = 5'd19;
      4'b1011 : table0out01 = 5'd20;
      4'b1100 : table0out01 = 5'd21;
      4'b1101 : table0out01 = 5'd22;
      4'b1110 : table0out01 = 5'd24;
      4'b1111 : table0out01 = 5'd25;
      default : ;
    endcase      
  end              

endmodule