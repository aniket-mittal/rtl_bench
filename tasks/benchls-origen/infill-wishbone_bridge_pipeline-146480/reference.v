module origen_146480 (
    input sys_rst,
    
    // Wishbone Slave Interface
    input wbs_clk_i,
    input [18:0] wbs_adr_i,
    input [15:0] wbs_dat_i,
    output reg [15:0] wbs_dat_o,
    input [1:0] wbs_sel_i,
    input wbs_tga_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    output reg wbs_ack_o,
    
    // Wishbone Master Interface
    input wbm_clk_i,
    output reg [18:0] wbm_adr_o,
    output reg [15:0] wbm_dat_o,
    input [15:0] wbm_dat_i,
    output reg [1:0] wbm_sel_o,
    output reg wbm_tga_o,
    output reg wbm_stb_o,
    output reg wbm_cyc_o,
    output reg wbm_we_o,
    input wbm_ack_i
);

    // Internal registers for pipelining
    reg [18:0] wbs_adr_r;
    reg [15:0] wbs_dat_r;
    reg [1:0] wbs_sel_r;
    reg wbs_we_r;
    reg wbs_cyc_r;
    reg wbs_stb_r;
    
    reg [18:0] wbm_adr_r;
    reg [15:0] wbm_dat_r;
    reg [1:0] wbm_sel_r;
    reg wbm_we_r;
    reg wbm_cyc_r;
    reg wbm_stb_r;
    
    // State machine states
    localparam IDLE = 2'b00;
    localparam SLAVE_ACTIVE = 2'b01;
    localparam MASTER_ACTIVE = 2'b10;
    
    reg [1:0] state, next_state;
    
    // State machine
    always @(posedge wbs_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (wbs_cyc_i && wbs_stb_i)
                    next_state = SLAVE_ACTIVE;
                else if (wbm_cyc_r && wbm_stb_r)
                    next_state = MASTER_ACTIVE;
                else
                    next_state = IDLE;
            end
            SLAVE_ACTIVE: begin
                if (!wbs_cyc_i || !wbs_stb_i)
                    next_state = IDLE;
                else
                    next_state = SLAVE_ACTIVE;
            end
            MASTER_ACTIVE: begin
                if (wbm_ack_i)
                    next_state = IDLE;
                else
                    next_state = MASTER_ACTIVE;
            end
            default: next_state = IDLE;
        endcase
    end
    
    // Slave interface logic
    always @(posedge wbs_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbs_ack_o <= 1'b0;
            wbs_dat_o <= 16'h0000;
            wbs_adr_r <= 19'h00000;
            wbs_dat_r <= 16'h0000;
            wbs_sel_r <= 2'b00;
            wbs_we_r <= 1'b0;
            wbs_cyc_r <= 1'b0;
            wbs_stb_r <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    wbs_ack_o <= 1'b0;
                    if (wbs_cyc_i && wbs_stb_i) begin
                        wbs_adr_r <= wbs_adr_i;
                        wbs_dat_r <= wbs_dat_i;
                        wbs_sel_r <= wbs_sel_i;
                        wbs_we_r <= wbs_we_i;
                        wbs_cyc_r <= wbs_cyc_i;
                        wbs_stb_r <= wbs_stb_i;
                    end
                end
                SLAVE_ACTIVE: begin
                    wbs_ack_o <= 1'b1;
                    if (wbs_we_r)
                        wbs_dat_o <= wbs_dat_r;
                    else
                        wbs_dat_o <= wbm_dat_i;
                end
                default: begin
                    wbs_ack_o <= 1'b0;
                end
            endcase
        end
    end
    
    // Master interface logic
    always @(posedge wbm_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbm_adr_o <= 19'h00000;
            wbm_dat_o <= 16'h0000;
            wbm_sel_o <= 2'b00;
            wbm_tga_o <= 1'b0;
            wbm_stb_o <= 1'b0;
            wbm_cyc_o <= 1'b0;
            wbm_we_o <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (wbs_cyc_r && wbs_stb_r) begin
                        wbm_adr_o <= wbs_adr_r;
                        wbm_dat_o <= wbs_dat_r;
                        wbm_sel_o <= wbs_sel_r;
                        wbm_tga_o <= 1'b1;
                        wbm_stb_o <= 1'b1;
                        wbm_cyc_o <= 1'b1;
                        wbm_we_o <= wbs_we_r;
                    end
                end
                MASTER_ACTIVE: begin
                    if (wbm_ack_i) begin
                        wbm_stb_o <= 1'b0;
                        wbm_cyc_o <= 1'b0;
                        wbm_tga_o <= 1'b0;
                    end
                end
                default: begin
                    wbm_stb_o <= 1'b0;
                    wbm_cyc_o <= 1'b0;
                    wbm_tga_o <= 1'b0;
                end
            endcase
        end
    end

endmodule