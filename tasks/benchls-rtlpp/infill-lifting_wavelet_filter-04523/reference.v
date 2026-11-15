module rtlpp_04523
 (input          clk, reset,
  output         clk2,
  input signed  [7:0]  x_in,
  output signed [16:0]  x_e, x_o,
  output reg signed [8:0]   g, h);

  reg signed  [7:0]  x_wait;
  reg signed  [16:0] sx_up, sx_low;
  reg  clk_div2;
  wire signed [16:0] sxa0_up, sxa0_low;
  wire signed [16:0] up0, up1, low1;
  reg signed  [16:0] low0;

  parameter even=1'b0, odd=1'b1;
  reg [0:0] state;

  always @(posedge clk or posedge reset) 
  begin : Multiplex          
    if (reset)              
      state <= even;
    else
      case (state) 
        even : begin
          sx_up   <= (x_in <<< 7) - (x_in <<< 2);
          sx_low  <= (x_wait <<< 7) - (x_wait <<< 2);
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
  


  assign sxa0_up  = ((sx_up <<< 1)  - (sx_up >>> 2))
                  - ((sx_up >>> 6) + (sx_up >>> 8)); 

  assign sxa0_low = ((sx_low <<< 1) - (sx_low >>> 2))
                 - ((sx_low >>> 6) + (sx_low >>> 8));


  assign up0 = sxa0_low + sx_up;
  always @(negedge clk_div2)
  begin: LowerTreeFF
      low0 <= sx_low - sxa0_up;         
  end



  assign up1  = (up0 - (low0 >>> 2)) 
                 - ((low0 >>> 6) + (low0 >>> 8));

  assign low1 = (low0 + (up0 >>> 2)) 
                       + ((up0 >>> 6) + (up0 >>> 8));

  assign x_e  = sx_up;       
  assign x_o  = sx_low;      
  assign clk2 = clk_div2;

  always @(negedge clk_div2)
  begin: OutputScale
    g <= up1 >>> 8;      
    h <= low1 >>> 8;     
  end

endmodule