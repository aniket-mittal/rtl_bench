// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059687 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .get_rdid(in_vec[1:1]),
    .spimiso(in_vec[0:0]),
    .chipsel(out_vec[27:27]),
    .spiclk(out_vec[26:26]),
    .spimosi(out_vec[25:25]),
    .get_rdid_done(out_vec[24:24]),
    .manufacturer_id(out_vec[23:16]),
    .memory_type(out_vec[15:8]),
    .memory_capacity(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h4;
    stim[2] = 3'h3;
    stim[3] = 3'h2;
    stim[4] = 3'h0;
    stim[5] = 3'h0;
    stim[6] = 3'h0;
    stim[7] = 3'h1;
    stim[8] = 3'h1;
    stim[9] = 3'h3;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h2;
    stim[13] = 3'h3;
    stim[14] = 3'h2;
    stim[15] = 3'h0;
    stim[16] = 3'h2;
    stim[17] = 3'h3;
    stim[18] = 3'h3;
    stim[19] = 3'h1;
    stim[20] = 3'h2;
    stim[21] = 3'h2;
    stim[22] = 3'h2;
    stim[23] = 3'h0;
    stim[24] = 3'h2;
    stim[25] = 3'h3;
    stim[26] = 3'h0;
    stim[27] = 3'h1;
    stim[28] = 3'h0;
    stim[29] = 3'h2;
    stim[30] = 3'h1;
    stim[31] = 3'h3;
    stim[32] = 3'h3;
    stim[33] = 3'h2;
    stim[34] = 3'h3;
    stim[35] = 3'h0;
    stim[36] = 3'h0;
    stim[37] = 3'h2;
    stim[38] = 3'h2;
    stim[39] = 3'h0;
    stim[40] = 3'h2;
    stim[41] = 3'h0;
    stim[42] = 3'h1;
    stim[43] = 3'h3;
    stim[44] = 3'h2;
    stim[45] = 3'h1;
    stim[46] = 3'h3;
    stim[47] = 3'h2;
    stim[48] = 3'h0;
    stim[49] = 3'h3;
    stim[50] = 3'h2;
    stim[51] = 3'h1;
    stim[52] = 3'h3;
    stim[53] = 3'h4;
    stim[54] = 3'h3;
    stim[55] = 3'h2;
    stim[56] = 3'h1;
    stim[57] = 3'h1;
    stim[58] = 3'h3;
    stim[59] = 3'h0;
    stim[60] = 3'h0;
    stim[61] = 3'h1;
    stim[62] = 3'h2;
    stim[63] = 3'h3;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 28'h8000000;
      expv[1] = 28'h8000000;
      expv[2] = 28'h8000000;
      expv[3] = 28'h8000000;
      expv[4] = 28'h0000000;
      expv[5] = 28'h6000000;
      expv[6] = 28'h0000000;
      expv[7] = 28'h4000000;
      expv[8] = 28'h2000000;
      expv[9] = 28'h6000000;
      expv[10] = 28'h2000000;
      expv[11] = 28'h6000000;
      expv[12] = 28'h2000000;
      expv[13] = 28'h6000000;
      expv[14] = 28'h2010000;
      expv[15] = 28'h6020000;
      expv[16] = 28'h2040000;
      expv[17] = 28'h6080000;
      expv[18] = 28'h2110000;
      expv[19] = 28'h6230000;
      expv[20] = 28'h2470000;
      expv[21] = 28'h68e0000;
      expv[22] = 28'h21c0000;
      expv[23] = 28'h6380000;
      expv[24] = 28'h2700000;
      expv[25] = 28'h6e00000;
      expv[26] = 28'h2c10000;
      expv[27] = 28'h6820000;
      expv[28] = 28'h2050000;
      expv[29] = 28'hf050000;
      expv[30] = 28'h8050000;
      expv[31] = 28'h0050000;
      expv[32] = 28'h4050000;
      expv[33] = 28'h0050000;
      expv[34] = 28'h4050000;
      expv[35] = 28'h0050000;
      expv[36] = 28'h4050000;
      expv[37] = 28'h0050000;
      expv[38] = 28'h4050000;
      expv[39] = 28'h0050000;
      expv[40] = 28'h40a0000;
      expv[41] = 28'h0140000;
      expv[42] = 28'h4280000;
      expv[43] = 28'h0510000;
      expv[44] = 28'h4a30000;
      expv[45] = 28'h0460000;
      expv[46] = 28'h48d0000;
      expv[47] = 28'h01b0000;
      expv[48] = 28'h4360000;
      expv[49] = 28'h06c0000;
      expv[50] = 28'h4d90000;
      expv[51] = 28'h0b20000;
      expv[52] = 28'h4650000;
      expv[53] = 28'h8000000;
      expv[54] = 28'h8000000;
      expv[55] = 28'h8000000;
      expv[56] = 28'h0000000;
      expv[57] = 28'h6000000;
      expv[58] = 28'h0000000;
      expv[59] = 28'h4000000;
      expv[60] = 28'h2000000;
      expv[61] = 28'h6000000;
      expv[62] = 28'h2000000;
      expv[63] = 28'h6000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
