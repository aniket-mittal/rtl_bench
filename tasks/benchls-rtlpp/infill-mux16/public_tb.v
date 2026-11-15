// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Mux16 dut (
    .a(in_vec[32:17]),
    .b(in_vec[16:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h04a09ef4b;
    stim[1] = 33'h02364f99d;
    stim[2] = 33'h0f6456695;
    stim[3] = 33'h112180ca5;
    stim[4] = 33'h0f140e61c;
    stim[5] = 33'h1a63dcd55;
    stim[6] = 33'h1205440e2;
    stim[7] = 33'h0408d24e4;
    stim[8] = 33'h0860653ed;
    stim[9] = 33'h11f8a7bbf;
    stim[10] = 33'h117d5bf54;
    stim[11] = 33'h1e2f0af0d;
    stim[12] = 33'h1797f365c;
    stim[13] = 33'h0e4d45921;
    stim[14] = 33'h1869c803d;
    stim[15] = 33'h119ce820c;
    stim[16] = 33'h1c0edadd7;
    stim[17] = 33'h19019ab8b;
    stim[18] = 33'h1ae6bc2ca;
    stim[19] = 33'h1dc54127f;
    stim[20] = 33'h02f7ca4f5;
    stim[21] = 33'h073060d55;
    stim[22] = 33'h15fd133d6;
    stim[23] = 33'h1e4ee5532;
    stim[24] = 33'h1a74818c7;
    stim[25] = 33'h09998f40e;
    stim[26] = 33'h002e5256e;
    stim[27] = 33'h0ece31200;
    stim[28] = 33'h0932d25ac;
    stim[29] = 33'h007b5b0fa;
    stim[30] = 33'h18095089f;
    stim[31] = 33'h0024f83e9;
    stim[32] = 33'h1265065a0;
    stim[33] = 33'h19a4d7397;
    stim[34] = 33'h072ff704b;
    stim[35] = 33'h0b8cfb02d;
    stim[36] = 33'h0cbdbfadc;
    stim[37] = 33'h1920ed9c1;
    stim[38] = 33'h0e31b503d;
    stim[39] = 33'h02d47fe58;
    stim[40] = 33'h10ffcb7c1;
    stim[41] = 33'h1afe56ae0;
    stim[42] = 33'h0f0025da0;
    stim[43] = 33'h1a0911272;
    stim[44] = 33'h0171c0c3e;
    stim[45] = 33'h1c717ebfd;
    stim[46] = 33'h1a3795db2;
    stim[47] = 33'h1372485a8;
    stim[48] = 33'h0ed91a519;
    stim[49] = 33'h15ae84bd1;
    stim[50] = 33'h114ce1332;
    stim[51] = 33'h097cb5b82;
    stim[52] = 33'h19eae3104;
    stim[53] = 33'h16c54d692;
    stim[54] = 33'h0e463bebd;
    stim[55] = 33'h077213f5f;
    stim[56] = 33'h18d98c8f5;
    stim[57] = 33'h0c63baa0e;
    stim[58] = 33'h1a6d3dddb;
    stim[59] = 33'h1521df549;
    stim[60] = 33'h073889b44;
    stim[61] = 33'h0bb71e80b;
    stim[62] = 33'h181398ded;
    stim[63] = 33'h0ed94d974;
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
      expv[0] = 16'hf7a5;
      expv[1] = 16'h7cce;
      expv[2] = 16'hb34a;
      expv[3] = 16'h0652;
      expv[4] = 16'h78a0;
      expv[5] = 16'he6aa;
      expv[6] = 16'h902a;
      expv[7] = 16'h2046;
      expv[8] = 16'h29f6;
      expv[9] = 16'h3ddf;
      expv[10] = 16'h8bea;
      expv[11] = 16'h5786;
      expv[12] = 16'hbcbf;
      expv[13] = 16'h2c90;
      expv[14] = 16'h401e;
      expv[15] = 16'h8ce7;
      expv[16] = 16'hd6eb;
      expv[17] = 16'hd5c5;
      expv[18] = 16'hd735;
      expv[19] = 16'h093f;
      expv[20] = 16'h527a;
      expv[21] = 16'h06aa;
      expv[22] = 16'hafe8;
      expv[23] = 16'hf277;
      expv[24] = 16'h0c63;
      expv[25] = 16'h4ccc;
      expv[26] = 16'h0172;
      expv[27] = 16'h7671;
      expv[28] = 16'h4996;
      expv[29] = 16'h03da;
      expv[30] = 16'h844f;
      expv[31] = 16'hc1f4;
      expv[32] = 16'h9328;
      expv[33] = 16'hb9cb;
      expv[34] = 16'hb825;
      expv[35] = 16'hd816;
      expv[36] = 16'h65ed;
      expv[37] = 16'h6ce0;
      expv[38] = 16'ha81e;
      expv[39] = 16'h16a3;
      expv[40] = 16'h5be0;
      expv[41] = 16'hd7f2;
      expv[42] = 16'h7801;
      expv[43] = 16'hd048;
      expv[44] = 16'h0b8e;
      expv[45] = 16'hf5fe;
      expv[46] = 16'hd1bc;
      expv[47] = 16'h9b92;
      expv[48] = 16'hd28c;
      expv[49] = 16'h25e8;
      expv[50] = 16'h8a67;
      expv[51] = 16'h4be5;
      expv[52] = 16'hcf57;
      expv[53] = 16'hb62a;
      expv[54] = 16'hdf5e;
      expv[55] = 16'h9faf;
      expv[56] = 16'h647a;
      expv[57] = 16'h631d;
      expv[58] = 16'heeed;
      expv[59] = 16'hfaa4;
      expv[60] = 16'h39c4;
      expv[61] = 16'hf405;
      expv[62] = 16'hc6f6;
      expv[63] = 16'h76ca;
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
