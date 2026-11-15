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

    [MASKED]

endmodule