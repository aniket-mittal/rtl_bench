// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05585 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2174cc;
    stim[1] = 22'h20a29e;
    stim[2] = 22'h2b1de0;
    stim[3] = 22'h0f6e5b;
    stim[4] = 22'h2edb35;
    stim[5] = 22'h3b8c1d;
    stim[6] = 22'h0f4315;
    stim[7] = 22'h1e6713;
    stim[8] = 22'h2afd1d;
    stim[9] = 22'h0b2350;
    stim[10] = 22'h0fcafc;
    stim[11] = 22'h1bff3f;
    stim[12] = 22'h36eb07;
    stim[13] = 22'h0b3866;
    stim[14] = 22'h3fc5a5;
    stim[15] = 22'h1b52fb;
    stim[16] = 22'h024a6f;
    stim[17] = 22'h3aaf0b;
    stim[18] = 22'h0d3368;
    stim[19] = 22'h3b87ce;
    stim[20] = 22'h23bbda;
    stim[21] = 22'h3ff1eb;
    stim[22] = 22'h27cf8d;
    stim[23] = 22'h0b5845;
    stim[24] = 22'h37f9f2;
    stim[25] = 22'h0e07f5;
    stim[26] = 22'h13079a;
    stim[27] = 22'h36746a;
    stim[28] = 22'h3face7;
    stim[29] = 22'h2625d9;
    stim[30] = 22'h06cfea;
    stim[31] = 22'h12e98a;
    stim[32] = 22'h20a529;
    stim[33] = 22'h37084f;
    stim[34] = 22'h2a9008;
    stim[35] = 22'h1b5d58;
    stim[36] = 22'h0a764e;
    stim[37] = 22'h2a30b3;
    stim[38] = 22'h13f6a6;
    stim[39] = 22'h2fb7ea;
    stim[40] = 22'h17625f;
    stim[41] = 22'h0d0b5f;
    stim[42] = 22'h26a223;
    stim[43] = 22'h3adcb3;
    stim[44] = 22'h1709d0;
    stim[45] = 22'h27dd84;
    stim[46] = 22'h0f06d2;
    stim[47] = 22'h2b28fb;
    stim[48] = 22'h06c199;
    stim[49] = 22'h07a3d9;
    stim[50] = 22'h2a39f6;
    stim[51] = 22'h3fd03b;
    stim[52] = 22'h0f6618;
    stim[53] = 22'h2b5066;
    stim[54] = 22'h22b2d4;
    stim[55] = 22'h166f8f;
    stim[56] = 22'h17f2ed;
    stim[57] = 22'h2face0;
    stim[58] = 22'h1670dd;
    stim[59] = 22'h0e4814;
    stim[60] = 22'h2f5fc2;
    stim[61] = 22'h1b8749;
    stim[62] = 22'h2f361c;
    stim[63] = 22'h2eaa14;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h0001e;
      expv[9] = 17'h0001e;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h06713;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h06713;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h0847f;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00002;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h0001e;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h0847f;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h0847f;
      expv[46] = 17'h0847f;
      expv[47] = 17'h00000;
      expv[48] = 17'h0001e;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h0001e;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h0001e;
      expv[55] = 17'h0847f;
      expv[56] = 17'h0847f;
      expv[57] = 17'h06f8f;
      expv[58] = 17'h0001e;
      expv[59] = 17'h06f8f;
      expv[60] = 17'h00000;
      expv[61] = 17'h0001e;
      expv[62] = 17'h0001e;
      expv[63] = 17'h0001e;
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
