// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091490 dut (
    .animationCLOCK(clk),
    .pointY(in_vec[21:12]),
    .score(in_vec[11:2]),
    .mouse1(in_vec[1:1]),
    .mouse2(in_vec[0:0]),
    .PIPEDOWN1X(out_vec[56:47]),
    .PIPEDOWN1Y(out_vec[46:37]),
    .PIPEUP1X(out_vec[36:27]),
    .PIPEUP1Y(out_vec[26:17]),
    .PIPEDOWN1VISIBLE(out_vec[16:16]),
    .PIPEUP1SKIPY(out_vec[15:6]),
    .PIPEUP1VISIBLE(out_vec[5:5]),
    .leds(out_vec[4:1]),
    .endOfMapPipe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h379b50;
    stim[1] = 22'h007e4d;
    stim[2] = 22'h2ecc61;
    stim[3] = 22'h34f27e;
    stim[4] = 22'h1b1dbb;
    stim[5] = 22'h3ab5bc;
    stim[6] = 22'h272036;
    stim[7] = 22'h0f240a;
    stim[8] = 22'h13e126;
    stim[9] = 22'h3c79d7;
    stim[10] = 22'h02f331;
    stim[11] = 22'h182519;
    stim[12] = 22'h3fc4f0;
    stim[13] = 22'h0651af;
    stim[14] = 22'h1abffa;
    stim[15] = 22'h30a0eb;
    stim[16] = 22'h1a40cb;
    stim[17] = 22'h2162a3;
    stim[18] = 22'h1d09ca;
    stim[19] = 22'h23bac1;
    stim[20] = 22'h358e01;
    stim[21] = 22'h1c672f;
    stim[22] = 22'h3c7165;
    stim[23] = 22'h0df77d;
    stim[24] = 22'h17ebb4;
    stim[25] = 22'h0e1ecf;
    stim[26] = 22'h30457c;
    stim[27] = 22'h09ef03;
    stim[28] = 22'h14630b;
    stim[29] = 22'h363c7a;
    stim[30] = 22'h2b03ae;
    stim[31] = 22'h1e7f1c;
    stim[32] = 22'h10c895;
    stim[33] = 22'h22be4a;
    stim[34] = 22'h295dcd;
    stim[35] = 22'h3851fc;
    stim[36] = 22'h13c25a;
    stim[37] = 22'h3ed5f1;
    stim[38] = 22'h155318;
    stim[39] = 22'h021246;
    stim[40] = 22'h157878;
    stim[41] = 22'h12297c;
    stim[42] = 22'h06f8a5;
    stim[43] = 22'h25ab2f;
    stim[44] = 22'h14faf8;
    stim[45] = 22'h112b1a;
    stim[46] = 22'h1d6c0e;
    stim[47] = 22'h24b59b;
    stim[48] = 22'h1fb0d5;
    stim[49] = 22'h3c664d;
    stim[50] = 22'h3c5332;
    stim[51] = 22'h02aff1;
    stim[52] = 22'h35e1ca;
    stim[53] = 22'h15e5bf;
    stim[54] = 22'h3f11d8;
    stim[55] = 22'h28efc3;
    stim[56] = 22'h36f0f5;
    stim[57] = 22'h04a16a;
    stim[58] = 22'h24ef89;
    stim[59] = 22'h1353a4;
    stim[60] = 22'h18e1d4;
    stim[61] = 22'h165ab7;
    stim[62] = 22'h2feb77;
    stim[63] = 22'h299a6d;
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
      expv[0] = 57'hxxxxxxxxx0xxxxx;
      expv[1] = 57'hxxxxxxxxx0xxxxx;
      expv[2] = 57'hxxxxxxxxx0xxxxx;
      expv[3] = 57'hxxxxxxxxx0xxxxx;
      expv[4] = 57'hxxxxxxxxx0xxxxx;
      expv[5] = 57'hxxxxxxxxx0xxxxx;
      expv[6] = 57'hxxxxxxxxx0xxxxx;
      expv[7] = 57'hxxxxxxxxx0xxxxx;
      expv[8] = 57'hxxxxxxxxx0xxxxx;
      expv[9] = 57'hxxxxxxxxx0xxxxx;
      expv[10] = 57'hxxxxxxxxx0xxxxx;
      expv[11] = 57'hxxxxxxxxx0xxxxx;
      expv[12] = 57'hxxxxxxxxx0xxxxx;
      expv[13] = 57'hxxxxxxxxx0xxxxx;
      expv[14] = 57'hxxxxxxxxx0xxxxx;
      expv[15] = 57'hxxxxxxxxx0xxxxx;
      expv[16] = 57'hxxxxxxxxx0xxxxx;
      expv[17] = 57'hxxxxxxxxx0xxxxx;
      expv[18] = 57'hxxxxxxxxx0xxxxx;
      expv[19] = 57'hxxxxxxxxx0xxxxx;
      expv[20] = 57'hxxxxxxxxx0xxxxx;
      expv[21] = 57'hxxxxxxxxx0xxxxx;
      expv[22] = 57'hxxxxxxxxx0xxxxx;
      expv[23] = 57'hxxxxxxxxx0xxxxx;
      expv[24] = 57'hxxxxxxxxx0xxxxx;
      expv[25] = 57'hxxxxxxxxx0xxxxx;
      expv[26] = 57'hxxxxxxxxx0xxxxx;
      expv[27] = 57'hxxxxxxxxx0xxxxx;
      expv[28] = 57'hxxxxxxxxx0xxxxx;
      expv[29] = 57'hxxxxxxxxx0xxxxx;
      expv[30] = 57'hxxxxxxxxx0xxxxx;
      expv[31] = 57'hxxxxxxxxx0xxxxx;
      expv[32] = 57'hxxxxxxxxx0xxxxx;
      expv[33] = 57'hxxxxxxxxx0xxxxx;
      expv[34] = 57'hxxxxxxxxx0xxxxx;
      expv[35] = 57'hxxxxxxxxx0xxxxx;
      expv[36] = 57'hxxxxxxxxx0xxxxx;
      expv[37] = 57'hxxxxxxxxx0xxxxx;
      expv[38] = 57'hxxxxxxxxx0xxxxx;
      expv[39] = 57'hxxxxxxxxx0xxxxx;
      expv[40] = 57'hxxxxxxxxx0xxxxx;
      expv[41] = 57'hxxxxxxxxx0xxxxx;
      expv[42] = 57'hxxxxxxxxx0xxxxx;
      expv[43] = 57'hxxxxxxxxx0xxxxx;
      expv[44] = 57'hxxxxxxxxx0xxxxx;
      expv[45] = 57'hxxxxxxxxx0xxxxx;
      expv[46] = 57'hxxxxxxxxx0xxxxx;
      expv[47] = 57'hxxxxxxxxx0xxxxx;
      expv[48] = 57'hxxxxxxxxx0xxxxx;
      expv[49] = 57'hxxxxxxxxx0xxxxx;
      expv[50] = 57'hxxxxxxxxx0xxxxx;
      expv[51] = 57'hxxxxxxxxx0xxxxx;
      expv[52] = 57'hxxxxxxxxx0xxxxx;
      expv[53] = 57'hxxxxxxxxx0xxxxx;
      expv[54] = 57'hxxxxxxxxx0xxxxx;
      expv[55] = 57'hxxxxxxxxx0xxxxx;
      expv[56] = 57'hxxxxxxxxx0xxxxx;
      expv[57] = 57'hxxxxxxxxx0xxxxx;
      expv[58] = 57'hxxxxxxxxx0xxxxx;
      expv[59] = 57'hxxxxxxxxx0xxxxx;
      expv[60] = 57'hxxxxxxxxx0xxxxx;
      expv[61] = 57'hxxxxxxxxx0xxxxx;
      expv[62] = 57'hxxxxxxxxx0xxxxx;
      expv[63] = 57'hxxxxxxxxx0xxxxx;
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
