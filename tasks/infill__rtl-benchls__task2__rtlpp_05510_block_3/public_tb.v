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

  rtlpp_05510 dut (
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
    stim[0] = 22'h0c82b8;
    stim[1] = 22'h00a10a;
    stim[2] = 22'h1f4cef;
    stim[3] = 22'h33c531;
    stim[4] = 22'h0b8244;
    stim[5] = 22'h331ba6;
    stim[6] = 22'h324cb8;
    stim[7] = 22'h3335b6;
    stim[8] = 22'h27e5fb;
    stim[9] = 22'h1fc545;
    stim[10] = 22'h0ebfca;
    stim[11] = 22'h074652;
    stim[12] = 22'h2ffacc;
    stim[13] = 22'h26140e;
    stim[14] = 22'h333fb7;
    stim[15] = 22'h166b5b;
    stim[16] = 22'h12cfb4;
    stim[17] = 22'h1b861d;
    stim[18] = 22'h3b826b;
    stim[19] = 22'h0f807b;
    stim[20] = 22'h3af76c;
    stim[21] = 22'h16ab6a;
    stim[22] = 22'h073f32;
    stim[23] = 22'h0245e8;
    stim[24] = 22'h22bf17;
    stim[25] = 22'h27ad08;
    stim[26] = 22'h2b28c6;
    stim[27] = 22'h06abfc;
    stim[28] = 22'h3f11cf;
    stim[29] = 22'h278649;
    stim[30] = 22'h3be14a;
    stim[31] = 22'h1b97dc;
    stim[32] = 22'h12f047;
    stim[33] = 22'h374b2b;
    stim[34] = 22'h27597b;
    stim[35] = 22'h1ad3a9;
    stim[36] = 22'h0e5e89;
    stim[37] = 22'h37ac65;
    stim[38] = 22'h0fee79;
    stim[39] = 22'h3add7d;
    stim[40] = 22'h0e0e80;
    stim[41] = 22'h06fe98;
    stim[42] = 22'h3e0819;
    stim[43] = 22'h3b6190;
    stim[44] = 22'h323204;
    stim[45] = 22'h2fdc84;
    stim[46] = 22'h0e6f85;
    stim[47] = 22'h1e657e;
    stim[48] = 22'h27bbc2;
    stim[49] = 22'h1f6352;
    stim[50] = 22'h0b2d33;
    stim[51] = 22'h0fc665;
    stim[52] = 22'h3ea855;
    stim[53] = 22'h1f5f9f;
    stim[54] = 22'h02102f;
    stim[55] = 22'h3ea658;
    stim[56] = 22'h0bad8f;
    stim[57] = 22'h16c1c5;
    stim[58] = 22'h0a4b73;
    stim[59] = 22'h12bbc3;
    stim[60] = 22'h3a0e90;
    stim[61] = 22'h0aece5;
    stim[62] = 22'h06f22b;
    stim[63] = 22'h062992;
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
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h06b5b;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h0000a;
      expv[21] = 17'h00000;
      expv[22] = 17'h06b5b;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h0ab6a;
      expv[34] = 17'h00000;
      expv[35] = 17'h0c34f;
      expv[36] = 17'h00000;
      expv[37] = 17'h0000a;
      expv[38] = 17'h00000;
      expv[39] = 17'h00009;
      expv[40] = 17'h00000;
      expv[41] = 17'h00009;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0c34f;
      expv[50] = 17'h0657e;
      expv[51] = 17'h00005;
      expv[52] = 17'h00005;
      expv[53] = 17'h00000;
      expv[54] = 17'h0657e;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00005;
      expv[58] = 17'h0ab6a;
      expv[59] = 17'h00005;
      expv[60] = 17'h0c1c5;
      expv[61] = 17'h00000;
      expv[62] = 17'h00005;
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
