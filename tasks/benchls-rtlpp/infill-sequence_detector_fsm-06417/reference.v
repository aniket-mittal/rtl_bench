module rtlpp_06417(clk, rst, sequence_in, detected_out);
  input clk, rst, sequence_in;
  output reg detected_out;
  
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  reg [2:0] curr_state, next_state;
  
  always @(posedge clk or posedge rst) begin
    if (rst)
      curr_state <= S0;
    else
      curr_state <= next_state;
  end
  
  always @(curr_state or sequence_in) begin
    case (curr_state)
      S0: begin
        if (sequence_in == 1'b0)
          next_state = S0;
        else
          next_state = S1;
      end
      S1: begin
        if (sequence_in == 1'b0)
          next_state = S1;
        else
          next_state = S2;
      end
      S2: begin
        if (sequence_in == 1'b0)
          next_state = S0;
        else
          next_state = S3;
      end
      S3: begin
        if (sequence_in == 1'b0)
          next_state = S2;
        else
          next_state = S4;
      end
      S4: begin
        if (sequence_in == 1'b0)
          next_state = S2;
        else
          next_state = S1;
      end
      default: next_state = S0;
    endcase
  end
  
  always @(curr_state) begin
    case (curr_state)
      S0: detected_out = 0;
      S1: detected_out = 0;
      S2: detected_out = 0;
      S3: detected_out = 0;
      S4: detected_out = 1;
      default: detected_out = 0;
    endcase
  end
endmodule