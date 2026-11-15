module autovcoder_073678 (
    input wire clock,
    input wire ready,
    input wire restart,
    output reg [19:0] pcm_data
);
  reg [8:0] index;

  initial begin
    index <= 8'h00;
    // synthesis attribute init of index is "00";
    pcm_data <= 20'h00000;
    // synthesis attribute init of pcm_data is "00000";
  end

  always @(posedge clock) begin
    if (restart) index <= 0;
    else if (ready) index <= index + 1;
  end

  // one cycle of a sinewave in 64 20-bit samples
  [MASKED]  // always @ (index)
endmodule

