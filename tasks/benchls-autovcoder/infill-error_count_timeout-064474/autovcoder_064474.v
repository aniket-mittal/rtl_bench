module autovcoder_064474 #(
    parameter clk_freq = 156250000,
    parameter timer = 1,
    parameter req_num = 256
) (
    input rst_in,
    input clk,

    input state,
    input start,

    output reg request

);


  reg [34:0] cnt;
  reg [ 9:0] err_cnt;


  //startΪ'1'£ָʱΣclk_freq*timerڣstatereq_numʱӵ'1'ʱrequestΪ'1'
  [MASKED]

endmodule

