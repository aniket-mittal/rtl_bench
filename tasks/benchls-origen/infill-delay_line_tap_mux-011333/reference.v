`timescale 1ps / 1ps

module origen_011333 #(
    parameter DELAY_OFFSET = "OFF",
    parameter IOSTANDARD = "DEFAULT"
) (
    input I,
    input [2:0] S,
    output reg O
);

    localparam SIM_TAPDELAY_VALUE = 200;
    localparam SPECTRUM_OFFSET_DELAY = 1600;
    
    reg [7:0] delay_chain;
    integer INITIAL_DELAY;

    initial begin
        if (DELAY_OFFSET == "ON")
            INITIAL_DELAY = SIM_TAPDELAY_VALUE + SPECTRUM_OFFSET_DELAY;
        else if (DELAY_OFFSET == "OFF")
            INITIAL_DELAY = SIM_TAPDELAY_VALUE;
        else begin
            $display("Error: Invalid DELAY_OFFSET value");
            ;
        end
    end

    always @(*) begin
        delay_chain[0] = #(INITIAL_DELAY) I;
        delay_chain[1] = #(SIM_TAPDELAY_VALUE) delay_chain[0];
        delay_chain[2] = #(SIM_TAPDELAY_VALUE) delay_chain[1];
        delay_chain[3] = #(SIM_TAPDELAY_VALUE) delay_chain[2];
        delay_chain[4] = #(SIM_TAPDELAY_VALUE) delay_chain[3];
        delay_chain[5] = #(SIM_TAPDELAY_VALUE) delay_chain[4];
        delay_chain[6] = #(SIM_TAPDELAY_VALUE) delay_chain[5];
        delay_chain[7] = #(SIM_TAPDELAY_VALUE) delay_chain[6];
    end

    always @(*) begin
        case(S)
            3'd0: O = delay_chain[0];
            3'd1: O = delay_chain[1];
            3'd2: O = delay_chain[2];
            3'd3: O = delay_chain[3];
            3'd4: O = delay_chain[4];
            3'd5: O = delay_chain[5];
            3'd6: O = delay_chain[6];
            3'd7: O = delay_chain[7];
            default: O = delay_chain[0];
        endcase
    end

endmodule