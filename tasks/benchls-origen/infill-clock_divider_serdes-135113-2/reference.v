`timescale 1ns / 1ps

module origen_135113 #(
    parameter SERDES_FACTOR = 4,
    parameter DIFF_TERM = "TRUE"
) (
    input wire clkin_p,
    input wire clkin_n,
    input wire reset,
    output wire rxioclk,
    output wire rx_serdesstrobe,
    output wire rx_bufg_x1
);

    // Internal signals
    wire clkin_ibufg;
    wire clkin_delayed;
    wire clkin_bufio;

    // Differential Input Buffer
    assign clkin_ibufg = clkin_p - clkin_n;

    // Input Delay
    reg [4:0] delay_value = 5'd0;
    always @(posedge clkin_ibufg or posedge reset) begin
        if (reset)
            delay_value <= 5'd0;
        else
            delay_value <= delay_value + 1;
    end
    assign #(delay_value) clkin_delayed = clkin_ibufg;

    // IO Clock Buffer
    assign rxioclk = clkin_delayed;

    // Regional Clock Buffer
    reg [SERDES_FACTOR-1:0] div_counter = 0;
    always @(posedge clkin_delayed or posedge reset) begin
        if (reset)
            div_counter <= 0;
        else
            div_counter <= {div_counter[SERDES_FACTOR-2:0], ~div_counter[SERDES_FACTOR-1]};
    end
    assign clkin_bufio = (SERDES_FACTOR == 1) ? clkin_delayed : div_counter[SERDES_FACTOR-1];

    // Global Clock Buffer
    assign rx_bufg_x1 = clkin_bufio;

    // Generate rx_serdesstrobe
    reg [SERDES_FACTOR-1:0] serdes_counter = 0;
    always @(posedge rxioclk or posedge reset) begin
        if (reset)
            serdes_counter <= 0;
        else
            serdes_counter <= {serdes_counter[SERDES_FACTOR-2:0], serdes_counter[SERDES_FACTOR-1]};
    end

    assign rx_serdesstrobe = serdes_counter[SERDES_FACTOR-1];

endmodule