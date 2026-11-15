module rtlpp_07023               
  (input clk,                
   input reset,              
   input  [7:0] n_in,        
   input  [5:0] d_in,        
   output reg [5:0] r_out,   
   output reg [7:0] q_out);  

  reg [1:0] state;           
  parameter ini=2'b00, sub=2'b01, restore=2'b10, done=2'b11; 
                                             
  
  always @(posedge clk or posedge reset) 
  begin : States 
    reg [3:0] count;

    reg  [13:0] d;        
    reg  signed [13:0] r; 
    reg  [7:0] q;

    if (reset) begin              
      state <= ini; count <= 4'b0000; 
      q <= 8'b00000000; r <= 14'sb0; d <= 14'b0; q_out <= 8'b0; r_out <= 6'b0;
    end else
      case (state) 
        ini : begin         
          state <= sub;
          count = 4'b0000;
          q <= 8'b0;           
          d <= d_in << 7;   
          r <= n_in;        
        end                                           
        sub : begin         
          r <= r - d;      
          state <= restore;
        end
        restore : begin          
          if (r < 0) begin  
            r <= r + d;     
            q <= q << 1;     
            end
          else
            q <= (q << 1) + 1; 
          count = count + 4'b0001;
          d <= d >> 1;

          if (count == 4'b1000)   
            state <= done;
          else             
            state <= sub;
        end
        done : begin       
          q_out <= q[7:0]; 
          r_out <= r[5:0]; 
          state <= ini;   
        end
      endcase  
  end

endmodule