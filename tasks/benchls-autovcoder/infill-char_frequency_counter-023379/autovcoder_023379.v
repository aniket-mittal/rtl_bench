module autovcoder_023379 (
    CLK,
    nRST,
    CHARACTER_IN,
    FREQUENT_OUT
);
  input CLK;
  input nRST;
  input [27:0] CHARACTER_IN;
  output [15:0] FREQUENT_OUT;

  reg [ 3:0] temp_frequent1;
  reg [ 3:0] temp_frequent2;
  reg [ 3:0] temp_frequent3;
  reg [ 3:0] temp_frequent4;

  reg [ 3:0] temp_character;
  reg [11:0] clk_counter;

  [MASKED]
  assign FREQUENT_OUT[15:0] = {temp_frequent4, temp_frequent3, temp_frequent2, temp_frequent1};

endmodule

