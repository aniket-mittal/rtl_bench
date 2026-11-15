module origen_133413 (
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire is_read,
    input wire is_write_reg,
    input wire start2,
    input wire ip2bus_rdack_i_D1,
    input wire ip2bus_wrack_i_D1,
    input wire [3:0] gpio2_io_t,
    input wire [3:0] Dual_gpio2_Data_In_reg,
    input wire [2:0] bus2ip_addr_i_reg,
    input wire bus2ip_rnw_i_reg,
    input wire rst_reg,
    input wire [3:0] GPIO2_DBus_i,
    input wire [3:0] GPIO_DBus_i,
    input wire [3:0] gpio_io_t,
    input wire [3:0] Dual_gpio_Data_In_reg,
    input wire gpio_xferAck_Reg,
    input wire GPIO_xferAck_i,

    output reg MEM_DECODE_GEN_0_cs_out_i_reg_0,
    output reg s_axi_arready,
    output reg s_axi_wready,
    output reg [3:0] Read_Reg2_In,
    output reg E,
    output reg Dual_gpio2_Data_Out_reg,
    output reg [3:0] D,
    output reg [3:0] Read_Reg_In,
    output reg Dual_gpio_OE_reg,
    output reg Dual_gpio_Data_Out_reg,
    output reg Read_Reg_Rst
);

    reg [2:0] state;
    parameter IDLE = 3'b000, READ = 3'b001, WRITE = 3'b010, WAIT = 3'b011;

    [MASKED]

endmodule