// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123430 dut (
    .i_clk(clk),
    .i_resetn(in_vec[17:17]),
    .wdata0(in_vec[16:9]),
    .wdata1(in_vec[8:1]),
    .wen(in_vec[0:0]),
    .rdata0(out_vec[16:9]),
    .rdata1(out_vec[8:1]),
    .rsync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h132fd;
    stim[1] = 18'h04296;
    stim[2] = 18'h2d4bc;
    stim[3] = 18'h20c87;
    stim[4] = 18'h212b1;
    stim[5] = 18'h3d148;
    stim[6] = 18'h2da66;
    stim[7] = 18'h28646;
    stim[8] = 18'h213c5;
    stim[9] = 18'h24fe1;
    stim[10] = 18'h380f1;
    stim[11] = 18'h2801d;
    stim[12] = 18'h31f4c;
    stim[13] = 18'h28fc4;
    stim[14] = 18'h34b2c;
    stim[15] = 18'h2b540;
    stim[16] = 18'h366e6;
    stim[17] = 18'h2d04e;
    stim[18] = 18'h338f9;
    stim[19] = 18'h2925b;
    stim[20] = 18'h35538;
    stim[21] = 18'h257cb;
    stim[22] = 18'h279d9;
    stim[23] = 18'h3f3dc;
    stim[24] = 18'h357bb;
    stim[25] = 18'h32eea;
    stim[26] = 18'h24685;
    stim[27] = 18'h25b59;
    stim[28] = 18'h017f7;
    stim[29] = 18'h32066;
    stim[30] = 18'h31da7;
    stim[31] = 18'h34453;
    stim[32] = 18'h38bda;
    stim[33] = 18'h3ce60;
    stim[34] = 18'h2eed2;
    stim[35] = 18'h2481f;
    stim[36] = 18'h20541;
    stim[37] = 18'h2d21f;
    stim[38] = 18'h2c364;
    stim[39] = 18'h2e769;
    stim[40] = 18'h39870;
    stim[41] = 18'h3a9d3;
    stim[42] = 18'h271a3;
    stim[43] = 18'h3b549;
    stim[44] = 18'h2bd5c;
    stim[45] = 18'h341c4;
    stim[46] = 18'h20cf1;
    stim[47] = 18'h2b068;
    stim[48] = 18'h27755;
    stim[49] = 18'h3ebcc;
    stim[50] = 18'h3a1f9;
    stim[51] = 18'h310e6;
    stim[52] = 18'h3e4f9;
    stim[53] = 18'h2eb98;
    stim[54] = 18'h388a5;
    stim[55] = 18'h3653e;
    stim[56] = 18'h2b9c3;
    stim[57] = 18'h3d425;
    stim[58] = 18'h3b84c;
    stim[59] = 18'h39ed3;
    stim[60] = 18'h295d8;
    stim[61] = 18'h3e7ad;
    stim[62] = 18'h3ccc1;
    stim[63] = 18'h21a1c;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
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
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
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
