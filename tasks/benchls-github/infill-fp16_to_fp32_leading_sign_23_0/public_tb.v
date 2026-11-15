// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  FP16_TO_FP32_leading_sign_23_0 dut (
    .mantissa(in_vec[22:0]),
    .rtn(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h46bc56;
    stim[1] = 23'h58e271;
    stim[2] = 23'h0414cd;
    stim[3] = 23'h18087e;
    stim[4] = 23'h56ef91;
    stim[5] = 23'h4d38db;
    stim[6] = 23'h31fad0;
    stim[7] = 23'h521a19;
    stim[8] = 23'h381173;
    stim[9] = 23'h678361;
    stim[10] = 23'h723267;
    stim[11] = 23'h216a09;
    stim[12] = 23'h6f855c;
    stim[13] = 23'h7edb1c;
    stim[14] = 23'h3135d3;
    stim[15] = 23'h4df54c;
    stim[16] = 23'h3da7a0;
    stim[17] = 23'h1086d8;
    stim[18] = 23'h041457;
    stim[19] = 23'h3bea69;
    stim[20] = 23'h3be172;
    stim[21] = 23'h2fc589;
    stim[22] = 23'h3268be;
    stim[23] = 23'h7af1cc;
    stim[24] = 23'h056d2b;
    stim[25] = 23'h2fc4d5;
    stim[26] = 23'h68035d;
    stim[27] = 23'h2392b8;
    stim[28] = 23'h770781;
    stim[29] = 23'h783452;
    stim[30] = 23'h62b6e6;
    stim[31] = 23'h493b64;
    stim[32] = 23'h67f608;
    stim[33] = 23'h209d9b;
    stim[34] = 23'h415eac;
    stim[35] = 23'h41382b;
    stim[36] = 23'h4013af;
    stim[37] = 23'h1b676b;
    stim[38] = 23'h28065e;
    stim[39] = 23'h7bf472;
    stim[40] = 23'h257083;
    stim[41] = 23'h4eeeda;
    stim[42] = 23'h181882;
    stim[43] = 23'h2ad4c4;
    stim[44] = 23'h0a398a;
    stim[45] = 23'h13e6ab;
    stim[46] = 23'h70d480;
    stim[47] = 23'h10f285;
    stim[48] = 23'h298c94;
    stim[49] = 23'h6f152b;
    stim[50] = 23'h282b2b;
    stim[51] = 23'h5990c1;
    stim[52] = 23'h4d2319;
    stim[53] = 23'h1e3806;
    stim[54] = 23'h200446;
    stim[55] = 23'h1a3955;
    stim[56] = 23'h51c7c7;
    stim[57] = 23'h72e7bf;
    stim[58] = 23'h3b822d;
    stim[59] = 23'h6062cf;
    stim[60] = 23'h512a5a;
    stim[61] = 23'h7facd6;
    stim[62] = 23'h5b0895;
    stim[63] = 23'h39a2ed;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h04;
      expv[3] = 5'h02;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h01;
      expv[7] = 5'h00;
      expv[8] = 5'h01;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h01;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h01;
      expv[15] = 5'h00;
      expv[16] = 5'h01;
      expv[17] = 5'h02;
      expv[18] = 5'h04;
      expv[19] = 5'h01;
      expv[20] = 5'h01;
      expv[21] = 5'h01;
      expv[22] = 5'h01;
      expv[23] = 5'h00;
      expv[24] = 5'h04;
      expv[25] = 5'h01;
      expv[26] = 5'h00;
      expv[27] = 5'h01;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h01;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h02;
      expv[38] = 5'h01;
      expv[39] = 5'h00;
      expv[40] = 5'h01;
      expv[41] = 5'h00;
      expv[42] = 5'h02;
      expv[43] = 5'h01;
      expv[44] = 5'h03;
      expv[45] = 5'h02;
      expv[46] = 5'h00;
      expv[47] = 5'h02;
      expv[48] = 5'h01;
      expv[49] = 5'h00;
      expv[50] = 5'h01;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h02;
      expv[54] = 5'h01;
      expv[55] = 5'h02;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h01;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h01;
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
