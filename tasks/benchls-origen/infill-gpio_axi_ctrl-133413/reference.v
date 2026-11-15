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

    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            state <= IDLE;
            MEM_DECODE_GEN_0_cs_out_i_reg_0 <= 1'b0;
            s_axi_arready <= 1'b0;
            s_axi_wready <= 1'b0;
            Read_Reg2_In <= 4'b0000;
            E <= 1'b0;
            Dual_gpio2_Data_Out_reg <= 1'b0;
            D <= 4'b0000;
            Read_Reg_In <= 4'b0000;
            Dual_gpio_OE_reg <= 1'b0;
            Dual_gpio_Data_Out_reg <= 1'b0;
            Read_Reg_Rst <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (start2) begin
                        state <= is_read ? READ : WRITE;
                        MEM_DECODE_GEN_0_cs_out_i_reg_0 <= 1'b1;
                    end
                end
                READ: begin
                    s_axi_arready <= 1'b1;
                    case (bus2ip_addr_i_reg)
                        3'b000: Read_Reg_In <= Dual_gpio_Data_In_reg;
                        3'b001: Read_Reg2_In <= Dual_gpio2_Data_In_reg;
                        3'b010: D <= GPIO_DBus_i;
                        3'b011: D <= GPIO2_DBus_i;
                    endcase
                    state <= WAIT;
                end
                WRITE: begin
                    s_axi_wready <= 1'b1;
                    case (bus2ip_addr_i_reg)
                        3'b000: Dual_gpio_Data_Out_reg <= 1'b1;
                        3'b001: Dual_gpio2_Data_Out_reg <= 1'b1;
                        3'b010: Dual_gpio_OE_reg <= 1'b1;
                        3'b011: E <= 1'b1;
                    endcase
                    state <= WAIT;
                end
                WAIT: begin
                    if (ip2bus_rdack_i_D1 || ip2bus_wrack_i_D1) begin
                        state <= IDLE;
                        MEM_DECODE_GEN_0_cs_out_i_reg_0 <= 1'b0;
                        s_axi_arready <= 1'b0;
                        s_axi_wready <= 1'b0;
                        E <= 1'b0;
                        Dual_gpio_OE_reg <= 1'b0;
                        Dual_gpio_Data_Out_reg <= 1'b0;
                        Dual_gpio2_Data_Out_reg <= 1'b0;
                    end
                end
            endcase

            if (rst_reg) begin
                Read_Reg_Rst <= 1'b1;
            end else begin
                Read_Reg_Rst <= 1'b0;
            end
        end
    end

endmodule