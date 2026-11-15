// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07256 dut (
    .clk(clk),
    .rst(in_vec[29:29]),
    .config_valid(in_vec[28:28]),
    .config_low(in_vec[27:20]),
    .config_high(in_vec[19:12]),
    .config_chained(in_vec[11:10]),
    .input_valid(in_vec[9:9]),
    .input_char(in_vec[8:1]),
    .prev_matched(in_vec[0:0]),
    .this_matched(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3ba777da;
    stim[1] = 30'h303edf08;
    stim[2] = 30'h3c5fa73d;
    stim[3] = 30'h0da46d5e;
    stim[4] = 30'h14a218f2;
    stim[5] = 30'h036eac6b;
    stim[6] = 30'h07604ecd;
    stim[7] = 30'h13bc9bb6;
    stim[8] = 30'h14d9f94e;
    stim[9] = 30'h0178b744;
    stim[10] = 30'h04d1d007;
    stim[11] = 30'h1d64bcd6;
    stim[12] = 30'h1ffddfe4;
    stim[13] = 30'h1aca797a;
    stim[14] = 30'h0cdd3b54;
    stim[15] = 30'h0101e4eb;
    stim[16] = 30'h0fff7080;
    stim[17] = 30'h058110d4;
    stim[18] = 30'h075f89b2;
    stim[19] = 30'h142ac919;
    stim[20] = 30'h1de46bfd;
    stim[21] = 30'h11229fcc;
    stim[22] = 30'h1223c16c;
    stim[23] = 30'h00c3e50d;
    stim[24] = 30'h009baf80;
    stim[25] = 30'h1a24e51f;
    stim[26] = 30'h0c408f18;
    stim[27] = 30'h1bf59b9c;
    stim[28] = 30'h1562b569;
    stim[29] = 30'h12ac3ee4;
    stim[30] = 30'h09b0bdc7;
    stim[31] = 30'h159aeadf;
    stim[32] = 30'h1fefdadf;
    stim[33] = 30'h0f08eb51;
    stim[34] = 30'h0c806e67;
    stim[35] = 30'h1fe77636;
    stim[36] = 30'h11c9f057;
    stim[37] = 30'h1b1339ba;
    stim[38] = 30'h04ea9fca;
    stim[39] = 30'h0a2e4466;
    stim[40] = 30'h1f1c6690;
    stim[41] = 30'h1cd9aeb7;
    stim[42] = 30'h0d08e5ad;
    stim[43] = 30'h1ba6ef6b;
    stim[44] = 30'h0f786e2c;
    stim[45] = 30'h16efeb62;
    stim[46] = 30'h1efcc5fa;
    stim[47] = 30'h1d503d5b;
    stim[48] = 30'h1ff0e40b;
    stim[49] = 30'h0b324381;
    stim[50] = 30'h0d5c0e1c;
    stim[51] = 30'h1f428fc3;
    stim[52] = 30'h0b7c957f;
    stim[53] = 30'h029eb2af;
    stim[54] = 30'h168223dc;
    stim[55] = 30'h0b5fc0ff;
    stim[56] = 30'h00121677;
    stim[57] = 30'h0cbd537c;
    stim[58] = 30'h083593b8;
    stim[59] = 30'h1ebdb446;
    stim[60] = 30'h0acd335c;
    stim[61] = 30'h1ffb5e35;
    stim[62] = 30'h13cfd469;
    stim[63] = 30'h034099fe;
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
      expv[0] = 1'hx;
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
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
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
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
