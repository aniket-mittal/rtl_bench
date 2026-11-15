module rtlpp_09734              
 (input clk,                  
  input reset,                
  input signed  [3:0]  x0_in, 
  input signed  [3:0]  x1_in, 
  input signed  [3:0]  x2_in, 
  output [3:0]  lut,          
  output reg signed [6:0]  y);

  reg  signed  [3:0] x0, x1, x2;
  wire signed  [2:0] table_in;
  reg signed  [3:0] table_out;
  reg [0:0] state;

  assign table_in[0] = x0[0];
  assign table_in[1] = x1[0];
  assign table_in[2] = x2[0];

  always @(posedge clk or posedge reset)
  begin
    parameter s0=0, s1=1;
    integer k;
    reg [2:0] count;           
    reg [6:0] p;               
    
    if (reset) begin               
      state <= s0;
      x0 <= 0; x1 <= 0; x2 <= 0; p <= 0; y <= 0;
      count <= 0;
    end else
      case (state) 
        s0 : begin             
          state <= s1;
          count = 0;
          p  <= 0;           
          x0 <= x0_in;
          x1 <= x1_in;
          x2 <= x2_in;
        end
        s1 : begin             
          if (count == 4) begin
            y <= p;            
            state <= s0;       
          end else begin 
            if (count == 3)   
              p <= (p >>> 1) - (table_out <<< 3);  
            else          
              p <= (p >>> 1) + (table_out <<< 3);
            for (k=0; k<=2; k= k+1) begin     
              x0[k] <= x0[k+1];
              x1[k] <= x1[k+1];
              x2[k] <= x2[k+1];
            end
            count = count + 1;
            state <= s1;
          end
        end
      endcase  
  end

  always @(*) begin
    case (table_in)
      3'b000: table_out = 4'b0000;
      3'b001: table_out = 4'b0001;
      3'b010: table_out = 4'b0010;
      3'b011: table_out = 4'b0011;
      3'b100: table_out = 4'b0100;
      3'b101: table_out = 4'b0101;
      3'b110: table_out = 4'b0110;
      3'b111: table_out = 4'b0111;
      default: table_out = 4'b0000;
    endcase
  end

  assign lut = table_out;

endmodule