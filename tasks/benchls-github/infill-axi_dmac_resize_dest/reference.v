module axi_dmac_resize_dest #(
  parameter DATA_WIDTH_DEST = 64,
  parameter DATA_WIDTH_MEM = 64
) (
  input clk,
  input reset,

  input mem_data_valid,
  output mem_data_ready,
  input [DATA_WIDTH_MEM-1:0] mem_data,
  input mem_data_last,
  input [DATA_WIDTH_MEM/8-1:0] mem_data_strb,

  output dest_data_valid,
  input dest_data_ready,
  output [DATA_WIDTH_DEST-1:0] dest_data,
  output dest_data_last,
  output [DATA_WIDTH_DEST/8-1:0] dest_data_strb
);

  /*
   * Resize the data width between the burst memory and the destination interface
   * if necessary.
   */

  generate if (DATA_WIDTH_DEST == DATA_WIDTH_MEM)  begin
    assign dest_data_valid = mem_data_valid;
    assign dest_data = mem_data;
    assign dest_data_last = mem_data_last;
    assign dest_data_strb = mem_data_strb;
    assign mem_data_ready = dest_data_ready;
  end else begin

    localparam RATIO = DATA_WIDTH_MEM / DATA_WIDTH_DEST;

    reg [$clog2(RATIO)-1:0] count = 'h0;
    reg valid = 1'b0;
    reg [RATIO-1:0] last = 'h0;
    reg [DATA_WIDTH_MEM-1:0] data = 'h0;
    reg [DATA_WIDTH_MEM/8-1:0] strb = {DATA_WIDTH_MEM/8{1'b1}};

    wire last_beat;

    assign last_beat = (count == RATIO - 1) | last[0];

    always @(posedge clk) begin
      if (reset == 1'b1) begin
        valid <= 1'b0;
      end else if (mem_data_valid == 1'b1) begin
        valid <= 1'b1;
      end else if (last_beat == 1'b1 && dest_data_ready == 1'b1) begin
        valid <= 1'b0;
      end
    end

    always @(posedge clk) begin
      if (reset == 1'b1) begin
        count <= 'h0;
      end else if (dest_data_ready == 1'b1 && dest_data_valid == 1'b1) begin
        if (last_beat == 1'b1) begin
          count <= 'h0;
        end else begin
          count <= count + 1;
        end
      end
    end

    assign mem_data_ready = ~valid | (dest_data_ready & last_beat);

    integer i;
    always @(posedge clk) begin
      if (mem_data_ready == 1'b1) begin
        data <= mem_data;

        /*
         * Skip those words where strb would be completely zero for the output
         * word. We assume that strb is thermometer encoded (i.e. a certain number
         * of LSBs are 1'b1 followed by all 1'b0 in the MSBs) and by extension
         * that if the first strb bit for a word is zero that means that all strb
         * bits for a word will be zero.
         */
        for (i = 0; i < RATIO-1; i = i + 1) begin
          last[i] <= mem_data_last & ~mem_data_strb[(i+1)*(DATA_WIDTH_MEM/8/RATIO)];
        end
        last[RATIO-1] <= mem_data_last;
        strb <= mem_data_strb;
      end else if (dest_data_ready == 1'b1) begin
        data[DATA_WIDTH_MEM-DATA_WIDTH_DEST-1:0] <= data[DATA_WIDTH_MEM-1:DATA_WIDTH_DEST];
        strb[(DATA_WIDTH_MEM-DATA_WIDTH_DEST)/8-1:0] <= strb[DATA_WIDTH_MEM/8-1:DATA_WIDTH_DEST/8];
        last[RATIO-2:0] <= last[RATIO-1:1];
      end
    end

    assign dest_data_valid = valid;
    assign dest_data = data[DATA_WIDTH_DEST-1:0];
    assign dest_data_strb = strb[DATA_WIDTH_DEST/8-1:0];
    assign dest_data_last = last[0];

  end endgenerate

endmodule