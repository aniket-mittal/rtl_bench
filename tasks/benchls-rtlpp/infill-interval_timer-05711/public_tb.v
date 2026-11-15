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

  rtlpp_05711 dut (
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
    stim[0] = 22'h098922;
    stim[1] = 22'h3431ba;
    stim[2] = 22'h3a3f14;
    stim[3] = 22'h2ea74e;
    stim[4] = 22'h2f3784;
    stim[5] = 22'h2b0a15;
    stim[6] = 22'h022bbe;
    stim[7] = 22'h06c553;
    stim[8] = 22'h262373;
    stim[9] = 22'h0e6ed0;
    stim[10] = 22'h3398e0;
    stim[11] = 22'h3be220;
    stim[12] = 22'h1f5347;
    stim[13] = 22'h0f48f4;
    stim[14] = 22'h179660;
    stim[15] = 22'h2722fa;
    stim[16] = 22'h1ac649;
    stim[17] = 22'h2a6e3f;
    stim[18] = 22'h3ae527;
    stim[19] = 22'h1ed7b4;
    stim[20] = 22'h26d133;
    stim[21] = 22'h1eed19;
    stim[22] = 22'h3acaf9;
    stim[23] = 22'h262d9b;
    stim[24] = 22'h238412;
    stim[25] = 22'h3bfdd1;
    stim[26] = 22'h36723a;
    stim[27] = 22'h075838;
    stim[28] = 22'h22499b;
    stim[29] = 22'h3e0e6c;
    stim[30] = 22'h36cf97;
    stim[31] = 22'h32b585;
    stim[32] = 22'h3b7abf;
    stim[33] = 22'h1f67d3;
    stim[34] = 22'h1aff8b;
    stim[35] = 22'h2b8baf;
    stim[36] = 22'h16c20a;
    stim[37] = 22'h2a92f6;
    stim[38] = 22'h3270ea;
    stim[39] = 22'h1285f9;
    stim[40] = 22'h02ba11;
    stim[41] = 22'h371b9b;
    stim[42] = 22'h2777ee;
    stim[43] = 22'h1e4be5;
    stim[44] = 22'h2b855b;
    stim[45] = 22'h17d6d1;
    stim[46] = 22'h1e3a31;
    stim[47] = 22'h12670b;
    stim[48] = 22'h3a6204;
    stim[49] = 22'h12c2b8;
    stim[50] = 22'h36b1e7;
    stim[51] = 22'h1af946;
    stim[52] = 22'h2284ba;
    stim[53] = 22'h1a19d8;
    stim[54] = 22'h07fd37;
    stim[55] = 22'h322621;
    stim[56] = 22'h3665a8;
    stim[57] = 22'h0e2b35;
    stim[58] = 22'h225db5;
    stim[59] = 22'h1ffa7d;
    stim[60] = 22'h32d3af;
    stim[61] = 22'h26ed2d;
    stim[62] = 22'h167b16;
    stim[63] = 22'h33337a;
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
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h0c34f;
      expv[22] = 17'h0d7b4;
      expv[23] = 17'h00000;
      expv[24] = 17'h0c34f;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h0ed19;
      expv[35] = 17'h0ed19;
      expv[36] = 17'h0ed19;
      expv[37] = 17'h0c34f;
      expv[38] = 17'h0ed19;
      expv[39] = 17'h00000;
      expv[40] = 17'h0c20a;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h0ed19;
      expv[45] = 17'h0ed19;
      expv[46] = 17'h0c20a;
      expv[47] = 17'h04be5;
      expv[48] = 17'h0c20a;
      expv[49] = 17'h00000;
      expv[50] = 17'h0c20a;
      expv[51] = 17'h00000;
      expv[52] = 17'h03a31;
      expv[53] = 17'h0c34f;
      expv[54] = 17'h03a31;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h0c34f;
      expv[60] = 17'h03a31;
      expv[61] = 17'h00000;
      expv[62] = 17'h0c34f;
      expv[63] = 17'h0c20a;
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
