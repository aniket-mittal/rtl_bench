// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041063 dut (
    .ALUOp(in_vec[9:6]),
    .Funct(in_vec[5:0]),
    .ALUCtl(out_vec[5:1]),
    .Sign(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h22c;
    stim[1] = 10'h28c;
    stim[2] = 10'h3d3;
    stim[3] = 10'h3ce;
    stim[4] = 10'h31e;
    stim[5] = 10'h176;
    stim[6] = 10'h05b;
    stim[7] = 10'h1ce;
    stim[8] = 10'h079;
    stim[9] = 10'h359;
    stim[10] = 10'h210;
    stim[11] = 10'h11f;
    stim[12] = 10'h146;
    stim[13] = 10'h110;
    stim[14] = 10'h13e;
    stim[15] = 10'h1e6;
    stim[16] = 10'h390;
    stim[17] = 10'h337;
    stim[18] = 10'h109;
    stim[19] = 10'h008;
    stim[20] = 10'h235;
    stim[21] = 10'h1e3;
    stim[22] = 10'h2a6;
    stim[23] = 10'h2b2;
    stim[24] = 10'h320;
    stim[25] = 10'h13d;
    stim[26] = 10'h103;
    stim[27] = 10'h358;
    stim[28] = 10'h163;
    stim[29] = 10'h11d;
    stim[30] = 10'h0bc;
    stim[31] = 10'h3c6;
    stim[32] = 10'h119;
    stim[33] = 10'h269;
    stim[34] = 10'h157;
    stim[35] = 10'h1d2;
    stim[36] = 10'h035;
    stim[37] = 10'h1c0;
    stim[38] = 10'h2fb;
    stim[39] = 10'h195;
    stim[40] = 10'h26c;
    stim[41] = 10'h30a;
    stim[42] = 10'h0d5;
    stim[43] = 10'h001;
    stim[44] = 10'h1d4;
    stim[45] = 10'h00e;
    stim[46] = 10'h3da;
    stim[47] = 10'h26f;
    stim[48] = 10'h26a;
    stim[49] = 10'h2d4;
    stim[50] = 10'h3ec;
    stim[51] = 10'h275;
    stim[52] = 10'h3c8;
    stim[53] = 10'h260;
    stim[54] = 10'h2e3;
    stim[55] = 10'h266;
    stim[56] = 10'h325;
    stim[57] = 10'h29d;
    stim[58] = 10'h15e;
    stim[59] = 10'h0fc;
    stim[60] = 10'h01f;
    stim[61] = 10'h37d;
    stim[62] = 10'h0af;
    stim[63] = 10'h0f6;
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
      expv[0] = 6'h00;
      expv[1] = 6'h01;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h04;
      expv[5] = 6'h0d;
      expv[6] = 6'h03;
      expv[7] = 6'h01;
      expv[8] = 6'h03;
      expv[9] = 6'h0c;
      expv[10] = 6'h00;
      expv[11] = 6'h05;
      expv[12] = 6'h0d;
      expv[13] = 6'h05;
      expv[14] = 6'h05;
      expv[15] = 6'h01;
      expv[16] = 6'h00;
      expv[17] = 6'h04;
      expv[18] = 6'h05;
      expv[19] = 6'h01;
      expv[20] = 6'h00;
      expv[21] = 6'h01;
      expv[22] = 6'h09;
      expv[23] = 6'h01;
      expv[24] = 6'h04;
      expv[25] = 6'h05;
      expv[26] = 6'h05;
      expv[27] = 6'h0c;
      expv[28] = 6'h0d;
      expv[29] = 6'h05;
      expv[30] = 6'h01;
      expv[31] = 6'h00;
      expv[32] = 6'h05;
      expv[33] = 6'h02;
      expv[34] = 6'h0d;
      expv[35] = 6'h01;
      expv[36] = 6'h01;
      expv[37] = 6'h01;
      expv[38] = 6'h06;
      expv[39] = 6'h01;
      expv[40] = 6'h02;
      expv[41] = 6'h04;
      expv[42] = 6'h07;
      expv[43] = 6'h01;
      expv[44] = 6'h01;
      expv[45] = 6'h01;
      expv[46] = 6'h00;
      expv[47] = 6'h02;
      expv[48] = 6'h02;
      expv[49] = 6'h06;
      expv[50] = 6'h00;
      expv[51] = 6'h02;
      expv[52] = 6'h00;
      expv[53] = 6'h02;
      expv[54] = 6'h06;
      expv[55] = 6'h02;
      expv[56] = 6'h04;
      expv[57] = 6'h00;
      expv[58] = 6'h0d;
      expv[59] = 6'h07;
      expv[60] = 6'h01;
      expv[61] = 6'h0c;
      expv[62] = 6'h00;
      expv[63] = 6'h07;
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
