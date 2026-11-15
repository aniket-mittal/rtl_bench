// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ov7670_capture_verilog dut (
    .pclk(clk),
    .vsync(in_vec[9:9]),
    .href(in_vec[8:8]),
    .d(in_vec[7:0]),
    .addr(out_vec[31:13]),
    .dout(out_vec[12:1]),
    .we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h260;
    stim[1] = 10'h2ab;
    stim[2] = 10'h1bf;
    stim[3] = 10'h1c0;
    stim[4] = 10'h0de;
    stim[5] = 10'h3cb;
    stim[6] = 10'h04f;
    stim[7] = 10'h329;
    stim[8] = 10'h1e5;
    stim[9] = 10'h072;
    stim[10] = 10'h167;
    stim[11] = 10'h0c7;
    stim[12] = 10'h17c;
    stim[13] = 10'h279;
    stim[14] = 10'h0e9;
    stim[15] = 10'h388;
    stim[16] = 10'h38b;
    stim[17] = 10'h178;
    stim[18] = 10'h209;
    stim[19] = 10'h1f9;
    stim[20] = 10'h3e7;
    stim[21] = 10'h1a3;
    stim[22] = 10'h01d;
    stim[23] = 10'h2cb;
    stim[24] = 10'h04d;
    stim[25] = 10'h25a;
    stim[26] = 10'h140;
    stim[27] = 10'h125;
    stim[28] = 10'h0d2;
    stim[29] = 10'h2bf;
    stim[30] = 10'h128;
    stim[31] = 10'h0db;
    stim[32] = 10'h25e;
    stim[33] = 10'h0d6;
    stim[34] = 10'h1ba;
    stim[35] = 10'h1d2;
    stim[36] = 10'h3c5;
    stim[37] = 10'h3da;
    stim[38] = 10'h374;
    stim[39] = 10'h344;
    stim[40] = 10'h01b;
    stim[41] = 10'h0da;
    stim[42] = 10'h122;
    stim[43] = 10'h39a;
    stim[44] = 10'h16a;
    stim[45] = 10'h290;
    stim[46] = 10'h243;
    stim[47] = 10'h0d6;
    stim[48] = 10'h0ed;
    stim[49] = 10'h128;
    stim[50] = 10'h06b;
    stim[51] = 10'h13b;
    stim[52] = 10'h193;
    stim[53] = 10'h078;
    stim[54] = 10'h33c;
    stim[55] = 10'h302;
    stim[56] = 10'h3aa;
    stim[57] = 10'h306;
    stim[58] = 10'h373;
    stim[59] = 10'h072;
    stim[60] = 10'h020;
    stim[61] = 10'h0b3;
    stim[62] = 10'h1aa;
    stim[63] = 10'h186;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h0000xxxx;
      expv[2] = 32'h0000xxxx;
      expv[3] = 32'h000037f7;
      expv[4] = 32'h00005819;
      expv[5] = 32'h00005818;
      expv[6] = 32'h00001818;
      expv[7] = 32'h00001818;
      expv[8] = 32'h00001818;
      expv[9] = 32'h00003cbd;
      expv[10] = 32'h00003cbc;
      expv[11] = 32'h00004ced;
      expv[12] = 32'h00004cec;
      expv[13] = 32'h00006f8f;
      expv[14] = 32'h00000f8e;
      expv[15] = 32'h00000f8e;
      expv[16] = 32'h00000f8e;
      expv[17] = 32'h00000f8e;
      expv[18] = 32'h00002f0f;
      expv[19] = 32'h00000f0e;
      expv[20] = 32'h00003f3f;
      expv[21] = 32'h00001f3e;
      expv[22] = 32'h00003475;
      expv[23] = 32'h00003474;
      expv[24] = 32'h00001474;
      expv[25] = 32'h00001474;
      expv[26] = 32'h00001474;
      expv[27] = 32'h00002809;
      expv[28] = 32'h000044a5;
      expv[29] = 32'h000044a4;
      expv[30] = 32'h000004a4;
      expv[31] = 32'h00002505;
      expv[32] = 32'h00002504;
      expv[33] = 32'h00000504;
      expv[34] = 32'h00000504;
      expv[35] = 32'h00003757;
      expv[36] = 32'h00005a5b;
      expv[37] = 32'h00001a5a;
      expv[38] = 32'h00001a5a;
      expv[39] = 32'h00001a5a;
      expv[40] = 32'h00001a5a;
      expv[41] = 32'h00001a5a;
      expv[42] = 32'h00001a5a;
      expv[43] = 32'h00002445;
      expv[44] = 32'h00000444;
      expv[45] = 32'h00002d4d;
      expv[46] = 32'h00000d4c;
      expv[47] = 32'h00000d4c;
      expv[48] = 32'h00000d4c;
      expv[49] = 32'h00000d4c;
      expv[50] = 32'h00002505;
      expv[51] = 32'h00002504;
      expv[52] = 32'h00004767;
      expv[53] = 32'h00007273;
      expv[54] = 32'h00007272;
      expv[55] = 32'h00001272;
      expv[56] = 32'h00001272;
      expv[57] = 32'h00001272;
      expv[58] = 32'h00001272;
      expv[59] = 32'h00001272;
      expv[60] = 32'h00001272;
      expv[61] = 32'h00001272;
      expv[62] = 32'h00001272;
      expv[63] = 32'h00003555;
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
