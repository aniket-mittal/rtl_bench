// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00893 dut (
    .A(in_vec[19:11]),
    .ADD(in_vec[10:10]),
    .B(in_vec[9:1]),
    .CI(in_vec[0:0]),
    .CO(out_vec[10:10]),
    .OFL(out_vec[9:9]),
    .S(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hbfbf5;
    stim[1] = 20'h9a3b7;
    stim[2] = 20'hd5065;
    stim[3] = 20'hb0b69;
    stim[4] = 20'he991f;
    stim[5] = 20'h02d1b;
    stim[6] = 20'hbd1a9;
    stim[7] = 20'he03fd;
    stim[8] = 20'h62545;
    stim[9] = 20'hc05a9;
    stim[10] = 20'h9d107;
    stim[11] = 20'he97bb;
    stim[12] = 20'h6e915;
    stim[13] = 20'h00047;
    stim[14] = 20'h12927;
    stim[15] = 20'hd0150;
    stim[16] = 20'h0bad6;
    stim[17] = 20'h8decd;
    stim[18] = 20'h57252;
    stim[19] = 20'h33c79;
    stim[20] = 20'h23a41;
    stim[21] = 20'heed17;
    stim[22] = 20'h94c8b;
    stim[23] = 20'ha2b55;
    stim[24] = 20'h81481;
    stim[25] = 20'h4bb09;
    stim[26] = 20'h9438f;
    stim[27] = 20'h2c24b;
    stim[28] = 20'he313c;
    stim[29] = 20'h2d69c;
    stim[30] = 20'h28568;
    stim[31] = 20'hbebbf;
    stim[32] = 20'hfd8db;
    stim[33] = 20'h785a0;
    stim[34] = 20'h9220d;
    stim[35] = 20'h6b4fa;
    stim[36] = 20'he5027;
    stim[37] = 20'h3bf0e;
    stim[38] = 20'haaef9;
    stim[39] = 20'h37315;
    stim[40] = 20'h40599;
    stim[41] = 20'hc76d3;
    stim[42] = 20'h9d351;
    stim[43] = 20'ha07c7;
    stim[44] = 20'h2f5c9;
    stim[45] = 20'h502fd;
    stim[46] = 20'h11589;
    stim[47] = 20'h58599;
    stim[48] = 20'h700c6;
    stim[49] = 20'heeaac;
    stim[50] = 20'h85273;
    stim[51] = 20'h0db33;
    stim[52] = 20'h0bdd6;
    stim[53] = 20'hd975b;
    stim[54] = 20'he35e1;
    stim[55] = 20'hf49eb;
    stim[56] = 20'hce36f;
    stim[57] = 20'h42a73;
    stim[58] = 20'h91bcb;
    stim[59] = 20'h3b997;
    stim[60] = 20'h4531f;
    stim[61] = 20'he9f9b;
    stim[62] = 20'h826ac;
    stim[63] = 20'h58340;
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
      expv[0] = 11'h17b;
      expv[1] = 11'h117;
      expv[2] = 11'h064;
      expv[3] = 11'h12b;
      expv[4] = 11'h0a2;
      expv[5] = 11'h08b;
      expv[6] = 11'h052;
      expv[7] = 11'h1be;
      expv[8] = 11'h067;
      expv[9] = 11'h155;
      expv[10] = 11'h045;
      expv[11] = 11'h00e;
      expv[12] = 11'h1a9;
      expv[13] = 11'h123;
      expv[14] = 11'h148;
      expv[15] = 11'h0f7;
      expv[16] = 11'h083;
      expv[17] = 11'h07a;
      expv[18] = 11'h078;
      expv[19] = 11'h054;
      expv[20] = 11'h099;
      expv[21] = 11'h155;
      expv[22] = 11'h16f;
      expv[23] = 11'h111;
      expv[24] = 11'h143;
      expv[25] = 11'h0ed;
      expv[26] = 11'h11f;
      expv[27] = 11'h08d;
      expv[28] = 11'h0a7;
      expv[29] = 11'h114;
      expv[30] = 11'h0e4;
      expv[31] = 11'h15c;
      expv[32] = 11'h068;
      expv[33] = 11'h020;
      expv[34] = 11'h1da;
      expv[35] = 11'h0ab;
      expv[36] = 11'h025;
      expv[37] = 11'h1f0;
      expv[38] = 11'h02a;
      expv[39] = 11'h018;
      expv[40] = 11'h04d;
      expv[41] = 11'h0e6;
      expv[42] = 11'h16e;
      expv[43] = 11'h0a2;
      expv[44] = 11'h0bb;
      expv[45] = 11'h01e;
      expv[46] = 11'h0e7;
      expv[47] = 11'h07d;
      expv[48] = 11'h17c;
      expv[49] = 11'h174;
      expv[50] = 11'h1cf;
      expv[51] = 11'h07c;
      expv[52] = 11'h0fc;
      expv[53] = 11'h01e;
      expv[54] = 11'h137;
      expv[55] = 11'h0e2;
      expv[56] = 11'h1d3;
      expv[57] = 11'h042;
      expv[58] = 11'h138;
      expv[59] = 11'h142;
      expv[60] = 11'h0f9;
      expv[61] = 11'h019;
      expv[62] = 11'h052;
      expv[63] = 11'h0ef;
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
