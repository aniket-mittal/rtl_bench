// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_181373 dut (
    .iID_NumRs(in_vec[34:30]),
    .iID_NumRt(in_vec[29:25]),
    .iEX_NumRt(in_vec[24:20]),
    .iEX_MemRead(in_vec[19:19]),
    .iEX_RegWrite(in_vec[18:18]),
    .iMEM_MemRead(in_vec[17:17]),
    .iMEM_RegWrite(in_vec[16:16]),
    .iCJr(in_vec[15:15]),
    .iEX_RegDst(in_vec[14:10]),
    .iMEM_RegDst(in_vec[9:5]),
    .iBranch(in_vec[4:4]),
    .iEX_MovN(in_vec[3:3]),
    .iEX_MovZ(in_vec[2:2]),
    .iMEM_MovN(in_vec[1:1]),
    .iMEM_MovZ(in_vec[0:0]),
    .oHazard(out_vec[2:2]),
    .oForwardJr(out_vec[1:1]),
    .oForwardPC4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h0bd1c83c1;
    stim[1] = 35'h5086037fa;
    stim[2] = 35'h4aeaffe65;
    stim[3] = 35'h254ed7902;
    stim[4] = 35'h711c06228;
    stim[5] = 35'h149bfee67;
    stim[6] = 35'h72fea2192;
    stim[7] = 35'h2edc04104;
    stim[8] = 35'h3c95dfdd7;
    stim[9] = 35'h475c110ba;
    stim[10] = 35'h506f83b53;
    stim[11] = 35'h0311a5791;
    stim[12] = 35'h2145ed71a;
    stim[13] = 35'h414e8cb1d;
    stim[14] = 35'h48220ccd7;
    stim[15] = 35'h7356b0cef;
    stim[16] = 35'h222535c11;
    stim[17] = 35'h50234d1d0;
    stim[18] = 35'h2be5f1f1f;
    stim[19] = 35'h6bd7fd8b3;
    stim[20] = 35'h13575425d;
    stim[21] = 35'h0f7130113;
    stim[22] = 35'h1535f2b8a;
    stim[23] = 35'h7fc6f4fae;
    stim[24] = 35'h728b9c3c9;
    stim[25] = 35'h736696a12;
    stim[26] = 35'h52f7d42ec;
    stim[27] = 35'h464a46d76;
    stim[28] = 35'h1bcec6902;
    stim[29] = 35'h7278c4f29;
    stim[30] = 35'h6cb5d3848;
    stim[31] = 35'h5b69bb665;
    stim[32] = 35'h2b4a4fb2b;
    stim[33] = 35'h3f2c9443b;
    stim[34] = 35'h31a0ba416;
    stim[35] = 35'h690c9efe3;
    stim[36] = 35'h0d2ccc492;
    stim[37] = 35'h69d725532;
    stim[38] = 35'h0b006e372;
    stim[39] = 35'h02b474237;
    stim[40] = 35'h3382f3d90;
    stim[41] = 35'h3f376ee97;
    stim[42] = 35'h5e9233c35;
    stim[43] = 35'h4d7df757c;
    stim[44] = 35'h3592befc6;
    stim[45] = 35'h4c5bec224;
    stim[46] = 35'h4a5dd891a;
    stim[47] = 35'h4c62ca5be;
    stim[48] = 35'h45500d55b;
    stim[49] = 35'h54c7eca5a;
    stim[50] = 35'h28e466fdb;
    stim[51] = 35'h34a6ebd9c;
    stim[52] = 35'h001e4d67c;
    stim[53] = 35'h5e252234d;
    stim[54] = 35'h446ec6e9a;
    stim[55] = 35'h040aef609;
    stim[56] = 35'h1dba060ef;
    stim[57] = 35'h3cf50f3d7;
    stim[58] = 35'h7f3bce682;
    stim[59] = 35'h5b1a3bfd9;
    stim[60] = 35'h6cd6f8bfe;
    stim[61] = 35'h3a31df150;
    stim[62] = 35'h676486991;
    stim[63] = 35'h7832c6d0d;
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
      expv[0] = 3'h7;
      expv[1] = 3'h7;
      expv[2] = 3'h7;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h7;
      expv[6] = 3'h7;
      expv[7] = 3'h0;
      expv[8] = 3'h7;
      expv[9] = 3'h7;
      expv[10] = 3'h7;
      expv[11] = 3'h7;
      expv[12] = 3'h7;
      expv[13] = 3'h7;
      expv[14] = 3'h7;
      expv[15] = 3'h0;
      expv[16] = 3'h5;
      expv[17] = 3'h7;
      expv[18] = 3'h7;
      expv[19] = 3'h7;
      expv[20] = 3'h7;
      expv[21] = 3'h5;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h7;
      expv[25] = 3'h7;
      expv[26] = 3'h4;
      expv[27] = 3'h7;
      expv[28] = 3'h0;
      expv[29] = 3'h4;
      expv[30] = 3'h0;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h7;
      expv[34] = 3'h7;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h5;
      expv[38] = 3'h7;
      expv[39] = 3'h7;
      expv[40] = 3'h7;
      expv[41] = 3'h7;
      expv[42] = 3'h7;
      expv[43] = 3'h7;
      expv[44] = 3'h7;
      expv[45] = 3'h7;
      expv[46] = 3'h7;
      expv[47] = 3'h7;
      expv[48] = 3'h7;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h7;
      expv[52] = 3'h7;
      expv[53] = 3'h0;
      expv[54] = 3'h7;
      expv[55] = 3'h7;
      expv[56] = 3'h0;
      expv[57] = 3'h7;
      expv[58] = 3'h7;
      expv[59] = 3'h7;
      expv[60] = 3'h7;
      expv[61] = 3'h7;
      expv[62] = 3'h7;
      expv[63] = 3'h0;
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
