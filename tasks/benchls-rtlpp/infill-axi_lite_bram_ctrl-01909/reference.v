module rtlpp_01909 (
  input s_axi_aclk,
  input s_axi_aresetn,
  input [12:0]s_axi_awaddr,
  input [7:0]s_axi_awlen,
  input [2:0]s_axi_awsize,
  input [1:0]s_axi_awburst,
  input s_axi_awlock,
  input [3:0]s_axi_awcache,
  input [2:0]s_axi_awprot,
  input s_axi_awvalid,
  output reg s_axi_awready,
  input [31:0]s_axi_wdata,
  input [3:0]s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output reg s_axi_wready,
  output reg [1:0]s_axi_bresp,
  output reg s_axi_bvalid,
  input s_axi_bready,
  input [12:0]s_axi_araddr,
  input [7:0]s_axi_arlen,
  input [2:0]s_axi_arsize,
  input [1:0]s_axi_arburst,
  input s_axi_arlock,
  input [3:0]s_axi_arcache,
  input [2:0]s_axi_arprot,
  input s_axi_arvalid,
  output reg s_axi_arready,
  output reg [31:0]s_axi_rdata,
  output reg [1:0]s_axi_rresp,
  output reg s_axi_rlast,
  output reg s_axi_rvalid,
  input s_axi_rready,
  output reg bram_rst_a,
  output reg bram_clk_a,
  output reg bram_en_a,
  output reg [3:0] bram_we_a,
  output reg [12:0]bram_addr_a,
  output reg [31:0]bram_wrdata_a,
  input [31:0]bram_rddata_a
);

  // Internal Registers and Wires
  reg [3:0] state;  // State machine register
  reg [7:0] burst_counter;
  reg [31:0] data_buffer;

  // State Machine States
  localparam IDLE     = 4'b0000;
  localparam WRITE    = 4'b0001;
  localparam READ     = 4'b0010;
  localparam RESP     = 4'b0011;

  // State Machine
  always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
      state <= IDLE;
      s_axi_awready <= 0;
      s_axi_wready <= 0;
      s_axi_bvalid <= 0;
      s_axi_arready <= 0;
      s_axi_rvalid <= 0;
      burst_counter <= 0;
      bram_en_a <= 0;
      bram_we_a <= 0;
      bram_addr_a <= 0;
    end else begin
      case (state)
        IDLE: begin
          if (s_axi_awvalid) begin
            s_axi_awready <= 1;
            s_axi_wready <= 1;
            bram_addr_a <= s_axi_awaddr;
            burst_counter <= s_axi_awlen;
            state <= WRITE;
          end else if (s_axi_arvalid) begin
            s_axi_arready <= 1;
            bram_addr_a <= s_axi_araddr;
            burst_counter <= s_axi_arlen;
            state <= READ;
          end
        end

        WRITE: begin
          if (s_axi_wvalid && s_axi_wready) begin
            bram_wrdata_a <= s_axi_wdata;
            bram_we_a <= s_axi_wstrb;
            bram_en_a <= 1;
            if (s_axi_wlast || burst_counter == 0) begin
              s_axi_wready <= 0;
              s_axi_bvalid <= 1;
              s_axi_bresp <= 2'b00;  // OKAY response
              state <= RESP;
            end else begin
              burst_counter <= burst_counter - 1;
              bram_addr_a <= bram_addr_a + 1;
            end
          end
        end

        READ: begin
          if (s_axi_arready && s_axi_arvalid) begin
            data_buffer <= bram_rddata_a;
            s_axi_rdata <= bram_rddata_a;
            s_axi_rvalid <= 1;
            s_axi_rlast <= (burst_counter == 0);
            if (s_axi_rlast || burst_counter == 0) begin
              s_axi_arready <= 0;
              state <= IDLE;
            end else begin
              burst_counter <= burst_counter - 1;
              bram_addr_a <= bram_addr_a + 1;
            end
          end
        end

        RESP: begin
          if (s_axi_bready && s_axi_bvalid) begin
            s_axi_bvalid <= 0;
            s_axi_awready <= 0;
            state <= IDLE;
          end
        end

      endcase
    end
  end
endmodule