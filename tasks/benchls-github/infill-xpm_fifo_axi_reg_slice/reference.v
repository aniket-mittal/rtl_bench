module xpm_fifo_axi_reg_slice #
  (
   parameter C_DATA_WIDTH = 32,
   parameter C_REG_CONFIG = 32'h00000000
   )
  (
   // System Signals
   input  wire                      ACLK,
   input  wire                      ARESET,

   // Slave side
   input  wire [C_DATA_WIDTH-1:0]   S_PAYLOAD_DATA,
   input  wire                      S_VALID,
   output wire                      S_READY,

   // Master side
   output wire [C_DATA_WIDTH-1:0]   M_PAYLOAD_DATA,
   output wire                      M_VALID,
   input  wire                      M_READY
   );

  localparam RST_SYNC_STAGES = 5;
  localparam RST_BUSY_LEN    = 6;
  reg [1:0] arst_sync_wr  = 2'b11;
  reg [RST_BUSY_LEN-1:0] sckt_wr_rst_cc = 0;
  wire sync_reset;
  wire extnd_reset;


  always @(posedge ARESET or posedge ACLK) begin
    if (ARESET)
      arst_sync_wr <= 2'b11;
    else
      arst_sync_wr <= {arst_sync_wr[0], 1'b0};
  end

  always @(posedge ACLK) begin
    sckt_wr_rst_cc   <= {sckt_wr_rst_cc[RST_BUSY_LEN-2:0], arst_sync_wr[1]};
  end

  assign sync_reset     = |sckt_wr_rst_cc[RST_BUSY_LEN-5:0] | arst_sync_wr[1]; 
  assign extnd_reset    = |sckt_wr_rst_cc | arst_sync_wr[1];
  generate
  ////////////////////////////////////////////////////////////////////
  //
  // Both FWD and REV mode
  //
  ////////////////////////////////////////////////////////////////////
    if (C_REG_CONFIG == 32'h00000000)
    begin
      reg [1:0] state;
      localparam [1:0] 
        ZERO = 2'b10,
        ONE  = 2'b11,
        TWO  = 2'b01;
      
      reg [C_DATA_WIDTH-1:0] storage_data1 = 0;
      reg [C_DATA_WIDTH-1:0] storage_data2 = 0;
      reg                    load_s1;
      wire                   load_s2;
      wire                   load_s1_from_s2;
      reg                    s_ready_i; //local signal of output
      wire                   m_valid_i; //local signal of output

      // assign local signal to its output signal
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;

      reg  areset_d1; // Reset delay register
      always @(posedge ACLK) begin
        areset_d1 <= extnd_reset;
      end
      
      // Load storage1 with either slave side data or from storage2
      always @(posedge ACLK) 
      begin
        if (load_s1)
          if (load_s1_from_s2)
            storage_data1 <= storage_data2;
          else
            storage_data1 <= S_PAYLOAD_DATA;        
      end

      // Load storage2 with slave side data
      always @(posedge ACLK) 
      begin
        if (load_s2)
          storage_data2 <= S_PAYLOAD_DATA;
      end

      assign M_PAYLOAD_DATA = storage_data1;

      // Always load s2 on a valid transaction even if it's unnecessary
      assign load_s2 = S_VALID & s_ready_i;

      // Loading s1
      always @ *
      begin
        if ( ((state == ZERO) && (S_VALID == 1)) || // Load when empty on slave transaction
             // Load when ONE if we both have read and write at the same time
             ((state == ONE) && (S_VALID == 1) && (M_READY == 1)) ||
             // Load when TWO and we have a transaction on Master side
             ((state == TWO) && (M_READY == 1)))
          load_s1 = 1'b1;
        else
          load_s1 = 1'b0;
      end // always @ *

      assign load_s1_from_s2 = (state == TWO);
                       
      // State Machine for handling output signals
      always @(posedge ACLK) begin
        if (sync_reset || extnd_reset) begin
          s_ready_i <= 1'b0;
          state <= ZERO;
        end else if (areset_d1 && ~extnd_reset) begin
          s_ready_i <= 1'b1;
        end else begin
          case (state)
            // No transaction stored locally
            ZERO: if (S_VALID) state <= ONE; // Got one so move to ONE

            // One transaction stored locally
            ONE: begin
              if (M_READY & ~S_VALID) state <= ZERO; // Read out one so move to ZERO
              if (~M_READY & S_VALID) begin
                state <= TWO;  // Got another one so move to TWO
                s_ready_i <= 1'b0;
              end
            end

            // TWO transaction stored locally
            TWO: if (M_READY) begin
              state <= ONE; // Read out one so move to ONE
              s_ready_i <= 1'b1;
            end
          endcase // case (state)
        end
      end // always @ (posedge ACLK)
      
      assign m_valid_i = state[0];

    end // if (C_REG_CONFIG == 1)
  ////////////////////////////////////////////////////////////////////
  //
  // 1-stage pipeline register with bubble cycle, both FWD and REV pipelining
  // Operates same as 1-deep FIFO
  //
  ////////////////////////////////////////////////////////////////////
    else if (C_REG_CONFIG == 32'h00000001)
    begin
      reg [C_DATA_WIDTH-1:0] storage_data1 = 0;
      reg                    s_ready_i; //local signal of output
      reg                    m_valid_i; //local signal of output

      // assign local signal to its output signal
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;

      reg  areset_d1; // Reset delay register
      always @(posedge ACLK) begin
        areset_d1 <= extnd_reset;
      end
      
      // Load storage1 with slave side data
      always @(posedge ACLK) 
      begin
        if (sync_reset || extnd_reset) begin
          s_ready_i <= 1'b0;
          m_valid_i <= 1'b0;
        end else if (areset_d1 && ~extnd_reset) begin
          s_ready_i <= 1'b1;
        end else if (m_valid_i & M_READY) begin
          s_ready_i <= 1'b1;
          m_valid_i <= 1'b0;
        end else if (S_VALID & s_ready_i) begin
          s_ready_i <= 1'b0;
          m_valid_i <= 1'b1;
        end
        if (~m_valid_i) begin
          storage_data1 <= S_PAYLOAD_DATA;        
        end
      end
      assign M_PAYLOAD_DATA = storage_data1;
    end // if (C_REG_CONFIG == 7)
    
    else begin : default_case
      // Passthrough
      assign M_PAYLOAD_DATA = S_PAYLOAD_DATA;
      assign M_VALID        = S_VALID;
      assign S_READY        = M_READY;      
    end

  endgenerate
endmodule