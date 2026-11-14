// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08571 dut (
    .clk(clk),
    .reset(in_vec[21:21]),
    .stream_data(in_vec[20:5]),
    .stream_startofpacket(in_vec[4:4]),
    .stream_endofpacket(in_vec[3:3]),
    .stream_empty(in_vec[2:2]),
    .stream_valid(in_vec[1:1]),
    .master_waitrequest(in_vec[0:0]),
    .stream_ready(out_vec[19:19]),
    .master_write(out_vec[18:18]),
    .master_writedata(out_vec[17:2]),
    .inc_address(out_vec[1:1]),
    .reset_address(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h37f05e;
    stim[1] = 22'h20ec8e;
    stim[2] = 22'h0078e8;
    stim[3] = 22'h1a64bc;
    stim[4] = 22'h1b4b90;
    stim[5] = 22'h18eee9;
    stim[6] = 22'h09ea9f;
    stim[7] = 22'h0b4ed9;
    stim[8] = 22'h0c3ece;
    stim[9] = 22'h10b267;
    stim[10] = 22'h06ff6a;
    stim[11] = 22'h3988cf;
    stim[12] = 22'h229785;
    stim[13] = 22'h122f1d;
    stim[14] = 22'h0186be;
    stim[15] = 22'h0efff6;
    stim[16] = 22'h131efb;
    stim[17] = 22'h1558f1;
    stim[18] = 22'h078a1c;
    stim[19] = 22'h1ba8f0;
    stim[20] = 22'h0f0b6c;
    stim[21] = 22'h2fe7f1;
    stim[22] = 22'h1ce50d;
    stim[23] = 22'h0c0912;
    stim[24] = 22'h0d06de;
    stim[25] = 22'h033eed;
    stim[26] = 22'h077f3d;
    stim[27] = 22'h14dbdc;
    stim[28] = 22'h0bd396;
    stim[29] = 22'h115bf2;
    stim[30] = 22'h0961e6;
    stim[31] = 22'h09b3f9;
    stim[32] = 22'h1fda41;
    stim[33] = 22'h080a36;
    stim[34] = 22'h085512;
    stim[35] = 22'h0b6673;
    stim[36] = 22'h1d0095;
    stim[37] = 22'h197514;
    stim[38] = 22'h0fff08;
    stim[39] = 22'h03b846;
    stim[40] = 22'h09813b;
    stim[41] = 22'h26f04f;
    stim[42] = 22'h0cb6c2;
    stim[43] = 22'h06b9c8;
    stim[44] = 22'h1549fb;
    stim[45] = 22'h132d34;
    stim[46] = 22'h1de73c;
    stim[47] = 22'h12f76f;
    stim[48] = 22'h052a9f;
    stim[49] = 22'h0ff03d;
    stim[50] = 22'h182f3e;
    stim[51] = 22'h064d64;
    stim[52] = 22'h09734c;
    stim[53] = 22'h064f96;
    stim[54] = 22'h038310;
    stim[55] = 22'h045ab6;
    stim[56] = 22'h01b50d;
    stim[57] = 22'h1718fd;
    stim[58] = 22'h1a1d34;
    stim[59] = 22'h113321;
    stim[60] = 22'h0732e7;
    stim[61] = 22'h146205;
    stim[62] = 22'h061e7f;
    stim[63] = 22'h133b3a;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'h00000;
      expv[2] = 20'h80000;
      expv[3] = 20'h80f1c;
      expv[4] = 20'hb4c94;
      expv[5] = 20'hb6970;
      expv[6] = 20'hb1ddf;
      expv[7] = 20'h53d50;
      expv[8] = 20'hd3d52;
      expv[9] = 20'h587d8;
      expv[10] = 20'hd87da;
      expv[11] = 20'h4dfec;
      expv[12] = 20'h4dfec;
      expv[13] = 20'h4dfec;
      expv[14] = 20'hcdfef;
      expv[15] = 20'hc30d7;
      expv[16] = 20'h5dffc;
      expv[17] = 20'h5dffc;
      expv[18] = 20'hddffc;
      expv[19] = 20'h8f140;
      expv[20] = 20'hb751c;
      expv[21] = 20'h1e16c;
      expv[22] = 20'h9e16c;
      expv[23] = 20'hb9ca3;
      expv[24] = 20'hd8123;
      expv[25] = 20'h5a0d8;
      expv[26] = 20'h5a0d8;
      expv[27] = 20'hda0d8;
      expv[28] = 20'ha9b7b;
      expv[29] = 20'hd7a73;
      expv[30] = 20'he2b7e;
      expv[31] = 20'h52c3c;
      expv[32] = 20'h52c3c;
      expv[33] = 20'hd2c3f;
      expv[34] = 20'hd0147;
      expv[35] = 20'h50aa0;
      expv[36] = 20'h50aa0;
      expv[37] = 20'hd0aa0;
      expv[38] = 20'hb2ea0;
      expv[39] = 20'h9ffe2;
      expv[40] = 20'h47708;
      expv[41] = 20'h47708;
      expv[42] = 20'hc770a;
      expv[43] = 20'hd96d8;
      expv[44] = 20'h8d73b;
      expv[45] = 20'hea93c;
      expv[46] = 20'ha65a4;
      expv[47] = 20'hbbce6;
      expv[48] = 20'h65eec;
      expv[49] = 20'h65eec;
      expv[50] = 20'he5eef;
      expv[51] = 20'hf05e4;
      expv[52] = 20'h8c9ac;
      expv[53] = 20'h92e6b;
      expv[54] = 20'hcc9f0;
      expv[55] = 20'h87063;
      expv[56] = 20'h48b54;
      expv[57] = 20'h48b54;
      expv[58] = 20'hc8b54;
      expv[59] = 20'hb43a4;
      expv[60] = 20'ha2666;
      expv[61] = 20'h4e65c;
      expv[62] = 20'h4e65c;
      expv[63] = 20'hce65f;
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
