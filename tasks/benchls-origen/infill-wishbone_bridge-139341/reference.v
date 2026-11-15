module origen_139341 (
    input wire sys_rst,
    input wire wbs_clk_i,
    input wire [19:0] wbs_adr_i,
    input wire [15:0] wbs_dat_i,
    input wire [1:0] wbs_sel_i,
    input wire wbs_tga_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    output reg [15:0] wbs_dat_o,
    output reg wbs_ack_o,

    input wire wbm_clk_i,
    output reg [19:0] wbm_adr_o,
    output reg [15:0] wbm_dat_o,
    input wire [15:0] wbm_dat_i,
    output reg [1:0] wbm_sel_o,
    output reg wbm_tga_o,
    output reg wbm_stb_o,
    output reg wbm_cyc_o,
    output reg wbm_we_o,
    input wire wbm_ack_i
);

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
                else if (wbm_cyc_o && wbm_stb_o)
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
            wbs_dat_o <= 16'b0;
        end else if (state == SLAVE_ACTIVE) begin
            wbs_ack_o <= 1'b1;
            if (wbs_we_i)
                wbs_dat_o <= wbs_dat_i;
            else
                wbs_dat_o <= wbm_dat_i;
        end else begin
            wbs_ack_o <= 1'b0;
            wbs_dat_o <= 16'b0;
        end
    end

    // Master interface logic
    always @(posedge wbm_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbm_adr_o <= 20'b0;
            wbm_dat_o <= 16'b0;
            wbm_sel_o <= 2'b0;
            wbm_tga_o <= 1'b0;
            wbm_stb_o <= 1'b0;
            wbm_cyc_o <= 1'b0;
            wbm_we_o <= 1'b0;
        end else if (state == SLAVE_ACTIVE) begin
            wbm_adr_o <= wbs_adr_i;
            wbm_dat_o <= wbs_dat_i;
            wbm_sel_o <= wbs_sel_i;
            wbm_tga_o <= wbs_tga_i;
            wbm_stb_o <= wbs_stb_i;
            wbm_cyc_o <= wbs_cyc_i;
            wbm_we_o <= wbs_we_i;
        end else begin
            wbm_adr_o <= 20'b0;
            wbm_dat_o <= 16'b0;
            wbm_sel_o <= 2'b0;
            wbm_tga_o <= 1'b0;
            wbm_stb_o <= 1'b0;
            wbm_cyc_o <= 1'b0;
            wbm_we_o <= 1'b0;
        end
    end

endmodule