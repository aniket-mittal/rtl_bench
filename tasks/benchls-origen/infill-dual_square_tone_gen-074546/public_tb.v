// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074546 dut (
    .clk(clk),
    .rst_n(in_vec[40:40]),
    .note_div_left(in_vec[39:20]),
    .note_div_right(in_vec[19:0]),
    .audio_left(out_vec[31:16]),
    .audio_right(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h0e636a77a64;
    stim[1] = 41'h05393883b7e;
    stim[2] = 41'h1ccc7a52a7f;
    stim[3] = 41'h1853128fe46;
    stim[4] = 41'h1fe48904a0a;
    stim[5] = 41'h1cfaeefe57b;
    stim[6] = 41'h1da2c9cf762;
    stim[7] = 41'h1d319b259de;
    stim[8] = 41'h1756e4ff964;
    stim[9] = 41'h1cc2602dff9;
    stim[10] = 41'h1e6922ede49;
    stim[11] = 41'h1a51a82c084;
    stim[12] = 41'h14143ac3257;
    stim[13] = 41'h196210437d3;
    stim[14] = 41'h14c72ad240e;
    stim[15] = 41'h18fcef61e5e;
    stim[16] = 41'h10a2f71f6ad;
    stim[17] = 41'h143f3ba7ae9;
    stim[18] = 41'h1a2d691234a;
    stim[19] = 41'h035712687c3;
    stim[20] = 41'h1086f4129e9;
    stim[21] = 41'h1f1ad88a616;
    stim[22] = 41'h1276d569e9a;
    stim[23] = 41'h1c3eeda220d;
    stim[24] = 41'h197f759fdcc;
    stim[25] = 41'h10d2a93bb19;
    stim[26] = 41'h1bbdbfe04f3;
    stim[27] = 41'h01d12d1026d;
    stim[28] = 41'h1a1611b502a;
    stim[29] = 41'h13238b95108;
    stim[30] = 41'h180d280bbaa;
    stim[31] = 41'h11a0e1de53c;
    stim[32] = 41'h1cbef9138c7;
    stim[33] = 41'h1ef5cc9716a;
    stim[34] = 41'h1c6fef9e42b;
    stim[35] = 41'h1005d30f025;
    stim[36] = 41'h1b8c18ade5a;
    stim[37] = 41'h1dd6e4cc928;
    stim[38] = 41'h12dd024d519;
    stim[39] = 41'h1a00f108b24;
    stim[40] = 41'h14f08ba8c48;
    stim[41] = 41'h1069951a280;
    stim[42] = 41'h10c9a556353;
    stim[43] = 41'h18262b3e434;
    stim[44] = 41'h151bfb55109;
    stim[45] = 41'h1fc7be082c5;
    stim[46] = 41'h174c0108436;
    stim[47] = 41'h1a5f52eef10;
    stim[48] = 41'h1a7d92d3067;
    stim[49] = 41'h1b5dd5ec588;
    stim[50] = 41'h14c35c62162;
    stim[51] = 41'h1813ea45c15;
    stim[52] = 41'h115702734dc;
    stim[53] = 41'h13084d9c548;
    stim[54] = 41'h12afb4f32a7;
    stim[55] = 41'h103cefb864b;
    stim[56] = 41'h11118f2e94f;
    stim[57] = 41'h1fdfdd0393c;
    stim[58] = 41'h103c4d9a072;
    stim[59] = 41'h12a62cce980;
    stim[60] = 41'h1c771d386cb;
    stim[61] = 41'h118127a0520;
    stim[62] = 41'h1d7676ec5fe;
    stim[63] = 41'h1f7af9754ec;
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
      expv[0] = 32'hc000c000;
      expv[1] = 32'hc000c000;
      expv[2] = 32'hc000c000;
      expv[3] = 32'hc000c000;
      expv[4] = 32'hc000c000;
      expv[5] = 32'hc000c000;
      expv[6] = 32'hc000c000;
      expv[7] = 32'hc000c000;
      expv[8] = 32'hc000c000;
      expv[9] = 32'hc000c000;
      expv[10] = 32'hc000c000;
      expv[11] = 32'hc000c000;
      expv[12] = 32'hc000c000;
      expv[13] = 32'hc000c000;
      expv[14] = 32'hc000c000;
      expv[15] = 32'hc000c000;
      expv[16] = 32'hc000c000;
      expv[17] = 32'hc000c000;
      expv[18] = 32'hc000c000;
      expv[19] = 32'hc000c000;
      expv[20] = 32'hc000c000;
      expv[21] = 32'hc000c000;
      expv[22] = 32'hc000c000;
      expv[23] = 32'hc000c000;
      expv[24] = 32'hc000c000;
      expv[25] = 32'hc000c000;
      expv[26] = 32'hc000c000;
      expv[27] = 32'hc000c000;
      expv[28] = 32'hc000c000;
      expv[29] = 32'hc000c000;
      expv[30] = 32'hc000c000;
      expv[31] = 32'hc000c000;
      expv[32] = 32'hc000c000;
      expv[33] = 32'hc000c000;
      expv[34] = 32'hc000c000;
      expv[35] = 32'hc000c000;
      expv[36] = 32'hc000c000;
      expv[37] = 32'hc000c000;
      expv[38] = 32'hc000c000;
      expv[39] = 32'hc000c000;
      expv[40] = 32'hc000c000;
      expv[41] = 32'hc000c000;
      expv[42] = 32'hc000c000;
      expv[43] = 32'hc000c000;
      expv[44] = 32'hc000c000;
      expv[45] = 32'hc000c000;
      expv[46] = 32'hc000c000;
      expv[47] = 32'hc000c000;
      expv[48] = 32'hc000c000;
      expv[49] = 32'hc000c000;
      expv[50] = 32'hc000c000;
      expv[51] = 32'hc000c000;
      expv[52] = 32'hc000c000;
      expv[53] = 32'hc000c000;
      expv[54] = 32'hc000c000;
      expv[55] = 32'hc000c000;
      expv[56] = 32'hc000c000;
      expv[57] = 32'hc000c000;
      expv[58] = 32'hc000c000;
      expv[59] = 32'hc000c000;
      expv[60] = 32'hc000c000;
      expv[61] = 32'hc000c000;
      expv[62] = 32'hc000c000;
      expv[63] = 32'hc000c000;
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
