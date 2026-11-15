// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092944 dut (
    .op(in_vec[7:2]),
    .Zero(in_vec[1:1]),
    .Sign(in_vec[0:0]),
    .ExtSel(out_vec[14:14]),
    .PCWre(out_vec[13:13]),
    .InsMemRW(out_vec[12:12]),
    .RegDst(out_vec[11:11]),
    .RegWre(out_vec[10:10]),
    .AluOp(out_vec[9:7]),
    .AluSrcA(out_vec[6:6]),
    .AluSrcB(out_vec[5:5]),
    .RD(out_vec[4:4]),
    .WR(out_vec[3:3]),
    .DBDataSrc(out_vec[2:2]),
    .PCSrc(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hde;
    stim[1] = 8'h20;
    stim[2] = 8'h45;
    stim[3] = 8'h64;
    stim[4] = 8'hb8;
    stim[5] = 8'h8d;
    stim[6] = 8'hba;
    stim[7] = 8'heb;
    stim[8] = 8'hf7;
    stim[9] = 8'hce;
    stim[10] = 8'h22;
    stim[11] = 8'ha3;
    stim[12] = 8'h23;
    stim[13] = 8'h64;
    stim[14] = 8'hc4;
    stim[15] = 8'h3b;
    stim[16] = 8'h79;
    stim[17] = 8'h23;
    stim[18] = 8'h6d;
    stim[19] = 8'h36;
    stim[20] = 8'hfd;
    stim[21] = 8'h58;
    stim[22] = 8'hb5;
    stim[23] = 8'h58;
    stim[24] = 8'he5;
    stim[25] = 8'had;
    stim[26] = 8'h3a;
    stim[27] = 8'h9d;
    stim[28] = 8'h0b;
    stim[29] = 8'hc6;
    stim[30] = 8'h16;
    stim[31] = 8'h52;
    stim[32] = 8'h36;
    stim[33] = 8'ha0;
    stim[34] = 8'hdb;
    stim[35] = 8'h99;
    stim[36] = 8'hb8;
    stim[37] = 8'hd1;
    stim[38] = 8'h3c;
    stim[39] = 8'hcc;
    stim[40] = 8'h12;
    stim[41] = 8'hda;
    stim[42] = 8'h68;
    stim[43] = 8'ha6;
    stim[44] = 8'h9a;
    stim[45] = 8'h68;
    stim[46] = 8'hca;
    stim[47] = 8'hdc;
    stim[48] = 8'h8f;
    stim[49] = 8'h09;
    stim[50] = 8'h6b;
    stim[51] = 8'h0f;
    stim[52] = 8'heb;
    stim[53] = 8'hb4;
    stim[54] = 8'hd0;
    stim[55] = 8'hf3;
    stim[56] = 8'hca;
    stim[57] = 8'h2b;
    stim[58] = 8'h6b;
    stim[59] = 8'h2b;
    stim[60] = 8'h79;
    stim[61] = 8'h5d;
    stim[62] = 8'h61;
    stim[63] = 8'h1f;
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
      expv[0] = 15'h3000;
      expv[1] = 15'h7420;
      expv[2] = 15'h3000;
      expv[3] = 15'h3000;
      expv[4] = 15'h3000;
      expv[5] = 15'h7434;
      expv[6] = 15'h3000;
      expv[7] = 15'h3000;
      expv[8] = 15'h3000;
      expv[9] = 15'h3000;
      expv[10] = 15'h7420;
      expv[11] = 15'h3000;
      expv[12] = 15'h7420;
      expv[13] = 15'h3000;
      expv[14] = 15'h3000;
      expv[15] = 15'h3000;
      expv[16] = 15'h3000;
      expv[17] = 15'h7420;
      expv[18] = 15'h3000;
      expv[19] = 15'h3620;
      expv[20] = 15'h1000;
      expv[21] = 15'h3000;
      expv[22] = 15'h3000;
      expv[23] = 15'h3000;
      expv[24] = 15'h3000;
      expv[25] = 15'h7028;
      expv[26] = 15'h3000;
      expv[27] = 15'h3000;
      expv[28] = 15'h3002;
      expv[29] = 15'h3000;
      expv[30] = 15'h7080;
      expv[31] = 15'h3000;
      expv[32] = 15'h3620;
      expv[33] = 15'h3000;
      expv[34] = 15'h3000;
      expv[35] = 15'h3000;
      expv[36] = 15'h3000;
      expv[37] = 15'h3000;
      expv[38] = 15'h3000;
      expv[39] = 15'h3000;
      expv[40] = 15'h7081;
      expv[41] = 15'h3000;
      expv[42] = 15'h3000;
      expv[43] = 15'h3000;
      expv[44] = 15'h3000;
      expv[45] = 15'h3000;
      expv[46] = 15'h3000;
      expv[47] = 15'h3000;
      expv[48] = 15'h7434;
      expv[49] = 15'h3002;
      expv[50] = 15'h3000;
      expv[51] = 15'h3000;
      expv[52] = 15'h3000;
      expv[53] = 15'h3000;
      expv[54] = 15'h3000;
      expv[55] = 15'h3000;
      expv[56] = 15'h3000;
      expv[57] = 15'h3000;
      expv[58] = 15'h3000;
      expv[59] = 15'h3000;
      expv[60] = 15'h3000;
      expv[61] = 15'h3000;
      expv[62] = 15'h3000;
      expv[63] = 15'h7080;
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
