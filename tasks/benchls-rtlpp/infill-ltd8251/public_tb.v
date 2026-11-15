// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ltd8251 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .adr(in_vec[13:13]),
    .cs(in_vec[12:12]),
    .we(in_vec[11:11]),
    .din(in_vec[10:3]),
    .txc(in_vec[2:2]),
    .rxc(in_vec[1:1]),
    .rxd(in_vec[0:0]),
    .dout(out_vec[16:9]),
    .txd(out_vec[8:8]),
    .status(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h5658;
    stim[1] = 15'h4b7e;
    stim[2] = 15'h2f14;
    stim[3] = 15'h3c47;
    stim[4] = 15'h1e16;
    stim[5] = 15'h0e23;
    stim[6] = 15'h3455;
    stim[7] = 15'h28bb;
    stim[8] = 15'h3fe8;
    stim[9] = 15'h30c1;
    stim[10] = 15'h12c5;
    stim[11] = 15'h132a;
    stim[12] = 15'h2219;
    stim[13] = 15'h259d;
    stim[14] = 15'h1652;
    stim[15] = 15'h3078;
    stim[16] = 15'h1a1a;
    stim[17] = 15'h3926;
    stim[18] = 15'h2f1b;
    stim[19] = 15'h1297;
    stim[20] = 15'h04ca;
    stim[21] = 15'h2fae;
    stim[22] = 15'h0a5f;
    stim[23] = 15'h3359;
    stim[24] = 15'h35b7;
    stim[25] = 15'h1941;
    stim[26] = 15'h25cb;
    stim[27] = 15'h3e48;
    stim[28] = 15'h0dad;
    stim[29] = 15'h2df0;
    stim[30] = 15'h20a4;
    stim[31] = 15'h1c38;
    stim[32] = 15'h17d5;
    stim[33] = 15'h3055;
    stim[34] = 15'h3718;
    stim[35] = 15'h01c4;
    stim[36] = 15'h2783;
    stim[37] = 15'h1275;
    stim[38] = 15'h1be2;
    stim[39] = 15'h16b9;
    stim[40] = 15'h11e8;
    stim[41] = 15'h3ea6;
    stim[42] = 15'h0478;
    stim[43] = 15'h0821;
    stim[44] = 15'h2b17;
    stim[45] = 15'h209a;
    stim[46] = 15'h0e4a;
    stim[47] = 15'h095a;
    stim[48] = 15'h03ed;
    stim[49] = 15'h371f;
    stim[50] = 15'h19dc;
    stim[51] = 15'h0b73;
    stim[52] = 15'h3b1f;
    stim[53] = 15'h048a;
    stim[54] = 15'h303b;
    stim[55] = 15'h064a;
    stim[56] = 15'h3c3b;
    stim[57] = 15'h2c16;
    stim[58] = 15'h2999;
    stim[59] = 15'h2281;
    stim[60] = 15'h2c61;
    stim[61] = 15'h073a;
    stim[62] = 15'h2c15;
    stim[63] = 15'h1b05;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00101;
      expv[2] = 17'h00301;
      expv[3] = 17'h00301;
      expv[4] = 17'h00101;
      expv[5] = 17'h00101;
      expv[6] = 17'h00301;
      expv[7] = 17'h00301;
      expv[8] = 17'h00301;
      expv[9] = 17'h00301;
      expv[10] = 17'h00101;
      expv[11] = 17'h00101;
      expv[12] = 17'h00301;
      expv[13] = 17'h00301;
      expv[14] = 17'h00101;
      expv[15] = 17'h00301;
      expv[16] = 17'h00101;
      expv[17] = 17'h00100;
      expv[18] = 17'h00100;
      expv[19] = 17'h00101;
      expv[20] = 17'h00001;
      expv[21] = 17'h00201;
      expv[22] = 17'h00001;
      expv[23] = 17'h00201;
      expv[24] = 17'h00201;
      expv[25] = 17'h00001;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
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
