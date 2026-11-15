// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04766 dut (
    .rs(in_vec[27:23]),
    .rt(in_vec[22:18]),
    .op(in_vec[17:12]),
    .func(in_vec[11:6]),
    .id_td(in_vec[5:1]),
    .id_LW(in_vec[0:0]),
    .stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h2f862f4;
    stim[1] = 28'hb022a83;
    stim[2] = 28'h3f2d2b8;
    stim[3] = 28'h9a2953d;
    stim[4] = 28'h72dd9bb;
    stim[5] = 28'h811b91a;
    stim[6] = 28'hf902668;
    stim[7] = 28'h97cf4dc;
    stim[8] = 28'h5c3b3f2;
    stim[9] = 28'h6680dec;
    stim[10] = 28'h1c66cba;
    stim[11] = 28'h08a911a;
    stim[12] = 28'h64d7235;
    stim[13] = 28'h78d9ada;
    stim[14] = 28'h9692ad3;
    stim[15] = 28'hda88954;
    stim[16] = 28'hce596a2;
    stim[17] = 28'h512ad44;
    stim[18] = 28'hf2470d4;
    stim[19] = 28'he23a949;
    stim[20] = 28'h0a1c3f5;
    stim[21] = 28'h2a04b14;
    stim[22] = 28'he5f708c;
    stim[23] = 28'hf74880c;
    stim[24] = 28'hd52d8b9;
    stim[25] = 28'h50e1b71;
    stim[26] = 28'h439902b;
    stim[27] = 28'h0a2f4f0;
    stim[28] = 28'h299483b;
    stim[29] = 28'hafe1430;
    stim[30] = 28'h4f72b46;
    stim[31] = 28'h1852ce4;
    stim[32] = 28'h036fd8d;
    stim[33] = 28'hf2cd2b1;
    stim[34] = 28'hc385a39;
    stim[35] = 28'heada7c2;
    stim[36] = 28'h535c2b3;
    stim[37] = 28'h6423cb2;
    stim[38] = 28'hdee19e6;
    stim[39] = 28'hb3d5ba8;
    stim[40] = 28'heb56ef8;
    stim[41] = 28'hd8534ff;
    stim[42] = 28'hef7cb57;
    stim[43] = 28'h41420f6;
    stim[44] = 28'hd117cce;
    stim[45] = 28'hcc4b852;
    stim[46] = 28'h63f5007;
    stim[47] = 28'hf7ec1c1;
    stim[48] = 28'hbc8319a;
    stim[49] = 28'hfdbc05e;
    stim[50] = 28'h0603bb8;
    stim[51] = 28'h5d1ab18;
    stim[52] = 28'ha22bfa2;
    stim[53] = 28'h25b85e0;
    stim[54] = 28'hfa68f8f;
    stim[55] = 28'h3785cb6;
    stim[56] = 28'hd1d67b8;
    stim[57] = 28'hdc526d2;
    stim[58] = 28'hd552700;
    stim[59] = 28'hbc1925e;
    stim[60] = 28'ha9b5e34;
    stim[61] = 28'ha60ea48;
    stim[62] = 28'h7466013;
    stim[63] = 28'h0444fd7;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
