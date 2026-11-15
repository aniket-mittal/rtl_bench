module jesd204_pattern_align #(
  parameter DATA_PATH_WIDTH = 4
) (
  input clk,
  input reset,

  input patternalign_en,

  input [DATA_PATH_WIDTH*10-1:0] in_data,
  output [DATA_PATH_WIDTH*10-1:0] out_data
);

  localparam [9:0] PATTERN_P = 10'b1010000011;
  localparam [9:0] PATTERN_N = 10'b0101111100;

  reg [1:0] match_counter = 2'h0;
  reg pattern_sync = 1'b0;
  reg pattern_match = 1'b0;

  reg [3:0] align = 4'h0;
  reg [1:0] cooldown = 2'h3;

  reg [8:0] data_d1 = 9'h00;
  reg [DATA_PATH_WIDTH*10+2:0] aligned_data_stage1;
  reg [DATA_PATH_WIDTH*10-1:0] aligned_data_stage2;
  wire [(DATA_PATH_WIDTH+1)*10-2:0] full_data;

  assign full_data = {in_data,data_d1};
  assign out_data = aligned_data_stage2;

  /* 2-stage cascade of 3:1 and 4:1 muxes */

  integer i;

  [MASKED]

  always @(posedge clk) begin
    data_d1 <= in_data[DATA_PATH_WIDTH*10-9+:9];
  end

  always @(posedge clk) begin
    if (out_data[9:0] == PATTERN_P || out_data[9:0] == PATTERN_N) begin
      pattern_match <= 1'b1;
    end else begin
      pattern_match <= 1'b0;
    end
  end

  always @(posedge clk) begin
    if (reset == 1'b1) begin
      cooldown <= 2'h3;
      align <= 4'h0;
    end else begin
      if (cooldown != 2'h0) begin
        cooldown <= cooldown - 1'b1;
      end else if (patternalign_en == 1'b1 && pattern_sync == 1'b0 &&
                   pattern_match == 1'b0) begin
        cooldown <= 2'h3;
        if (align == 'h9) begin
          align <= 4'h0;
        end else begin
          align <= align + 1'b1;
        end
      end
    end
  end

  always @(posedge clk) begin
    if (reset == 1'b1) begin
      pattern_sync <= 1'b0;
      match_counter <= 2'h0;
    end else begin
      if (match_counter == 2'h0) begin
        pattern_sync <= 1'b0;
      end else if (match_counter == 2'h3) begin
        pattern_sync <= 1'b1;
      end

      if (pattern_match == 1'b1) begin
        if (match_counter != 2'h3) begin
          match_counter <= match_counter + 1'b1;
        end
      end else begin
        if (match_counter != 2'h0) begin
          match_counter <= match_counter - 1'b1;
        end
      end
    end
  end

endmodule