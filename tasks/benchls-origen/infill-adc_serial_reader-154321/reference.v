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

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            r_State <= IDLE;
            r_Clock_Count <= 0;
            r_Bit_Index <= 0;
            r_ADC_Data <= 0;
            r_ADC_Data_Valid <= 0;
            r_ADC_Chip_Select_Not <= 1;
            r_ADC_Clock <= 0;
            r_Delay_Clock_Count <= 0;
            o_ADC_Data_Valid <= 0;
            o_ADC_Data <= 0;
            o_ADC_Chip_Select_Not <= 1;
            o_ADC_Data_Last <= 0;
            o_ADC_Clock <= 0;
        end else begin
            case (r_State)
                IDLE: begin
                    if (i_ADC_Data_Requested) begin
                        r_State <= ADC_CONVERSION_DELAY;
                        r_ADC_Chip_Select_Not <= 0;
                    end
                end
                ADC_CONVERSION_DELAY: begin
                    if (r_Delay_Clock_Count == ADC_CLKS_PER_BIT - 1) begin
                        r_State <= READ_DATA_BITS;
                        r_Delay_Clock_Count <= 0;
                    end else begin
                        r_Delay_Clock_Count <= r_Delay_Clock_Count + 1;
                    end
                end
                READ_DATA_BITS: begin
                    if (r_Clock_Count == ADC_CLKS_PER_BIT - 1) begin
                        r_ADC_Data <= {r_ADC_Data[14:0], i_ADC_Data_Serial};
                        r_Bit_Index <= r_Bit_Index + 1;
                        r_Clock_Count <= 0;
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1;
                    end

                    if (r_Bit_Index == 15) begin
                        r_State <= CLEANUP;
                        r_ADC_Data_Valid <= 1;
                        o_ADC_Data <= r_ADC_Data[15:4];
                        o_ADC_Data_Valid <= 1;
                        o_ADC_Data_Last <= 1;
                    end
                end
                CLEANUP: begin
                    r_State <= IDLE;
                    r_ADC_Chip_Select_Not <= 1;
                    r_ADC_Data_Valid <= 0;
                    o_ADC_Data_Valid <= 0;
                    o_ADC_Data_Last <= 0;
                end
                default: begin
                    r_State <= IDLE;
                end
            endcase

            // Generate ADC Clock
            r_ADC_Clock <= r_Clock_Count[0];
            o_ADC_Clock <= r_ADC_Clock;
        end
    end

endmodule