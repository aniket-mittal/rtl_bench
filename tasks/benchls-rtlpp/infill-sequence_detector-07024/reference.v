module rtlpp_07024(clk, rst, sequence_in, detected_out);
  input clk, rst, sequence_in;
  output reg detected_out;
  reg [2:0] curr_state, next_state;
  
  // State definitions
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  // State register
  always @(posedge clk or posedge rst) begin
    if (rst)
      curr_state <= S0;
    else
      curr_state <= next_state;
  end
  
  // Next state logic
  always @(curr_state or sequence_in) begin
    case (curr_state)
      S0: 
        if (sequence_in)
          next_state <= S1;
        else
          next_state <= S0;
      S1: 
        if (sequence_in)
          next_state <= S2;
        else
          next_state <= S1;
      S2: 
        if (sequence_in)
          next_state <= S3;
        else
          next_state <= S0;
      S3: 
        if (sequence_in)
          next_state <= S4;
        else
          next_state <= S2;
      S4: 
        if (sequence_in)
          next_state <= S1;
        else
          next_state <= S2;
      default: 
        next_state <= S0;
    endcase
  end
  
  // Output logic
  always @(curr_state) begin
    case (curr_state)
      S0, S1, S2, S3: 
        detected_out <= 0;
      S4: 
        detected_out <= 1;
      default: 
        detected_out <= 0;
    endcase
  end
endmodule