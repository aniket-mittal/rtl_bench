module rtlpp_01446                     
 (input  clk,                     
  input reset,                    
  input  [7:0]  x_in,             
  output reg signed [10:0] y_real, 
  output reg signed [10:0] y_imag);

  reg signed [10:0] accu;               
 
  reg signed [18:0] im [0:5]; 
  reg signed [18:0] re [0:5];  
 
  reg signed [18:0] x57, x111, x160, x200, x231, x250; 
                                 
  reg signed [18:0] x5, x25, x110, x125, x256; 
                           
  reg signed [7:0] x, x_0;            
  reg [1:0] state; 
  reg [4:0] count; 
    
  always @(posedge clk or posedge reset)   
  begin : States                        
    parameter Start=0, Load=1, Run=2;

    if (reset) begin              
      state <= Start; accu <= 0;
      count <= 0; y_real <= 0; y_imag <= 0;       
    end else
      case (state) 
        Start : begin        
          state <= Load;
          count <= 1;
          x_0 <= x_in;       
          accu <= 0;        
          y_real  <= 0;
          y_imag  <= 0;
        end
        Load : begin 
          if (count == 8)     
            state <= Run;
          else begin
            state <= Load;
            accu <= accu + x;
          end
          count <= count + 1;
        end
        Run : begin 
          if (count == 15) begin 
            y_real  <= accu;       
            y_imag  <= 0;  
            count <= 0;        
            state <= Start;    
          end else begin
            y_real  <= (re[0] >>> 8) + x_0; 
            y_imag  <= (im[0] >>> 8);     
            state <= Run;
            count <= count + 1;
          end
        end
      endcase  
  end

  always @(posedge clk or posedge reset) 
  begin : Structure                     
    integer k;    
    if (reset) begin                  
      for (k=0; k<=5; k=k+1) begin
        re[k] <= 0; im[k] <= 0;   
      end
      x <= 0;
    end else begin
      x <= x_in;
    
      re[0] <= re[1] + x160;   
      re[1] <= re[2] - x231;   
      re[2] <= re[3] - x57;   
      re[3] <= re[4] + x160;   
      re[4] <= re[5] - x231;   
      re[5] <= -x57;             
    
      im[0] <= im[1] - x200;   
      im[1] <= im[2] - x111;   
      im[2] <= im[3] - x250;   
      im[3] <= im[4] + x200;   
      im[4] <= im[5] + x111;   
      im[5] <= x250;             
    end
  end

  always @(posedge clk or posedge reset) 
  begin : Coeffs            
    if (reset) begin       
      x160 <= 0; x200 <= 0; x250 <= 0;
      x57 <= 0; x111 <= 0; x231 <= 0;
    end else begin
      x160 <= x5 <<< 5;        
      x200 <= x25 <<< 3;       
      x250 <= x125 <<< 1;      
      x57  <= x25 + (x <<< 5); 
      x111 <= x110 + x;       
      x231 <= x256 - x25;     
    end
  end

  always @(*)                 
  begin : Factors           
    x5   = (x <<< 2) + x;  
    x25  = (x5 <<< 2) + x5;        
    x110 = (x25 <<< 2) + (x5 <<< 2);
    x125 = (x25 <<< 2) + x25;      
    x256 = x <<< 8;            
  end
endmodule