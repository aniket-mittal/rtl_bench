// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_7 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h737faf13;
    stim[1] = 32'h1735f0b3;
    stim[2] = 32'hfd6bfba0;
    stim[3] = 32'h819a149d;
    stim[4] = 32'h70221860;
    stim[5] = 32'hb3215597;
    stim[6] = 32'hd7a06d58;
    stim[7] = 32'h5075f3b9;
    stim[8] = 32'hb4078949;
    stim[9] = 32'h1296df40;
    stim[10] = 32'h751175b4;
    stim[11] = 32'h10460fb7;
    stim[12] = 32'h57156a03;
    stim[13] = 32'h75bd0dd6;
    stim[14] = 32'h3d7725d3;
    stim[15] = 32'h007f6119;
    stim[16] = 32'h220074ee;
    stim[17] = 32'hb32cc3b9;
    stim[18] = 32'hcc86ee38;
    stim[19] = 32'h686c052e;
    stim[20] = 32'hfa8a331e;
    stim[21] = 32'h5dde2539;
    stim[22] = 32'h1de4c0bd;
    stim[23] = 32'h43b1c533;
    stim[24] = 32'hc05e33e7;
    stim[25] = 32'h0324350c;
    stim[26] = 32'h667abf44;
    stim[27] = 32'h667aa06e;
    stim[28] = 32'h5674cd1f;
    stim[29] = 32'ha0715f40;
    stim[30] = 32'h67cb0e6c;
    stim[31] = 32'hef808f3f;
    stim[32] = 32'hf6744b92;
    stim[33] = 32'h876350a4;
    stim[34] = 32'h84cf2362;
    stim[35] = 32'h8afcb89e;
    stim[36] = 32'hfcfc3c80;
    stim[37] = 32'hae30c59a;
    stim[38] = 32'h155321b9;
    stim[39] = 32'h67046cb8;
    stim[40] = 32'h7358582c;
    stim[41] = 32'hf82d162b;
    stim[42] = 32'h39f2c687;
    stim[43] = 32'hbbeba839;
    stim[44] = 32'h35902349;
    stim[45] = 32'h943f825a;
    stim[46] = 32'he8016ebc;
    stim[47] = 32'h789193cd;
    stim[48] = 32'ha0a2f46b;
    stim[49] = 32'h1c5c6001;
    stim[50] = 32'hdd2f7044;
    stim[51] = 32'hfa382b9b;
    stim[52] = 32'hd2d26060;
    stim[53] = 32'h99250246;
    stim[54] = 32'hae1d7086;
    stim[55] = 32'hefe19372;
    stim[56] = 32'h0415eee8;
    stim[57] = 32'h0d53e094;
    stim[58] = 32'h4b901812;
    stim[59] = 32'h00f6f3fd;
    stim[60] = 32'h6686f410;
    stim[61] = 32'hde7bb450;
    stim[62] = 32'h4fd7491f;
    stim[63] = 32'h595a8377;
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
      expv[0] = 32'ha476415d;
      expv[1] = 32'h9e1801a7;
      expv[2] = 32'h853e2186;
      expv[3] = 32'he5084fc0;
      expv[4] = 32'h0a0df0d8;
      expv[5] = 32'hb70802bd;
      expv[6] = 32'he8d5f5c7;
      expv[7] = 32'h2bf89c08;
      expv[8] = 32'h258675b2;
      expv[9] = 32'h4ecfe82d;
      expv[10] = 32'h92fb0ad2;
      expv[11] = 32'h26079ba8;
      expv[12] = 32'h9a545907;
      expv[13] = 32'hc4c73bd2;
      expv[14] = 32'hb75219e6;
      expv[15] = 32'h3fb08c80;
      expv[16] = 32'h0a9aff55;
      expv[17] = 32'hb1c315bd;
      expv[18] = 32'h7cb42dfe;
      expv[19] = 32'h2a8337e4;
      expv[20] = 32'h743a6689;
      expv[21] = 32'hfdd3ec16;
      expv[22] = 32'hf4a02eb6;
      expv[23] = 32'hcc439125;
      expv[24] = 32'h131af260;
      expv[25] = 32'h92ba8e05;
      expv[26] = 32'h22be3aff;
      expv[27] = 32'h22b1afff;
      expv[28] = 32'h2a87d707;
      expv[29] = 32'h1aad2110;
      expv[30] = 32'hfa66aeff;
      expv[31] = 32'hf524262b;
      expv[32] = 32'h08c61097;
      expv[33] = 32'h984a4b4f;
      expv[34] = 32'h4ed3a04a;
      expv[35] = 32'h547e6651;
      expv[36] = 32'h4eddb186;
      expv[37] = 32'h3900740b;
      expv[38] = 32'hadd08ca2;
      expv[39] = 32'h9dd7c4ff;
      expv[40] = 32'hb78ddedd;
      expv[41] = 32'h2708f40c;
      expv[42] = 32'hf4e3a3ec;
      expv[43] = 32'hd0f6f5a9;
      expv[44] = 32'hc65174f2;
      expv[45] = 32'h33837c62;
      expv[46] = 32'h3434ffa4;
      expv[47] = 32'h5148064c;
      expv[48] = 32'h7378b490;
      expv[49] = 32'h28f070b6;
      expv[50] = 32'had7b53d6;
      expv[51] = 32'h2d362409;
      expv[52] = 32'h509379cd;
      expv[53] = 32'hbd03427c;
      expv[54] = 32'h2fdafa0b;
      expv[55] = 32'hc5aa00ab;
      expv[56] = 32'h0bb7640a;
      expv[57] = 32'haa307a1e;
      expv[58] = 32'hde2d21b1;
      expv[59] = 32'h7b79fe80;
      expv[60] = 32'h5c9b90ff;
      expv[61] = 32'h07b951d3;
      expv[62] = 32'hfcc5b73b;
      expv[63] = 32'hbec0db1c;
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
