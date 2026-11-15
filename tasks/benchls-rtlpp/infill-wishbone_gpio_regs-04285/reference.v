module rtlpp_04285 ( 
                         WBs_ADR_i,
                         WBs_CYC_i,
                         WBs_BYTE_STB_i,
                         WBs_WE_i,
                         WBs_STB_i,
                         WBs_DAT_i,
                         WBs_CLK_i,
                         WBs_RST_i,
                         WBs_DAT_o,
                         WBs_ACK_o,
						 CLK_4M_CNTL_o,
						 CLK_1M_CNTL_o,
                         Device_ID_o,
				         GPIO_IN_i,
				         GPIO_OUT_o,
				         GPIO_OE_o
                         );

parameter ADDRWIDTH = 7;   
parameter DATAWIDTH = 32;   

parameter FPGA_REG_ID_VALUE_ADR = 7'h0; 
parameter FPGA_REV_NUM_ADR = 7'h1; 
parameter FPGA_GPIO_IN_REG_ADR = 7'h2; 
parameter FPGA_GPIO_OUT_REG_ADR = 7'h3; 
parameter FPGA_GPIO_OE_REG_ADR = 7'h4; 

parameter AL4S3B_DEVICE_ID = 16'h0;
parameter AL4S3B_REV_LEVEL = 32'h0;
parameter AL4S3B_GPIO_REG = 8'h0;
parameter AL4S3B_GPIO_OE_REG = 8'h0;

parameter AL4S3B_DEF_REG_VALUE = 32'hFAB_DEF_AC;

input  [ADDRWIDTH-1:0] WBs_ADR_i;  
input                  WBs_CYC_i;  
input            [3:0] WBs_BYTE_STB_i;  
input                  WBs_WE_i;  
input                  WBs_STB_i;  
input  [DATAWIDTH-1:0] WBs_DAT_i;  
input                  WBs_CLK_i;  
input                  WBs_RST_i;  
output [DATAWIDTH-1:0] WBs_DAT_o;  
output                 WBs_ACK_o;  

output [31:0] Device_ID_o;
output        CLK_4M_CNTL_o;
output        CLK_1M_CNTL_o;

input  [7:0] GPIO_IN_i;
output [7:0] GPIO_OUT_o;
output [7:0] GPIO_OE_o;

reg  [DATAWIDTH-1:0] WBs_DAT_o;  
reg  WBs_ACK_o;  
reg  [7:0] GPIO_OUT_o;    
reg  [7:0] GPIO_OE_o;    

wire FB_GPIO_Reg_Wr_Dcd;
wire FB_GPIO_OE_Reg_Wr_Dcd;
wire WBs_ACK_o_nxt;

assign CLK_4M_CNTL_o = 1'b0;
assign CLK_1M_CNTL_o = 1'b0;

assign FB_GPIO_Reg_Wr_Dcd = (WBs_ADR_i == FPGA_GPIO_OUT_REG_ADR) & WBs_CYC_i & WBs_STB_i & WBs_WE_i & (~WBs_ACK_o);
assign FB_GPIO_OE_Reg_Wr_Dcd = (WBs_ADR_i == FPGA_GPIO_OE_REG_ADR) & WBs_CYC_i & WBs_STB_i & WBs_WE_i & (~WBs_ACK_o);

assign WBs_ACK_o_nxt = WBs_CYC_i & WBs_STB_i & (~WBs_ACK_o);

always @(posedge WBs_CLK_i or posedge WBs_RST_i) begin
    if (WBs_RST_i) begin
        GPIO_OUT_o <= AL4S3B_GPIO_REG;
        GPIO_OE_o <= AL4S3B_GPIO_OE_REG;
        WBs_ACK_o <= 1'b0;
    end else begin
        if (FB_GPIO_Reg_Wr_Dcd && WBs_BYTE_STB_i[0])
            GPIO_OUT_o[7:0] <= WBs_DAT_i[7:0];
        if (FB_GPIO_OE_Reg_Wr_Dcd && WBs_BYTE_STB_i[0])
            GPIO_OE_o[7:0] <= WBs_DAT_i[7:0];
        WBs_ACK_o <= WBs_ACK_o_nxt;
    end
end

assign Device_ID_o = 32'h56A37E57;
always @(*) begin
    case(WBs_ADR_i[ADDRWIDTH-1:0])
        FPGA_REG_ID_VALUE_ADR : WBs_DAT_o <= Device_ID_o;
        FPGA_REV_NUM_ADR      : WBs_DAT_o <= {16'h0, 16'h100};  
        FPGA_GPIO_IN_REG_ADR  : WBs_DAT_o <= {24'h0, GPIO_IN_i[7:0]};
        FPGA_GPIO_OUT_REG_ADR : WBs_DAT_o <= {24'h0, GPIO_OUT_o[7:0]};
        FPGA_GPIO_OE_REG_ADR  : WBs_DAT_o <= {24'h0, GPIO_OE_o[7:0]};
        default               : WBs_DAT_o <= AL4S3B_DEF_REG_VALUE;
    endcase
end

endmodule