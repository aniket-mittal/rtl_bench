// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  add dut (
    .a(in_vec[31:16]),
    .b(in_vec[15:0]),
    .overflow(out_vec[16:16]),
    .sum(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h5fc75fba;
    stim[1] = 32'hc51cdef8;
    stim[2] = 32'h5486ace2;
    stim[3] = 32'h3963e3b0;
    stim[4] = 32'h2ec0a6d1;
    stim[5] = 32'hce47d3fa;
    stim[6] = 32'h805054f3;
    stim[7] = 32'hb58f30e1;
    stim[8] = 32'hdc64263f;
    stim[9] = 32'hff1ce9be;
    stim[10] = 32'h7f5604e5;
    stim[11] = 32'hccd55a76;
    stim[12] = 32'hd90ed215;
    stim[13] = 32'hf18813c9;
    stim[14] = 32'h370bb051;
    stim[15] = 32'hd4046b7a;
    stim[16] = 32'h13718bdb;
    stim[17] = 32'h1b02c665;
    stim[18] = 32'hd2872b4e;
    stim[19] = 32'h23787050;
    stim[20] = 32'h19933fb3;
    stim[21] = 32'h0ceddbb7;
    stim[22] = 32'h592e3485;
    stim[23] = 32'h30d50405;
    stim[24] = 32'h08314d79;
    stim[25] = 32'hfe9cc33a;
    stim[26] = 32'hc1e1a3e9;
    stim[27] = 32'he16e31e4;
    stim[28] = 32'h5b82ee34;
    stim[29] = 32'hf84e29f8;
    stim[30] = 32'had17b609;
    stim[31] = 32'h0930bf1b;
    stim[32] = 32'ha423b147;
    stim[33] = 32'h7168224b;
    stim[34] = 32'h35015997;
    stim[35] = 32'h6183ca03;
    stim[36] = 32'heac73668;
    stim[37] = 32'hfb027245;
    stim[38] = 32'h9ab1c0af;
    stim[39] = 32'h1daf750a;
    stim[40] = 32'hcf2f6c61;
    stim[41] = 32'hc1b6976c;
    stim[42] = 32'hb3c1a782;
    stim[43] = 32'h73e7fa99;
    stim[44] = 32'h584e43d4;
    stim[45] = 32'h4210039f;
    stim[46] = 32'h78cc340a;
    stim[47] = 32'h00dda92e;
    stim[48] = 32'hf9af5843;
    stim[49] = 32'h8dbfb16f;
    stim[50] = 32'h314daac6;
    stim[51] = 32'ha864dbf6;
    stim[52] = 32'h0e77b538;
    stim[53] = 32'h11877a80;
    stim[54] = 32'h37fa5b66;
    stim[55] = 32'h82bce528;
    stim[56] = 32'h050d0ad5;
    stim[57] = 32'h5f22c07e;
    stim[58] = 32'hf039a56e;
    stim[59] = 32'h9cf9e159;
    stim[60] = 32'hb084ad75;
    stim[61] = 32'hba10a5bb;
    stim[62] = 32'h0d2bbfac;
    stim[63] = 32'hf8838080;
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
      expv[0] = 17'h0bf81;
      expv[1] = 17'h1a414;
      expv[2] = 17'h10168;
      expv[3] = 17'h11d13;
      expv[4] = 17'h0d591;
      expv[5] = 17'h1a241;
      expv[6] = 17'h0d543;
      expv[7] = 17'h0e670;
      expv[8] = 17'h102a3;
      expv[9] = 17'h1e8da;
      expv[10] = 17'h0843b;
      expv[11] = 17'h1274b;
      expv[12] = 17'h1ab23;
      expv[13] = 17'h10551;
      expv[14] = 17'h0e75c;
      expv[15] = 17'h13f7e;
      expv[16] = 17'h09f4c;
      expv[17] = 17'h0e167;
      expv[18] = 17'h0fdd5;
      expv[19] = 17'h093c8;
      expv[20] = 17'h05946;
      expv[21] = 17'h0e8a4;
      expv[22] = 17'h08db3;
      expv[23] = 17'h034da;
      expv[24] = 17'h055aa;
      expv[25] = 17'h1c1d6;
      expv[26] = 17'h165ca;
      expv[27] = 17'h11352;
      expv[28] = 17'h149b6;
      expv[29] = 17'h12246;
      expv[30] = 17'h16320;
      expv[31] = 17'h0c84b;
      expv[32] = 17'h1556a;
      expv[33] = 17'h093b3;
      expv[34] = 17'h08e98;
      expv[35] = 17'h12b86;
      expv[36] = 17'h1212f;
      expv[37] = 17'h16d47;
      expv[38] = 17'h15b60;
      expv[39] = 17'h092b9;
      expv[40] = 17'h13b90;
      expv[41] = 17'h15922;
      expv[42] = 17'h15b43;
      expv[43] = 17'h16e80;
      expv[44] = 17'h09c22;
      expv[45] = 17'h045af;
      expv[46] = 17'h0acd6;
      expv[47] = 17'h0aa0b;
      expv[48] = 17'h151f2;
      expv[49] = 17'h13f2e;
      expv[50] = 17'h0dc13;
      expv[51] = 17'h1845a;
      expv[52] = 17'h0c3af;
      expv[53] = 17'h08c07;
      expv[54] = 17'h09360;
      expv[55] = 17'h167e4;
      expv[56] = 17'h00fe2;
      expv[57] = 17'h11fa0;
      expv[58] = 17'h195a7;
      expv[59] = 17'h17e52;
      expv[60] = 17'h15df9;
      expv[61] = 17'h15fcb;
      expv[62] = 17'h0ccd7;
      expv[63] = 17'h17903;
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
