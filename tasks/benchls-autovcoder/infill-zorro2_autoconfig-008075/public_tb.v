// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008075 dut (
    .AS20(clk),
    .RESET(in_vec[50:50]),
    .RW20(in_vec[49:49]),
    .DS20(in_vec[48:48]),
    .A(in_vec[47:16]),
    .D(in_vec[15:0]),
    .DOUT(out_vec[6:3]),
    .ACCESS(out_vec[2:2]),
    .DECODE(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h49d1a7a3c017a;
    stim[1] = 51'h7b226e9119b10;
    stim[2] = 51'h3437059e3316a;
    stim[3] = 51'h3f39ddbceca23;
    stim[4] = 51'h39423880e5e87;
    stim[5] = 51'h01c6184b143a5;
    stim[6] = 51'h1e60e587acce6;
    stim[7] = 51'h2fe71e9b5da54;
    stim[8] = 51'h0fef5e5f5adc1;
    stim[9] = 51'h3ec29a833a76c;
    stim[10] = 51'h063414ce7016d;
    stim[11] = 51'h3fef0dbfa65e4;
    stim[12] = 51'h229483d6e60f0;
    stim[13] = 51'h2ca652787d278;
    stim[14] = 51'h399214e1a7f50;
    stim[15] = 51'h15910b8088179;
    stim[16] = 51'h1e6f6b2a26413;
    stim[17] = 51'h1d74363b390c5;
    stim[18] = 51'h00c375d7b6913;
    stim[19] = 51'h015ee119b0d00;
    stim[20] = 51'h0ddd8c40be35b;
    stim[21] = 51'h18a27948fe93a;
    stim[22] = 51'h144d01317a715;
    stim[23] = 51'h0b3051af9f2ca;
    stim[24] = 51'h0fbd6a433462b;
    stim[25] = 51'h32bac57f67978;
    stim[26] = 51'h0cd144b00343c;
    stim[27] = 51'h2c0f214dae7a2;
    stim[28] = 51'h147dc11180a7e;
    stim[29] = 51'h1897ab96cc284;
    stim[30] = 51'h06a99ee2347c1;
    stim[31] = 51'h345c3a3851a89;
    stim[32] = 51'h38eb7f1170e94;
    stim[33] = 51'h238870e165a85;
    stim[34] = 51'h033c3e8498e43;
    stim[35] = 51'h20cee80780db6;
    stim[36] = 51'h126f94b6f9277;
    stim[37] = 51'h24a7a6c15e9bb;
    stim[38] = 51'h1562d30808846;
    stim[39] = 51'h12288dbeb3ace;
    stim[40] = 51'h1e4b920c4bdf0;
    stim[41] = 51'h3f667fbcdb247;
    stim[42] = 51'h34b9c84c59d02;
    stim[43] = 51'h0db467a15485a;
    stim[44] = 51'h08174d0967fe9;
    stim[45] = 51'h1f281cba08ce3;
    stim[46] = 51'h34c610b3fb558;
    stim[47] = 51'h236940200329e;
    stim[48] = 51'h329af07c1ddfe;
    stim[49] = 51'h07c0d38cb1492;
    stim[50] = 51'h339441f3ec120;
    stim[51] = 51'h5e3aba41eece4;
    stim[52] = 51'h3559ea1829faf;
    stim[53] = 51'h2b558f76f4687;
    stim[54] = 51'h127672e08f208;
    stim[55] = 51'h12a8258968d31;
    stim[56] = 51'h1614a1f7a7825;
    stim[57] = 51'h1a95d3477f6a6;
    stim[58] = 51'h23b44986bdbba;
    stim[59] = 51'h017a0fbae37ec;
    stim[60] = 51'h35c6ed5c1654e;
    stim[61] = 51'h29a9aa367d30e;
    stim[62] = 51'h270c8a32620de;
    stim[63] = 51'h230530dc0edad;
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
      expv[0] = 7'h7f;
      expv[1] = 7'h7e;
      expv[2] = 7'h7f;
      expv[3] = 7'h7f;
      expv[4] = 7'h7e;
      expv[5] = 7'h7f;
      expv[6] = 7'h7f;
      expv[7] = 7'h7f;
      expv[8] = 7'h7f;
      expv[9] = 7'h7e;
      expv[10] = 7'h7f;
      expv[11] = 7'h7f;
      expv[12] = 7'h7f;
      expv[13] = 7'h7f;
      expv[14] = 7'h7e;
      expv[15] = 7'h7f;
      expv[16] = 7'h7f;
      expv[17] = 7'h7f;
      expv[18] = 7'h7e;
      expv[19] = 7'h7f;
      expv[20] = 7'h7f;
      expv[21] = 7'h7e;
      expv[22] = 7'h7f;
      expv[23] = 7'h7f;
      expv[24] = 7'h7f;
      expv[25] = 7'h7f;
      expv[26] = 7'h7f;
      expv[27] = 7'h7f;
      expv[28] = 7'h7f;
      expv[29] = 7'h7f;
      expv[30] = 7'h7f;
      expv[31] = 7'h7f;
      expv[32] = 7'h7f;
      expv[33] = 7'h7f;
      expv[34] = 7'h7f;
      expv[35] = 7'h7f;
      expv[36] = 7'h7f;
      expv[37] = 7'h7f;
      expv[38] = 7'h7e;
      expv[39] = 7'h7f;
      expv[40] = 7'h7f;
      expv[41] = 7'h7f;
      expv[42] = 7'h7f;
      expv[43] = 7'h7f;
      expv[44] = 7'h7f;
      expv[45] = 7'h7f;
      expv[46] = 7'h7f;
      expv[47] = 7'h7f;
      expv[48] = 7'h7f;
      expv[49] = 7'h7f;
      expv[50] = 7'h7f;
      expv[51] = 7'h7f;
      expv[52] = 7'h7f;
      expv[53] = 7'h7f;
      expv[54] = 7'h7f;
      expv[55] = 7'h7f;
      expv[56] = 7'h7f;
      expv[57] = 7'h7f;
      expv[58] = 7'h7f;
      expv[59] = 7'h7f;
      expv[60] = 7'h7f;
      expv[61] = 7'h7f;
      expv[62] = 7'h7f;
      expv[63] = 7'h7f;
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
