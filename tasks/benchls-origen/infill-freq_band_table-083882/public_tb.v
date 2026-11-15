// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083882 dut (
    .channels(in_vec[3:0]),
    .freq_upper_bound(out_vec[71:48]),
    .freq_lower_bound(out_vec[47:24]),
    .freq_center(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hb;
    stim[1] = 4'he;
    stim[2] = 4'h4;
    stim[3] = 4'h5;
    stim[4] = 4'h0;
    stim[5] = 4'h0;
    stim[6] = 4'h4;
    stim[7] = 4'hb;
    stim[8] = 4'h0;
    stim[9] = 4'ha;
    stim[10] = 4'h5;
    stim[11] = 4'he;
    stim[12] = 4'h9;
    stim[13] = 4'h0;
    stim[14] = 4'ha;
    stim[15] = 4'hf;
    stim[16] = 4'hb;
    stim[17] = 4'hd;
    stim[18] = 4'hd;
    stim[19] = 4'h3;
    stim[20] = 4'hd;
    stim[21] = 4'h2;
    stim[22] = 4'h5;
    stim[23] = 4'hf;
    stim[24] = 4'hf;
    stim[25] = 4'h7;
    stim[26] = 4'hc;
    stim[27] = 4'hc;
    stim[28] = 4'h6;
    stim[29] = 4'h3;
    stim[30] = 4'he;
    stim[31] = 4'h5;
    stim[32] = 4'h2;
    stim[33] = 4'hf;
    stim[34] = 4'hf;
    stim[35] = 4'h2;
    stim[36] = 4'h2;
    stim[37] = 4'hd;
    stim[38] = 4'h3;
    stim[39] = 4'h3;
    stim[40] = 4'h2;
    stim[41] = 4'h0;
    stim[42] = 4'h1;
    stim[43] = 4'ha;
    stim[44] = 4'ha;
    stim[45] = 4'hc;
    stim[46] = 4'h8;
    stim[47] = 4'he;
    stim[48] = 4'hb;
    stim[49] = 4'h7;
    stim[50] = 4'h4;
    stim[51] = 4'hc;
    stim[52] = 4'h9;
    stim[53] = 4'hc;
    stim[54] = 4'he;
    stim[55] = 4'ha;
    stim[56] = 4'he;
    stim[57] = 4'h9;
    stim[58] = 4'h9;
    stim[59] = 4'h9;
    stim[60] = 4'he;
    stim[61] = 4'hc;
    stim[62] = 4'hf;
    stim[63] = 4'hb;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 72'h7affd07afd407afe88;
      expv[1] = 72'h7bbfd07bbd407bbe88;
      expv[2] = 72'h793fd0793d40793e88;
      expv[3] = 72'h797fd0797d40797e88;
      expv[4] = 72'h783fd0783d40783e88;
      expv[5] = 72'h783fd0783d40783e88;
      expv[6] = 72'h793fd0793d40793e88;
      expv[7] = 72'h7affd07afd407afe88;
      expv[8] = 72'h783fd0783d40783e88;
      expv[9] = 72'h7abfd07abd407abe88;
      expv[10] = 72'h797fd0797d40797e88;
      expv[11] = 72'h7bbfd07bbd407bbe88;
      expv[12] = 72'h7a7fd07a7d407a7e88;
      expv[13] = 72'h783fd0783d40783e88;
      expv[14] = 72'h7abfd07abd407abe88;
      expv[15] = 72'h7bffd07bfd407bfe88;
      expv[16] = 72'h7affd07afd407afe88;
      expv[17] = 72'h7b7fd07b7d407b7e88;
      expv[18] = 72'h7b7fd07b7d407b7e88;
      expv[19] = 72'h78ffd078fd4078fe88;
      expv[20] = 72'h7b7fd07b7d407b7e88;
      expv[21] = 72'h78bfd078bd4078be88;
      expv[22] = 72'h797fd0797d40797e88;
      expv[23] = 72'h7bffd07bfd407bfe88;
      expv[24] = 72'h7bffd07bfd407bfe88;
      expv[25] = 72'h79ffd079fd4079fe88;
      expv[26] = 72'h7b3fd07b3d407b3e88;
      expv[27] = 72'h7b3fd07b3d407b3e88;
      expv[28] = 72'h79bfd079bd4079be88;
      expv[29] = 72'h78ffd078fd4078fe88;
      expv[30] = 72'h7bbfd07bbd407bbe88;
      expv[31] = 72'h797fd0797d40797e88;
      expv[32] = 72'h78bfd078bd4078be88;
      expv[33] = 72'h7bffd07bfd407bfe88;
      expv[34] = 72'h7bffd07bfd407bfe88;
      expv[35] = 72'h78bfd078bd4078be88;
      expv[36] = 72'h78bfd078bd4078be88;
      expv[37] = 72'h7b7fd07b7d407b7e88;
      expv[38] = 72'h78ffd078fd4078fe88;
      expv[39] = 72'h78ffd078fd4078fe88;
      expv[40] = 72'h78bfd078bd4078be88;
      expv[41] = 72'h783fd0783d40783e88;
      expv[42] = 72'h787fd0787d40787e88;
      expv[43] = 72'h7abfd07abd407abe88;
      expv[44] = 72'h7abfd07abd407abe88;
      expv[45] = 72'h7b3fd07b3d407b3e88;
      expv[46] = 72'h7a3fd07a3d407a3e88;
      expv[47] = 72'h7bbfd07bbd407bbe88;
      expv[48] = 72'h7affd07afd407afe88;
      expv[49] = 72'h79ffd079fd4079fe88;
      expv[50] = 72'h793fd0793d40793e88;
      expv[51] = 72'h7b3fd07b3d407b3e88;
      expv[52] = 72'h7a7fd07a7d407a7e88;
      expv[53] = 72'h7b3fd07b3d407b3e88;
      expv[54] = 72'h7bbfd07bbd407bbe88;
      expv[55] = 72'h7abfd07abd407abe88;
      expv[56] = 72'h7bbfd07bbd407bbe88;
      expv[57] = 72'h7a7fd07a7d407a7e88;
      expv[58] = 72'h7a7fd07a7d407a7e88;
      expv[59] = 72'h7a7fd07a7d407a7e88;
      expv[60] = 72'h7bbfd07bbd407bbe88;
      expv[61] = 72'h7b3fd07b3d407b3e88;
      expv[62] = 72'h7bffd07bfd407bfe88;
      expv[63] = 72'h7affd07afd407afe88;
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
