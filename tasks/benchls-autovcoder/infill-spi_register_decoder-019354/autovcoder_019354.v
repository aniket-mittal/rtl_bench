module autovcoder_019354 (
    isData,
    SPI_data,
    N,
    CMD1,
    CMD2,
    Eth_I_max,
    Eth_I_min,
    Eth_Temp_max,
    Eth_I_work,
    Eth_kor,
    Eth_Imp_time,
    Eth_Start,
    Eth_Full_stop,
    Eth_Calibr,
    Eth_Ch_num
);

  input isData;
  input [15:0] SPI_data;
  input [7:0] N;

  output reg [15:0] CMD1;
  output reg [15:0] CMD2;
  output reg  [15:0] Eth_I_max, Eth_I_min, Eth_Temp_max, Eth_I_work, Eth_kor, Eth_Imp_time, Eth_Start, Eth_Full_stop, Eth_Calibr, Eth_Ch_num;
  /*output reg  [15:0] Eth_A;
output reg  [15:0] Eth_T1;
output reg  [15:0] Eth_T2;
output reg  [15:0] Eth_T3;
output reg  [15:0] Eth_T4;
output reg  [15:0] Eth_ref;*/

  [MASKED]
endmodule

