// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146681 dut (
    .measure_clk(clk),
    .reset_measure_clk_n(in_vec[10:10]),
    .mimic_recapture_debug_data(in_vec[9:9]),
    .mmc_seq_done(in_vec[8:8]),
    .mmc_seq_value(in_vec[7:0]),
    .debug_ram_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h3d7;
    stim[1] = 11'h252;
    stim[2] = 11'h66d;
    stim[3] = 11'h469;
    stim[4] = 11'h5e0;
    stim[5] = 11'h653;
    stim[6] = 11'h4f7;
    stim[7] = 11'h5fa;
    stim[8] = 11'h6a9;
    stim[9] = 11'h55a;
    stim[10] = 11'h6e0;
    stim[11] = 11'h484;
    stim[12] = 11'h65e;
    stim[13] = 11'h52b;
    stim[14] = 11'h760;
    stim[15] = 11'h558;
    stim[16] = 11'h750;
    stim[17] = 11'h4a8;
    stim[18] = 11'h6e9;
    stim[19] = 11'h699;
    stim[20] = 11'h50e;
    stim[21] = 11'h51d;
    stim[22] = 11'h7de;
    stim[23] = 11'h435;
    stim[24] = 11'h652;
    stim[25] = 11'h70b;
    stim[26] = 11'h70f;
    stim[27] = 11'h476;
    stim[28] = 11'h45a;
    stim[29] = 11'h48f;
    stim[30] = 11'h71b;
    stim[31] = 11'h432;
    stim[32] = 11'h6f8;
    stim[33] = 11'h52b;
    stim[34] = 11'h679;
    stim[35] = 11'h7ab;
    stim[36] = 11'h581;
    stim[37] = 11'h5ad;
    stim[38] = 11'h4d2;
    stim[39] = 11'h6f7;
    stim[40] = 11'h5fc;
    stim[41] = 11'h504;
    stim[42] = 11'h712;
    stim[43] = 11'h587;
    stim[44] = 11'h4d1;
    stim[45] = 11'h32b;
    stim[46] = 11'h68b;
    stim[47] = 11'h78a;
    stim[48] = 11'h4cf;
    stim[49] = 11'h47d;
    stim[50] = 11'h444;
    stim[51] = 11'h4cc;
    stim[52] = 11'h62f;
    stim[53] = 11'h461;
    stim[54] = 11'h409;
    stim[55] = 11'h45e;
    stim[56] = 11'h639;
    stim[57] = 11'h517;
    stim[58] = 11'h4fc;
    stim[59] = 11'h564;
    stim[60] = 11'h6b0;
    stim[61] = 11'h44f;
    stim[62] = 11'h6fa;
    stim[63] = 11'h4a8;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'he0;
      expv[9] = 8'he0;
      expv[10] = 8'hfa;
      expv[11] = 8'hfa;
      expv[12] = 8'hfa;
      expv[13] = 8'hfa;
      expv[14] = 8'h5a;
      expv[15] = 8'h2b;
      expv[16] = 8'h60;
      expv[17] = 8'h58;
      expv[18] = 8'h58;
      expv[19] = 8'h58;
      expv[20] = 8'h58;
      expv[21] = 8'h50;
      expv[22] = 8'h0e;
      expv[23] = 8'h1d;
      expv[24] = 8'h1d;
      expv[25] = 8'h1d;
      expv[26] = 8'hde;
      expv[27] = 8'h0b;
      expv[28] = 8'h0b;
      expv[29] = 8'h0b;
      expv[30] = 8'h0b;
      expv[31] = 8'h0f;
      expv[32] = 8'h0f;
      expv[33] = 8'h0f;
      expv[34] = 8'h1b;
      expv[35] = 8'h1b;
      expv[36] = 8'h2b;
      expv[37] = 8'hab;
      expv[38] = 8'h81;
      expv[39] = 8'h81;
      expv[40] = 8'h81;
      expv[41] = 8'had;
      expv[42] = 8'hfc;
      expv[43] = 8'h04;
      expv[44] = 8'h12;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h8a;
      expv[59] = 8'h8a;
      expv[60] = 8'h17;
      expv[61] = 8'h17;
      expv[62] = 8'h17;
      expv[63] = 8'h17;
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
