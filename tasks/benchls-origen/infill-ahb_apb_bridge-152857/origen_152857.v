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

[MASKED]

endmodule