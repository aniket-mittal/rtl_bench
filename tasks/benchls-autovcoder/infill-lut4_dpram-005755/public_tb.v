// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005755 dut (
    .dpram_wclk(clk),
    .mc1_ripmode(in_vec[11:11]),
    .I0(in_vec[10:10]),
    .I1(in_vec[9:9]),
    .I2(in_vec[8:8]),
    .I3(in_vec[7:7]),
    .dpram_mode(in_vec[6:6]),
    .dpram_di(in_vec[5:5]),
    .dpram_we(in_vec[4:4]),
    .dpram_waddr(in_vec[3:0]),
    .lut4_o(out_vec[1:1]),
    .lut00_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'haa4;
    stim[1] = 12'h4dd;
    stim[2] = 12'hfd5;
    stim[3] = 12'he42;
    stim[4] = 12'h54d;
    stim[5] = 12'h125;
    stim[6] = 12'h1e0;
    stim[7] = 12'hed0;
    stim[8] = 12'h51c;
    stim[9] = 12'hbf6;
    stim[10] = 12'h344;
    stim[11] = 12'h764;
    stim[12] = 12'h838;
    stim[13] = 12'h726;
    stim[14] = 12'h69b;
    stim[15] = 12'ha08;
    stim[16] = 12'he2f;
    stim[17] = 12'h4a9;
    stim[18] = 12'h6c8;
    stim[19] = 12'h695;
    stim[20] = 12'h892;
    stim[21] = 12'h8bd;
    stim[22] = 12'h0d1;
    stim[23] = 12'h5ed;
    stim[24] = 12'h979;
    stim[25] = 12'h6ed;
    stim[26] = 12'hd2c;
    stim[27] = 12'he07;
    stim[28] = 12'h7ec;
    stim[29] = 12'he10;
    stim[30] = 12'h4ed;
    stim[31] = 12'hfa8;
    stim[32] = 12'h289;
    stim[33] = 12'h40e;
    stim[34] = 12'h212;
    stim[35] = 12'hd1d;
    stim[36] = 12'h808;
    stim[37] = 12'hbb3;
    stim[38] = 12'hd54;
    stim[39] = 12'hdbe;
    stim[40] = 12'h85a;
    stim[41] = 12'h59c;
    stim[42] = 12'h747;
    stim[43] = 12'heb2;
    stim[44] = 12'h61e;
    stim[45] = 12'ha2a;
    stim[46] = 12'h326;
    stim[47] = 12'h62f;
    stim[48] = 12'h422;
    stim[49] = 12'hb38;
    stim[50] = 12'h77a;
    stim[51] = 12'h742;
    stim[52] = 12'h585;
    stim[53] = 12'h883;
    stim[54] = 12'h2be;
    stim[55] = 12'hbd9;
    stim[56] = 12'hb42;
    stim[57] = 12'ha0a;
    stim[58] = 12'h90f;
    stim[59] = 12'h71b;
    stim[60] = 12'h292;
    stim[61] = 12'h703;
    stim[62] = 12'hdbe;
    stim[63] = 12'hcfd;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h3;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h3;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h3;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h3;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h3;
      expv[55] = 2'h1;
      expv[56] = 2'h3;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h3;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
