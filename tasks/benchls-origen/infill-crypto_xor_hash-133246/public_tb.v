// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133246 dut (
    .in(in_vec[17:10]),
    .key(in_vec[9:2]),
    .ctrl(in_vec[1:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h06d9d;
    stim[1] = 18'h2e580;
    stim[2] = 18'h1481b;
    stim[3] = 18'h187cd;
    stim[4] = 18'h078d5;
    stim[5] = 18'h053fb;
    stim[6] = 18'h015c4;
    stim[7] = 18'h046c8;
    stim[8] = 18'h3e711;
    stim[9] = 18'h090d8;
    stim[10] = 18'h1caea;
    stim[11] = 18'h245aa;
    stim[12] = 18'h16692;
    stim[13] = 18'h1c255;
    stim[14] = 18'h38318;
    stim[15] = 18'h00163;
    stim[16] = 18'h37548;
    stim[17] = 18'h186ed;
    stim[18] = 18'h2b676;
    stim[19] = 18'h3c207;
    stim[20] = 18'h1f0df;
    stim[21] = 18'h033d9;
    stim[22] = 18'h2bb3b;
    stim[23] = 18'h3f1d0;
    stim[24] = 18'h1b759;
    stim[25] = 18'h1acdc;
    stim[26] = 18'h11d39;
    stim[27] = 18'h039d0;
    stim[28] = 18'h060e9;
    stim[29] = 18'h32913;
    stim[30] = 18'h16873;
    stim[31] = 18'h3a1dc;
    stim[32] = 18'h182bb;
    stim[33] = 18'h0aa4f;
    stim[34] = 18'h38f3b;
    stim[35] = 18'h03b0e;
    stim[36] = 18'h11581;
    stim[37] = 18'h2463b;
    stim[38] = 18'h28544;
    stim[39] = 18'h0b661;
    stim[40] = 18'h1864b;
    stim[41] = 18'h1d6bd;
    stim[42] = 18'h3b501;
    stim[43] = 18'h31b8d;
    stim[44] = 18'h12685;
    stim[45] = 18'h1bfed;
    stim[46] = 18'h044a7;
    stim[47] = 18'h3e9c5;
    stim[48] = 18'h1b6a1;
    stim[49] = 18'h16dc8;
    stim[50] = 18'h1c238;
    stim[51] = 18'h13356;
    stim[52] = 18'h01a25;
    stim[53] = 18'h35765;
    stim[54] = 18'h1ef98;
    stim[55] = 18'h08b20;
    stim[56] = 18'h1f334;
    stim[57] = 18'h0f67b;
    stim[58] = 18'h07d0c;
    stim[59] = 18'h0e2d3;
    stim[60] = 18'h1ed35;
    stim[61] = 18'h3ac8e;
    stim[62] = 18'h21540;
    stim[63] = 18'h0b437;
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
      expv[0] = 8'h7c;
      expv[1] = 8'hd9;
      expv[2] = 8'h00;
      expv[3] = 8'h92;
      expv[4] = 8'h2b;
      expv[5] = 8'h00;
      expv[6] = 8'h74;
      expv[7] = 8'ha3;
      expv[8] = 8'h3d;
      expv[9] = 8'h12;
      expv[10] = 8'h4e;
      expv[11] = 8'h89;
      expv[12] = 8'h9a;
      expv[13] = 8'he5;
      expv[14] = 8'h26;
      expv[15] = 8'h00;
      expv[16] = 8'h8f;
      expv[17] = 8'hda;
      expv[18] = 8'hb5;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'hfa;
      expv[22] = 8'h00;
      expv[23] = 8'h88;
      expv[24] = 8'hbb;
      expv[25] = 8'h5c;
      expv[26] = 8'h09;
      expv[27] = 8'h7a;
      expv[28] = 8'h22;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h9f;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h70;
      expv[36] = 8'h25;
      expv[37] = 8'h00;
      expv[38] = 8'hf0;
      expv[39] = 8'hb5;
      expv[40] = 8'h00;
      expv[41] = 8'hda;
      expv[42] = 8'had;
      expv[43] = 8'h25;
      expv[44] = 8'he8;
      expv[45] = 8'h94;
      expv[46] = 8'h00;
      expv[47] = 8'h8b;
      expv[48] = 8'hc5;
      expv[49] = 8'h29;
      expv[50] = 8'hfe;
      expv[51] = 8'h32;
      expv[52] = 8'h8f;
      expv[53] = 8'h0c;
      expv[54] = 8'h9d;
      expv[55] = 8'hea;
      expv[56] = 8'hb1;
      expv[57] = 8'h00;
      expv[58] = 8'h5c;
      expv[59] = 8'h00;
      expv[60] = 8'h36;
      expv[61] = 8'hd7;
      expv[62] = 8'hd5;
      expv[63] = 8'h00;
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
