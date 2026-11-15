// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015360 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .enb(in_vec[16:16]),
    .min_Index(in_vec[15:8]),
    .Index(in_vec[7:0]),
    .Out1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h26663;
    stim[1] = 18'h3f084;
    stim[2] = 18'h1fd4f;
    stim[3] = 18'h0fdfe;
    stim[4] = 18'h10c5c;
    stim[5] = 18'h001b0;
    stim[6] = 18'h22676;
    stim[7] = 18'h0df6a;
    stim[8] = 18'h05f81;
    stim[9] = 18'h09814;
    stim[10] = 18'h1fa98;
    stim[11] = 18'h1b7a1;
    stim[12] = 18'h0f9f1;
    stim[13] = 18'h1a8c4;
    stim[14] = 18'h026aa;
    stim[15] = 18'h045d1;
    stim[16] = 18'h19de6;
    stim[17] = 18'h10773;
    stim[18] = 18'h03840;
    stim[19] = 18'h0490c;
    stim[20] = 18'h06912;
    stim[21] = 18'h0443a;
    stim[22] = 18'h178fd;
    stim[23] = 18'h02f22;
    stim[24] = 18'h0c15f;
    stim[25] = 18'h12f83;
    stim[26] = 18'h1425c;
    stim[27] = 18'h0a14e;
    stim[28] = 18'h0ec21;
    stim[29] = 18'h124f6;
    stim[30] = 18'h01978;
    stim[31] = 18'h0b94b;
    stim[32] = 18'h06b11;
    stim[33] = 18'h0998d;
    stim[34] = 18'h0aa5d;
    stim[35] = 18'h1bb73;
    stim[36] = 18'h0913a;
    stim[37] = 18'h2f439;
    stim[38] = 18'h04494;
    stim[39] = 18'h0addf;
    stim[40] = 18'h0c63f;
    stim[41] = 18'h0c1a6;
    stim[42] = 18'h0974b;
    stim[43] = 18'h1bb3a;
    stim[44] = 18'h1d16d;
    stim[45] = 18'h1a1da;
    stim[46] = 18'h11ff2;
    stim[47] = 18'h147ef;
    stim[48] = 18'h0e614;
    stim[49] = 18'h0ea24;
    stim[50] = 18'h000ac;
    stim[51] = 18'h0a543;
    stim[52] = 18'h028b2;
    stim[53] = 18'h1677c;
    stim[54] = 18'h09984;
    stim[55] = 18'h03a77;
    stim[56] = 18'h18405;
    stim[57] = 18'h18649;
    stim[58] = 18'h0564e;
    stim[59] = 18'h076de;
    stim[60] = 18'h12cbd;
    stim[61] = 18'h01c6b;
    stim[62] = 18'h05821;
    stim[63] = 18'h0fce3;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
