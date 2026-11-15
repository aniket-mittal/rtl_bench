// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065503 dut (
    .clk(clk),
    .rst_n(in_vec[4:4]),
    .r_sr_hip_en(in_vec[3:3]),
    .r_sr_parity_en(in_vec[2:2]),
    .r_sr_reserbits_in_en(in_vec[1:1]),
    .avmm_hrdrst_fabric_osc_transfer_en_sync(in_vec[0:0]),
    .sr_sm_testbus(out_vec[12:1]),
    .sr_loadout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0b;
    stim[1] = 5'h09;
    stim[2] = 5'h14;
    stim[3] = 5'h12;
    stim[4] = 5'h1e;
    stim[5] = 5'h1a;
    stim[6] = 5'h1b;
    stim[7] = 5'h18;
    stim[8] = 5'h16;
    stim[9] = 5'h1a;
    stim[10] = 5'h1e;
    stim[11] = 5'h12;
    stim[12] = 5'h15;
    stim[13] = 5'h19;
    stim[14] = 5'h19;
    stim[15] = 5'h14;
    stim[16] = 5'h1a;
    stim[17] = 5'h1e;
    stim[18] = 5'h1d;
    stim[19] = 5'h12;
    stim[20] = 5'h1f;
    stim[21] = 5'h14;
    stim[22] = 5'h19;
    stim[23] = 5'h15;
    stim[24] = 5'h11;
    stim[25] = 5'h19;
    stim[26] = 5'h1a;
    stim[27] = 5'h1d;
    stim[28] = 5'h1c;
    stim[29] = 5'h19;
    stim[30] = 5'h1b;
    stim[31] = 5'h10;
    stim[32] = 5'h14;
    stim[33] = 5'h15;
    stim[34] = 5'h1f;
    stim[35] = 5'h17;
    stim[36] = 5'h18;
    stim[37] = 5'h12;
    stim[38] = 5'h19;
    stim[39] = 5'h08;
    stim[40] = 5'h15;
    stim[41] = 5'h15;
    stim[42] = 5'h11;
    stim[43] = 5'h1b;
    stim[44] = 5'h1d;
    stim[45] = 5'h13;
    stim[46] = 5'h13;
    stim[47] = 5'h1a;
    stim[48] = 5'h1a;
    stim[49] = 5'h13;
    stim[50] = 5'h1e;
    stim[51] = 5'h1a;
    stim[52] = 5'h1b;
    stim[53] = 5'h1a;
    stim[54] = 5'h14;
    stim[55] = 5'h1e;
    stim[56] = 5'h1a;
    stim[57] = 5'h1a;
    stim[58] = 5'h1d;
    stim[59] = 5'h19;
    stim[60] = 5'h19;
    stim[61] = 5'h17;
    stim[62] = 5'h19;
    stim[63] = 5'h19;
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
      expv[0] = 13'h0c01;
      expv[1] = 13'h0c01;
      expv[2] = 13'h0401;
      expv[3] = 13'h0401;
      expv[4] = 13'h0401;
      expv[5] = 13'h0401;
      expv[6] = 13'h0c01;
      expv[7] = 13'h0101;
      expv[8] = 13'h0403;
      expv[9] = 13'h0401;
      expv[10] = 13'h0401;
      expv[11] = 13'h0401;
      expv[12] = 13'h0c01;
      expv[13] = 13'h0901;
      expv[14] = 13'h0902;
      expv[15] = 13'h0104;
      expv[16] = 13'h0407;
      expv[17] = 13'h0401;
      expv[18] = 13'h0c01;
      expv[19] = 13'h0101;
      expv[20] = 13'h0c03;
      expv[21] = 13'h0101;
      expv[22] = 13'h0c03;
      expv[23] = 13'h0901;
      expv[24] = 13'h0902;
      expv[25] = 13'h0904;
      expv[26] = 13'h0106;
      expv[27] = 13'h0c09;
      expv[28] = 13'h0101;
      expv[29] = 13'h0c03;
      expv[30] = 13'h0901;
      expv[31] = 13'h0102;
      expv[32] = 13'h0405;
      expv[33] = 13'h0c01;
      expv[34] = 13'h0901;
      expv[35] = 13'h0902;
      expv[36] = 13'h0104;
      expv[37] = 13'h0407;
      expv[38] = 13'h0c01;
      expv[39] = 13'h0401;
      expv[40] = 13'h0c01;
      expv[41] = 13'h0901;
      expv[42] = 13'h0902;
      expv[43] = 13'h0904;
      expv[44] = 13'h0906;
      expv[45] = 13'h0908;
      expv[46] = 13'h090a;
      expv[47] = 13'h010c;
      expv[48] = 13'h040f;
      expv[49] = 13'h0c01;
      expv[50] = 13'h0101;
      expv[51] = 13'h0403;
      expv[52] = 13'h0c01;
      expv[53] = 13'h0101;
      expv[54] = 13'h0403;
      expv[55] = 13'h0401;
      expv[56] = 13'h0401;
      expv[57] = 13'h0401;
      expv[58] = 13'h0c01;
      expv[59] = 13'h0901;
      expv[60] = 13'h0902;
      expv[61] = 13'h0904;
      expv[62] = 13'h0906;
      expv[63] = 13'h0908;
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
