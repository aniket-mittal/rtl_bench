module rtlpp_01172
(
    Bus2IP_Clk,                     
    Bus2IP_Reset,                   
    Bus2IP_Data,                    
    Bus2IP_BE,                      
    Bus2IP_RdCE,                    
    Bus2IP_WrCE,                    
    IP2Bus_Data,                    
    IP2Bus_RdAck,                   
    IP2Bus_WrAck,                   
    IP2Bus_Error                    
); 

parameter C_SLV_DWIDTH = 32;
parameter C_NUM_REG = 8;

input Bus2IP_Clk;
input Bus2IP_Reset;
input [C_SLV_DWIDTH-1:0] Bus2IP_Data;
input [C_SLV_DWIDTH/8-1:0] Bus2IP_BE;
input [C_NUM_REG-1:0] Bus2IP_RdCE;
input [C_NUM_REG-1:0] Bus2IP_WrCE;
output [C_SLV_DWIDTH-1:0] IP2Bus_Data;
output IP2Bus_RdAck;
output IP2Bus_WrAck;
output IP2Bus_Error;

reg [C_SLV_DWIDTH-1:0] slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7;
wire [7:0] slv_reg_write_sel;
wire [7:0] slv_reg_read_sel;
reg [C_SLV_DWIDTH-1:0] slv_ip2bus_data;
wire slv_read_ack;
wire slv_write_ack;
integer byte_index, bit_index;

assign slv_reg_write_sel = Bus2IP_WrCE[7:0];
assign slv_reg_read_sel = Bus2IP_RdCE[7:0];
assign slv_write_ack = |Bus2IP_WrCE;
assign slv_read_ack = |Bus2IP_RdCE;

always @(posedge Bus2IP_Clk)
begin: SLAVE_REG_WRITE_PROC
    if (Bus2IP_Reset == 1) begin
        slv_reg0 <= 0;
        slv_reg1 <= 0;
        slv_reg2 <= 0;
        slv_reg3 <= 0;
        slv_reg4 <= 0;
        slv_reg5 <= 0;
        slv_reg6 <= 0;
        slv_reg7 <= 0;
    end else begin
        case (slv_reg_write_sel)
            8'b10000000: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg0[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b01000000: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg1[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00100000: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg2[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00010000: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg3[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00001000: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg4[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00000100: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg5[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00000010: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg6[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            8'b00000001: begin
                for (byte_index = 0; byte_index < C_SLV_DWIDTH/8; byte_index = byte_index+1) begin
                    if (Bus2IP_BE[byte_index]) begin
                        for (bit_index = byte_index*8; bit_index < (byte_index*8+8); bit_index = bit_index+1)
                            slv_reg7[bit_index] <= Bus2IP_Data[bit_index];
                    end
                end
            end
            default: ;
        endcase
    end
end 

always @(slv_reg_read_sel or slv_reg0 or slv_reg1 or slv_reg2 or slv_reg3 or slv_reg4 or slv_reg5 or slv_reg6 or slv_reg7)
begin: SLAVE_REG_READ_PROC
    case (slv_reg_read_sel)
        8'b10000000: slv_ip2bus_data <= slv_reg0;
        8'b01000000: slv_ip2bus_data <= slv_reg1;
        8'b00100000: slv_ip2bus_data <= slv_reg2;
        8'b00010000: slv_ip2bus_data <= slv_reg3;
        8'b00001000: slv_ip2bus_data <= slv_reg4;
        8'b00000100: slv_ip2bus_data <= slv_reg5;
        8'b00000010: slv_ip2bus_data <= slv_reg6;
        8'b00000001: slv_ip2bus_data <= slv_reg7;
        default: slv_ip2bus_data <= 0;
    endcase
end 

assign IP2Bus_Data = slv_ip2bus_data;
assign IP2Bus_WrAck = slv_write_ack;
assign IP2Bus_RdAck = slv_read_ack;
assign IP2Bus_Error = 0;

endmodule