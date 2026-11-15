// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01701 dut (
    .pm0(in_vec[15:12]),
    .pm1(in_vec[11:8]),
    .pm2(in_vec[7:4]),
    .pm3(in_vec[3:0]),
    .d0(out_vec[1:1]),
    .d1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h617a;
    stim[1] = 16'hb9d8;
    stim[2] = 16'h8f3d;
    stim[3] = 16'h698d;
    stim[4] = 16'h8ebe;
    stim[5] = 16'h2ce6;
    stim[6] = 16'hd489;
    stim[7] = 16'h5a33;
    stim[8] = 16'heacf;
    stim[9] = 16'haa11;
    stim[10] = 16'hf3ec;
    stim[11] = 16'h7878;
    stim[12] = 16'h0dae;
    stim[13] = 16'hdd9a;
    stim[14] = 16'hb2d3;
    stim[15] = 16'h7b77;
    stim[16] = 16'h33e0;
    stim[17] = 16'h777f;
    stim[18] = 16'h8a44;
    stim[19] = 16'h975b;
    stim[20] = 16'hf1cb;
    stim[21] = 16'h7c99;
    stim[22] = 16'hb240;
    stim[23] = 16'hc64c;
    stim[24] = 16'h0c58;
    stim[25] = 16'hb9a7;
    stim[26] = 16'h4b69;
    stim[27] = 16'hf11b;
    stim[28] = 16'hea99;
    stim[29] = 16'hc19b;
    stim[30] = 16'h07ca;
    stim[31] = 16'h456b;
    stim[32] = 16'h40ed;
    stim[33] = 16'h21d1;
    stim[34] = 16'h2372;
    stim[35] = 16'h1f46;
    stim[36] = 16'h463e;
    stim[37] = 16'hc291;
    stim[38] = 16'he163;
    stim[39] = 16'h1feb;
    stim[40] = 16'h8749;
    stim[41] = 16'h3fa7;
    stim[42] = 16'h992a;
    stim[43] = 16'h66bd;
    stim[44] = 16'hcca2;
    stim[45] = 16'hef44;
    stim[46] = 16'h01ae;
    stim[47] = 16'h7ea3;
    stim[48] = 16'hf157;
    stim[49] = 16'h3dcc;
    stim[50] = 16'hac76;
    stim[51] = 16'h5265;
    stim[52] = 16'h644b;
    stim[53] = 16'hffb1;
    stim[54] = 16'h020b;
    stim[55] = 16'hccf1;
    stim[56] = 16'h2bc3;
    stim[57] = 16'h218f;
    stim[58] = 16'h7132;
    stim[59] = 16'h0bec;
    stim[60] = 16'h68cb;
    stim[61] = 16'h6819;
    stim[62] = 16'hd224;
    stim[63] = 16'h7987;
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
      expv[0] = 2'h2;
      expv[1] = 2'h3;
      expv[2] = 2'h1;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h2;
      expv[7] = 2'h1;
      expv[8] = 2'h2;
      expv[9] = 2'h1;
      expv[10] = 2'h2;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h3;
      expv[17] = 2'h0;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h2;
      expv[21] = 2'h0;
      expv[22] = 2'h3;
      expv[23] = 2'h1;
      expv[24] = 2'h0;
      expv[25] = 2'h3;
      expv[26] = 2'h0;
      expv[27] = 2'h2;
      expv[28] = 2'h1;
      expv[29] = 2'h2;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h3;
      expv[38] = 2'h2;
      expv[39] = 2'h0;
      expv[40] = 2'h1;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h3;
      expv[45] = 2'h1;
      expv[46] = 2'h0;
      expv[47] = 2'h3;
      expv[48] = 2'h2;
      expv[49] = 2'h0;
      expv[50] = 2'h3;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h3;
      expv[54] = 2'h0;
      expv[55] = 2'h3;
      expv[56] = 2'h0;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
      expv[62] = 2'h2;
      expv[63] = 2'h0;
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
