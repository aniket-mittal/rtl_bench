// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02909 dut (
    .x(in_vec[31:0]),
    .y(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h6dd09d87;
    stim[1] = 32'hc71b1860;
    stim[2] = 32'h139f2481;
    stim[3] = 32'he61c8d63;
    stim[4] = 32'h5363614e;
    stim[5] = 32'ha1159416;
    stim[6] = 32'hf986ab3c;
    stim[7] = 32'he22bf1e9;
    stim[8] = 32'h2b41207c;
    stim[9] = 32'hbd106004;
    stim[10] = 32'hb01e7e19;
    stim[11] = 32'h61236f11;
    stim[12] = 32'hbc0795ff;
    stim[13] = 32'h289c9d44;
    stim[14] = 32'he39ba010;
    stim[15] = 32'h8d43809b;
    stim[16] = 32'hd6692411;
    stim[17] = 32'hfd59d2cd;
    stim[18] = 32'h343e0cce;
    stim[19] = 32'h0533adea;
    stim[20] = 32'h75dd11ed;
    stim[21] = 32'h36ecdc4a;
    stim[22] = 32'h356044b1;
    stim[23] = 32'h512e108f;
    stim[24] = 32'h4a778b6e;
    stim[25] = 32'h4f3c1d9a;
    stim[26] = 32'h58090205;
    stim[27] = 32'h813f4c56;
    stim[28] = 32'h718b6669;
    stim[29] = 32'h911a2234;
    stim[30] = 32'h69af17fd;
    stim[31] = 32'hce9f4bec;
    stim[32] = 32'h3f26835b;
    stim[33] = 32'h9b95e332;
    stim[34] = 32'hd2927cde;
    stim[35] = 32'h6242d50b;
    stim[36] = 32'h5398ff3a;
    stim[37] = 32'hf2589356;
    stim[38] = 32'hd9f840ae;
    stim[39] = 32'hdf686a02;
    stim[40] = 32'ha40480bd;
    stim[41] = 32'h3d2e4bbf;
    stim[42] = 32'h6670d7a0;
    stim[43] = 32'he4002d7d;
    stim[44] = 32'h93e88fdb;
    stim[45] = 32'hf26348b2;
    stim[46] = 32'h3ec0c462;
    stim[47] = 32'heb4ec612;
    stim[48] = 32'h3b1a5925;
    stim[49] = 32'hfcde523b;
    stim[50] = 32'h2d40bde8;
    stim[51] = 32'hd11c7aeb;
    stim[52] = 32'hc7e41196;
    stim[53] = 32'hfb38c5d7;
    stim[54] = 32'h00be7ce8;
    stim[55] = 32'h9a78111c;
    stim[56] = 32'hb7788e8e;
    stim[57] = 32'h8e45200e;
    stim[58] = 32'hf8611912;
    stim[59] = 32'h1fcd5bc2;
    stim[60] = 32'hd4bac9df;
    stim[61] = 32'h5be95404;
    stim[62] = 32'h7bf799d9;
    stim[63] = 32'hc2f97d04;
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
      expv[0] = 32'h45143bd3;
      expv[1] = 32'h0288bf61;
      expv[2] = 32'h5bfe4fff;
      expv[3] = 32'h2da20057;
      expv[4] = 32'ha13746c0;
      expv[5] = 32'h529a7fb2;
      expv[6] = 32'h572cb405;
      expv[7] = 32'h8f4c1e48;
      expv[8] = 32'h5fb852b0;
      expv[9] = 32'h9a53e1d2;
      expv[10] = 32'haac976ef;
      expv[11] = 32'h361f2161;
      expv[12] = 32'h42cd617b;
      expv[13] = 32'hf669c3f2;
      expv[14] = 32'h8c421585;
      expv[15] = 32'hdc84ebb4;
      expv[16] = 32'hf1f1615f;
      expv[17] = 32'hc2a3aa8f;
      expv[18] = 32'hbe1018e8;
      expv[19] = 32'h8c829dc0;
      expv[20] = 32'h66f1395f;
      expv[21] = 32'hd7f34bf1;
      expv[22] = 32'he2d17580;
      expv[23] = 32'hbba6da28;
      expv[24] = 32'hef2527f9;
      expv[25] = 32'h447bdad2;
      expv[26] = 32'h514a2784;
      expv[27] = 32'h4f72f198;
      expv[28] = 32'had5b284d;
      expv[29] = 32'h19c75184;
      expv[30] = 32'hdd807709;
      expv[31] = 32'h810658a1;
      expv[32] = 32'h94dad342;
      expv[33] = 32'h66ccbc7d;
      expv[34] = 32'ha9ae74d5;
      expv[35] = 32'had8fc6bf;
      expv[36] = 32'hc27b8dca;
      expv[37] = 32'h1d5e8226;
      expv[38] = 32'h529c8966;
      expv[39] = 32'hff134dca;
      expv[40] = 32'he364cc40;
      expv[41] = 32'h1c36c379;
      expv[42] = 32'h4dfedd77;
      expv[43] = 32'h583a3e42;
      expv[44] = 32'h617a32e7;
      expv[45] = 32'hec339832;
      expv[46] = 32'h64deea16;
      expv[47] = 32'h2e935bb5;
      expv[48] = 32'h3d6798b2;
      expv[49] = 32'hc7a5ff7c;
      expv[50] = 32'hbdee5ef6;
      expv[51] = 32'h7c03278c;
      expv[52] = 32'h9bcfa7a7;
      expv[53] = 32'h79716ff2;
      expv[54] = 32'h623c9a3c;
      expv[55] = 32'h6df2210b;
      expv[56] = 32'h574c4a70;
      expv[57] = 32'h1978db63;
      expv[58] = 32'h5932013b;
      expv[59] = 32'h96912dcb;
      expv[60] = 32'h19cc9394;
      expv[61] = 32'h654eda57;
      expv[62] = 32'ha50c4c29;
      expv[63] = 32'hcf2d38ba;
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
