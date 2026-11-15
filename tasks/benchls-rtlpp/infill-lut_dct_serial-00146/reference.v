module rtlpp_00146 (
  input         clk, reset,
  input  [2:0]  x_in0, x_in1, x_in2,
  output [2:0]  lut,
  output reg [5:0]  y
);

  reg    [2:0]  x0, x1, x2;
  reg    [2:0]  table_in;
  reg    [2:0]  table_out;

  reg [5:0] p;  
  wire ena;

  assign ena = 1; 

  assign table_in[0] = x0[0];
  assign table_in[1] = x1[0];
  assign table_in[2] = x2[0];

  always @(posedge clk or posedge reset) begin : DA                 
    reg [0:0] state;
    reg [1:0] count;

    parameter s0 = 0, s1 = 1;

    if (reset) begin
      state <= s0;
    end else begin
      case (state) 
        s0 : begin    
          state <= s1;
          count = 0;
          p  <= 0;           
          x0 <= x_in0;
          x1 <= x_in1;
          x2 <= x_in2;
        end
        s1 : begin                 
          if (count == 3) begin  
            y <= (p >> 1) + (table_out << 2);
            state <= s0;   
          end else begin
            p <= (p >> 1) + (table_out << 2);
            x0[0] <= x0[1];
            x0[1] <= x0[2];
            x1[0] <= x1[1];
            x1[1] <= x1[2];
            x2[0] <= x2[1];
            x2[1] <= x2[2];
            count = count + 1;
            state <= s1;
          end
        end
        default : ;
      endcase  
    end
  end

  // ROM Model
  always @(posedge clk) begin
    case (table_in)
      3'b000: table_out <= 3'b000;
      3'b001: table_out <= 3'b001;
      3'b010: table_out <= 3'b010;
      3'b011: table_out <= 3'b011;
      3'b100: table_out <= 3'b100;
      3'b101: table_out <= 3'b101;
      3'b110: table_out <= 3'b110;
      3'b111: table_out <= 3'b111;
      default: table_out <= 3'b000;
    endcase
  end

  assign lut = table_out; 

endmodule