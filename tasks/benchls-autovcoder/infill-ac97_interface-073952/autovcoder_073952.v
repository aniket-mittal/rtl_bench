module autovcoder_073952 (
    output reg ready,
    input wire [7:0] command_address,
    input wire [15:0] command_data,
    input wire command_valid,
    input wire [19:0] left_data,
    input wire left_valid,
    input wire [19:0] right_data,
    input wire right_valid,
    output reg [19:0] left_in_data,
    right_in_data,
    output reg ac97_sdata_out,
    input wire ac97_sdata_in,
    output reg ac97_synch,
    input wire ac97_bit_clock
);
  reg [ 7:0] bit_count;

  reg [19:0] l_cmd_addr;
  reg [19:0] l_cmd_data;
  reg [19:0] l_left_data, l_right_data;
  reg l_cmd_v, l_left_v, l_right_v;

  initial begin
    ready <= 1'b0;
    // synthesis attribute init of ready is "0";
    ac97_sdata_out <= 1'b0;
    // synthesis attribute init of ac97_sdata_out is "0";
    ac97_synch <= 1'b0;
    // synthesis attribute init of ac97_synch is "0";

    bit_count <= 8'h00;
    // synthesis attribute init of bit_count is "0000";
    l_cmd_v <= 1'b0;
    // synthesis attribute init of l_cmd_v is "0";
    l_left_v <= 1'b0;
    // synthesis attribute init of l_left_v is "0";
    l_right_v <= 1'b0;
    // synthesis attribute init of l_right_v is "0";

    left_in_data <= 20'h00000;
    // synthesis attribute init of left_in_data is "00000";
    right_in_data <= 20'h00000;
    // synthesis attribute init of right_in_data is "00000";
  end

  [MASKED]

  always @(negedge ac97_bit_clock) begin
    if ((bit_count >= 57) && (bit_count <= 76))
      // Slot 3: Left channel
      left_in_data <= {
        left_in_data[18:0], ac97_sdata_in
      };
    else if ((bit_count >= 77) && (bit_count <= 96))
      // Slot 4: Right channel
      right_in_data <= {
        right_in_data[18:0], ac97_sdata_in
      };
  end
endmodule

