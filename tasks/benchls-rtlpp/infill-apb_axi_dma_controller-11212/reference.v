module rtlpp_11212(
    clk, reset, scan_en, idle, INT, periph_tx_req, periph_tx_clr, periph_rx_req, periph_rx_clr,
    pclken, psel, penable, paddr, pwrite, pwdata, prdata, pslverr, pready,
    AWID0, AWADDR0, AWLEN0, AWSIZE0, AWVALID0, AWREADY0, WID0, WDATA0, WSTRB0, WLAST0, WVALID0, WREADY0,
    BID0, BRESP0, BVALID0, BREADY0, ARID0, ARADDR0, ARLEN0, ARSIZE0, ARVALID0, ARREADY0,
    RID0, RDATA0, RRESP0, RLAST0, RVALID0, RREADY0
);

   input clk;
   input reset;
   input scan_en;

   output idle;
   output [0:0] INT;
   
   input [30:0] periph_tx_req;
   output [30:0] periph_tx_clr;
   input [30:0] periph_rx_req;
   output [30:0] periph_rx_clr;

   input pclken;
   input psel;
   input penable;
   input [12:0] paddr;
   input pwrite;
   input [31:0] pwdata;
   output [31:0] prdata;
   output pslverr;
   output pready;

   output [3:0] AWID0;
   output [31:0] AWADDR0;
   output [7:0] AWLEN0;
   output [2:0] AWSIZE0;
   output AWVALID0;
   input AWREADY0;
   output [3:0] WID0;
   output [63:0] WDATA0;
   output [7:0] WSTRB0;
   output WLAST0;
   output WVALID0;
   input WREADY0;
   input [3:0] BID0;
   input [1:0] BRESP0;
   input BVALID0;
   output BREADY0;
   output [3:0] ARID0;
   output [31:0] ARADDR0;
   output [7:0] ARLEN0;
   output [2:0] ARSIZE0;
   output ARVALID0;
   input ARREADY0;
   input [3:0] RID0;
   input [63:0] RDATA0;
   input [1:0] RRESP0;
   input RLAST0;
   input RVALID0;
   output RREADY0;

   wire rd_port_num0;
   wire wr_port_num0;
   wire rd_port_num1;
   wire wr_port_num1;

   wire [3:0]                  M0_AWID;
   wire [31:0]           M0_AWADDR;
   wire [7:0]                 M0_AWLEN;
   wire [2:0]         M0_AWSIZE;
   wire                                 M0_AWVALID;
   wire                                 M0_AWREADY;
   wire [3:0]                  M0_WID;
   wire [63:0]           M0_WDATA;
   wire [7:0]         M0_WSTRB;
   wire                                 M0_WLAST;
   wire                                 M0_WVALID;
   wire                                 M0_WREADY;
   wire [3:0]                  M0_BID;
   wire [1:0]                           M0_BRESP;
   wire                                 M0_BVALID;
   wire                                 M0_BREADY;
   wire [3:0]                  M0_ARID;
   wire [31:0]           M0_ARADDR;
   wire [7:0]                 M0_ARLEN;
   wire [2:0]         M0_ARSIZE;
   wire                                 M0_ARVALID;
   wire                                 M0_ARREADY;
   wire [3:0]                  M0_RID;
   wire [63:0]           M0_RDATA;
   wire [1:0]                           M0_RRESP;
   wire                                 M0_RLAST;
   wire                                 M0_RVALID;
   wire                                 M0_RREADY;

   assign M0_AWID = 4'd0;
   assign M0_WID  = 4'd0;
   assign M0_ARID = 4'd0;

   assign AWID0  = M0_AWID;
   assign AWADDR0  = M0_AWADDR;
   assign AWLEN0  = M0_AWLEN;
   assign AWSIZE0  = M0_AWSIZE;
   assign AWVALID0  = M0_AWVALID;
   assign WID0  = M0_WID;
   assign WDATA0  = M0_WDATA;
   assign WSTRB0  = M0_WSTRB;
   assign WLAST0  = M0_WLAST;
   assign WVALID0  = M0_WVALID;
   assign BREADY0  = M0_BREADY;
   assign ARID0  = M0_ARID;
   assign ARADDR0  = M0_ARADDR;
   assign ARLEN0  = M0_ARLEN;
   assign ARSIZE0  = M0_ARSIZE;
   assign ARVALID0  = M0_ARVALID;
   assign RREADY0  = M0_RREADY;
   assign M0_AWREADY = AWREADY0;
   assign M0_WREADY = WREADY0;
   assign M0_BID = BID0;
   assign M0_BRESP = BRESP0;
   assign M0_BVALID = BVALID0;
   assign M0_ARREADY = ARREADY0;
   assign M0_RID = RID0;
   assign M0_RDATA = RDATA0;
   assign M0_RRESP = RRESP0;
   assign M0_RLAST = RLAST0;
   assign M0_RVALID = RVALID0;

   // Dual core logic is embedded here
   // Assuming very simple operation for dual core, just forwarding the signals

   assign idle = periph_tx_req == 31'd0 && periph_rx_req == 31'd0;
   assign INT = 1'b0;
   assign periph_tx_clr = periph_tx_req;
   assign periph_rx_clr = periph_rx_req;

   assign prdata = pwdata;
   assign pslverr = 1'b0;
   assign pready = 1'b1;

endmodule