// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00474 dut (
    .x(in_vec[33:18]),
    .y(in_vec[17:2]),
    .ci(in_vec[1:1]),
    .s(in_vec[0:0]),
    .co(out_vec[16:16]),
    .z(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2aca38ba5;
    stim[1] = 34'h34d51eb2c;
    stim[2] = 34'h1810da5ae;
    stim[3] = 34'h31e003a29;
    stim[4] = 34'h34cfd6282;
    stim[5] = 34'h2d47cb8c3;
    stim[6] = 34'h2c358bf12;
    stim[7] = 34'h320be0204;
    stim[8] = 34'h2b87c764e;
    stim[9] = 34'h1351d2d6c;
    stim[10] = 34'h1b9efa6b5;
    stim[11] = 34'h36a495a57;
    stim[12] = 34'h1d57edbad;
    stim[13] = 34'h2b2688edb;
    stim[14] = 34'h33a34e2b5;
    stim[15] = 34'h27e9d2803;
    stim[16] = 34'h3a699661a;
    stim[17] = 34'h17a8cb12c;
    stim[18] = 34'h130827c68;
    stim[19] = 34'h18669d500;
    stim[20] = 34'h334473aea;
    stim[21] = 34'h25453ba60;
    stim[22] = 34'h15b3e62cf;
    stim[23] = 34'h0ebfc601f;
    stim[24] = 34'h22c28f623;
    stim[25] = 34'h0e6d8dacd;
    stim[26] = 34'h3a6091f71;
    stim[27] = 34'h3aa3ddf10;
    stim[28] = 34'h03335c913;
    stim[29] = 34'h16da09a78;
    stim[30] = 34'h34d564961;
    stim[31] = 34'h3cb746fcf;
    stim[32] = 34'h3e1d0bc13;
    stim[33] = 34'h0d7285e30;
    stim[34] = 34'h28bb26825;
    stim[35] = 34'h1533d9ece;
    stim[36] = 34'h3f27fa699;
    stim[37] = 34'h2c51d7553;
    stim[38] = 34'h1f32ba05b;
    stim[39] = 34'h294d51c4d;
    stim[40] = 34'h3e115c88d;
    stim[41] = 34'h0a0366a46;
    stim[42] = 34'h31ce5a5ff;
    stim[43] = 34'h30e63aa6b;
    stim[44] = 34'h2da900543;
    stim[45] = 34'h13091efed;
    stim[46] = 34'h23f779a11;
    stim[47] = 34'h1fa3f81d7;
    stim[48] = 34'h2210c2493;
    stim[49] = 34'h096e26bcc;
    stim[50] = 34'h1790d1acd;
    stim[51] = 34'h3ae4bfe2c;
    stim[52] = 34'h12d439e91;
    stim[53] = 34'h3fe7b4531;
    stim[54] = 34'h2df938bf8;
    stim[55] = 34'h06bf51fcd;
    stim[56] = 34'h30fa0b3b1;
    stim[57] = 34'h235a18f3e;
    stim[58] = 34'h3617e9b54;
    stim[59] = 34'h2f69a27c3;
    stim[60] = 34'h1f340e117;
    stim[61] = 34'h3af790491;
    stim[62] = 34'h2f97f13cd;
    stim[63] = 34'h15cf4e99c;
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
      expv[0] = 17'h08e11;
      expv[1] = 17'h14e1f;
      expv[2] = 17'h0c9af;
      expv[3] = 17'h1d60a;
      expv[4] = 17'h12be0;
      expv[5] = 17'h1e350;
      expv[6] = 17'h0e09b;
      expv[7] = 17'h148b0;
      expv[8] = 17'h0cbb3;
      expv[9] = 17'h098a2;
      expv[10] = 17'h05828;
      expv[11] = 17'h03128;
      expv[12] = 17'h02c4a;
      expv[13] = 17'h1d051;
      expv[14] = 17'h0073a;
      expv[15] = 17'h1e9a8;
      expv[16] = 17'h1432d;
      expv[17] = 17'h08aee;
      expv[18] = 17'h0eb3a;
      expv[19] = 17'h0d6da;
      expv[20] = 17'h19bcc;
      expv[21] = 17'h183ac;
      expv[22] = 17'h1ef83;
      expv[23] = 17'h15307;
      expv[24] = 17'h1c893;
      expv[25] = 17'h17069;
      expv[26] = 17'h0315e;
      expv[27] = 17'h16253;
      expv[28] = 17'h17f12;
      expv[29] = 17'h08206;
      expv[30] = 17'h065ad;
      expv[31] = 17'h00ed1;
      expv[32] = 17'h02779;
      expv[33] = 17'h04d56;
      expv[34] = 17'h03cf5;
      expv[35] = 17'h0bc83;
      expv[36] = 17'h0e645;
      expv[37] = 17'h00e9c;
      expv[38] = 17'h064e1;
      expv[39] = 17'h1ec48;
      expv[40] = 17'h06a68;
      expv[41] = 17'h0c29f;
      expv[42] = 17'h030b9;
      expv[43] = 17'h0ae33;
      expv[44] = 17'h1b7f5;
      expv[45] = 17'h1c81f;
      expv[46] = 17'h07661;
      expv[47] = 17'h05f05;
      expv[48] = 17'h19168;
      expv[49] = 17'h0c0ab;
      expv[50] = 17'h1a4f6;
      expv[51] = 17'h1eb1d;
      expv[52] = 17'h032f4;
      expv[53] = 17'h0d0ea;
      expv[54] = 17'h19ae2;
      expv[55] = 17'h162f0;
      expv[56] = 17'h1f0d4;
      expv[57] = 17'h0f138;
      expv[58] = 17'h17f34;
      expv[59] = 17'h04797;
      expv[60] = 17'h1b516;
      expv[61] = 17'h02d02;
      expv[62] = 17'h08352;
      expv[63] = 17'h091a4;
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
