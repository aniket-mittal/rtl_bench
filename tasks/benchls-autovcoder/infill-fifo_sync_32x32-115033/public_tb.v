// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115033 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h235f70471a;
    stim[1] = 38'h38f6f053cc;
    stim[2] = 38'h17f7fd93b3;
    stim[3] = 38'h1e2ccd6520;
    stim[4] = 38'h01bdceef7d;
    stim[5] = 38'h044ee17321;
    stim[6] = 38'h18d735af06;
    stim[7] = 38'h1a8de13d86;
    stim[8] = 38'h0444856232;
    stim[9] = 38'h126626f29e;
    stim[10] = 38'h18d298c05a;
    stim[11] = 38'h0708c9cdb5;
    stim[12] = 38'h0d4b6bc305;
    stim[13] = 38'h0315ce3028;
    stim[14] = 38'h110b9db6d6;
    stim[15] = 38'h0f0049deb2;
    stim[16] = 38'h0a13022e44;
    stim[17] = 38'h0557f8c185;
    stim[18] = 38'h0380853078;
    stim[19] = 38'h0c7cfd22a6;
    stim[20] = 38'h1158cf4a23;
    stim[21] = 38'h16c5256cf4;
    stim[22] = 38'h18d21e6aa9;
    stim[23] = 38'h126a7095a8;
    stim[24] = 38'h1a076d7976;
    stim[25] = 38'h164361cec4;
    stim[26] = 38'h037635fd0c;
    stim[27] = 38'h1290a4c860;
    stim[28] = 38'h05d0111e73;
    stim[29] = 38'h06f44c99a8;
    stim[30] = 38'h1059e3c739;
    stim[31] = 38'h1cd6f6488b;
    stim[32] = 38'h0ffc38a34c;
    stim[33] = 38'h1392ce30aa;
    stim[34] = 38'h08222a39e0;
    stim[35] = 38'h0fc021929f;
    stim[36] = 38'h11c35076e7;
    stim[37] = 38'h0ac68bd7c9;
    stim[38] = 38'h1687adc45e;
    stim[39] = 38'h1cd2c7ca32;
    stim[40] = 38'h1e914ccade;
    stim[41] = 38'h36f80c277a;
    stim[42] = 38'h06056ec0e7;
    stim[43] = 38'h0e5fd16166;
    stim[44] = 38'h0565b10fcb;
    stim[45] = 38'h0ae7b7e7d4;
    stim[46] = 38'h15f863220c;
    stim[47] = 38'h1dafc88d20;
    stim[48] = 38'h189b22da9f;
    stim[49] = 38'h0d8970d7c1;
    stim[50] = 38'h1e6dd6db7d;
    stim[51] = 38'h10a36d41ba;
    stim[52] = 38'h149bce2795;
    stim[53] = 38'h2b9f9a1442;
    stim[54] = 38'h15ef0d0ae8;
    stim[55] = 38'h0e4e6cb00f;
    stim[56] = 38'h0815fad40c;
    stim[57] = 38'h1b7c9caf85;
    stim[58] = 38'h1785486196;
    stim[59] = 38'h1d8b464ae3;
    stim[60] = 38'h0c7228014f;
    stim[61] = 38'h0597386ee3;
    stim[62] = 38'h0a9c2433cf;
    stim[63] = 38'h09c8126167;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h38b335948;
      expv[8] = 34'h38b335948;
      expv[9] = 34'h38b335948;
      expv[10] = 34'h38b335948;
      expv[11] = 34'h38b335948;
      expv[12] = 34'h38b335948;
      expv[13] = 34'h38b335948;
      expv[14] = 34'h38b335948;
      expv[15] = 34'h38b335948;
      expv[16] = 34'h38b335948;
      expv[17] = 34'h38b335948;
      expv[18] = 34'h38b335948;
      expv[19] = 34'h38b335948;
      expv[20] = 34'h38b335948;
      expv[21] = 34'h28b335948;
      expv[22] = 34'h28b335948;
      expv[23] = 34'h28b335948;
      expv[24] = 34'h28b335948;
      expv[25] = 34'h28b335948;
      expv[26] = 34'h28b335948;
      expv[27] = 34'h28b335948;
      expv[28] = 34'h28b335948;
      expv[29] = 34'h28b335948;
      expv[30] = 34'h28b335948;
      expv[31] = 34'h28b335948;
      expv[32] = 34'h28b335948;
      expv[33] = 34'h28b335948;
      expv[34] = 34'h335bd9222;
      expv[35] = 34'h335bd9222;
      expv[36] = 34'h335bd9222;
      expv[37] = 34'h235bd9222;
      expv[38] = 34'h235bd9222;
      expv[39] = 34'h235bd9222;
      expv[40] = 34'h235bd9222;
      expv[41] = 34'h334b1f28c;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h36bf22348;
      expv[50] = 34'h36bf22348;
      expv[51] = 34'h36bf22348;
      expv[52] = 34'h36bf22348;
      expv[53] = 34'h36bf22348;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
