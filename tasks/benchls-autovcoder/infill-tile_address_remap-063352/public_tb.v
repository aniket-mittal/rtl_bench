// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063352 dut (
    .tile(in_vec[25:6]),
    .C_LATCH(in_vec[5:2]),
    .map_code(in_vec[1:0]),
    .CROM_ADDR(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h3bebd97;
    stim[1] = 26'h0c3726c;
    stim[2] = 26'h0697e26;
    stim[3] = 26'h2a1814f;
    stim[4] = 26'h0a79f64;
    stim[5] = 26'h1985492;
    stim[6] = 26'h3aaa829;
    stim[7] = 26'h2d0fe7c;
    stim[8] = 26'h15224f8;
    stim[9] = 26'h2010a33;
    stim[10] = 26'h29b8903;
    stim[11] = 26'h35ba535;
    stim[12] = 26'h0278c00;
    stim[13] = 26'h2183df7;
    stim[14] = 26'h38b6905;
    stim[15] = 26'h00afa21;
    stim[16] = 26'h0f7763f;
    stim[17] = 26'h11674e8;
    stim[18] = 26'h2a8b82e;
    stim[19] = 26'h31f2bbb;
    stim[20] = 26'h2bb2225;
    stim[21] = 26'h11612c6;
    stim[22] = 26'h0eb9e47;
    stim[23] = 26'h3ac2640;
    stim[24] = 26'h2d9cdb1;
    stim[25] = 26'h29f0070;
    stim[26] = 26'h2df2159;
    stim[27] = 26'h3994d25;
    stim[28] = 26'h24cc571;
    stim[29] = 26'h076e937;
    stim[30] = 26'h0bccef0;
    stim[31] = 26'h098bc40;
    stim[32] = 26'h2e00121;
    stim[33] = 26'h355e3a5;
    stim[34] = 26'h0adb24d;
    stim[35] = 26'h286fd8b;
    stim[36] = 26'h2472f0d;
    stim[37] = 26'h34fbeca;
    stim[38] = 26'h04e8adb;
    stim[39] = 26'h2139766;
    stim[40] = 26'h25b4b6c;
    stim[41] = 26'h28edf7a;
    stim[42] = 26'h04cbd2c;
    stim[43] = 26'h2fd9a6c;
    stim[44] = 26'h00bdbaf;
    stim[45] = 26'h3b03888;
    stim[46] = 26'h34b025f;
    stim[47] = 26'h2601df2;
    stim[48] = 26'h2d453fa;
    stim[49] = 26'h3350cba;
    stim[50] = 26'h07ae605;
    stim[51] = 26'h2d0e217;
    stim[52] = 26'h33fb88e;
    stim[53] = 26'h14ae5cc;
    stim[54] = 26'h187119a;
    stim[55] = 26'h3396d95;
    stim[56] = 26'h113d794;
    stim[57] = 26'h19959f9;
    stim[58] = 26'h34d62fe;
    stim[59] = 26'h0dcfb1c;
    stim[60] = 26'h1ca07a6;
    stim[61] = 26'h194cdb0;
    stim[62] = 26'h3067218;
    stim[63] = 26'h27cc376;
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
      expv[0] = 25'h1fd7b28;
      expv[1] = 25'h006e4d8;
      expv[2] = 25'h152fc48;
      expv[3] = 25'h1c30298;
      expv[4] = 25'h1cf3ec8;
      expv[5] = 25'h170a920;
      expv[6] = 25'h1d55050;
      expv[7] = 25'h021fcf8;
      expv[8] = 25'h12449f0;
      expv[9] = 25'h0821460;
      expv[10] = 25'h1b71200;
      expv[11] = 25'h1374a68;
      expv[12] = 25'h0cf1800;
      expv[13] = 25'h0b07be8;
      expv[14] = 25'h196d208;
      expv[15] = 25'h095f440;
      expv[16] = 25'h1eeec78;
      expv[17] = 25'h0ace9d0;
      expv[18] = 25'h1917058;
      expv[19] = 25'h0be5770;
      expv[20] = 25'h1f64448;
      expv[21] = 25'h0ac2588;
      expv[22] = 25'h1d73c88;
      expv[23] = 25'h1d84c80;
      expv[24] = 25'h1f39b60;
      expv[25] = 25'h1be00e0;
      expv[26] = 25'h1fe42b0;
      expv[27] = 25'h1b29a48;
      expv[28] = 25'h1198ae0;
      expv[29] = 25'h12dd268;
      expv[30] = 25'h1f99de0;
      expv[31] = 25'h1b17880;
      expv[32] = 25'h0000240;
      expv[33] = 25'h12bc748;
      expv[34] = 25'h1db6498;
      expv[35] = 25'h18dfb10;
      expv[36] = 25'h10e5e18;
      expv[37] = 25'h11f7d90;
      expv[38] = 25'h0dd15b0;
      expv[39] = 25'h0a72ec8;
      expv[40] = 25'h13696d8;
      expv[41] = 25'h15dbef0;
      expv[42] = 25'h1197a58;
      expv[43] = 25'h07b34d8;
      expv[44] = 25'h097b758;
      expv[45] = 25'h1e07110;
      expv[46] = 25'h0d604b8;
      expv[47] = 25'h1403be0;
      expv[48] = 25'h1a8a7f0;
      expv[49] = 25'h0ea1970;
      expv[50] = 25'h175cc08;
      expv[51] = 25'h1a1c428;
      expv[52] = 25'h0ff7118;
      expv[53] = 25'h115cb98;
      expv[54] = 25'h14e2330;
      expv[55] = 25'h0f2db28;
      expv[56] = 25'h0a7af28;
      expv[57] = 25'h1b2b3f0;
      expv[58] = 25'h11ac5f8;
      expv[59] = 25'h039f638;
      expv[60] = 25'h1940f48;
      expv[61] = 25'h1a99b60;
      expv[62] = 25'h08ce430;
      expv[63] = 25'h17986e8;
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
