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

  rtlpp_06609 dut (
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
    stim[0] = 22'h1c9d4f;
    stim[1] = 22'h2d3d91;
    stim[2] = 22'h230ff5;
    stim[3] = 22'h3b6ef1;
    stim[4] = 22'h33dd60;
    stim[5] = 22'h1382eb;
    stim[6] = 22'h1fa6db;
    stim[7] = 22'h37603d;
    stim[8] = 22'h1720f6;
    stim[9] = 22'h063b4e;
    stim[10] = 22'h26a117;
    stim[11] = 22'h27001b;
    stim[12] = 22'h2e8027;
    stim[13] = 22'h163e94;
    stim[14] = 22'h262f55;
    stim[15] = 22'h26477f;
    stim[16] = 22'h36ac4e;
    stim[17] = 22'h33d0e4;
    stim[18] = 22'h024753;
    stim[19] = 22'h35a93b;
    stim[20] = 22'h2e9476;
    stim[21] = 22'h06985e;
    stim[22] = 22'h0e27d2;
    stim[23] = 22'h1fdd52;
    stim[24] = 22'h2ebc1d;
    stim[25] = 22'h0b566a;
    stim[26] = 22'h2a5ba3;
    stim[27] = 22'h0fd326;
    stim[28] = 22'h222901;
    stim[29] = 22'h3a120b;
    stim[30] = 22'h23d9d5;
    stim[31] = 22'h122833;
    stim[32] = 22'h3320d5;
    stim[33] = 22'h2f45ee;
    stim[34] = 22'h1f0f81;
    stim[35] = 22'h374567;
    stim[36] = 22'h0b1c07;
    stim[37] = 22'h2fd2c2;
    stim[38] = 22'h330154;
    stim[39] = 22'h1b9cab;
    stim[40] = 22'h17aeb5;
    stim[41] = 22'h1b10fa;
    stim[42] = 22'h3b413d;
    stim[43] = 22'h3e48ea;
    stim[44] = 22'h2b95b6;
    stim[45] = 22'h0f11b8;
    stim[46] = 22'h2a2bef;
    stim[47] = 22'h3ee075;
    stim[48] = 22'h065939;
    stim[49] = 22'h1b3891;
    stim[50] = 22'h3a9fed;
    stim[51] = 22'h1209c0;
    stim[52] = 22'h33fc36;
    stim[53] = 22'h336594;
    stim[54] = 22'h22a6aa;
    stim[55] = 22'h1b89c9;
    stim[56] = 22'h3386bf;
    stim[57] = 22'h06c086;
    stim[58] = 22'h37a523;
    stim[59] = 22'h0f7870;
    stim[60] = 22'h2fd2c1;
    stim[61] = 22'h17e914;
    stim[62] = 22'h371897;
    stim[63] = 22'h2ab0b3;
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
      expv[6] = 17'h0c34f;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h0c34f;
      expv[13] = 17'h00000;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00002;
      expv[27] = 17'h00000;
      expv[28] = 17'h00002;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00000;
      expv[31] = 17'h0c34f;
      expv[32] = 17'h0c34f;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00002;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h0c34f;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00002;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h0c34f;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h0c34f;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00002;
      expv[61] = 17'h00000;
      expv[62] = 17'h0c34f;
      expv[63] = 17'h00000;
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
