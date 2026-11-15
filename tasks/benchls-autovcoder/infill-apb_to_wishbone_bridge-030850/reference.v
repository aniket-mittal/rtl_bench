module autovcoder_030850 #(
    parameter REGISTER      = 1,    // enable registering on interfaces (otherwise module is purely combinational)
    parameter ADDR = 32,
    parameter DATA = 32,
    // derived; don't touch
    parameter STRB = (DATA / 8)
) (
    // system
    input wire clk,
    input wire rst,

    // ** APB **

    input wire [ADDR-1:0] apb_addr,
    input wire            apb_sel,
    input wire            apb_enable,
    input wire            apb_write,
    input wire [DATA-1:0] apb_wdata,
    input wire [STRB-1:0] apb_strb,

    output reg            apb_ready,
    output reg [DATA-1:0] apb_rdata,
    output reg            apb_slverr,

    // ** Wishbone **

    // cycle
    output reg wb_cyc_o,

    // address
    output reg            wb_stb_o,
    output reg            wb_we_o,
    output reg [ADDR-1:0] wb_adr_o,

    // data
    output reg [DATA-1:0] wb_dat_o,
    output reg [STRB-1:0] wb_sel_o,

    // response
    input wire            wb_ack_i,
    input wire            wb_err_i,
    input wire [DATA-1:0] wb_dat_i
);

  generate
    if (!REGISTER) begin : GEN_NO_REG

      always @* begin
        wb_cyc_o   = apb_sel;

        wb_stb_o   = apb_sel && apb_enable;
        wb_we_o    = apb_write;
        wb_adr_o   = apb_addr;

        wb_dat_o   = apb_wdata;
        wb_sel_o   = apb_write ? apb_strb : {STRB{1'b1}};

        apb_ready  = wb_stb_o ? wb_ack_i : 1'b0;
        apb_rdata  = wb_stb_o ? wb_dat_i : {DATA{1'b0}};
        apb_slverr = wb_stb_o ? wb_err_i : 1'b0;
      end

    end else begin : GEN_REG

      wire set_cyc = apb_sel && !apb_ready && !wb_cyc_o;
      wire clr_cyc = wb_cyc_o && wb_ack_i;

      always @(posedge clk) begin
        if (rst) begin

          apb_ready  <= 1'b0;
          apb_rdata  <= {DATA{1'b0}};
          apb_slverr <= 1'b0;

          wb_cyc_o   <= 1'b0;
          wb_stb_o   <= 1'b0;

        end else begin

          apb_ready  <= 1'b0;
          apb_rdata  <= {DATA{1'b0}};
          apb_slverr <= 1'b0;

          if (set_cyc) begin
            wb_cyc_o <= 1'b1;
            wb_stb_o <= 1'b1;
          end

          if (clr_cyc) begin
            wb_cyc_o   <= 1'b0;
            wb_stb_o   <= 1'b0;
            apb_ready  <= 1'b1;
            apb_rdata  <= wb_dat_i;
            apb_slverr <= wb_err_i;
          end

        end
      end

      always @(posedge clk) begin
        if (set_cyc) begin
          wb_we_o  <= apb_write;
          wb_adr_o <= apb_addr;
          wb_dat_o <= apb_wdata;
          wb_sel_o <= apb_write ? apb_strb : {STRB{1'b1}};
        end
      end

    end
  endgenerate

endmodule

