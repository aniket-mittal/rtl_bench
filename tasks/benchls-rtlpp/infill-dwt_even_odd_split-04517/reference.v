module rtlpp_04517                  
 (input clk,                    
  input reset,                  
  input signed [7:0] x_in,      
  output clk2,                  
  output signed [16:0] x_e, x_o,
  output signed [16:0] g0, g1,  
  output signed [8:0] y_out);   

  reg signed [7:0] x_odd, x_even, x_wait;
  reg  clk_div2;

  reg signed [16:0] m0, m1, m2, m3, r0, r1, r2, r3; 
  reg signed [16:0] x33, x99, x107;
  reg signed [8:0] y;

  // State encoding
  parameter even = 1'b0, odd = 1'b1;

  reg [0:0] state;  // One-bit state register

  always @(posedge clk or posedge reset) 
  begin
    if (reset) begin             
      state <= even;
      clk_div2 <= 0;
      x_even <= 0;
      x_odd <= 0;
      x_wait <= 0;
    end else begin
      case (state) 
        even : begin
          x_even <= x_in; 
          x_odd  <= x_wait;
          clk_div2 <= 1;
          state <= odd;
        end
        odd : begin
          x_wait <= x_in;
          clk_div2 <= 0;
          state <= even;
        end
      endcase  
    end
  end

  always @(x_odd or x_even) 
  begin
    x33  = (x_odd <<< 5) + x_odd;            
    x99  = (x33 <<< 1) + x33;                  
    x107 = x99 + (x_odd << 3);

    m0 = (x_even <<< 7) - (x_even <<< 2); 
    m1 = x107 <<< 1;                      
    m2 = (x_even <<< 6) - (x_even <<< 3) + x_even; 
    m3 = x33;                               
  end

  always @(posedge reset or negedge clk_div2)  
  begin
    if (reset) begin             
      r0 <= 0;
      r1 <= 0;
      r2 <= 0;
      r3 <= 0;
      y <= 0;
    end else begin
      r0 <=  r2 + m0;        
      r2 <=  m2;             
      r1 <=  -r3 + m1;       
      r3 <=  m3;             
      y <= r0 + r1; 
    end
  end

  assign x_e = x_even; 
  assign x_o = x_odd;
  assign clk2 = clk_div2;
  assign g0 = r0;
  assign g1 = r1;
  assign y_out = y >>> 8; 

endmodule