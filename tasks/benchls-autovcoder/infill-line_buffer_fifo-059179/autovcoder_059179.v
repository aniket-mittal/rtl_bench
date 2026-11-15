module autovcoder_059179 #(
    parameter
    ///////////advanced parameters//////////
    DATA_WIDTH = 32,
    ///////////architecture parameters//////
    IFM_SIZE = 26,
    KERNAL_SIZE = 2,
    ///////////generated parameters/////////
    FIFO_SIZE = (KERNAL_SIZE - 1) * IFM_SIZE + KERNAL_SIZE

) (
    input clk,
    input reset,
    input fifo_enable,
    input [DATA_WIDTH-1:0] fifo_data_in,
    input [DATA_WIDTH-1:0] fifo_data_in_2,
    output [DATA_WIDTH-1:0] fifo_data_out_1,
    output [DATA_WIDTH-1:0] fifo_data_out_2,
    output [DATA_WIDTH-1:0] fifo_data_out_3,
    output [DATA_WIDTH-1:0] fifo_data_out_4
);
  reg [DATA_WIDTH-1:0] FIFO[FIFO_SIZE-1:0];
  [MASKED]

  assign fifo_data_out_1 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-1)];
  assign fifo_data_out_2 = FIFO[(KERNAL_SIZE-1)*IFM_SIZE+(KERNAL_SIZE-2)];

  assign fifo_data_out_3 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-1)];
  assign fifo_data_out_4 = FIFO[(KERNAL_SIZE-2)*IFM_SIZE+(KERNAL_SIZE-2)];

endmodule

