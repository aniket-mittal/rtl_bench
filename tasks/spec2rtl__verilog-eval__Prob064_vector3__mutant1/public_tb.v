// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h29a9e8ce;
    stim[1] = 30'h0db2b13b;
    stim[2] = 30'h3086724e;
    stim[3] = 30'h02ad2ef3;
    stim[4] = 30'h24857d69;
    stim[5] = 30'h2cfcb51a;
    stim[6] = 30'h3b3699b3;
    stim[7] = 30'h3c4bff59;
    stim[8] = 30'h202f3e30;
    stim[9] = 30'h2bdcaa0c;
    stim[10] = 30'h3bdc2fa4;
    stim[11] = 30'h18c819b5;
    stim[12] = 30'h085766a3;
    stim[13] = 30'h0cd942c8;
    stim[14] = 30'h33de78c8;
    stim[15] = 30'h0a3a81a3;
    stim[16] = 30'h1372b53d;
    stim[17] = 30'h0a3aac76;
    stim[18] = 30'h00d48bc8;
    stim[19] = 30'h055357a3;
    stim[20] = 30'h228f0f31;
    stim[21] = 30'h38886fb7;
    stim[22] = 30'h1e890fd3;
    stim[23] = 30'h0eef71ed;
    stim[24] = 30'h0abd053c;
    stim[25] = 30'h08c2065b;
    stim[26] = 30'h29304dde;
    stim[27] = 30'h2225a43b;
    stim[28] = 30'h1a5a0b49;
    stim[29] = 30'h1569e666;
    stim[30] = 30'h1569890f;
    stim[31] = 30'h13a75e64;
    stim[32] = 30'h1739dfdc;
    stim[33] = 30'h13d7ca00;
    stim[34] = 30'h2ee58123;
    stim[35] = 30'h2085d330;
    stim[36] = 30'h1506b921;
    stim[37] = 30'h1d3e366d;
    stim[38] = 30'h1705059d;
    stim[39] = 30'h39fc1bcf;
    stim[40] = 30'h3f3a41b5;
    stim[41] = 30'h3bca6012;
    stim[42] = 30'h1215c1d3;
    stim[43] = 30'h3062008d;
    stim[44] = 30'h27d18272;
    stim[45] = 30'h2e1b20da;
    stim[46] = 30'h17f98b1e;
    stim[47] = 30'h168c7ff7;
    stim[48] = 30'h16a09644;
    stim[49] = 30'h06762e95;
    stim[50] = 30'h28ea39f9;
    stim[51] = 30'h16266857;
    stim[52] = 30'h2b90defc;
    stim[53] = 30'h34c84b78;
    stim[54] = 30'h3f98d9d2;
    stim[55] = 30'h13ae2289;
    stim[56] = 30'h24d480c2;
    stim[57] = 30'h123f407e;
    stim[58] = 30'h3ca226dc;
    stim[59] = 30'h3a4d8c88;
    stim[60] = 30'h2884e807;
    stim[61] = 30'h22fe20f8;
    stim[62] = 30'h189f8bbb;
    stim[63] = 30'h0fac7c40;
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
      expv[0] = 32'h2ea7a33b;
      expv[1] = 32'h66cac4ef;
      expv[2] = 32'h1a19c93b;
      expv[3] = 32'h82b4bbcf;
      expv[4] = 32'h4a15f5a7;
      expv[5] = 32'h6bf2d46b;
      expv[6] = 32'hbcda66cf;
      expv[7] = 32'h792ffd67;
      expv[8] = 32'h08bcf8c3;
      expv[9] = 32'haf72a833;
      expv[10] = 32'hbf70be93;
      expv[11] = 32'h332066d7;
      expv[12] = 32'h215d9a8f;
      expv[13] = 32'h63650b23;
      expv[14] = 32'h9f79e323;
      expv[15] = 32'ha0ea068f;
      expv[16] = 32'h95cad4f7;
      expv[17] = 32'ha0eab1db;
      expv[18] = 32'h03522f23;
      expv[19] = 32'h454d5e8f;
      expv[20] = 32'h8a3c3cc7;
      expv[21] = 32'h3a21bedf;
      expv[22] = 32'hf2243f4f;
      expv[23] = 32'he3bdc7b7;
      expv[24] = 32'ha2f414f3;
      expv[25] = 32'h2308196f;
      expv[26] = 32'h2cc1377b;
      expv[27] = 32'h889690ef;
      expv[28] = 32'hb1682d27;
      expv[29] = 32'h55a7999b;
      expv[30] = 32'h55a6243f;
      expv[31] = 32'h969d7993;
      expv[32] = 32'hd4e77f73;
      expv[33] = 32'h975f2803;
      expv[34] = 32'heb96048f;
      expv[35] = 32'h0a174cc3;
      expv[36] = 32'h541ae487;
      expv[37] = 32'h74f8d9b7;
      expv[38] = 32'hd4141677;
      expv[39] = 32'h3ff06f3f;
      expv[40] = 32'hfce906d7;
      expv[41] = 32'hbf29804b;
      expv[42] = 32'h9057074f;
      expv[43] = 32'h19880237;
      expv[44] = 32'hcf4609cb;
      expv[45] = 32'he86c836b;
      expv[46] = 32'hd7e62c7b;
      expv[47] = 32'hd231ffdf;
      expv[48] = 32'hd2825913;
      expv[49] = 32'hc1d8ba57;
      expv[50] = 32'h2ba8e7e7;
      expv[51] = 32'hd099a15f;
      expv[52] = 32'hae437bf3;
      expv[53] = 32'h5b212de3;
      expv[54] = 32'hfe63674b;
      expv[55] = 32'h96b88a27;
      expv[56] = 32'h4b52030b;
      expv[57] = 32'h90fd01fb;
      expv[58] = 32'h7a889b73;
      expv[59] = 32'hb9363223;
      expv[60] = 32'h2a13a01f;
      expv[61] = 32'h8bf883e3;
      expv[62] = 32'h327e2eef;
      expv[63] = 32'he6b1f103;
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
