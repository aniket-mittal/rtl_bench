// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119105 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h43319;
    stim[1] = 19'h4cb8f;
    stim[2] = 19'h06302;
    stim[3] = 19'h2a3ec;
    stim[4] = 19'h2eafd;
    stim[5] = 19'h3099f;
    stim[6] = 19'h2d874;
    stim[7] = 19'h4fe6f;
    stim[8] = 19'h3507d;
    stim[9] = 19'h3dcbb;
    stim[10] = 19'h34939;
    stim[11] = 19'h05bdc;
    stim[12] = 19'h0cbe1;
    stim[13] = 19'h0802b;
    stim[14] = 19'h29d49;
    stim[15] = 19'h0d726;
    stim[16] = 19'h04190;
    stim[17] = 19'h106b5;
    stim[18] = 19'h0558b;
    stim[19] = 19'h01538;
    stim[20] = 19'h0b5e4;
    stim[21] = 19'h2e6cc;
    stim[22] = 19'h191ef;
    stim[23] = 19'h06c35;
    stim[24] = 19'h2d93c;
    stim[25] = 19'h00199;
    stim[26] = 19'h36f63;
    stim[27] = 19'h04de1;
    stim[28] = 19'h21101;
    stim[29] = 19'h27370;
    stim[30] = 19'h315eb;
    stim[31] = 19'h348f6;
    stim[32] = 19'h1b5e1;
    stim[33] = 19'h0907a;
    stim[34] = 19'h1e256;
    stim[35] = 19'h3c1d2;
    stim[36] = 19'h0d107;
    stim[37] = 19'h06e2f;
    stim[38] = 19'h21c70;
    stim[39] = 19'h2eb67;
    stim[40] = 19'h19d0f;
    stim[41] = 19'h3fb06;
    stim[42] = 19'h10ad1;
    stim[43] = 19'h142e1;
    stim[44] = 19'h0afd6;
    stim[45] = 19'h1b093;
    stim[46] = 19'h15a87;
    stim[47] = 19'h289ed;
    stim[48] = 19'h226f2;
    stim[49] = 19'h03c12;
    stim[50] = 19'h36c2d;
    stim[51] = 19'h3b4a4;
    stim[52] = 19'h2ddce;
    stim[53] = 19'h0161b;
    stim[54] = 19'h38b04;
    stim[55] = 19'h0a810;
    stim[56] = 19'h27bc9;
    stim[57] = 19'h1d6a8;
    stim[58] = 19'h2986c;
    stim[59] = 19'h083da;
    stim[60] = 19'h36860;
    stim[61] = 19'h383b0;
    stim[62] = 19'h3f79f;
    stim[63] = 19'h0c713;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h20000;
      expv[2] = 19'h20000;
      expv[3] = 19'h5a3ec;
      expv[4] = 19'h4a3ec;
      expv[5] = 19'h4a3ec;
      expv[6] = 19'h5d874;
      expv[7] = 19'h6d874;
      expv[8] = 19'h5507d;
      expv[9] = 19'h5dcbb;
      expv[10] = 19'h54939;
      expv[11] = 19'h24939;
      expv[12] = 19'h24939;
      expv[13] = 19'h24939;
      expv[14] = 19'h59d49;
      expv[15] = 19'h69d49;
      expv[16] = 19'h69d49;
      expv[17] = 19'h69d49;
      expv[18] = 19'h29d49;
      expv[19] = 19'h29d49;
      expv[20] = 19'h29d49;
      expv[21] = 19'h5e6cc;
      expv[22] = 19'h6e6cc;
      expv[23] = 19'h2e6cc;
      expv[24] = 19'h5d93c;
      expv[25] = 19'h6d93c;
      expv[26] = 19'h4d93c;
      expv[27] = 19'h2d93c;
      expv[28] = 19'h51101;
      expv[29] = 19'h41101;
      expv[30] = 19'h41101;
      expv[31] = 19'h548f6;
      expv[32] = 19'h248f6;
      expv[33] = 19'h248f6;
      expv[34] = 19'h248f6;
      expv[35] = 19'h5c1d2;
      expv[36] = 19'h2c1d2;
      expv[37] = 19'h2c1d2;
      expv[38] = 19'h51c70;
      expv[39] = 19'h41c70;
      expv[40] = 19'h61c70;
      expv[41] = 19'h5fb06;
      expv[42] = 19'h2fb06;
      expv[43] = 19'h2fb06;
      expv[44] = 19'h2fb06;
      expv[45] = 19'h2fb06;
      expv[46] = 19'h2fb06;
      expv[47] = 19'h589ed;
      expv[48] = 19'h489ed;
      expv[49] = 19'h689ed;
      expv[50] = 19'h489ed;
      expv[51] = 19'h5b4a4;
      expv[52] = 19'h5ddce;
      expv[53] = 19'h6ddce;
      expv[54] = 19'h4ddce;
      expv[55] = 19'h2ddce;
      expv[56] = 19'h57bc9;
      expv[57] = 19'h67bc9;
      expv[58] = 19'h5986c;
      expv[59] = 19'h6986c;
      expv[60] = 19'h4986c;
      expv[61] = 19'h583b0;
      expv[62] = 19'h5f79f;
      expv[63] = 19'h2f79f;
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
