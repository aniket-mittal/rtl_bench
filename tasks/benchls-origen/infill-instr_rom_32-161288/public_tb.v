// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161288 dut (
    .clk(clk),
    .a(in_vec[37:33]),
    .d(in_vec[32:1]),
    .we(in_vec[0:0]),
    .spo(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h0d565f9f24;
    stim[1] = 38'h2ef5e25221;
    stim[2] = 38'h222aca3079;
    stim[3] = 38'h221b028f23;
    stim[4] = 38'h11b65f15b3;
    stim[5] = 38'h0919828805;
    stim[6] = 38'h2832f76c54;
    stim[7] = 38'h18e2b660fa;
    stim[8] = 38'h1e69f25856;
    stim[9] = 38'h1373ec4745;
    stim[10] = 38'h354f0bdf0e;
    stim[11] = 38'h2231dc7272;
    stim[12] = 38'h0839ee3bfe;
    stim[13] = 38'h0b26c32839;
    stim[14] = 38'h333291f74b;
    stim[15] = 38'h158c7ff0d3;
    stim[16] = 38'h3084f82732;
    stim[17] = 38'h32b73cee31;
    stim[18] = 38'h10d25ecd6b;
    stim[19] = 38'h01031f0a02;
    stim[20] = 38'h0c4d31dc99;
    stim[21] = 38'h065d1bb0c9;
    stim[22] = 38'h11a7b1eecf;
    stim[23] = 38'h168a0aa3f6;
    stim[24] = 38'h144e662f5b;
    stim[25] = 38'h03468abfae;
    stim[26] = 38'h1f8786e0d2;
    stim[27] = 38'h291bb87145;
    stim[28] = 38'h324524b202;
    stim[29] = 38'h1766109bc3;
    stim[30] = 38'h22a48d46f9;
    stim[31] = 38'h1bb7243237;
    stim[32] = 38'h3d26d6785e;
    stim[33] = 38'h04d842f1b5;
    stim[34] = 38'h00bf1832f8;
    stim[35] = 38'h175018c730;
    stim[36] = 38'h23c0ee94d4;
    stim[37] = 38'h2e6cc4d305;
    stim[38] = 38'h367788fdfb;
    stim[39] = 38'h37db3b416f;
    stim[40] = 38'h2556622f24;
    stim[41] = 38'h37b8ab5af7;
    stim[42] = 38'h27af354fc7;
    stim[43] = 38'h25939e2eca;
    stim[44] = 38'h33551e7594;
    stim[45] = 38'h17f67047b5;
    stim[46] = 38'h39b7c85537;
    stim[47] = 38'h0f925b05be;
    stim[48] = 38'h225c81aa8c;
    stim[49] = 38'h3075ccec01;
    stim[50] = 38'h2cf39a37d4;
    stim[51] = 38'h3319873898;
    stim[52] = 38'h137019d2eb;
    stim[53] = 38'h3ca27893fa;
    stim[54] = 38'h20bc5d7a10;
    stim[55] = 38'h1eac47a3ff;
    stim[56] = 38'h1ae60acc3f;
    stim[57] = 38'h1866999bb4;
    stim[58] = 38'h132c87010b;
    stim[59] = 38'h2f02c41960;
    stim[60] = 38'h233658852b;
    stim[61] = 38'h3c3b591a7a;
    stim[62] = 38'h2d10650847;
    stim[63] = 38'h354230f7ff;
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
      expv[0] = 32'h00600393;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00800493;
      expv[5] = 32'h00400293;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00900513;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00400293;
      expv[13] = 32'h00500313;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00a00593;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00800493;
      expv[19] = 32'h00000093;
      expv[20] = 32'hab2fcf92;
      expv[21] = 32'h00300213;
      expv[22] = 32'h00800493;
      expv[23] = 32'h00b00613;
      expv[24] = 32'h00a00593;
      expv[25] = 32'h00100113;
      expv[26] = 32'h34f92c2b;
      expv[27] = 32'h197bb62a;
      expv[28] = 32'h00000000;
      expv[29] = 32'h450551fb;
      expv[30] = 32'h18ee3939;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00200193;
      expv[34] = 32'h818f8501;
      expv[35] = 32'h450551fb;
      expv[36] = 32'h18ee3939;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'hab311792;
      expv[44] = 32'h22925901;
      expv[45] = 32'ha80c6398;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00700413;
      expv[48] = 32'he0774a6a;
      expv[49] = 32'h427c1399;
      expv[50] = 32'h00000000;
      expv[51] = 32'haa8f3aca;
      expv[52] = 32'h00900513;
      expv[53] = 32'h936b3c2f;
      expv[54] = 32'h00000000;
      expv[55] = 32'hc3c37069;
      expv[56] = 32'h00000000;
      expv[57] = 32'h715b307d;
      expv[58] = 32'h00900513;
      expv[59] = 32'h00000000;
      expv[60] = 32'h2e40d546;
      expv[61] = 32'h513c49fd;
      expv[62] = 32'h79cd1bea;
      expv[63] = 32'ha785ef87;
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
