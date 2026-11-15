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

  rtlpp_05710 dut (
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
    stim[0] = 22'h392d22;
    stim[1] = 22'h2c87ed;
    stim[2] = 22'h2a23ad;
    stim[3] = 22'h3ae603;
    stim[4] = 22'h3ed2cc;
    stim[5] = 22'h2b938d;
    stim[6] = 22'h2aa9ad;
    stim[7] = 22'h0774cf;
    stim[8] = 22'h0b5d9f;
    stim[9] = 22'h2a7369;
    stim[10] = 22'h17e3bb;
    stim[11] = 22'h0edd56;
    stim[12] = 22'h3a9282;
    stim[13] = 22'h171c1b;
    stim[14] = 22'h0b99b3;
    stim[15] = 22'h32d456;
    stim[16] = 22'h1fe6cb;
    stim[17] = 22'h263c89;
    stim[18] = 22'h032932;
    stim[19] = 22'h1fa1d4;
    stim[20] = 22'h330c1f;
    stim[21] = 22'h1f09e0;
    stim[22] = 22'h33d014;
    stim[23] = 22'h2aabb1;
    stim[24] = 22'h233949;
    stim[25] = 22'h0a7db9;
    stim[26] = 22'h3294c9;
    stim[27] = 22'h16dc03;
    stim[28] = 22'h23b43c;
    stim[29] = 22'h1a41f5;
    stim[30] = 22'h271813;
    stim[31] = 22'h2e5b4a;
    stim[32] = 22'h3a17b7;
    stim[33] = 22'h2af28d;
    stim[34] = 22'h1f861e;
    stim[35] = 22'h224301;
    stim[36] = 22'h3a75c8;
    stim[37] = 22'h06c410;
    stim[38] = 22'h0a19f0;
    stim[39] = 22'h1ea6d5;
    stim[40] = 22'h2b74eb;
    stim[41] = 22'h3a1605;
    stim[42] = 22'h26efb3;
    stim[43] = 22'h33e9d8;
    stim[44] = 22'h028d10;
    stim[45] = 22'h120295;
    stim[46] = 22'h21e43d;
    stim[47] = 22'h2e0575;
    stim[48] = 22'h034f4b;
    stim[49] = 22'h27d607;
    stim[50] = 22'h2757ae;
    stim[51] = 22'h3b727d;
    stim[52] = 22'h328c48;
    stim[53] = 22'h26cc6b;
    stim[54] = 22'h3bd45d;
    stim[55] = 22'h26ae19;
    stim[56] = 22'h2ab414;
    stim[57] = 22'h1695f5;
    stim[58] = 22'h22a376;
    stim[59] = 22'h16ac50;
    stim[60] = 22'h2bdaf1;
    stim[61] = 22'h2781d4;
    stim[62] = 22'h1a8a83;
    stim[63] = 22'h278d1a;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h0c34f;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h00006;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00002;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0c34a;
      expv[26] = 17'h00006;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h0c34a;
      expv[30] = 17'h00000;
      expv[31] = 17'h0c34a;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h0dc03;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00006;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h0dc03;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h0c34f;
      expv[51] = 17'h0c34f;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h00000;
      expv[56] = 17'h0c34f;
      expv[57] = 17'h00000;
      expv[58] = 17'h0c34f;
      expv[59] = 17'h0c34f;
      expv[60] = 17'h095f5;
      expv[61] = 17'h00000;
      expv[62] = 17'h0c34f;
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
