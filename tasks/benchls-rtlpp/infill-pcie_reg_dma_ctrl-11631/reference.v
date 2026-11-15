module rtlpp_11631 (
   input             clk_in,
   input             rstn,
   input             sel_ep_reg,
   input             reg_wr_ena,         
   input             reg_rd_ena,
   input [7:0]       reg_rd_addr,        
   input [7:0]       reg_wr_addr,
   input [31:0]      reg_wr_data,        
   input [31:0]      dma_rd_prg_rddata,
   input [31:0]      dma_wr_prg_rddata,
   input [15:0]      rx_ecrc_bad_cnt,
   input [63:0]      read_dma_status,
   input [63:0]      write_dma_status,

   output reg [31:0] reg_rd_data,        
   output reg        reg_rd_data_valid,  
   output reg [31:0] dma_prg_wrdata,
   output reg [3:0]  dma_prg_addr,       
   output reg        dma_rd_prg_wrena,
   output reg        dma_wr_prg_wrena
);

   localparam DMA_WRITE_PRG = 4'h0;
   localparam DMA_READ_PRG  = 4'h1;
   localparam MISC          = 4'h2;
   localparam ERR_STATUS    = 4'h3;

   localparam WRITE_DMA_STATUS_REG_HI = 4'h0;
   localparam WRITE_DMA_STATUS_REG_LO = 4'h4;
   localparam READ_DMA_STATUS_REG_HI  = 4'h8;
   localparam READ_DMA_STATUS_REG_LO  = 4'hc;

   reg [31:0] err_status_reg;
   reg [63:0] read_dma_status_reg;
   reg [63:0] write_dma_status_reg;
   reg [31:0] dma_rd_prg_rddata_reg;
   reg [31:0] dma_wr_prg_rddata_reg;

   reg             reg_wr_ena_reg;
   reg             reg_rd_ena_reg;
   reg [7:0]       reg_rd_addr_reg;
   reg [7:0]       reg_wr_addr_reg;
   reg [31:0]      reg_wr_data_reg;
   reg             sel_ep_reg_reg;
   reg             reg_rd_ena_reg2;
   reg             reg_rd_ena_reg3;

   always @ (negedge rstn or posedge clk_in) begin
      if (rstn==1'b0) begin
          err_status_reg       <= 32'h0;
          read_dma_status_reg  <= 64'h0;
          write_dma_status_reg <= 64'h0;
          reg_wr_ena_reg       <= 1'b0;
          reg_rd_ena_reg       <= 1'b0;
          reg_rd_ena_reg2      <= 1'b0;
          reg_rd_ena_reg3      <= 1'b0;
          reg_rd_addr_reg      <= 8'h0;
          reg_wr_addr_reg      <= 8'h0;
          reg_wr_data_reg      <= 32'h0;
          sel_ep_reg_reg       <= 1'b0;
          dma_rd_prg_rddata_reg <= 32'h0;
          dma_wr_prg_rddata_reg <= 32'h0;
      end
      else begin
          err_status_reg       <= {16'h0, rx_ecrc_bad_cnt};
          read_dma_status_reg  <= read_dma_status;
          write_dma_status_reg <= write_dma_status;
          reg_wr_ena_reg       <= reg_wr_ena & sel_ep_reg;
          reg_rd_ena_reg       <= reg_rd_ena & sel_ep_reg;
          reg_rd_ena_reg2      <= reg_rd_ena_reg;
          reg_rd_ena_reg3      <= reg_rd_ena_reg2;
          reg_rd_addr_reg      <= reg_rd_addr;
          reg_wr_addr_reg      <= reg_wr_addr;
          reg_wr_data_reg      <= reg_wr_data;
          dma_rd_prg_rddata_reg <= dma_rd_prg_rddata;
          dma_wr_prg_rddata_reg <= dma_wr_prg_rddata;
      end
   end

   always @ (negedge rstn or posedge clk_in) begin
      if (rstn==1'b0) begin
          reg_rd_data       <= 32'h0;
          reg_rd_data_valid <= 1'b0;
          dma_prg_wrdata    <= 32'h0;
          dma_prg_addr      <= 4'h0;
          dma_rd_prg_wrena  <= 1'b0;
          dma_wr_prg_wrena  <= 1'b0;
      end
      else begin
          dma_prg_wrdata    <= reg_wr_data_reg;
          dma_prg_addr      <= reg_wr_addr_reg[3:0];
          dma_rd_prg_wrena  <= ((reg_wr_ena_reg==1'b1) & (reg_wr_addr_reg[7:4] == DMA_READ_PRG))  ? 1'b1 : 1'b0;
          dma_wr_prg_wrena  <= ((reg_wr_ena_reg==1'b1) & (reg_wr_addr_reg[7:4] == DMA_WRITE_PRG)) ? 1'b1 : 1'b0;

          case (reg_rd_addr_reg[7:0])
              {MISC, WRITE_DMA_STATUS_REG_HI}: reg_rd_data <= write_dma_status_reg[63:32];
              {MISC, WRITE_DMA_STATUS_REG_LO}: reg_rd_data <= write_dma_status_reg[31:0];
              {MISC, READ_DMA_STATUS_REG_HI} : reg_rd_data <= read_dma_status_reg[63:32];
              {MISC, READ_DMA_STATUS_REG_LO} : reg_rd_data <= read_dma_status_reg[31:0];
              {ERR_STATUS, 4'h0}             : reg_rd_data <= err_status_reg;
              {DMA_WRITE_PRG, 4'h0},
              {DMA_WRITE_PRG, 4'h4},
              {DMA_WRITE_PRG, 4'h8},
              {DMA_WRITE_PRG, 4'hC}          : reg_rd_data <= dma_wr_prg_rddata_reg;
              {DMA_READ_PRG, 4'h0},
              {DMA_READ_PRG, 4'h4},
              {DMA_READ_PRG, 4'h8},
              {DMA_READ_PRG, 4'hC}           : reg_rd_data <= dma_rd_prg_rddata_reg;
              default                        : reg_rd_data <= 32'h0;
          endcase

          case (reg_rd_addr_reg[7:4])
              DMA_WRITE_PRG: reg_rd_data_valid <= reg_rd_ena_reg3;
              DMA_READ_PRG : reg_rd_data_valid <= reg_rd_ena_reg3;
              default      : reg_rd_data_valid <= reg_rd_ena_reg;
          endcase
      end
   end

endmodule