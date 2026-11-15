module rtlpp_11714 (
  
  input   wire          CLK_IN,
  input   wire          RESETn,

  
  output  wire          CLK_by_1,
  output  wire          CLK_by_1_EN,
  output  wire          CLK_by_2,
  output  wire          CLK_by_2_EN,
  output  wire          CLK_by_4,
  output  wire          CLK_by_4_EN,
  output  wire          CLK_by_8,
  output  wire          CLK_by_8_EN,
  output  wire          CLK_by_16,
  output  wire          CLK_by_16_EN,
  output  wire          CLK_by_32,
  output  wire          CLK_by_32_EN
);
  
  reg  [5:0] counter;
  
  always @(posedge CLK_IN or negedge RESETn) begin
    if (!RESETn)
      counter <= 6'b0;
    else
      counter <= counter + 1;
  end

  assign CLK_by_1 = CLK_IN;
  assign CLK_by_1_EN = 1'b1;
  assign CLK_by_2 = counter[0];
  assign CLK_by_2_EN = counter[0];
  assign CLK_by_4 = counter[1];
  assign CLK_by_4_EN = counter[1];
  assign CLK_by_8 = counter[2];
  assign CLK_by_8_EN = counter[2];
  assign CLK_by_16 = counter[3];
  assign CLK_by_16_EN = counter[3];
  assign CLK_by_32 = counter[4];
  assign CLK_by_32_EN = counter[4];
  
endmodule