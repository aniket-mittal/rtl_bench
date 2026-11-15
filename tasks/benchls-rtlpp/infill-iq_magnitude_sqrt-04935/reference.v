module rtlpp_04935
  (
    clk,
    I_in ,
    Q_in ,
    d_out
  );
  
  input clk;
  input signed [11:0] I_in;
  input signed [11:0] Q_in;
  output reg [11:0] d_out;

  reg signed [15:0] d_out_d;
  reg [31:0] ISquare;
  reg signed [11:0] MultDataA;
  reg signed [11:0] MultDataB;
  reg signed [11:0] MultDataC;
  reg signed [11:0] MultDataD;
  wire signed [23:0] MultResult1;
  wire signed [23:0] MultResult2;

  function [15:0] sqrt;
    input [31:0] num;  
    
    reg [31:0] a;
    reg [15:0] q;
    reg [17:0] left, right, r;    
    integer i;
    begin
      a = num;
      q = 0;
      i = 0;
      left = 0;   
      right = 0;  
      r = 0;  
      
      for (i=0; i<16; i=i+1) begin 
        right = {q, r[17], 1'b1};
        left = {r[15:0], a[31:30]};
        a = {a[29:0], 2'b00};    
        if (r[17] == 1) 
          r = left + right;
        else    
          r = left - right;
        q = {q[14:0], !r[17]};       
      end
      sqrt = q;   
    end
  endfunction 

  assign MultResult1 = MultDataA * MultDataB;
  assign MultResult2 = MultDataC * MultDataD;

  always @(posedge clk) begin
    MultDataA <= I_in;
    MultDataB <= I_in;
    MultDataC <= Q_in;
    MultDataD <= Q_in;
    ISquare <= MultResult1 + MultResult2;
    d_out_d <= sqrt(ISquare);
    d_out <= d_out_d[11:0];
  end

endmodule