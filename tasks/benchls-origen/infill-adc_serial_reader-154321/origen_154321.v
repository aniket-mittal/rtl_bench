module origen_154321 #(
    parameter ADC_CLKS_PER_BIT = 10
)(
    input i_ADC_Data_Serial,
    input i_ADC_Data_Requested,
    output reg o_ADC_Data_Valid,
    output reg [11:0] o_ADC_Data,
    output reg o_ADC_Chip_Select_Not,
    output reg o_ADC_Data_Last,
    output reg o_ADC_Clock,
    input clk,
    input reset_n
);

    // Internal Registers
    reg [3:0] r_State;
    reg [4:0] r_Clock_Count;
    reg [3:0] r_Bit_Index;
    reg [15:0] r_ADC_Data;
    reg r_ADC_Data_Valid;
    reg r_ADC_Chip_Select_Not;
    reg r_ADC_Clock;
    reg [4:0] r_Delay_Clock_Count;

    // State Definitions
    localparam IDLE = 4'b0001;
    localparam ADC_CONVERSION_DELAY = 4'b0010;
    localparam READ_DATA_BITS = 4'b0100;
    localparam CLEANUP = 4'b1000;

    [MASKED]

endmodule