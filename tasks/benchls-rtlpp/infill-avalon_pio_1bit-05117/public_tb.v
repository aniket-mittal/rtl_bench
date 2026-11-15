// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05117 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h144d94ae11;
    stim[1] = 37'h1118e0741d;
    stim[2] = 37'h12b266cfc8;
    stim[3] = 37'h0aa299f105;
    stim[4] = 37'h0b27faa7f7;
    stim[5] = 37'h0266e83cb0;
    stim[6] = 37'h169ff9fee4;
    stim[7] = 37'h0fa743e623;
    stim[8] = 37'h06318a4758;
    stim[9] = 37'h1a829214b5;
    stim[10] = 37'h12c0c6aa82;
    stim[11] = 37'h17d523e3f7;
    stim[12] = 37'h1b3bd48b6b;
    stim[13] = 37'h0a1689094a;
    stim[14] = 37'h125af39867;
    stim[15] = 37'h0afef98842;
    stim[16] = 37'h1a15add7a3;
    stim[17] = 37'h12e32a4154;
    stim[18] = 37'h0faad50dc2;
    stim[19] = 37'h1ebe342ccf;
    stim[20] = 37'h1eb36e0d88;
    stim[21] = 37'h038d565a12;
    stim[22] = 37'h0ec1c810d1;
    stim[23] = 37'h06b1d837f0;
    stim[24] = 37'h169e8709c8;
    stim[25] = 37'h13b6228c70;
    stim[26] = 37'h1b8b2b61e2;
    stim[27] = 37'h1341b19cbb;
    stim[28] = 37'h1fe4e312ac;
    stim[29] = 37'h1db5a326f9;
    stim[30] = 37'h0e783e946c;
    stim[31] = 37'h0743be2a60;
    stim[32] = 37'h0765885921;
    stim[33] = 37'h1abb11809d;
    stim[34] = 37'h1fa1ecccf8;
    stim[35] = 37'h0e8a656643;
    stim[36] = 37'h1ffdea1e6f;
    stim[37] = 37'h0633512f70;
    stim[38] = 37'h17c538b312;
    stim[39] = 37'h0b5bc31ee9;
    stim[40] = 37'h1257c8fa91;
    stim[41] = 37'h168d9382f8;
    stim[42] = 37'h0faae1acc4;
    stim[43] = 37'h1fca9defd5;
    stim[44] = 37'h165821f267;
    stim[45] = 37'h1b8bc223c7;
    stim[46] = 37'h0bda1e2cab;
    stim[47] = 37'h1bd54bd1ef;
    stim[48] = 37'h16d2534841;
    stim[49] = 37'h0b0734795d;
    stim[50] = 37'h022cde46aa;
    stim[51] = 37'h1f446f613b;
    stim[52] = 37'h03523ef439;
    stim[53] = 37'h0220875dad;
    stim[54] = 37'h06202f2ff2;
    stim[55] = 37'h070fdf094f;
    stim[56] = 37'h0305e27608;
    stim[57] = 37'h0623e99134;
    stim[58] = 37'h1a19cd366d;
    stim[59] = 37'h0a93e54921;
    stim[60] = 37'h1f394ffcd7;
    stim[61] = 37'h17019aa4d0;
    stim[62] = 37'h130f48a8eb;
    stim[63] = 37'h0a11a783cb;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
