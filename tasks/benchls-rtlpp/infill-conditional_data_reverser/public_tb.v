// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  conditional_data_reverser dut (
    .a(in_vec[16:1]),
    .rev(in_vec[0:0]),
    .z(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h180ca;
    stim[1] = 17'h09d32;
    stim[2] = 17'h1f2f0;
    stim[3] = 17'h0fd5f;
    stim[4] = 17'h01a0a;
    stim[5] = 17'h0de8c;
    stim[6] = 17'h15603;
    stim[7] = 17'h1cb33;
    stim[8] = 17'h01122;
    stim[9] = 17'h042b0;
    stim[10] = 17'h09891;
    stim[11] = 17'h07005;
    stim[12] = 17'h13c33;
    stim[13] = 17'h140a8;
    stim[14] = 17'h10cd5;
    stim[15] = 17'h09185;
    stim[16] = 17'h12ef1;
    stim[17] = 17'h18f93;
    stim[18] = 17'h18b03;
    stim[19] = 17'h106c9;
    stim[20] = 17'h19c91;
    stim[21] = 17'h1ef23;
    stim[22] = 17'h0c5b6;
    stim[23] = 17'h1d7ba;
    stim[24] = 17'h1d27a;
    stim[25] = 17'h0dab5;
    stim[26] = 17'h1b4b1;
    stim[27] = 17'h1d62e;
    stim[28] = 17'h1f371;
    stim[29] = 17'h053ac;
    stim[30] = 17'h0a992;
    stim[31] = 17'h08998;
    stim[32] = 17'h0748c;
    stim[33] = 17'h0afb0;
    stim[34] = 17'h057fb;
    stim[35] = 17'h0daa4;
    stim[36] = 17'h0d629;
    stim[37] = 17'h10f3e;
    stim[38] = 17'h04a50;
    stim[39] = 17'h0dc94;
    stim[40] = 17'h02d80;
    stim[41] = 17'h0e59a;
    stim[42] = 17'h00ef4;
    stim[43] = 17'h130f8;
    stim[44] = 17'h09f62;
    stim[45] = 17'h15e2e;
    stim[46] = 17'h18824;
    stim[47] = 17'h06cb6;
    stim[48] = 17'h04e8a;
    stim[49] = 17'h08202;
    stim[50] = 17'h026a5;
    stim[51] = 17'h0773c;
    stim[52] = 17'h0387b;
    stim[53] = 17'h14ffc;
    stim[54] = 17'h09735;
    stim[55] = 17'h06130;
    stim[56] = 17'h19a60;
    stim[57] = 17'h0c01c;
    stim[58] = 17'h1c328;
    stim[59] = 17'h0fefd;
    stim[60] = 17'h0767c;
    stim[61] = 17'h063e9;
    stim[62] = 17'h03193;
    stim[63] = 17'h06ed4;
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
      expv[0] = 16'hc065;
      expv[1] = 16'h4e99;
      expv[2] = 16'hf978;
      expv[3] = 16'hf57e;
      expv[4] = 16'h0d05;
      expv[5] = 16'h6f46;
      expv[6] = 16'h80d5;
      expv[7] = 16'h99a7;
      expv[8] = 16'h0891;
      expv[9] = 16'h2158;
      expv[10] = 16'h1232;
      expv[11] = 16'h401c;
      expv[12] = 16'h9879;
      expv[13] = 16'ha054;
      expv[14] = 16'h5661;
      expv[15] = 16'h4312;
      expv[16] = 16'h1ee9;
      expv[17] = 16'h93e3;
      expv[18] = 16'h81a3;
      expv[19] = 16'h26c1;
      expv[20] = 16'h1273;
      expv[21] = 16'h89ef;
      expv[22] = 16'h62db;
      expv[23] = 16'hebdd;
      expv[24] = 16'he93d;
      expv[25] = 16'h5ab6;
      expv[26] = 16'h1a5b;
      expv[27] = 16'heb17;
      expv[28] = 16'h1d9f;
      expv[29] = 16'h29d6;
      expv[30] = 16'h54c9;
      expv[31] = 16'h44cc;
      expv[32] = 16'h3a46;
      expv[33] = 16'h57d8;
      expv[34] = 16'hbfd4;
      expv[35] = 16'h6d52;
      expv[36] = 16'h28d6;
      expv[37] = 16'h879f;
      expv[38] = 16'h2528;
      expv[39] = 16'h6e4a;
      expv[40] = 16'h16c0;
      expv[41] = 16'h72cd;
      expv[42] = 16'h077a;
      expv[43] = 16'h987c;
      expv[44] = 16'h4fb1;
      expv[45] = 16'haf17;
      expv[46] = 16'hc412;
      expv[47] = 16'h365b;
      expv[48] = 16'h2745;
      expv[49] = 16'h4101;
      expv[50] = 16'h4ac8;
      expv[51] = 16'h3b9e;
      expv[52] = 16'hbc38;
      expv[53] = 16'ha7fe;
      expv[54] = 16'h59d2;
      expv[55] = 16'h3098;
      expv[56] = 16'hcd30;
      expv[57] = 16'h600e;
      expv[58] = 16'he194;
      expv[59] = 16'h7efe;
      expv[60] = 16'h3b3e;
      expv[61] = 16'h2f8c;
      expv[62] = 16'h9318;
      expv[63] = 16'h376a;
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
