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

    always @(*) begin
        case (wr_port_select)
            16'h0001: begin
                muxed_port_wr_en = port0_wr_en;
                muxed_port_wr_addr = port0_wr_addr;
                muxed_port_wr_data = port0_wr_data;
                muxed_port_wr_mask = port0_wr_mask;
            end
            16'h0002: begin
                muxed_port_wr_en = port1_wr_en;
                muxed_port_wr_addr = port1_wr_addr;
                muxed_port_wr_data = port1_wr_data;
                muxed_port_wr_mask = port1_wr_mask;
            end
            16'h0004: begin
                muxed_port_wr_en = port2_wr_en;
                muxed_port_wr_addr = port2_wr_addr;
                muxed_port_wr_data = port2_wr_data;
                muxed_port_wr_mask = port2_wr_mask;
            end
            16'h0008: begin
                muxed_port_wr_en = port3_wr_en;
                muxed_port_wr_addr = port3_wr_addr;
                muxed_port_wr_data = port3_wr_data;
                muxed_port_wr_mask = port3_wr_mask;
            end
            16'h0010: begin
                muxed_port_wr_en = port4_wr_en;
                muxed_port_wr_addr = port4_wr_addr;
                muxed_port_wr_data = port4_wr_data;
                muxed_port_wr_mask = port4_wr_mask;
            end
            16'h0020: begin
                muxed_port_wr_en = port5_wr_en;
                muxed_port_wr_addr = port5_wr_addr;
                muxed_port_wr_data = port5_wr_data;
                muxed_port_wr_mask = port5_wr_mask;
            end
            16'h0040: begin
                muxed_port_wr_en = port6_wr_en;
                muxed_port_wr_addr = port6_wr_addr;
                muxed_port_wr_data = port6_wr_data;
                muxed_port_wr_mask = port6_wr_mask;
            end
            16'h0080: begin
                muxed_port_wr_en = port7_wr_en;
                muxed_port_wr_addr = port7_wr_addr;
                muxed_port_wr_data = port7_wr_data;
                muxed_port_wr_mask = port7_wr_mask;
            end
            16'h0100: begin
                muxed_port_wr_en = port8_wr_en;
                muxed_port_wr_addr = port8_wr_addr;
                muxed_port_wr_data = port8_wr_data;
                muxed_port_wr_mask = port8_wr_mask;
            end
            16'h0200: begin
                muxed_port_wr_en = port9_wr_en;
                muxed_port_wr_addr = port9_wr_addr;
                muxed_port_wr_data = port9_wr_data;
                muxed_port_wr_mask = port9_wr_mask;
            end
            default: begin
                muxed_port_wr_en = 1'b0;
                muxed_port_wr_addr = 32'h0;
                muxed_port_wr_data = 512'h0;
                muxed_port_wr_mask = 64'h0;
            end
        endcase
    end

endmodule