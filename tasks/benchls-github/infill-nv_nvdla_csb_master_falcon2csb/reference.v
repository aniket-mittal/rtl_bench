module NV_NVDLA_CSB_MASTER_falcon2csb_fifo_gray_cntr_strict (
`ifdef NV_FPGA_FIFOGEN
      inc ,
`endif
      gray
    , gray_next
    );

`ifdef NV_FPGA_FIFOGEN
input 			inc;
`endif
input  [2:0]		gray;
output [2:0]                gray_next;


wire			polarity;  // polarity of gray counter bits

assign polarity = gray[0] ^ gray[1] ^ gray[2];

assign gray_next = 
`ifdef NV_FPGA_FIFOGEN
 (~inc) ? gray : 
`endif 
                         { gray[2]^(polarity           &~gray[0]),
                         gray[1]^(polarity&gray[0]),
                         gray[0]^(~polarity) };

endmodule