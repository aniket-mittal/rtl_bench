module origen_152857 #(
    parameter W_HADDR = 32,
    parameter W_PADDR = 32,
    parameter W_DATA  = 32
) (
    input  wire                  clk,
    input  wire                  rst_n,
    // AHB Slave Signals
    input  wire                  ahbls_hready,
    input  wire [W_HADDR-1:0]    ahbls_haddr,
    input  wire                  ahbls_hwrite,
    input  wire [1:0]            ahbls_htrans,
    input  wire [2:0]            ahbls_hsize,
    input  wire [2:0]            ahbls_hburst,
    input  wire [3:0]            ahbls_hprot,
    input  wire                  ahbls_hmastlock,
    input  wire [W_DATA-1:0]     ahbls_hwdata,
    // APB Master Signals
    input  wire                  apbm_pready,
    input  wire [W_DATA-1:0]     apbm_prdata,
    input  wire                  apbm_pslverr,
    // AHB Slave Signals
    output reg                   ahbls_hready_resp,
    output reg  [1:0]            ahbls_hresp,
    output reg  [W_DATA-1:0]     ahbls_hrdata,
    // APB Master Signals
    output reg  [W_PADDR-1:0]    apbm_paddr,
    output reg                   apbm_psel,
    output reg                   apbm_penable,
    output reg                   apbm_pwrite,
    output reg  [W_DATA-1:0]     apbm_pwdata
);

localparam APB_STATE_RD0 = 2'b00;
localparam APB_STATE_RD1 = 2'b01;
localparam APB_STATE_WR0 = 2'b10;
localparam APB_STATE_WR1 = 2'b11;
localparam APB_STATE_IDLE = 2'b11;

reg [1:0] apb_state;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        apb_state <= APB_STATE_IDLE;
        ahbls_hready_resp <= 1'b0;
        ahbls_hresp <= 2'b00;
        ahbls_hrdata <= {W_DATA{1'b0}};
        apbm_paddr <= {W_PADDR{1'b0}};
        apbm_psel <= 1'b0;
        apbm_penable <= 1'b0;
        apbm_pwrite <= 1'b0;
        apbm_pwdata <= {W_DATA{1'b0}};
    end else begin
        case (apb_state)
            APB_STATE_IDLE: begin
                if (ahbls_hready && ahbls_htrans != 2'b00) begin
                    if (ahbls_hwrite) begin
                        apb_state <= APB_STATE_WR0;
                    end else begin
                        apb_state <= APB_STATE_RD0;
                    end
                    apbm_paddr <= ahbls_haddr[W_PADDR-1:0];
                    apbm_psel <= 1'b1;
                    apbm_pwrite <= ahbls_hwrite;
                end else begin
                    ahbls_hready_resp <= 1'b0;
                end
            end
            APB_STATE_RD0: begin
                if (apbm_pready) begin
                    apb_state <= APB_STATE_RD1;
                    ahbls_hready_resp <= 1'b1;
                    ahbls_hresp <= 2'b00;
                    ahbls_hrdata <= apbm_prdata;
                    apbm_penable <= 1'b0;
                end else begin
                    ahbls_hready_resp <= 1'b0;
                end
            end
            APB_STATE_RD1: begin
                apb_state <= APB_STATE_IDLE;
                ahbls_hready_resp <= 1'b0;
            end
            APB_STATE_WR0: begin
                if (apbm_pready) begin
                    apb_state <= APB_STATE_WR1;
                    ahbls_hready_resp <= 1'b1;
                    ahbls_hresp <= 2'b00;
                    apbm_pwdata <= ahbls_hwdata;
                    apbm_penable <= 1'b1;
                end else begin
                    ahbls_hready_resp <= 1'b0;
                end
            end
            APB_STATE_WR1: begin
                apb_state <= APB_STATE_IDLE;
                ahbls_hready_resp <= 1'b0;
                apbm_penable <= 1'b0;
            end
            default: begin
                apb_state <= APB_STATE_IDLE;
            end
        endcase
    end
end

endmodule