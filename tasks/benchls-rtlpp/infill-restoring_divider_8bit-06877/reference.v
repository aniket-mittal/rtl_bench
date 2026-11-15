module rtlpp_06877(
  input         clk, reset,
  input  [7:0] n_in,
  input  [5:0] d_in,
  output reg [5:0] r_out,
  output reg [7:0] q_out);

  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11; 

  reg [3:0] count;
  reg [1:0] s;          
  reg [13:0] d;        
  reg signed [13:0] r; 
  reg [7:0] q;

  always @(posedge clk or posedge reset) 
  begin 
    if (reset)              
      s <= s0;
    else
      case (s) 
        s0 : begin         
          s <= s1;
          count <= 0;
          q <= 0;           
          d <= d_in << 7;   
          r <= n_in;        
        end                                           
        s1 : begin         
          r <= r - d;      
          s <= s2;
        end
        s2 : begin          
          if (r < 0) begin  
            r <= r + d;     
            q <= q << 1;     
          end
          else
            q <= (q << 1) + 1; 
          count <= count + 1;
          d <= d >> 1;

          if (count == 8)   
            s <= s3;
          else             
            s <= s1;
        end
        s3 : begin       
          q_out <= q[7:0]; 
          r_out <= r[5:0]; 
          s <= s0;   
        end
      endcase  
  end

endmodule