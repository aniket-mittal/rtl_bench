module rtlpp_01537
(
       i_clk,
       i_rst_n,
       
       iv_descriptor,
       i_descriptor_wr,

       ov_tsn_descriptor,
       o_tsn_descriptor_wr,

       ov_standard_descriptor,
       o_standard_descriptor_wr
);

input                  i_clk;                   
input                  i_rst_n;

input      [71:0]      iv_descriptor;
input                  i_descriptor_wr;

output reg [45:0]      ov_tsn_descriptor;
output reg             o_tsn_descriptor_wr;

output reg [70:0]      ov_standard_descriptor;
output reg             o_standard_descriptor_wr;

[MASKED]
endmodule