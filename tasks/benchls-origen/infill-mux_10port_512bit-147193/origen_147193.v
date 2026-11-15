module origen_147193 (
    input [15:0] wr_port_select,
    
    input port0_wr_en,
    input [31:0] port0_wr_addr,
    input [511:0] port0_wr_data,
    input [63:0] port0_wr_mask,
    
    input port1_wr_en,
    input [31:0] port1_wr_addr,
    input [511:0] port1_wr_data,
    input [63:0] port1_wr_mask,
    
    input port2_wr_en,
    input [31:0] port2_wr_addr,
    input [511:0] port2_wr_data,
    input [63:0] port2_wr_mask,
    
    input port3_wr_en,
    input [31:0] port3_wr_addr,
    input [511:0] port3_wr_data,
    input [63:0] port3_wr_mask,
    
    input port4_wr_en,
    input [31:0] port4_wr_addr,
    input [511:0] port4_wr_data,
    input [63:0] port4_wr_mask,
    
    input port5_wr_en,
    input [31:0] port5_wr_addr,
    input [511:0] port5_wr_data,
    input [63:0] port5_wr_mask,
    
    input port6_wr_en,
    input [31:0] port6_wr_addr,
    input [511:0] port6_wr_data,
    input [63:0] port6_wr_mask,
    
    input port7_wr_en,
    input [31:0] port7_wr_addr,
    input [511:0] port7_wr_data,
    input [63:0] port7_wr_mask,
    
    input port8_wr_en,
    input [31:0] port8_wr_addr,
    input [511:0] port8_wr_data,
    input [63:0] port8_wr_mask,
    
    input port9_wr_en,
    input [31:0] port9_wr_addr,
    input [511:0] port9_wr_data,
    input [63:0] port9_wr_mask,
    
    output reg muxed_port_wr_en,
    output reg [31:0] muxed_port_wr_addr,
    output reg [511:0] muxed_port_wr_data,
    output reg [63:0] muxed_port_wr_mask
);

    [MASKED]

endmodule