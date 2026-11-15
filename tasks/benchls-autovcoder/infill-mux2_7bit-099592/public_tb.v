// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099592 dut (
    .in1(in_vec[14:8]),
    .in0(in_vec[7:1]),
    .sel(in_vec[0:0]),
    .ou1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h2140;
    stim[1] = 15'h41c5;
    stim[2] = 15'h663a;
    stim[3] = 15'h20f0;
    stim[4] = 15'h1e58;
    stim[5] = 15'h4726;
    stim[6] = 15'h03d3;
    stim[7] = 15'h74c9;
    stim[8] = 15'h480c;
    stim[9] = 15'h5620;
    stim[10] = 15'h3c00;
    stim[11] = 15'h40fd;
    stim[12] = 15'h0b29;
    stim[13] = 15'h7e1d;
    stim[14] = 15'h3f0b;
    stim[15] = 15'h51d8;
    stim[16] = 15'h191a;
    stim[17] = 15'h5e7e;
    stim[18] = 15'h3dd0;
    stim[19] = 15'h2a29;
    stim[20] = 15'h4591;
    stim[21] = 15'h33d8;
    stim[22] = 15'h66e6;
    stim[23] = 15'h3541;
    stim[24] = 15'h437d;
    stim[25] = 15'h618e;
    stim[26] = 15'h133a;
    stim[27] = 15'h55b6;
    stim[28] = 15'h65cd;
    stim[29] = 15'h32ad;
    stim[30] = 15'h2952;
    stim[31] = 15'h4893;
    stim[32] = 15'h09e2;
    stim[33] = 15'h037a;
    stim[34] = 15'h3b20;
    stim[35] = 15'h408f;
    stim[36] = 15'h47a2;
    stim[37] = 15'h0752;
    stim[38] = 15'h2f3a;
    stim[39] = 15'h1436;
    stim[40] = 15'h4dfc;
    stim[41] = 15'h13f2;
    stim[42] = 15'h7949;
    stim[43] = 15'h4624;
    stim[44] = 15'h0e1d;
    stim[45] = 15'h1896;
    stim[46] = 15'h50f3;
    stim[47] = 15'h2c8c;
    stim[48] = 15'h371d;
    stim[49] = 15'h52f4;
    stim[50] = 15'h4dfc;
    stim[51] = 15'h1536;
    stim[52] = 15'h2f12;
    stim[53] = 15'h2506;
    stim[54] = 15'h0624;
    stim[55] = 15'h3718;
    stim[56] = 15'h2e0f;
    stim[57] = 15'h49b7;
    stim[58] = 15'h58c4;
    stim[59] = 15'h72d3;
    stim[60] = 15'h7a52;
    stim[61] = 15'h3d87;
    stim[62] = 15'h7e57;
    stim[63] = 15'h3d6b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 7'h20;
      expv[1] = 7'h41;
      expv[2] = 7'h1d;
      expv[3] = 7'h78;
      expv[4] = 7'h2c;
      expv[5] = 7'h13;
      expv[6] = 7'h03;
      expv[7] = 7'h74;
      expv[8] = 7'h06;
      expv[9] = 7'h10;
      expv[10] = 7'h00;
      expv[11] = 7'h40;
      expv[12] = 7'h0b;
      expv[13] = 7'h7e;
      expv[14] = 7'h3f;
      expv[15] = 7'h6c;
      expv[16] = 7'h0d;
      expv[17] = 7'h3f;
      expv[18] = 7'h68;
      expv[19] = 7'h2a;
      expv[20] = 7'h45;
      expv[21] = 7'h6c;
      expv[22] = 7'h73;
      expv[23] = 7'h35;
      expv[24] = 7'h43;
      expv[25] = 7'h47;
      expv[26] = 7'h1d;
      expv[27] = 7'h5b;
      expv[28] = 7'h65;
      expv[29] = 7'h32;
      expv[30] = 7'h29;
      expv[31] = 7'h48;
      expv[32] = 7'h71;
      expv[33] = 7'h3d;
      expv[34] = 7'h10;
      expv[35] = 7'h40;
      expv[36] = 7'h51;
      expv[37] = 7'h29;
      expv[38] = 7'h1d;
      expv[39] = 7'h1b;
      expv[40] = 7'h7e;
      expv[41] = 7'h79;
      expv[42] = 7'h79;
      expv[43] = 7'h12;
      expv[44] = 7'h0e;
      expv[45] = 7'h4b;
      expv[46] = 7'h50;
      expv[47] = 7'h46;
      expv[48] = 7'h37;
      expv[49] = 7'h7a;
      expv[50] = 7'h7e;
      expv[51] = 7'h1b;
      expv[52] = 7'h09;
      expv[53] = 7'h03;
      expv[54] = 7'h12;
      expv[55] = 7'h0c;
      expv[56] = 7'h2e;
      expv[57] = 7'h49;
      expv[58] = 7'h62;
      expv[59] = 7'h72;
      expv[60] = 7'h29;
      expv[61] = 7'h3d;
      expv[62] = 7'h7e;
      expv[63] = 7'h3d;
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
