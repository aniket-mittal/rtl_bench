// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123958 dut (
    .tclk0(clk),
    .cascadein(in_vec[16:16]),
    .nen0(in_vec[15:15]),
    .nen1(in_vec[14:14]),
    .shift0(in_vec[13:13]),
    .shift1(in_vec[12:12]),
    .shiftdone0i(in_vec[11:11]),
    .shiftdone1i(in_vec[10:10]),
    .shiften(in_vec[9:9]),
    .tclk1(in_vec[8:8]),
    .up0(in_vec[7:7]),
    .up1(in_vec[6:6]),
    .vco0ph(in_vec[5:3]),
    .vco1ph(in_vec[2:0]),
    .cascadeout(out_vec[3:3]),
    .divclk(out_vec[2:2]),
    .shiftdone0o(out_vec[1:1]),
    .shiftdone1o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h09c0f;
    stim[1] = 17'h00250;
    stim[2] = 17'h001a2;
    stim[3] = 17'h182a7;
    stim[4] = 17'h1a337;
    stim[5] = 17'h013c7;
    stim[6] = 17'h0e26e;
    stim[7] = 17'h1312e;
    stim[8] = 17'h1151a;
    stim[9] = 17'h1d251;
    stim[10] = 17'h07750;
    stim[11] = 17'h0de0a;
    stim[12] = 17'h1c762;
    stim[13] = 17'h05048;
    stim[14] = 17'h18887;
    stim[15] = 17'h0d673;
    stim[16] = 17'h1296a;
    stim[17] = 17'h10d45;
    stim[18] = 17'h089a4;
    stim[19] = 17'h15180;
    stim[20] = 17'h0833c;
    stim[21] = 17'h1c36f;
    stim[22] = 17'h07399;
    stim[23] = 17'h01fbf;
    stim[24] = 17'h14d0c;
    stim[25] = 17'h12ad4;
    stim[26] = 17'h13fd4;
    stim[27] = 17'h1717a;
    stim[28] = 17'h0446b;
    stim[29] = 17'h0d865;
    stim[30] = 17'h0af78;
    stim[31] = 17'h109b4;
    stim[32] = 17'h0ea21;
    stim[33] = 17'h093ff;
    stim[34] = 17'h0c4cd;
    stim[35] = 17'h10aec;
    stim[36] = 17'h08bb1;
    stim[37] = 17'h035dc;
    stim[38] = 17'h07e23;
    stim[39] = 17'h15370;
    stim[40] = 17'h0bc94;
    stim[41] = 17'h0dbba;
    stim[42] = 17'h15cdd;
    stim[43] = 17'h1dc1c;
    stim[44] = 17'h196d4;
    stim[45] = 17'h08352;
    stim[46] = 17'h02668;
    stim[47] = 17'h08cca;
    stim[48] = 17'h0110c;
    stim[49] = 17'h1c4d0;
    stim[50] = 17'h14afe;
    stim[51] = 17'h1e326;
    stim[52] = 17'h0607e;
    stim[53] = 17'h19367;
    stim[54] = 17'h0a834;
    stim[55] = 17'h163f0;
    stim[56] = 17'h17dac;
    stim[57] = 17'h0c44e;
    stim[58] = 17'h13da1;
    stim[59] = 17'h09835;
    stim[60] = 17'h0cfb4;
    stim[61] = 17'h1739d;
    stim[62] = 17'h1d94a;
    stim[63] = 17'h059b6;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'hc;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'hc;
      expv[7] = 4'h0;
      expv[8] = 4'hd;
      expv[9] = 4'h0;
      expv[10] = 4'h1;
      expv[11] = 4'h3;
      expv[12] = 4'h1;
      expv[13] = 4'h0;
      expv[14] = 4'h2;
      expv[15] = 4'h1;
      expv[16] = 4'h2;
      expv[17] = 4'hf;
      expv[18] = 4'h2;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h3;
      expv[24] = 4'hf;
      expv[25] = 4'h2;
      expv[26] = 4'hf;
      expv[27] = 4'h0;
      expv[28] = 4'h1;
      expv[29] = 4'h2;
      expv[30] = 4'h3;
      expv[31] = 4'h2;
      expv[32] = 4'he;
      expv[33] = 4'h0;
      expv[34] = 4'h1;
      expv[35] = 4'h2;
      expv[36] = 4'he;
      expv[37] = 4'h1;
      expv[38] = 4'hf;
      expv[39] = 4'h0;
      expv[40] = 4'h3;
      expv[41] = 4'h2;
      expv[42] = 4'h3;
      expv[43] = 4'h3;
      expv[44] = 4'h1;
      expv[45] = 4'h0;
      expv[46] = 4'h1;
      expv[47] = 4'hf;
      expv[48] = 4'h0;
      expv[49] = 4'hd;
      expv[50] = 4'h2;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h2;
      expv[55] = 4'h0;
      expv[56] = 4'h3;
      expv[57] = 4'h1;
      expv[58] = 4'h3;
      expv[59] = 4'he;
      expv[60] = 4'h3;
      expv[61] = 4'h0;
      expv[62] = 4'h2;
      expv[63] = 4'h2;
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
