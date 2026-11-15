module origen_173304 #(
    parameter CLKS_PER_BIT = 115     // Clocks per bit. 
                                    // For 115200 baud,
                                    // 50M clock, 115 clks per bit
) (
    input        i_Clock,
    input        i_RX_Serial,
    output       o_RX_DV,
    output [7:0] o_RX_Byte
);

    // States
    localparam IDLE         = 3'b000;
    localparam RX_START_BIT = 3'b001;
    localparam RX_DATA_BITS = 3'b010;
    localparam RX_STOP_BIT  = 3'b011;
    localparam CLEANUP      = 3'b100;
    
    reg [2:0] r_SM_Main = 0;
    reg [7:0] r_RX_Byte = 0;
    reg       r_RX_DV = 0;
    reg [4:0] r_Bit_Index = 0;
    reg [12:0] r_Clock_Count = 0;

    [MASKED]

    assign o_RX_DV = r_RX_DV;
    assign o_RX_Byte = r_RX_Byte;

endmodule