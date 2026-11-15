// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_201141 dut (
    .RegWrite_IN(in_vec[14:14]),
    .MemRead_IN(in_vec[13:13]),
    .MemWrite_IN(in_vec[12:12]),
    .JLFlag_IN(in_vec[11:11]),
    .AluBSRC_IN(in_vec[10:9]),
    .WriteDataSRC_IN(in_vec[8:7]),
    .AluCtl_IN(in_vec[6:4]),
    .IsBranch_IN(in_vec[3:3]),
    .targetSRC_IN(in_vec[2:2]),
    .stall(in_vec[1:1]),
    .bImm_IN(in_vec[0:0]),
    .RegWrite_OUT(out_vec[13:13]),
    .MemRead_OUT(out_vec[12:12]),
    .MemWrite_OUT(out_vec[11:11]),
    .JLFlag_OUT(out_vec[10:10]),
    .AluBSRC_OUT(out_vec[9:8]),
    .WriteDataSRC_OUT(out_vec[7:6]),
    .AluCtl_OUT(out_vec[5:3]),
    .IsBranch_OUT(out_vec[2:2]),
    .targetSRC_OUT(out_vec[1:1]),
    .bImm_OUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h20c2;
    stim[1] = 15'h276e;
    stim[2] = 15'h3cec;
    stim[3] = 15'h05fc;
    stim[4] = 15'h2532;
    stim[5] = 15'h0f8a;
    stim[6] = 15'h0903;
    stim[7] = 15'h361c;
    stim[8] = 15'h6ede;
    stim[9] = 15'h1b06;
    stim[10] = 15'h100f;
    stim[11] = 15'h3291;
    stim[12] = 15'h3082;
    stim[13] = 15'h7d74;
    stim[14] = 15'h7bba;
    stim[15] = 15'h7057;
    stim[16] = 15'h6967;
    stim[17] = 15'h1fdc;
    stim[18] = 15'h3bd7;
    stim[19] = 15'h226f;
    stim[20] = 15'h6fe8;
    stim[21] = 15'h59db;
    stim[22] = 15'h702e;
    stim[23] = 15'h0be2;
    stim[24] = 15'h3d00;
    stim[25] = 15'h1e46;
    stim[26] = 15'h54a2;
    stim[27] = 15'h4a82;
    stim[28] = 15'h3461;
    stim[29] = 15'h41d1;
    stim[30] = 15'h555a;
    stim[31] = 15'h4726;
    stim[32] = 15'h5f34;
    stim[33] = 15'h2fd8;
    stim[34] = 15'h1149;
    stim[35] = 15'h3d0b;
    stim[36] = 15'h7408;
    stim[37] = 15'h5943;
    stim[38] = 15'h4dfa;
    stim[39] = 15'h4016;
    stim[40] = 15'h430d;
    stim[41] = 15'h2063;
    stim[42] = 15'h7d47;
    stim[43] = 15'h0b3f;
    stim[44] = 15'h14fa;
    stim[45] = 15'h7f54;
    stim[46] = 15'h264d;
    stim[47] = 15'h794e;
    stim[48] = 15'h3d33;
    stim[49] = 15'h6be4;
    stim[50] = 15'h1223;
    stim[51] = 15'h186f;
    stim[52] = 15'h06a8;
    stim[53] = 15'h59ae;
    stim[54] = 15'h1b62;
    stim[55] = 15'h45f1;
    stim[56] = 15'h112d;
    stim[57] = 15'h2f98;
    stim[58] = 15'h7bb8;
    stim[59] = 15'h1ed8;
    stim[60] = 15'h73f3;
    stim[61] = 15'h6cb4;
    stim[62] = 15'h1345;
    stim[63] = 15'h67de;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h1e76;
      expv[3] = 14'h02fe;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h1b0e;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h1949;
      expv[12] = 14'h0000;
      expv[13] = 14'h3eba;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0fee;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h37f4;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h1e80;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h1a31;
      expv[29] = 14'h20e9;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h2f9a;
      expv[33] = 14'h17ec;
      expv[34] = 14'h08a5;
      expv[35] = 14'h0000;
      expv[36] = 14'h3a04;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h2187;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h3faa;
      expv[46] = 14'h1327;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h35f2;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0354;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h22f9;
      expv[56] = 14'h0897;
      expv[57] = 14'h17cc;
      expv[58] = 14'h3ddc;
      expv[59] = 14'h0f6c;
      expv[60] = 14'h0000;
      expv[61] = 14'h365a;
      expv[62] = 14'h09a3;
      expv[63] = 14'h0000;
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
