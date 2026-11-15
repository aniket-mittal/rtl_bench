module rtlpp_01905(
    input         clk_i,		
    input  [6:0]  saddr_i,	
    input  [31:0] sdata_i,	
    input 	 s_strobe_i,    
    output        tx_side_o,     
    output        tx_strobe_o,	
    output [13:0] tx_dac_i_o,	
    output [13:0] tx_dac_q_o,    
    output        io_tx_ena_o,   
    input  [15:0] rx_adc_i_i,	
    input  [15:0] rx_adc_q_i,	
    output 	 rx_strobe_o,	
    output [15:0] rx_ech_i_o,	
    output [15:0] rx_ech_q_o	 
);

    wire reset;		
    wire tx_side;	
    wire debug_enabled; 
    wire tx_enable;     
    wire rx_enable;     
    wire tx_ctrl;       
    wire rx_ctrl;       
    wire [15:0] pulse_num;     
    wire [15:0] ampl;		
    wire [31:0] fstart;	
    wire [31:0] fincr;         

    // Radar control logic
    assign reset = s_strobe_i & sdata_i[0];
    assign tx_side_o = saddr_i[6];
    assign debug_enabled = sdata_i[31];
    assign tx_strobe_o = s_strobe_i;
    assign tx_ctrl = saddr_i[5];
    assign rx_ctrl = saddr_i[4];
    assign ampl = sdata_i[15:0];
    assign fstart = sdata_i;
    assign fincr = sdata_i;
    assign pulse_num = sdata_i[15:0];
    assign io_tx_ena_o = s_strobe_i & saddr_i[3];

    // Radar transmit logic
    wire [13:0] tx_i_internal, tx_q_internal;
    assign tx_dac_i_o = tx_ctrl ? tx_i_internal : 14'b0;
    assign tx_dac_q_o = tx_ctrl ? tx_q_internal : 14'b0;
    assign tx_i_internal = ampl[13:0];
    assign tx_q_internal = ampl[13:0];

    // Radar receive logic
    wire [15:0] rx_i_internal, rx_q_internal;
    assign rx_strobe_o = rx_ctrl & debug_enabled;
    assign rx_ech_i_o = rx_ctrl ? rx_adc_i_i : 16'b0;
    assign rx_ech_q_o = rx_ctrl ? rx_adc_q_i : 16'b0;
    
endmodule