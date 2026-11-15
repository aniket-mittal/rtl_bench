// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_083294 dut (
    .clk(clk),
    .rd_data(in_vec[16:1]),
    .rst_n(in_vec[0:0]),
    .mul_out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h07c96;
    stim[1] = 17'h1509c;
    stim[2] = 17'h18bbb;
    stim[3] = 17'h1bd5f;
    stim[4] = 17'h1ddc3;
    stim[5] = 17'h0ba67;
    stim[6] = 17'h03f39;
    stim[7] = 17'h08ee7;
    stim[8] = 17'h07797;
    stim[9] = 17'h16b2b;
    stim[10] = 17'h0ef91;
    stim[11] = 17'h1efc1;
    stim[12] = 17'h0f907;
    stim[13] = 17'h09f97;
    stim[14] = 17'h12889;
    stim[15] = 17'h109e1;
    stim[16] = 17'h11e3b;
    stim[17] = 17'h03389;
    stim[18] = 17'h0db8d;
    stim[19] = 17'h07085;
    stim[20] = 17'h07d4f;
    stim[21] = 17'h1167f;
    stim[22] = 17'h12c87;
    stim[23] = 17'h010b1;
    stim[24] = 17'h1b399;
    stim[25] = 17'h17ef9;
    stim[26] = 17'h1c71f;
    stim[27] = 17'h16f55;
    stim[28] = 17'h1a93b;
    stim[29] = 17'h1385d;
    stim[30] = 17'h11d37;
    stim[31] = 17'h0b8ed;
    stim[32] = 17'h118d9;
    stim[33] = 17'h03d75;
    stim[34] = 17'h118eb;
    stim[35] = 17'h064ed;
    stim[36] = 17'h194fd;
    stim[37] = 17'h086ab;
    stim[38] = 17'h15401;
    stim[39] = 17'h02df5;
    stim[40] = 17'h09b59;
    stim[41] = 17'h1b78b;
    stim[42] = 17'h125aa;
    stim[43] = 17'h04ec1;
    stim[44] = 17'h127c1;
    stim[45] = 17'h0573b;
    stim[46] = 17'h05421;
    stim[47] = 17'h1892c;
    stim[48] = 17'h04bc7;
    stim[49] = 17'h00f15;
    stim[50] = 17'h03b25;
    stim[51] = 17'h1dcc5;
    stim[52] = 17'h1b8a3;
    stim[53] = 17'h1f4ad;
    stim[54] = 17'h0abb3;
    stim[55] = 17'h0fd4b;
    stim[56] = 17'h0e45f;
    stim[57] = 17'h0c41d;
    stim[58] = 17'h18ae3;
    stim[59] = 17'h18973;
    stim[60] = 17'h04eaf;
    stim[61] = 17'h01887;
    stim[62] = 17'h0b24b;
    stim[63] = 17'h004a1;
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
      expv[3] = 10'hxxx;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'hxxx;
      expv[7] = 10'h196;
      expv[8] = 10'h13b;
      expv[9] = 10'h017;
      expv[10] = 10'h0ab;
      expv[11] = 10'h310;
      expv[12] = 10'h201;
      expv[13] = 10'h14a;
      expv[14] = 10'h0fc;
      expv[15] = 10'h0f0;
      expv[16] = 10'h000;
      expv[17] = 10'h00c;
      expv[18] = 10'h14a;
      expv[19] = 10'h008;
      expv[20] = 10'h070;
      expv[21] = 10'h2b8;
      expv[22] = 10'h038;
      expv[23] = 10'h054;
      expv[24] = 10'h004;
      expv[25] = 10'h093;
      expv[26] = 10'h307;
      expv[27] = 10'h036;
      expv[28] = 10'h030;
      expv[29] = 10'h0a8;
      expv[30] = 10'h2f4;
      expv[31] = 10'h1a4;
      expv[32] = 10'h122;
      expv[33] = 10'h074;
      expv[34] = 10'h00e;
      expv[35] = 10'h21c;
      expv[36] = 10'h042;
      expv[37] = 10'h024;
      expv[38] = 10'h222;
      expv[39] = 10'h03f;
      expv[40] = 10'h1a2;
      expv[41] = 10'h23a;
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
      expv[52] = 10'h100;
      expv[53] = 10'h02d;
      expv[54] = 10'h118;
      expv[55] = 10'h0d8;
      expv[56] = 10'h026;
      expv[57] = 10'h022;
      expv[58] = 10'h18c;
      expv[59] = 10'h15e;
      expv[60] = 10'h069;
      expv[61] = 10'h0ff;
      expv[62] = 10'h0e0;
      expv[63] = 10'h0bb;
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
