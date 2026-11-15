// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089722 dut (
    .clk(clk),
    .frame(in_vec[12:12]),
    .ACL_IN(in_vec[11:2]),
    .rst(in_vec[1:1]),
    .win_rst(in_vec[0:0]),
    .paddle_x(out_vec[20:10]),
    .paddle_y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0def;
    stim[1] = 13'h177e;
    stim[2] = 13'h18c5;
    stim[3] = 13'h0851;
    stim[4] = 13'h06fc;
    stim[5] = 13'h159c;
    stim[6] = 13'h0a51;
    stim[7] = 13'h105c;
    stim[8] = 13'h0e2d;
    stim[9] = 13'h1469;
    stim[10] = 13'h1f9c;
    stim[11] = 13'h0f99;
    stim[12] = 13'h0774;
    stim[13] = 13'h12e0;
    stim[14] = 13'h0c8c;
    stim[15] = 13'h186d;
    stim[16] = 13'h089d;
    stim[17] = 13'h0ec5;
    stim[18] = 13'h1dd8;
    stim[19] = 13'h0610;
    stim[20] = 13'h1a39;
    stim[21] = 13'h01b0;
    stim[22] = 13'h0d29;
    stim[23] = 13'h1e40;
    stim[24] = 13'h1f44;
    stim[25] = 13'h073c;
    stim[26] = 13'h1215;
    stim[27] = 13'h09b5;
    stim[28] = 13'h1128;
    stim[29] = 13'h128c;
    stim[30] = 13'h10e6;
    stim[31] = 13'h1a24;
    stim[32] = 13'h18e5;
    stim[33] = 13'h0de5;
    stim[34] = 13'h016d;
    stim[35] = 13'h0e90;
    stim[36] = 13'h0810;
    stim[37] = 13'h047c;
    stim[38] = 13'h0759;
    stim[39] = 13'h1d40;
    stim[40] = 13'h06e8;
    stim[41] = 13'h1a84;
    stim[42] = 13'h0be4;
    stim[43] = 13'h0379;
    stim[44] = 13'h1358;
    stim[45] = 13'h0f85;
    stim[46] = 13'h12d0;
    stim[47] = 13'h0c79;
    stim[48] = 13'h0b1c;
    stim[49] = 13'h05a8;
    stim[50] = 13'h02f8;
    stim[51] = 13'h1918;
    stim[52] = 13'h0dc9;
    stim[53] = 13'h1d69;
    stim[54] = 13'h1864;
    stim[55] = 13'h0c84;
    stim[56] = 13'h0219;
    stim[57] = 13'h1c60;
    stim[58] = 13'h06c4;
    stim[59] = 13'h1f01;
    stim[60] = 13'h1868;
    stim[61] = 13'h0205;
    stim[62] = 13'h17cd;
    stim[63] = 13'h1779;
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
      expv[0] = 21'h0c2xxx;
      expv[1] = 21'h0c28c8;
      expv[2] = 21'h0c28c8;
      expv[3] = 21'h0c28c8;
      expv[4] = 21'h0c28c8;
      expv[5] = 21'h0c28c8;
      expv[6] = 21'h0c28ca;
      expv[7] = 21'h0c28c8;
      expv[8] = 21'h0c28c7;
      expv[9] = 21'h0c28c8;
      expv[10] = 21'h0c28c8;
      expv[11] = 21'h0c28c9;
      expv[12] = 21'h0c28c8;
      expv[13] = 21'h0c28c8;
      expv[14] = 21'h0c28c6;
      expv[15] = 21'h0c28c6;
      expv[16] = 21'h0c28c8;
      expv[17] = 21'h0c28c8;
      expv[18] = 21'h0c28c8;
      expv[19] = 21'h0c28ca;
      expv[20] = 21'h0c28ca;
      expv[21] = 21'h0c28c8;
      expv[22] = 21'h0c28c8;
      expv[23] = 21'h0c28c8;
      expv[24] = 21'h0c28c9;
      expv[25] = 21'h0c28ca;
      expv[26] = 21'h0c28ca;
      expv[27] = 21'h0c28c8;
      expv[28] = 21'h0c28c8;
      expv[29] = 21'h0c28c7;
      expv[30] = 21'h0c28c6;
      expv[31] = 21'h0c28c8;
      expv[32] = 21'h0c28c7;
      expv[33] = 21'h0c28c8;
      expv[34] = 21'h0c28c8;
      expv[35] = 21'h0c28c8;
      expv[36] = 21'h0c28c8;
      expv[37] = 21'h0c28c8;
      expv[38] = 21'h0c28c8;
      expv[39] = 21'h0c28c8;
      expv[40] = 21'h0c28ca;
      expv[41] = 21'h0c28ca;
      expv[42] = 21'h0c28c9;
      expv[43] = 21'h0c28c9;
      expv[44] = 21'h0c28c8;
      expv[45] = 21'h0c28c6;
      expv[46] = 21'h0c28c8;
      expv[47] = 21'h0c28c6;
      expv[48] = 21'h0c28c8;
      expv[49] = 21'h0c28c8;
      expv[50] = 21'h0c28c8;
      expv[51] = 21'h0c28c8;
      expv[52] = 21'h0c28c7;
      expv[53] = 21'h0c28c8;
      expv[54] = 21'h0c28c8;
      expv[55] = 21'h0c28c7;
      expv[56] = 21'h0c28c7;
      expv[57] = 21'h0c28c8;
      expv[58] = 21'h0c28ca;
      expv[59] = 21'h0c28ca;
      expv[60] = 21'h0c28c8;
      expv[61] = 21'h0c28c7;
      expv[62] = 21'h0c28c8;
      expv[63] = 21'h0c28c8;
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
