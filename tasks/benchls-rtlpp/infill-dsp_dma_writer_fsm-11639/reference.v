module rtlpp_11639 (
  input clk,
  input resetn,

  input [31:0] phase,
  input phase_valid,
  output reg phase_ready,

  input [23:0] data,
  input data_valid,
  output reg data_ready,

  input [31:0] data_filtered,
  input data_filtered_valid,
  output reg data_filtered_ready,

  input [31:0] i_q,
  input i_q_valid,
  output reg i_q_ready,

  input [31:0] i_q_filtered,
  input i_q_filtered_valid,
  output reg i_q_filtered_ready,

  output overflow,

  output reg [31:0] dma_wr_data,
  output reg dma_wr_en,
  output reg dma_wr_sync,
  input dma_wr_overflow,
  input dma_wr_xfer_req,

  input [13:0] channel_enable,

  output processing_resetn
);

  reg [3:0] count;

  assign overflow = dma_wr_overflow;
  assign processing_resetn = dma_wr_xfer_req;

  always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
      count <= 4'h0;
    end else if (!processing_resetn) begin
      count <= 4'h0;
    end else begin
      case (count)
        4'h0: if (phase_valid) count <= count + 1;
        4'h1: if (data_valid) count <= count + 1;
        4'h2: if (data_filtered_valid) count <= count + 1;
        4'h3: if (i_q_valid) count <= count + 1;
        4'h4: if (i_q_valid) count <= count + 1;
        4'h5: if (i_q_filtered_valid) count <= count + 1;
        4'h6: if (i_q_filtered_valid) count <= count + 1;
        4'h7: if (phase_valid) count <= count + 1;
        4'h8: if (data_valid) count <= count + 1;
        4'h9: if (data_filtered_valid) count <= count + 1;
        4'ha: if (i_q_valid) count <= count + 1;
        4'hb: if (i_q_valid) count <= count + 1;
        4'hc: if (i_q_filtered_valid) count <= count + 1;
        4'hd: if (i_q_filtered_valid) count <= 4'h0;
      endcase
    end
  end

  always @(posedge clk) begin
    case (count)
      4'h0: dma_wr_data <= phase;
      4'h1: dma_wr_data <= {8'h00, data[23:0]};
      4'h2: dma_wr_data <= data_filtered;
      4'h3: dma_wr_data <= i_q;
      4'h4: dma_wr_data <= i_q;
      4'h5: dma_wr_data <= i_q_filtered;
      4'h6: dma_wr_data <= i_q_filtered;
      4'h7: dma_wr_data <= phase;
      4'h8: dma_wr_data <= {8'h00, data[23:0]};
      4'h9: dma_wr_data <= data_filtered;
      4'ha: dma_wr_data <= i_q;
      4'hb: dma_wr_data <= i_q;
      4'hc: dma_wr_data <= i_q_filtered;
      4'hd: dma_wr_data <= i_q_filtered;
    endcase
  end

  always @(posedge clk) begin
    if (!resetn || !processing_resetn || !channel_enable[count]) begin
      dma_wr_en <= 1'b0;
    end else begin
      case (count)
        4'h0: dma_wr_en <= phase_valid;
        4'h1: dma_wr_en <= data_valid;
        4'h2: dma_wr_en <= data_filtered_valid;
        4'h3: dma_wr_en <= i_q_valid;
        4'h4: dma_wr_en <= i_q_valid;
        4'h5: dma_wr_en <= i_q_filtered_valid;
        4'h6: dma_wr_en <= i_q_filtered_valid;
        4'h7: dma_wr_en <= phase_valid;
        4'h8: dma_wr_en <= data_valid;
        4'h9: dma_wr_en <= data_filtered_valid;
        4'ha: dma_wr_en <= i_q_valid;
        4'hb: dma_wr_en <= i_q_valid;
        4'hc: dma_wr_en <= i_q_filtered_valid;
        4'hd: dma_wr_en <= i_q_filtered_valid;
      endcase
    end
  end

  always @(posedge clk) begin
    if (count == 4'h0) begin
      dma_wr_sync <= 1'b1;
    end else if (dma_wr_en) begin
      dma_wr_sync <= 1'b0;
    end
  end

  always @(*) begin
    case (count)
      4'h0, 4'h7: phase_ready <= 1'b1;
      default: phase_ready <= 1'b0;
    endcase
  end

  always @(*) begin
    case (count)
      4'h1, 4'h8: data_ready <= 1'b1;
      default: data_ready <= 1'b0;
    endcase
  end

  always @(*) begin
    case (count)
      4'h2, 4'h9: data_filtered_ready <= 1'b1;
      default: data_filtered_ready <= 1'b0;
    endcase
  end

  always @(*) begin
    case (count)
      4'h3, 4'h4, 4'ha, 4'hb: i_q_ready <= 1'b1;
      default: i_q_ready <= 1'b0;
    endcase
  end

  always @(*) begin
    case (count)
      4'h5, 4'h6, 4'hc, 4'hd: i_q_filtered_ready <= 1'b1;
      default: i_q_filtered_ready <= 1'b0;
    endcase
  end

endmodule