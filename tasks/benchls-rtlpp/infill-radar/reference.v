module radar_control (input clk_i, input [6:0] saddr_i, input [31:0] sdata_i, input s_strobe_i,
                      output reg reset_o, output reg tx_side_o, output reg dbg_o,
                      output reg tx_strobe_o, output reg tx_ctrl_o, output reg rx_ctrl_o,
                      output reg [15:0] ampl_o, output reg [31:0] fstart_o,
                      output reg [31:0] fincr_o, output reg [15:0] pulse_num_o,
                      output reg io_tx_ena_o);
    // Internal logic of radar_control
    // Populate with the actual code
endmodule

module radar_rx(
    input         clk_i,
    input         rst_i,
    input         ena_i,
    input         dbg_i,
    input  [15:0] pulse_num_i,
    input  [15:0] rx_in_i_i,
    input  [15:0] rx_in_q_i,
    output        rx_strobe_o,
    output [15:0] rx_i_o,
    output [15:0] rx_q_o
);

    assign rx_strobe_o = 1'b0;
    assign rx_i_o = 16'b0;
    assign rx_q_o = 16'b0;

endmodule

module radar_tx(
    input         clk_i,
    input         rst_i,
    input         ena_i,
    input         strobe_i,
    input  [15:0] ampl_i,
    input  [31:0] fstart_i,
    input  [31:0] fincr_i,
    output [13:0] tx_i_o,
    output [13:0] tx_q_o
);

    assign tx_i_o = 14'b0;
    assign tx_q_o = 14'b0;

endmodule

module radar(
    input         clk_i,       
    input  [6:0]  saddr_i,  
    input  [31:0] sdata_i, 
    input         s_strobe_i,    
    output        tx_side_o,     
    output        tx_strobe_o,   
    output [13:0] tx_dac_i_o,    
    output [13:0] tx_dac_q_o,    
    output        io_tx_ena_o,   
    input  [15:0] rx_adc_i_i,    
    input  [15:0] rx_adc_q_i,    
    output        rx_strobe_o,   
    output [15:0] rx_ech_i_o,    
    output [15:0] rx_ech_q_o
);

    wire reset;     
    wire tx_side;   
    wire debug_enabled; 
    wire tx_ctrl;     
    wire rx_ctrl;     
    wire [15:0] pulse_num;   

    wire [15:0] ampl;   
    wire [31:0] fstart; 
    wire [31:0] fincr;  

    radar_control controller (
        .clk_i(clk_i), .saddr_i(saddr_i), .sdata_i(sdata_i), .s_strobe_i(s_strobe_i),
        .reset_o(reset), .tx_side_o(tx_side_o), .dbg_o(debug_enabled),
        .tx_strobe_o(tx_strobe_o), .tx_ctrl_o(tx_ctrl), .rx_ctrl_o(rx_ctrl),
        .ampl_o(ampl), .fstart_o(fstart), .fincr_o(fincr), .pulse_num_o(pulse_num),
        .io_tx_ena_o(io_tx_ena_o)
    );

    radar_tx transmitter (
        .clk_i(clk_i), .rst_i(reset), .ena_i(tx_ctrl), .strobe_i(tx_strobe_o),
        .ampl_i(ampl), .fstart_i(fstart), .fincr_i(fincr),
        .tx_i_o(tx_dac_i_o), .tx_q_o(tx_dac_q_o)
    );

    radar_rx receiver (
        .clk_i(clk_i), .rst_i(reset), .ena_i(rx_ctrl), .dbg_i(debug_enabled),
        .pulse_num_i(pulse_num), .rx_in_i_i(rx_adc_i_i), .rx_in_q_i(rx_adc_q_i),
        .rx_strobe_o(rx_strobe_o), .rx_i_o(rx_ech_i_o), .rx_q_o(rx_ech_q_o)
    );

endmodule