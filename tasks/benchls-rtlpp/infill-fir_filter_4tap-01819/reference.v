module rtlpp_01819 (clk, Load_x, x_in, c_in, y_out);  
  parameter W1 = 9;   
  parameter W2 = 18;  
  parameter W3 = 19;  
  parameter W4 = 11;  
  parameter L  = 4;   
  parameter Mpipe = 3; 
  
  input clk, Load_x;  
  input [W1-1:0] x_in, c_in;  
  output [W3-1:0] y_out;  

  reg [W1-1:0]  x;
  wire [W3-1:0]  y;

  reg  [W1-1:0] c0, c1, c2, c3; 
  wire [W2-1:0] p0, p1, p2, p3; 
  reg  [W3-1:0] a0, a1, a2, a3; 

  wire  [W2-1:0] sum;  
  wire  clken, aclr;

  assign sum = 0; 
  assign aclr = 0; 
  assign clken = 0;
                
  always @(posedge clk) begin
    if (! Load_x) begin
      c3 <= c_in; 
      c2 <= c3;   
      c1 <= c2;
      c0 <= c1;
    end else begin
      x <= x_in; 
    end
  end

  always @(posedge clk) begin
    a0 <= {p0[W2-1], p0} + a1;
    a1 <= {p1[W2-1], p1} + a2;
    a2 <= {p2[W2-1], p2} + a3;
    a3 <= {p3[W2-1], p3}; 
  end
  assign y = a0;

  // Multiply Logic for mul_0
  reg [W2-1:0] p0_reg;
  always @(posedge clk) begin
    p0_reg <= $signed(x) * $signed(c0);
  end
  assign p0 = p0_reg;

  // Multiply Logic for mul_1
  reg [W2-1:0] p1_reg;
  always @(posedge clk) begin
    p1_reg <= $signed(x) * $signed(c1);
  end
  assign p1 = p1_reg;

  // Multiply Logic for mul_2
  reg [W2-1:0] p2_reg;
  always @(posedge clk) begin
    p2_reg <= $signed(x) * $signed(c2);
  end
  assign p2 = p2_reg;

  // Multiply Logic for mul_3
  reg [W2-1:0] p3_reg;
  always @(posedge clk) begin
    p3_reg <= $signed(x) * $signed(c3);
  end
  assign p3 = p3_reg;

  assign y_out = y[W3-1:W3-W4];
endmodule