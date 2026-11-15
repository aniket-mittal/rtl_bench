// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07531 dut (
    .lfo_mod(in_vec[27:21]),
    .amsen(in_vec[20:20]),
    .ams(in_vec[19:18]),
    .tl(in_vec[17:11]),
    .eg_pure_in(in_vec[10:1]),
    .ssg_inv(in_vec[0:0]),
    .eg_limited(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hb065217;
    stim[1] = 28'h9a38e24;
    stim[2] = 28'h9b53df7;
    stim[3] = 28'h452b44e;
    stim[4] = 28'h1c19534;
    stim[5] = 28'h1f6b5ba;
    stim[6] = 28'h106264b;
    stim[7] = 28'h0671f5b;
    stim[8] = 28'h8099d57;
    stim[9] = 28'ha1469a6;
    stim[10] = 28'hb4587b8;
    stim[11] = 28'h2e57432;
    stim[12] = 28'h1a8a140;
    stim[13] = 28'h9fdb06d;
    stim[14] = 28'h97d64e6;
    stim[15] = 28'h5aeb96a;
    stim[16] = 28'hcab1efd;
    stim[17] = 28'he9d638f;
    stim[18] = 28'h6b87e7a;
    stim[19] = 28'h51ec45f;
    stim[20] = 28'hd0cb28e;
    stim[21] = 28'h7771dda;
    stim[22] = 28'h6caf5ce;
    stim[23] = 28'hfdb7be9;
    stim[24] = 28'h7562356;
    stim[25] = 28'hf176118;
    stim[26] = 28'hbf95fff;
    stim[27] = 28'h573f393;
    stim[28] = 28'h3cd1934;
    stim[29] = 28'h8cd8703;
    stim[30] = 28'h1b5633c;
    stim[31] = 28'h61aa29a;
    stim[32] = 28'hee00623;
    stim[33] = 28'h238acbd;
    stim[34] = 28'hc3e5a86;
    stim[35] = 28'hde188b5;
    stim[36] = 28'h8c28723;
    stim[37] = 28'had68609;
    stim[38] = 28'h085a21a;
    stim[39] = 28'h6d0aba0;
    stim[40] = 28'h831c48a;
    stim[41] = 28'h13715ac;
    stim[42] = 28'h5b71636;
    stim[43] = 28'he7c6847;
    stim[44] = 28'hba62c5a;
    stim[45] = 28'h7756b5e;
    stim[46] = 28'hc7542bf;
    stim[47] = 28'hbbf3296;
    stim[48] = 28'h828c581;
    stim[49] = 28'h196ee60;
    stim[50] = 28'hff4b185;
    stim[51] = 28'h9460415;
    stim[52] = 28'h691bd4b;
    stim[53] = 28'h1d1f4e5;
    stim[54] = 28'h32f897f;
    stim[55] = 28'hf8b8bd6;
    stim[56] = 28'h1345fee;
    stim[57] = 28'h22559d2;
    stim[58] = 28'h23094af;
    stim[59] = 28'h5ef0ae1;
    stim[60] = 28'h06db81d;
    stim[61] = 28'h5633f4c;
    stim[62] = 28'h7513419;
    stim[63] = 28'h214d643;
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
      expv[0] = 10'h345;
      expv[1] = 10'h3ff;
      expv[2] = 10'h3ff;
      expv[3] = 10'h3ff;
      expv[4] = 10'h3ff;
      expv[5] = 10'h3ff;
      expv[6] = 10'h3ff;
      expv[7] = 10'h3ff;
      expv[8] = 10'h3ff;
      expv[9] = 10'h146;
      expv[10] = 10'h3ff;
      expv[11] = 10'h389;
      expv[12] = 10'h140;
      expv[13] = 10'h3da;
      expv[14] = 10'h3ff;
      expv[15] = 10'h36d;
      expv[16] = 10'h3ff;
      expv[17] = 10'h1af;
      expv[18] = 10'h3ea;
      expv[19] = 10'h3ff;
      expv[20] = 10'h1f7;
      expv[21] = 10'h3ff;
      expv[22] = 10'h3ff;
      expv[23] = 10'h385;
      expv[24] = 10'h3d9;
      expv[25] = 10'h3ed;
      expv[26] = 10'h379;
      expv[27] = 10'h3ff;
      expv[28] = 10'h1b2;
      expv[29] = 10'h3ff;
      expv[30] = 10'h301;
      expv[31] = 10'h3ff;
      expv[32] = 10'h2ef;
      expv[33] = 10'h3ff;
      expv[34] = 10'h3d7;
      expv[35] = 10'h32e;
      expv[36] = 10'h3ff;
      expv[37] = 10'h3ff;
      expv[38] = 10'h2ad;
      expv[39] = 10'h278;
      expv[40] = 10'h3ff;
      expv[41] = 10'h3ff;
      expv[42] = 10'h3ff;
      expv[43] = 10'h25d;
      expv[44] = 10'h3ff;
      expv[45] = 10'h325;
      expv[46] = 10'h1e8;
      expv[47] = 10'h3ff;
      expv[48] = 10'h3ff;
      expv[49] = 10'h3ff;
      expv[50] = 10'h1ee;
      expv[51] = 10'h3ff;
      expv[52] = 10'h3ff;
      expv[53] = 10'h3ff;
      expv[54] = 10'h3ff;
      expv[55] = 10'h3ff;
      expv[56] = 10'h3ff;
      expv[57] = 10'h241;
      expv[58] = 10'h3ff;
      expv[59] = 10'h398;
      expv[60] = 10'h3aa;
      expv[61] = 10'h3ff;
      expv[62] = 10'h3ff;
      expv[63] = 10'h3b3;
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
