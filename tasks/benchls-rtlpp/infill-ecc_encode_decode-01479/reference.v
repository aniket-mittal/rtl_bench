module rtlpp_01479 
    (
        CLK_3M,
        ENCODE_DATA,
        DECODE_DATA,
        ENCODE_READ_EN,
        DECODE_CLK_3M,
        DECODE_WRITE_EN,
        FSL_Clk,
        FSL_Rst,
        FSL_S_Clk,
        FSL_S_Read,
        FSL_S_Data,
        FSL_S_Control,
        FSL_S_Exists,
        FSL_M_Clk,
        FSL_M_Write,
        FSL_M_Data,
        FSL_M_Control,
        FSL_M_Full
    );

input                                          CLK_3M;
output     [31:0]                              ENCODE_DATA;
input      [31:0]                              DECODE_DATA;
input                                          ENCODE_READ_EN;
input                                          DECODE_WRITE_EN;
input                                          DECODE_CLK_3M;

input                                          FSL_Clk;
input                                          FSL_Rst;
output                                         FSL_S_Clk;
output                                         FSL_S_Read;
input      [31:0]                              FSL_S_Data;
output                                         FSL_S_Control;
input                                          FSL_S_Exists;
output                                         FSL_M_Clk;
output                                         FSL_M_Write;
output     [31:0]                              FSL_M_Data;
output                                         FSL_M_Control;
input                                          FSL_M_Full;

localparam                                     NUMBER_OF_INPUT_WORDS  = 16;
localparam                                     NUMBER_OF_OUTPUT_WORDS = 16;

localparam                                     Idle                  = 3'b100;
localparam                                     Read_Inputs           = 3'b010;
localparam                                     Write_Outputs         = 3'b001;

reg         [2:0]                              state;
reg         [31:0]                             sum;
reg         [NUMBER_OF_INPUT_WORDS-1:0]        nr_of_reads;
reg         [NUMBER_OF_OUTPUT_WORDS-1:0]       nr_of_writes;

assign FSL_S_Clk      = CLK_3M;
assign FSL_S_Read     = ENCODE_READ_EN;
assign ENCODE_DATA    = FSL_S_Data;
assign FSL_S_Control  = 1'b1;

assign FSL_M_Clk      = DECODE_CLK_3M;
assign FSL_M_Write    = DECODE_WRITE_EN;
assign FSL_M_Data     = DECODE_DATA;
assign FSL_M_Control  = 1'b1;

endmodule