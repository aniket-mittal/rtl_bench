module rtlpp_01814 (x, y, sum, clk);  
  parameter WIDTH   = 15; 
  parameter WIDTH1  = 7;  
  parameter WIDTH2  = 8;  

  input  [WIDTH-1:0] x, y;  
  output [WIDTH-1:0] sum;  
  input              clk;  

  reg  [WIDTH1-1:0] l1, l2; 
  wire [WIDTH1-1:0] q1, r1; 
  reg  [WIDTH2-1:0] l3, l4; 
  wire [WIDTH2-1:0] r2, q2, u2; 
  reg  [WIDTH-1:0]  s;    
  wire cr1, cq1; 
  wire [WIDTH2-1:0] h2; 
     
  wire  clkena, ADD, ena, aset, sclr;  
  wire sset, aload, sload, aclr, ovf1, cin1; 


  assign cin1    = 0; 
  assign aclr    = 0; 
  assign ADD     = 1; 
  assign ena     = 1; 
  assign aclr    = 0;            
  assign sclr    = 0; 
  assign sset    = 0; 
  assign aload   = 0; 
  assign sload   = 0; 
  assign clkena  = 0; 
  assign aset    = 0;

  always @(posedge clk) begin
    l1[WIDTH1-1:0] <= x[WIDTH1-1:0];
    l2[WIDTH1-1:0] <= y[WIDTH1-1:0]; 
    l3[WIDTH2-1:0] <= x[WIDTH2-1+WIDTH1:WIDTH1];
    l4[WIDTH2-1:0] <= y[WIDTH2-1+WIDTH1:WIDTH1];
  end

  // Internal adder 1 for l1 and l2
  assign r1 = l1 + l2;
  assign cr1 = (l1 + l2) > {WIDTH1{1'b1}};

  // Internal flip-flops for r1 and cr1
  reg [WIDTH1-1:0] reg1_q1;
  reg reg2_cq1;

  always @(posedge clk) begin
    reg1_q1 <= r1;
    reg2_cq1 <= cr1;
  end

  assign q1 = reg1_q1;
  assign cq1 = reg2_cq1;

  // Internal adder 2 for l3 and l4
  assign r2 = l3 + l4;

  // Internal flip-flop for r2
  reg [WIDTH2-1:0] reg3_q2;

  always @(posedge clk) begin
    reg3_q2 <= r2;
  end

  assign q2 = reg3_q2;

  assign h2 = {WIDTH2{1'b0}}; // Zero extend h2

  // Internal adder 3 for q2 and cq1
  assign u2 = q2 + cq1;

  always @(posedge clk) begin  
    s = {u2[WIDTH2-1:0], q1[WIDTH1-1:0]};     
  end                             

  assign sum = s;    

endmodule