// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088973 dut (
    .PCLK(clk),
    .RESETn(in_vec[13:13]),
    .VSYNC(in_vec[12:12]),
    .HREF(in_vec[11:11]),
    .D(in_vec[10:3]),
    .block(in_vec[2:2]),
    .wr_delay(in_vec[1:1]),
    .init_done(in_vec[0:0]),
    .dout(out_vec[9:2]),
    .valid(out_vec[1:1]),
    .frame_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h1aa5;
    stim[1] = 14'h0ee3;
    stim[2] = 14'h3b62;
    stim[3] = 14'h3f86;
    stim[4] = 14'h3255;
    stim[5] = 14'h3e54;
    stim[6] = 14'h3002;
    stim[7] = 14'h3533;
    stim[8] = 14'h2845;
    stim[9] = 14'h2e30;
    stim[10] = 14'h2410;
    stim[11] = 14'h27cc;
    stim[12] = 14'h2532;
    stim[13] = 14'h29c6;
    stim[14] = 14'h26ab;
    stim[15] = 14'h3160;
    stim[16] = 14'h2419;
    stim[17] = 14'h27f4;
    stim[18] = 14'h361c;
    stim[19] = 14'h2f04;
    stim[20] = 14'h2b41;
    stim[21] = 14'h2028;
    stim[22] = 14'h2ca6;
    stim[23] = 14'h3814;
    stim[24] = 14'h3c53;
    stim[25] = 14'h2c14;
    stim[26] = 14'h2f2a;
    stim[27] = 14'h26c7;
    stim[28] = 14'h2434;
    stim[29] = 14'h3163;
    stim[30] = 14'h2c11;
    stim[31] = 14'h2899;
    stim[32] = 14'h20e9;
    stim[33] = 14'h24bb;
    stim[34] = 14'h2ebd;
    stim[35] = 14'h39a9;
    stim[36] = 14'h31fc;
    stim[37] = 14'h2229;
    stim[38] = 14'h3dfa;
    stim[39] = 14'h2440;
    stim[40] = 14'h2eb7;
    stim[41] = 14'h207a;
    stim[42] = 14'h3e42;
    stim[43] = 14'h282c;
    stim[44] = 14'h3040;
    stim[45] = 14'h2386;
    stim[46] = 14'h2df0;
    stim[47] = 14'h3094;
    stim[48] = 14'h2de8;
    stim[49] = 14'h3e69;
    stim[50] = 14'h2810;
    stim[51] = 14'h327c;
    stim[52] = 14'h2287;
    stim[53] = 14'h3c73;
    stim[54] = 14'h224e;
    stim[55] = 14'h25b5;
    stim[56] = 14'h3676;
    stim[57] = 14'h3e90;
    stim[58] = 14'h26cb;
    stim[59] = 14'h297a;
    stim[60] = 14'h382f;
    stim[61] = 14'h3fae;
    stim[62] = 14'h2013;
    stim[63] = 14'h3a94;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
