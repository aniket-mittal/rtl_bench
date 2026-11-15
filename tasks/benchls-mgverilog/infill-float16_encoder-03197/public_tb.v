// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03197 dut (
    .lin(in_vec[15:0]),
    .man(out_vec[12:3]),
    .exp(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8dc1;
    stim[1] = 16'h98db;
    stim[2] = 16'h0174;
    stim[3] = 16'h02e1;
    stim[4] = 16'h1d41;
    stim[5] = 16'h402a;
    stim[6] = 16'he4d0;
    stim[7] = 16'h8003;
    stim[8] = 16'h256a;
    stim[9] = 16'h2444;
    stim[10] = 16'h32a5;
    stim[11] = 16'h6952;
    stim[12] = 16'h2e94;
    stim[13] = 16'h3973;
    stim[14] = 16'hd0dd;
    stim[15] = 16'hb794;
    stim[16] = 16'h9fa5;
    stim[17] = 16'hb010;
    stim[18] = 16'h1f11;
    stim[19] = 16'h6b26;
    stim[20] = 16'h00c0;
    stim[21] = 16'h8152;
    stim[22] = 16'h1163;
    stim[23] = 16'hfbe1;
    stim[24] = 16'h5588;
    stim[25] = 16'h3e2a;
    stim[26] = 16'h9223;
    stim[27] = 16'h7f0f;
    stim[28] = 16'he68c;
    stim[29] = 16'h1846;
    stim[30] = 16'hd3da;
    stim[31] = 16'hb802;
    stim[32] = 16'h98c3;
    stim[33] = 16'hc739;
    stim[34] = 16'hfde6;
    stim[35] = 16'hfb48;
    stim[36] = 16'h8634;
    stim[37] = 16'hafdb;
    stim[38] = 16'hba0c;
    stim[39] = 16'h0c68;
    stim[40] = 16'h6747;
    stim[41] = 16'h0cce;
    stim[42] = 16'h9326;
    stim[43] = 16'h694c;
    stim[44] = 16'hce9c;
    stim[45] = 16'h7ca9;
    stim[46] = 16'h4bd4;
    stim[47] = 16'h83fd;
    stim[48] = 16'h67fa;
    stim[49] = 16'h642c;
    stim[50] = 16'hcd24;
    stim[51] = 16'h4f16;
    stim[52] = 16'h0563;
    stim[53] = 16'hdae1;
    stim[54] = 16'hff50;
    stim[55] = 16'h7f25;
    stim[56] = 16'hd001;
    stim[57] = 16'h22c2;
    stim[58] = 16'h39f6;
    stim[59] = 16'h7e31;
    stim[60] = 16'hdf2f;
    stim[61] = 16'h90eb;
    stim[62] = 16'hd068;
    stim[63] = 16'h9dec;
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
      expv[0] = 13'h11bf;
      expv[1] = 13'h131f;
      expv[2] = 13'h0ba1;
      expv[3] = 13'h0b82;
      expv[4] = 13'h0ea5;
      expv[5] = 13'h0807;
      expv[6] = 13'h126d;
      expv[7] = 13'h1007;
      expv[8] = 13'h095e;
      expv[9] = 13'h0916;
      expv[10] = 13'h0cae;
      expv[11] = 13'h0d2f;
      expv[12] = 13'h0ba6;
      expv[13] = 13'h0e5e;
      expv[14] = 13'h1436;
      expv[15] = 13'h16f7;
      expv[16] = 13'h13f7;
      expv[17] = 13'h1607;
      expv[18] = 13'h0f8d;
      expv[19] = 13'h0d67;
      expv[20] = 13'h0601;
      expv[21] = 13'h102f;
      expv[22] = 13'h08b5;
      expv[23] = 13'h17c3;
      expv[24] = 13'h0ab7;
      expv[25] = 13'h0f8e;
      expv[26] = 13'h1247;
      expv[27] = 13'h0fe7;
      expv[28] = 13'h1345;
      expv[29] = 13'h0c25;
      expv[30] = 13'h14f6;
      expv[31] = 13'h1707;
      expv[32] = 13'h131f;
      expv[33] = 13'h11ce;
      expv[34] = 13'h179a;
      expv[35] = 13'h1693;
      expv[36] = 13'h10c7;
      expv[37] = 13'h15ff;
      expv[38] = 13'h1747;
      expv[39] = 13'h0c6c;
      expv[40] = 13'h0cef;
      expv[41] = 13'h0ccc;
      expv[42] = 13'h1267;
      expv[43] = 13'h0d2f;
      expv[44] = 13'h13a6;
      expv[45] = 13'h0f97;
      expv[46] = 13'h097f;
      expv[47] = 13'h107f;
      expv[48] = 13'h0cff;
      expv[49] = 13'h0c87;
      expv[50] = 13'h134e;
      expv[51] = 13'h09e7;
      expv[52] = 13'h0ac3;
      expv[53] = 13'h16be;
      expv[54] = 13'h1a81;
      expv[55] = 13'h0fe7;
      expv[56] = 13'h1406;
      expv[57] = 13'h08b6;
      expv[58] = 13'h0e7e;
      expv[59] = 13'h0fc7;
      expv[60] = 13'h17ce;
      expv[61] = 13'h121f;
      expv[62] = 13'h141e;
      expv[63] = 13'h13bf;
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
