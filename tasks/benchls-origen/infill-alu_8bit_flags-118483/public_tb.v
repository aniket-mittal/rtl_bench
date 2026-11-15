// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118483 dut (
    .a(in_vec[21:14]),
    .b(in_vec[13:6]),
    .fun(in_vec[5:1]),
    .cin(in_vec[0:0]),
    .result(out_vec[9:2]),
    .zero(out_vec[1:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h18d886;
    stim[1] = 22'h1a0606;
    stim[2] = 22'h3df3ba;
    stim[3] = 22'h1ee8bd;
    stim[4] = 22'h094f6b;
    stim[5] = 22'h1f9371;
    stim[6] = 22'h37855c;
    stim[7] = 22'h20e9a1;
    stim[8] = 22'h11ebd5;
    stim[9] = 22'h2159a5;
    stim[10] = 22'h04ac09;
    stim[11] = 22'h10b7f9;
    stim[12] = 22'h0a7640;
    stim[13] = 22'h05677a;
    stim[14] = 22'h1e0ffe;
    stim[15] = 22'h1889a9;
    stim[16] = 22'h2e37cf;
    stim[17] = 22'h054952;
    stim[18] = 22'h142770;
    stim[19] = 22'h2a0669;
    stim[20] = 22'h17634f;
    stim[21] = 22'h0b89df;
    stim[22] = 22'h03f6e9;
    stim[23] = 22'h096555;
    stim[24] = 22'h0f7aa2;
    stim[25] = 22'h04324d;
    stim[26] = 22'h2b2a7a;
    stim[27] = 22'h07c048;
    stim[28] = 22'h3e2641;
    stim[29] = 22'h22a002;
    stim[30] = 22'h10975d;
    stim[31] = 22'h3a5688;
    stim[32] = 22'h1a469b;
    stim[33] = 22'h125492;
    stim[34] = 22'h353958;
    stim[35] = 22'h1fcf52;
    stim[36] = 22'h26ca12;
    stim[37] = 22'h32c054;
    stim[38] = 22'h32e176;
    stim[39] = 22'h367320;
    stim[40] = 22'h0d42fa;
    stim[41] = 22'h0e3e77;
    stim[42] = 22'h0a9d4e;
    stim[43] = 22'h331d93;
    stim[44] = 22'h08fed6;
    stim[45] = 22'h0f447c;
    stim[46] = 22'h1cace3;
    stim[47] = 22'h1c0b3d;
    stim[48] = 22'h091ab8;
    stim[49] = 22'h0b7e31;
    stim[50] = 22'h195e64;
    stim[51] = 22'h3595cf;
    stim[52] = 22'h3ce87a;
    stim[53] = 22'h3a330c;
    stim[54] = 22'h0e9903;
    stim[55] = 22'h159ec8;
    stim[56] = 22'h0ffc87;
    stim[57] = 22'h27ba97;
    stim[58] = 22'h390e26;
    stim[59] = 22'h043f50;
    stim[60] = 22'h397a09;
    stim[61] = 22'h15b265;
    stim[62] = 22'h1a0d9d;
    stim[63] = 22'h3d26a4;
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
      expv[0] = 10'h004;
      expv[1] = 10'h140;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h002;
      expv[5] = 10'h002;
      expv[6] = 10'h2f5;
      expv[7] = 10'h002;
      expv[8] = 10'h25d;
      expv[9] = 10'h002;
      expv[10] = 10'h040;
      expv[11] = 10'h002;
      expv[12] = 10'h009;
      expv[13] = 10'h002;
      expv[14] = 10'h002;
      expv[15] = 10'h002;
      expv[16] = 10'h19c;
      expv[17] = 10'h0e8;
      expv[18] = 10'h002;
      expv[19] = 10'h002;
      expv[20] = 10'h3c8;
      expv[21] = 10'h05c;
      expv[22] = 10'h002;
      expv[23] = 10'h23d;
      expv[24] = 10'h002;
      expv[25] = 10'h364;
      expv[26] = 10'h002;
      expv[27] = 10'h004;
      expv[28] = 10'h249;
      expv[29] = 10'h029;
      expv[30] = 10'h210;
      expv[31] = 10'h120;
      expv[32] = 10'h0d1;
      expv[33] = 10'h26c;
      expv[34] = 10'h2a1;
      expv[35] = 10'h2f0;
      expv[36] = 10'h30c;
      expv[37] = 10'h328;
      expv[38] = 10'h002;
      expv[39] = 10'h002;
      expv[40] = 10'h002;
      expv[41] = 10'h002;
      expv[42] = 10'h37c;
      expv[43] = 10'h109;
      expv[44] = 10'h0a1;
      expv[45] = 10'h002;
      expv[46] = 10'h002;
      expv[47] = 10'h002;
      expv[48] = 10'h002;
      expv[49] = 10'h002;
      expv[50] = 10'h002;
      expv[51] = 10'h2a4;
      expv[52] = 10'h002;
      expv[53] = 10'h090;
      expv[54] = 10'h278;
      expv[55] = 10'h148;
      expv[56] = 10'h135;
      expv[57] = 10'h2d1;
      expv[58] = 10'h002;
      expv[59] = 10'h035;
      expv[60] = 10'h380;
      expv[61] = 10'h002;
      expv[62] = 10'h340;
      expv[63] = 10'h002;
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
