module axi_dmac_resize_src #(
  parameter DATA_WIDTH_SRC = 64,
  parameter BYTES_PER_BEAT_WIDTH_SRC = 3,
  parameter DATA_WIDTH_MEM = 64,
  parameter BYTES_PER_BEAT_WIDTH_MEM = 3
) (
  input clk,
  input reset,

  input src_data_valid,
  input [DATA_WIDTH_SRC-1:0] src_data,
  input src_data_last,
  input [BYTES_PER_BEAT_WIDTH_SRC-1:0] src_data_valid_bytes,
  input src_data_partial_burst,

  output mem_data_valid,
  output [DATA_WIDTH_MEM-1:0] mem_data,
  output mem_data_last,
  output [BYTES_PER_BEAT_WIDTH_MEM-1:0] mem_data_valid_bytes,
  output mem_data_partial_burst
);

  generate if (DATA_WIDTH_SRC == DATA_WIDTH_MEM)  begin
    assign mem_data_valid = src_data_valid;
    assign mem_data = src_data;
    assign mem_data_last = src_data_last;
    assign mem_data_valid_bytes = src_data_valid_bytes;
    assign mem_data_partial_burst = src_data_partial_burst;
  end else begin

    localparam RATIO = DATA_WIDTH_MEM / DATA_WIDTH_SRC;
    localparam RATIO_WIDTH = RATIO > 64 ? 7 :
                             RATIO > 32 ? 6 :
                             RATIO > 16 ? 5 :
                             RATIO > 8 ? 4 :
                             RATIO > 4 ? 3 :
                             RATIO > 2 ? 2 : 1;

    reg [RATIO-1:0] mask = 'h1;
    reg valid = 1'b0;
    reg last = 1'b0;
    reg [DATA_WIDTH_MEM-1:0] data = 'h0;
    reg [BYTES_PER_BEAT_WIDTH_SRC-1:0] valid_bytes = 'h00;
    reg partial_burst = 1'b0;
    reg [RATIO_WIDTH-1:0] num_beats = {RATIO_WIDTH{1'b1}};

    always @(posedge clk) begin
      if (reset == 1'b1) begin
        valid <= 1'b0;
        mask <= 'h1;
      end else if (src_data_valid == 1'b1) begin
        valid <= mask[RATIO-1] || src_data_last;
        if (src_data_last) begin
          mask <= 'h1;
        end else begin
          mask <= {mask[RATIO-2:0],mask[RATIO-1]};
        end
      end else begin
        valid <= 1'b0;
      end
    end

    // This counter will hold the number of source beat in a destination beat
    // minus one
    always @(posedge clk) begin
      if (reset == 1'b1) begin
        num_beats <= {RATIO_WIDTH{1'b1}};
      end else if (valid == 1'b1 && last == 1'b1) begin
        if (src_data_valid == 1'b1) begin
          num_beats <= {RATIO_WIDTH{1'b0}};
        end else begin
          num_beats <= {RATIO_WIDTH{1'b1}};
        end
      end else if (src_data_valid == 1'b1) begin
        num_beats <= num_beats + 1'b1;
      end
    end

    integer i;

    always @(posedge clk) begin
      for (i = 0; i < RATIO; i = i+1) begin
        if (mask[i] == 1'b1) begin
          data[i*DATA_WIDTH_SRC+:DATA_WIDTH_SRC] <= src_data;
        end
      end

      // Compensate for the one clock cycle pipeline delay of the data
      last <= src_data_last;
      if (src_data_valid == 1'b1) begin
        valid_bytes <= src_data_valid_bytes;
        partial_burst <= src_data_partial_burst;
      end
    end

    assign mem_data_valid = valid;
    assign mem_data = data;
    assign mem_data_last = last;
    assign mem_data_valid_bytes = {num_beats,valid_bytes};
    assign mem_data_partial_burst = partial_burst;

  end endgenerate

endmodule