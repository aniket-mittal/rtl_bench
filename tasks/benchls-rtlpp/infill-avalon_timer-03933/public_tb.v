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

  rtlpp_03933 dut (
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
    stim[0] = 22'h094d78;
    stim[1] = 22'h11d602;
    stim[2] = 22'h0e5a9b;
    stim[3] = 22'h2fb46d;
    stim[4] = 22'h0e8737;
    stim[5] = 22'h06d3b5;
    stim[6] = 22'h260b88;
    stim[7] = 22'h0b4c66;
    stim[8] = 22'h0659bf;
    stim[9] = 22'h2f7e0d;
    stim[10] = 22'h136fc5;
    stim[11] = 22'h1b75d1;
    stim[12] = 22'h16c5b8;
    stim[13] = 22'h26644c;
    stim[14] = 22'h3bc701;
    stim[15] = 22'h1f8a66;
    stim[16] = 22'h22d7dd;
    stim[17] = 22'h0e19a9;
    stim[18] = 22'h17ca19;
    stim[19] = 22'h12c139;
    stim[20] = 22'h2b4a4f;
    stim[21] = 22'h1eebe0;
    stim[22] = 22'h1b7527;
    stim[23] = 22'h2b4a89;
    stim[24] = 22'h26fb18;
    stim[25] = 22'h2b5ce9;
    stim[26] = 22'h3250d4;
    stim[27] = 22'h2b7ba6;
    stim[28] = 22'h37e5c7;
    stim[29] = 22'h0be2b9;
    stim[30] = 22'h0b44cc;
    stim[31] = 22'h1acfe2;
    stim[32] = 22'h378e14;
    stim[33] = 22'h03ff4a;
    stim[34] = 22'h3a6ded;
    stim[35] = 22'h0b5770;
    stim[36] = 22'h3ac818;
    stim[37] = 22'h1bea85;
    stim[38] = 22'h0bfd05;
    stim[39] = 22'h2bf489;
    stim[40] = 22'h3cfdb8;
    stim[41] = 22'h37ac91;
    stim[42] = 22'h2e6c4b;
    stim[43] = 22'h3acabc;
    stim[44] = 22'h1660fd;
    stim[45] = 22'h223e77;
    stim[46] = 22'h0f3fec;
    stim[47] = 22'h03034e;
    stim[48] = 22'h22ca12;
    stim[49] = 22'h1224c6;
    stim[50] = 22'h3ed4dd;
    stim[51] = 22'h277ad1;
    stim[52] = 22'h16f648;
    stim[53] = 22'h1a0a98;
    stim[54] = 22'h33d215;
    stim[55] = 22'h279db0;
    stim[56] = 22'h134ccf;
    stim[57] = 22'h2be9e4;
    stim[58] = 22'h1e8d12;
    stim[59] = 22'h3aaefa;
    stim[60] = 22'h2bacae;
    stim[61] = 22'h0f8869;
    stim[62] = 22'h133512;
    stim[63] = 22'h2adbfc;
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
      expv[5] = 17'h0000b;
      expv[6] = 17'h00002;
      expv[7] = 17'h00000;
      expv[8] = 17'h00007;
      expv[9] = 17'h00002;
      expv[10] = 17'h0005f;
      expv[11] = 17'h05e0f;
      expv[12] = 17'h0005f;
      expv[13] = 17'h05e0f;
      expv[14] = 17'h05e0e;
      expv[15] = 17'h00000;
      expv[16] = 17'h0005f;
      expv[17] = 17'h05e07;
      expv[18] = 17'h00007;
      expv[19] = 17'h0c5b8;
      expv[20] = 17'h0c5b8;
      expv[21] = 17'h0005f;
      expv[22] = 17'h0005f;
      expv[23] = 17'h0ebe0;
      expv[24] = 17'h0005f;
      expv[25] = 17'h05e07;
      expv[26] = 17'h0ebe0;
      expv[27] = 17'h00000;
      expv[28] = 17'h0ebe0;
      expv[29] = 17'h00000;
      expv[30] = 17'h00009;
      expv[31] = 17'h00009;
      expv[32] = 17'h0ebe0;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00009;
      expv[37] = 17'h00000;
      expv[38] = 17'h0ebe0;
      expv[39] = 17'h00009;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h05e0f;
      expv[46] = 17'h05e0f;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h05e0f;
      expv[50] = 17'h060fd;
      expv[51] = 17'h00000;
      expv[52] = 17'h05e0f;
      expv[53] = 17'h060fd;
      expv[54] = 17'h0005f;
      expv[55] = 17'h00000;
      expv[56] = 17'h05e0f;
      expv[57] = 17'h0f648;
      expv[58] = 17'h0005f;
      expv[59] = 17'h0005f;
      expv[60] = 17'h00000;
      expv[61] = 17'h0005f;
      expv[62] = 17'h00000;
      expv[63] = 17'h0f648;
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
