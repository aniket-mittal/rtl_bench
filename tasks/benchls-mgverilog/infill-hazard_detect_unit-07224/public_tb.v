// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07224 dut (
    .clk(clk),
    .IDEXMemRead(in_vec[33:33]),
    .IDEXRt(in_vec[32:28]),
    .IFIDRs(in_vec[27:23]),
    .IFIDRt(in_vec[22:18]),
    .IDEXRd(in_vec[17:13]),
    .IDEXRegWrite(in_vec[12:12]),
    .opcode(in_vec[11:6]),
    .EXMEMRead(in_vec[5:5]),
    .EXMEMRt(in_vec[4:0]),
    .PCWrite(out_vec[2:2]),
    .IFIDWrite(out_vec[1:1]),
    .ctrlSetZero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2c5e64580;
    stim[1] = 34'h039b61d1b;
    stim[2] = 34'h3bc2f3f47;
    stim[3] = 34'h35d31f2cc;
    stim[4] = 34'h399d33d01;
    stim[5] = 34'h2fd174df6;
    stim[6] = 34'h1b4ec2011;
    stim[7] = 34'h3670ee00d;
    stim[8] = 34'h37116e5b5;
    stim[9] = 34'h25365836a;
    stim[10] = 34'h0f788c731;
    stim[11] = 34'h2e8e2740a;
    stim[12] = 34'h2eb60555d;
    stim[13] = 34'h06edd131e;
    stim[14] = 34'h2b3c29a6f;
    stim[15] = 34'h323adfac9;
    stim[16] = 34'h2bcd7559e;
    stim[17] = 34'h3775827a2;
    stim[18] = 34'h34f7f0446;
    stim[19] = 34'h3a8055e4d;
    stim[20] = 34'h3de81640f;
    stim[21] = 34'h1e3274622;
    stim[22] = 34'h33481bde1;
    stim[23] = 34'h0742c5725;
    stim[24] = 34'h19f722918;
    stim[25] = 34'h09f0cc368;
    stim[26] = 34'h163bc68ff;
    stim[27] = 34'h2ae62905f;
    stim[28] = 34'h3547e1bc4;
    stim[29] = 34'h16a73952b;
    stim[30] = 34'h03bfccb77;
    stim[31] = 34'h3a833872f;
    stim[32] = 34'h327b61c1b;
    stim[33] = 34'h33dbb5112;
    stim[34] = 34'h2f686401e;
    stim[35] = 34'h283ccf416;
    stim[36] = 34'h0af6ed4ad;
    stim[37] = 34'h240cf0e9b;
    stim[38] = 34'h037df5e62;
    stim[39] = 34'h29c3deaf0;
    stim[40] = 34'h227da3738;
    stim[41] = 34'h0238d51db;
    stim[42] = 34'h1ae3d0d09;
    stim[43] = 34'h3a08243b6;
    stim[44] = 34'h07d131b87;
    stim[45] = 34'h08e00940d;
    stim[46] = 34'h3847d7569;
    stim[47] = 34'h03881a097;
    stim[48] = 34'h25f40aa1e;
    stim[49] = 34'h15c665ac4;
    stim[50] = 34'h37312cb4d;
    stim[51] = 34'h18bc2d387;
    stim[52] = 34'h3e9d19c45;
    stim[53] = 34'h3249f12bb;
    stim[54] = 34'h03dad51aa;
    stim[55] = 34'h3ed033271;
    stim[56] = 34'h23bc0b478;
    stim[57] = 34'h26b796297;
    stim[58] = 34'h29ace2751;
    stim[59] = 34'h2c176e538;
    stim[60] = 34'h3a77f4a3f;
    stim[61] = 34'h2888717d9;
    stim[62] = 34'h38f7064ab;
    stim[63] = 34'h0afbbe959;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h6;
      expv[4] = 3'h6;
      expv[5] = 3'h6;
      expv[6] = 3'h6;
      expv[7] = 3'h6;
      expv[8] = 3'h6;
      expv[9] = 3'h6;
      expv[10] = 3'h6;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h6;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h6;
      expv[20] = 3'h1;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h6;
      expv[29] = 3'h6;
      expv[30] = 3'h6;
      expv[31] = 3'h6;
      expv[32] = 3'h6;
      expv[33] = 3'h6;
      expv[34] = 3'h6;
      expv[35] = 3'h6;
      expv[36] = 3'h6;
      expv[37] = 3'h6;
      expv[38] = 3'h6;
      expv[39] = 3'h6;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h6;
      expv[43] = 3'h6;
      expv[44] = 3'h6;
      expv[45] = 3'h6;
      expv[46] = 3'h6;
      expv[47] = 3'h6;
      expv[48] = 3'h6;
      expv[49] = 3'h6;
      expv[50] = 3'h6;
      expv[51] = 3'h6;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h6;
      expv[57] = 3'h6;
      expv[58] = 3'h6;
      expv[59] = 3'h6;
      expv[60] = 3'h6;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'h6;
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
