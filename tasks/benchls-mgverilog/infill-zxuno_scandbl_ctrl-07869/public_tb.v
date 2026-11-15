// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07869 dut (
    .clk(clk),
    .a(in_vec[36:21]),
    .kbd_change_video_output(in_vec[20:20]),
    .iorq_n(in_vec[19:19]),
    .wr_n(in_vec[18:18]),
    .zxuno_addr(in_vec[17:10]),
    .zxuno_regrd(in_vec[9:9]),
    .zxuno_regwr(in_vec[8:8]),
    .din(in_vec[7:0]),
    .dout(out_vec[16:9]),
    .oe_n(out_vec[8:8]),
    .vga_enable(out_vec[7:7]),
    .scanlines_enable(out_vec[6:6]),
    .freq_option(out_vec[5:3]),
    .turbo_enable(out_vec[2:1]),
    .csync_option(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h002926932f;
    stim[1] = 37'h0015f06fe8;
    stim[2] = 37'h19b958418a;
    stim[3] = 37'h1ee262730e;
    stim[4] = 37'h18d50f2b59;
    stim[5] = 37'h027dc1426a;
    stim[6] = 37'h15ea45f854;
    stim[7] = 37'h02b669d99b;
    stim[8] = 37'h1a4246eb4a;
    stim[9] = 37'h1330eab925;
    stim[10] = 37'h1dcd53c8e0;
    stim[11] = 37'h1f09874a9c;
    stim[12] = 37'h168afd6551;
    stim[13] = 37'h191a0d7272;
    stim[14] = 37'h0d4efb9cbe;
    stim[15] = 37'h0a7a0bd5db;
    stim[16] = 37'h06eb786e39;
    stim[17] = 37'h1b43af9a98;
    stim[18] = 37'h085e400b70;
    stim[19] = 37'h171198ca13;
    stim[20] = 37'h1677049851;
    stim[21] = 37'h184b94547e;
    stim[22] = 37'h0455b41de4;
    stim[23] = 37'h061b506628;
    stim[24] = 37'h1451721912;
    stim[25] = 37'h197a656e9b;
    stim[26] = 37'h161bff2edb;
    stim[27] = 37'h11ac2c5e43;
    stim[28] = 37'h1d30af4050;
    stim[29] = 37'h07b24ac518;
    stim[30] = 37'h1a6f06a212;
    stim[31] = 37'h1022d76937;
    stim[32] = 37'h0f9e344d2c;
    stim[33] = 37'h09ceea8a25;
    stim[34] = 37'h077058f562;
    stim[35] = 37'h0a16611db4;
    stim[36] = 37'h1b00249afd;
    stim[37] = 37'h027acfc39e;
    stim[38] = 37'h06aa8ae794;
    stim[39] = 37'h0921f01f2b;
    stim[40] = 37'h068951cec0;
    stim[41] = 37'h012a00550a;
    stim[42] = 37'h1e514f3dc0;
    stim[43] = 37'h1741f12185;
    stim[44] = 37'h1010dd782a;
    stim[45] = 37'h00693735cd;
    stim[46] = 37'h0afa7c1855;
    stim[47] = 37'h1d76a29fc9;
    stim[48] = 37'h09c1f578fe;
    stim[49] = 37'h1e59caf72d;
    stim[50] = 37'h120c6f6bf1;
    stim[51] = 37'h09eb2c03b0;
    stim[52] = 37'h1ce9f6f9ca;
    stim[53] = 37'h11fbef0549;
    stim[54] = 37'h04e3e70ad5;
    stim[55] = 37'h0aaf1b791d;
    stim[56] = 37'h18bc40a4d4;
    stim[57] = 37'h1fc3a98a6f;
    stim[58] = 37'h0a94bb5c4e;
    stim[59] = 37'h1d79790f36;
    stim[60] = 37'h1ed9e32a6d;
    stim[61] = 37'h14767cd89b;
    stim[62] = 37'h1e2f1b640a;
    stim[63] = 37'h1db4d0ab7e;
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
      expv[0] = 17'hxxx00;
      expv[1] = 17'h00100;
      expv[2] = 17'h00100;
      expv[3] = 17'h001b8;
      expv[4] = 17'h03bb8;
      expv[5] = 17'h03bb8;
      expv[6] = 17'h03bb8;
      expv[7] = 17'h03bb8;
      expv[8] = 17'h03bb8;
      expv[9] = 17'h03bb8;
      expv[10] = 17'h03bb8;
      expv[11] = 17'h03bb8;
      expv[12] = 17'h03b00;
      expv[13] = 17'h00100;
      expv[14] = 17'h001b8;
      expv[15] = 17'h03bb8;
      expv[16] = 17'h03b00;
      expv[17] = 17'h00100;
      expv[18] = 17'h001b8;
      expv[19] = 17'h03bb8;
      expv[20] = 17'h03bb8;
      expv[21] = 17'h03b00;
      expv[22] = 17'h00100;
      expv[23] = 17'h001b8;
      expv[24] = 17'h03bb8;
      expv[25] = 17'h03bb8;
      expv[26] = 17'h03bb8;
      expv[27] = 17'h03bb8;
      expv[28] = 17'h03b00;
      expv[29] = 17'h00100;
      expv[30] = 17'h00100;
      expv[31] = 17'h00100;
      expv[32] = 17'h00100;
      expv[33] = 17'h001b8;
      expv[34] = 17'h03bb8;
      expv[35] = 17'h03bb8;
      expv[36] = 17'h03b00;
      expv[37] = 17'h00100;
      expv[38] = 17'h00100;
      expv[39] = 17'h00100;
      expv[40] = 17'h00100;
      expv[41] = 17'h001b8;
      expv[42] = 17'h03bb8;
      expv[43] = 17'h03bb8;
      expv[44] = 17'h03bb8;
      expv[45] = 17'h03b00;
      expv[46] = 17'h00100;
      expv[47] = 17'h00100;
      expv[48] = 17'h00100;
      expv[49] = 17'h00100;
      expv[50] = 17'h001b8;
      expv[51] = 17'h03bb8;
      expv[52] = 17'h03bb8;
      expv[53] = 17'h03bb8;
      expv[54] = 17'h03b00;
      expv[55] = 17'h00100;
      expv[56] = 17'h00100;
      expv[57] = 17'h001b8;
      expv[58] = 17'h03bb8;
      expv[59] = 17'h03bb8;
      expv[60] = 17'h03b00;
      expv[61] = 17'h00100;
      expv[62] = 17'h00100;
      expv[63] = 17'h001b8;
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
