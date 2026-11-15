module autovcoder_020201 #(
    parameter         C_FAMILY     = "virtex6",
    parameter integer C_DATA_WIDTH = 32,
    parameter integer C_MODE       = 0           // 0 = Light-weight, 1 = Fully-registered
) (
    // System Signals
    input wire ACLK,    // Interface clock from faster clock domain
    input wire ARESET,  // Sync'd to ACLK
    input wire SAMPLE,  // Sample-cycle strobe for slower clock domain

    // Slave side (slower clock domain, sync'd to SAMPLE=1 @ACLK)
    input wire [C_DATA_WIDTH-1:0] S_PAYLOAD_DATA,
    input wire S_VALID,
    output wire S_READY,

    // Master side (faster clock domain; sync'd to ACLK)
    output wire [C_DATA_WIDTH-1:0] M_PAYLOAD_DATA,
    output wire M_VALID,
    input wire M_READY
);

  localparam [1:0] ZERO = 2'b10, ONE = 2'b11, TWO = 2'b01;

  reg  [C_DATA_WIDTH-1:0] storage_data1;
  reg  [C_DATA_WIDTH-1:0] storage_data2;
  reg                     s_ready_i;  //local signal of output
  reg                     m_valid_i;  //local signal of output
  reg  [             1:0] state;
  wire                    push;
  wire                    pop;
  reg                     areset_d1;

  // assign local signal to its output signal
  assign S_READY = s_ready_i;
  assign M_VALID = m_valid_i;
  assign M_PAYLOAD_DATA = storage_data1;
  assign push = SAMPLE & S_VALID & s_ready_i;
  assign pop = m_valid_i & M_READY;

  generate
    if (C_MODE == 0) begin : gen_mode_lightwt
      always @(posedge ACLK) begin
        if (s_ready_i) begin
          storage_data1 <= S_PAYLOAD_DATA;
        end
      end

      always @(posedge ACLK) begin
        if (ARESET) begin
          s_ready_i <= 1'b0;
          m_valid_i <= 1'b0;
          areset_d1 <= 1'b1;
        end else begin
          if (SAMPLE) begin
            if (areset_d1) begin
              s_ready_i <= 1'b1;
            end else begin
              s_ready_i <= pop | (~m_valid_i & ~push);
            end
            areset_d1 <= 1'b0;
          end
          if (pop) begin
            m_valid_i <= 1'b0;
          end else if (push) begin
            m_valid_i <= 1'b1;
          end
        end
      end

    end else begin : gen_mode_fully_reg

      always @(posedge ACLK) begin
        if (s_ready_i) begin
          storage_data2 <= S_PAYLOAD_DATA;
        end
        if (pop | (state == ZERO)) begin
          storage_data1 <= s_ready_i ? S_PAYLOAD_DATA : storage_data2;
        end
      end

      always @(posedge ACLK) begin
        if (ARESET) begin
          s_ready_i <= 1'b0;
          m_valid_i <= 1'b0;
          state <= ZERO;
          areset_d1 <= 1'b1;
        end else begin
          case (state)
            ZERO: begin
              if (SAMPLE) begin
                if (~areset_d1) begin
                  s_ready_i <= 1'b1;
                  if (push) begin
                    m_valid_i <= 1'b1;
                    state <= ONE;
                  end
                end
                areset_d1 <= 1'b0;
              end
            end
            ONE: begin
              if (push & ~pop) begin
                state <= TWO;
              end else if (pop & ~push) begin
                m_valid_i <= 1'b0;
                state <= ZERO;
              end
              if (SAMPLE) begin
                s_ready_i <= pop | ~push;
              end
            end
            TWO: begin
              if (pop) begin
                state <= ONE;
                if (SAMPLE) begin
                  s_ready_i <= 1'b1;
                end
              end
            end
          endcase
        end
      end
    end  // gen_mode
  endgenerate
endmodule

