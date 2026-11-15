module origen_125469 (
    input wire clk,
    input wire rst,
    
    // Wishbone slave interface
    input wire [31:0] wbs_data_i,
    output reg [31:0] wbs_data_o,
    input wire [31:0] wb_addr_i,
    input wire [3:0] wb_sel_i,
    input wire wb_we_i,
    input wire wb_cyc_i,
    input wire wb_stb_i,
    output reg wb_ack_o,
    output reg wb_err_o,
    output reg wb_rty_o,
    
    // Wishbone master interface
    input wire [31:0] wbm_data_i,
    output reg [31:0] wbm_data_o,
    output reg [31:0] wb_addr_o,
    output reg [3:0] wb_sel_o,
    output reg wb_we_o,
    output reg wb_cyc_o,
    output reg wb_stb_o,
    input wire wb_ack_i,
    input wire wb_err_i,
    input wire wb_rty_i,
    
    // Master interface
    input wire mast_go,
    input wire mast_we,
    input wire [31:0] mast_adr,
    input wire [3:0] mast_sel,
    input wire [31:0] mast_din,
    output reg [31:0] mast_dout,
    output reg mast_err,
    output reg mast_drdy,
    output reg mast_wait,
    input wire pt_sel_i,
    input wire [70:0] mast_pt_in,
    output reg [36:0] mast_pt_out,
    
    // Slave interface
    output reg [31:0] slv_adr,
    output reg [31:0] slv_din,
    input wire [31:0] slv_dout,
    output reg slv_re,
    output reg slv_we,
    output reg pt_sel_o,
    output reg [36:0] slv_pt_out,
    input wire [70:0] slv_pt_in
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam MASTER = 2'b01;
    localparam SLAVE = 2'b10;
    localparam PASSTHROUGH = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (pt_sel_i)
                    next_state = PASSTHROUGH;
                else if (mast_go)
                    next_state = MASTER;
                else if (wb_cyc_i && wb_stb_i)
                    next_state = SLAVE;
            end
            MASTER: begin
                if (!mast_go)
                    next_state = IDLE;
            end
            SLAVE: begin
                if (!wb_cyc_i || !wb_stb_i)
                    next_state = IDLE;
            end
            PASSTHROUGH: begin
                if (!pt_sel_i)
                    next_state = IDLE;
            end
        endcase
    end

    // Master logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wb_addr_o <= 32'b0;
            wb_sel_o <= 4'b0;
            wb_we_o <= 1'b0;
            wb_cyc_o <= 1'b0;
            wb_stb_o <= 1'b0;
            wbm_data_o <= 32'b0;
            mast_dout <= 32'b0;
            mast_err <= 1'b0;
            mast_drdy <= 1'b0;
            mast_wait <= 1'b0;
        end else if (state == MASTER) begin
            wb_addr_o <= mast_adr;
            wb_sel_o <= mast_sel;
            wb_we_o <= mast_we;
            wb_cyc_o <= 1'b1;
            wb_stb_o <= 1'b1;
            wbm_data_o <= mast_din;
            mast_dout <= wbm_data_i;
            mast_err <= wb_err_i;
            mast_drdy <= wb_ack_i;
            mast_wait <= wb_rty_i;
        end else begin
            wb_cyc_o <= 1'b0;
            wb_stb_o <= 1'b0;
            mast_drdy <= 1'b0;
            mast_wait <= 1'b0;
        end
    end

    // Slave logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wbs_data_o <= 32'b0;
            wb_ack_o <= 1'b0;
            wb_err_o <= 1'b0;
            wb_rty_o <= 1'b0;
            slv_adr <= 32'b0;
            slv_din <= 32'b0;
            slv_re <= 1'b0;
            slv_we <= 1'b0;
        end else if (state == SLAVE) begin
            slv_adr <= wb_addr_i;
            slv_din <= wbs_data_i;
            slv_re <= !wb_we_i;
            slv_we <= wb_we_i;
            wbs_data_o <= slv_dout;
            wb_ack_o <= 1'b1;
            wb_err_o <= 1'b0;
            wb_rty_o <= 1'b0;
        end else begin
            wb_ack_o <= 1'b0;
            wb_err_o <= 1'b0;
            wb_rty_o <= 1'b0;
            slv_re <= 1'b0;
            slv_we <= 1'b0;
        end
    end

    // Pass-through logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pt_sel_o <= 1'b0;
            mast_pt_out <= 37'b0;
            slv_pt_out <= 37'b0;
        end else if (state == PASSTHROUGH) begin
            pt_sel_o <= 1'b1;
            mast_pt_out <= {wb_addr_i, wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i};
            slv_pt_out <= {wbm_data_i, wb_ack_i, wb_err_i, wb_rty_i};
        end else begin
            pt_sel_o <= 1'b0;
        end
    end

endmodule