module NV_NVDLA_CSB_MASTER_csb2falcon_fifo_gray_cntr (
      clk
    , reset_
    , inc
    , gray
    );

input			clk;
input			reset_;
input 			inc;
output [1:0]		gray;

reg    [1:0]		gray;   // gray counter


wire			polarity;  // polarity of gray counter bits

assign polarity = gray[0] ^ gray[1];

  [MASKED]

endmodule