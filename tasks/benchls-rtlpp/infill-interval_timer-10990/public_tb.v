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

  rtlpp_10990 dut (
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
    stim[0] = 22'h212af3;
    stim[1] = 22'h3901b3;
    stim[2] = 22'h174ccb;
    stim[3] = 22'h175555;
    stim[4] = 22'h12e62a;
    stim[5] = 22'h1f9a91;
    stim[6] = 22'h2f828f;
    stim[7] = 22'h23c703;
    stim[8] = 22'h0640d2;
    stim[9] = 22'h1a04bc;
    stim[10] = 22'h03852b;
    stim[11] = 22'h3b9c78;
    stim[12] = 22'h1f8f3d;
    stim[13] = 22'h2a68d5;
    stim[14] = 22'h260a0c;
    stim[15] = 22'h320454;
    stim[16] = 22'h1aa26b;
    stim[17] = 22'h1adbf3;
    stim[18] = 22'h1aa95d;
    stim[19] = 22'h1f6910;
    stim[20] = 22'h1fcd5d;
    stim[21] = 22'h16384a;
    stim[22] = 22'h071d24;
    stim[23] = 22'h27e66d;
    stim[24] = 22'h1fbbc7;
    stim[25] = 22'h1b7ab6;
    stim[26] = 22'h230ca5;
    stim[27] = 22'h12ecb1;
    stim[28] = 22'h0adc69;
    stim[29] = 22'h1749d7;
    stim[30] = 22'h06ae5c;
    stim[31] = 22'h1ae278;
    stim[32] = 22'h1bde52;
    stim[33] = 22'h0b4685;
    stim[34] = 22'h26faf2;
    stim[35] = 22'h3fd264;
    stim[36] = 22'h3fe0fc;
    stim[37] = 22'h328322;
    stim[38] = 22'h0b0837;
    stim[39] = 22'h135fac;
    stim[40] = 22'h06a07e;
    stim[41] = 22'h279960;
    stim[42] = 22'h279cb4;
    stim[43] = 22'h0abeaf;
    stim[44] = 22'h33696e;
    stim[45] = 22'h374cca;
    stim[46] = 22'h2a8145;
    stim[47] = 22'h324002;
    stim[48] = 22'h06aa89;
    stim[49] = 22'h3e70fe;
    stim[50] = 22'h1733a7;
    stim[51] = 22'h032270;
    stim[52] = 22'h3eb647;
    stim[53] = 22'h3b0239;
    stim[54] = 22'h3621ae;
    stim[55] = 22'h3a64e3;
    stim[56] = 22'h3b8732;
    stim[57] = 22'h364897;
    stim[58] = 22'h169859;
    stim[59] = 22'h16d301;
    stim[60] = 22'h1fd637;
    stim[61] = 22'h22e61d;
    stim[62] = 22'h2b5185;
    stim[63] = 22'h3340d9;
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
      expv[3] = 17'h05e0f;
      expv[4] = 17'h05e0f;
      expv[5] = 17'h05e0f;
      expv[6] = 17'h0005f;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h0005f;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h0005f;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0005f;
      expv[18] = 17'h0005f;
      expv[19] = 17'h0005f;
      expv[20] = 17'h0005f;
      expv[21] = 17'h0005f;
      expv[22] = 17'h05e0f;
      expv[23] = 17'h00000;
      expv[24] = 17'h05e0f;
      expv[25] = 17'h0005f;
      expv[26] = 17'h0005f;
      expv[27] = 17'h05e0f;
      expv[28] = 17'h0384a;
      expv[29] = 17'h00000;
      expv[30] = 17'h0384a;
      expv[31] = 17'h00000;
      expv[32] = 17'h0005f;
      expv[33] = 17'h0005f;
      expv[34] = 17'h00000;
      expv[35] = 17'h05e0f;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h0384a;
      expv[41] = 17'h00000;
      expv[42] = 17'h0384a;
      expv[43] = 17'h0384a;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h0005f;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h0384a;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h0384a;
      expv[60] = 17'h09859;
      expv[61] = 17'h0005f;
      expv[62] = 17'h0384a;
      expv[63] = 17'h0005f;
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
