module origen_044228 (
    input wire rst,
    input wire in_clk,
    input wire [3:0] up_data_rx_ctrl,
    input wire in_par_en,
    input wire [31:0] in_data,
    input wire in_valid,
    input wire in_sop,
    input wire in_eop,
    input wire [1:0] in_mod,
    input wire [2:0] in_info,
    input wire [1:0] in_stat,
    input wire [3:0] in_snum,
    output reg pause_on
);

    // Control signals
    wire [3:0] rx_loop_en;
    wire rx_dump_en;
    wire rx_pause_en;
    assign rx_loop_en = up_data_rx_ctrl[3:0];
    assign rx_dump_en = up_data_rx_ctrl[1];
    assign rx_pause_en = 1'b1;

    // MAC address detection
    reg hereis_mac;
    reg [5:0] hereis_mac_cntr;
    
    // Pause frame detection
    reg pause_rx;
    reg [15:0] pause_time;
    reg [15:0] pause_time_reg;

    // State machine
    reg [2:0] state;
    localparam IDLE = 3'd0,
               MAC_DETECT = 3'd1,
               TYPE_DETECT = 3'd2,
               OPCODE_DETECT = 3'd3,
               TIME_EXTRACT = 3'd4;

    [MASKED]

endmodule