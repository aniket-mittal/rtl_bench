// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h155d4;
    stim[1] = 17'h09fd2;
    stim[2] = 17'h0e0f3;
    stim[3] = 17'h0e4db;
    stim[4] = 17'h1f2e8;
    stim[5] = 17'h0c66c;
    stim[6] = 17'h1e97b;
    stim[7] = 17'h110b5;
    stim[8] = 17'h1697d;
    stim[9] = 17'h0ea2b;
    stim[10] = 17'h08d99;
    stim[11] = 17'h19239;
    stim[12] = 17'h0197e;
    stim[13] = 17'h0725c;
    stim[14] = 17'h0b19c;
    stim[15] = 17'h1b3d7;
    stim[16] = 17'h04b5f;
    stim[17] = 17'h1c8dc;
    stim[18] = 17'h0e382;
    stim[19] = 17'h08dc3;
    stim[20] = 17'h0d248;
    stim[21] = 17'h13ee2;
    stim[22] = 17'h1dd73;
    stim[23] = 17'h19c6d;
    stim[24] = 17'h11ab2;
    stim[25] = 17'h1a3a0;
    stim[26] = 17'h09126;
    stim[27] = 17'h0ad96;
    stim[28] = 17'h06b44;
    stim[29] = 17'h06e92;
    stim[30] = 17'h04ef2;
    stim[31] = 17'h0665c;
    stim[32] = 17'h190e1;
    stim[33] = 17'h0da30;
    stim[34] = 17'h11917;
    stim[35] = 17'h03b91;
    stim[36] = 17'h08400;
    stim[37] = 17'h009b9;
    stim[38] = 17'h01a37;
    stim[39] = 17'h1907d;
    stim[40] = 17'h0076e;
    stim[41] = 17'h04833;
    stim[42] = 17'h0e93a;
    stim[43] = 17'h1421f;
    stim[44] = 17'h06f73;
    stim[45] = 17'h11ce0;
    stim[46] = 17'h01c29;
    stim[47] = 17'h03bd4;
    stim[48] = 17'h0373d;
    stim[49] = 17'h1b462;
    stim[50] = 17'h0a641;
    stim[51] = 17'h04b17;
    stim[52] = 17'h1d2e0;
    stim[53] = 17'h056b0;
    stim[54] = 17'h07e88;
    stim[55] = 17'h1d45d;
    stim[56] = 17'h1e0c3;
    stim[57] = 17'h15587;
    stim[58] = 17'h184b1;
    stim[59] = 17'h1755b;
    stim[60] = 17'h0b1f3;
    stim[61] = 17'h0d274;
    stim[62] = 17'h1f5b8;
    stim[63] = 17'h15c0e;
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
      expv[0] = 8'h55;
      expv[1] = 8'h9f;
      expv[2] = 8'hf3;
      expv[3] = 8'hdb;
      expv[4] = 8'hf2;
      expv[5] = 8'h6c;
      expv[6] = 8'he9;
      expv[7] = 8'h10;
      expv[8] = 8'h69;
      expv[9] = 8'h2b;
      expv[10] = 8'h8d;
      expv[11] = 8'h92;
      expv[12] = 8'h19;
      expv[13] = 8'h5c;
      expv[14] = 8'hb1;
      expv[15] = 8'hb3;
      expv[16] = 8'h4b;
      expv[17] = 8'hc8;
      expv[18] = 8'he3;
      expv[19] = 8'h8d;
      expv[20] = 8'h48;
      expv[21] = 8'h3e;
      expv[22] = 8'hdd;
      expv[23] = 8'h9c;
      expv[24] = 8'h1a;
      expv[25] = 8'ha3;
      expv[26] = 8'h91;
      expv[27] = 8'had;
      expv[28] = 8'h6b;
      expv[29] = 8'h92;
      expv[30] = 8'hf2;
      expv[31] = 8'h5c;
      expv[32] = 8'h90;
      expv[33] = 8'h30;
      expv[34] = 8'h19;
      expv[35] = 8'h3b;
      expv[36] = 8'h00;
      expv[37] = 8'h09;
      expv[38] = 8'h37;
      expv[39] = 8'h90;
      expv[40] = 8'h07;
      expv[41] = 8'h33;
      expv[42] = 8'he9;
      expv[43] = 8'h42;
      expv[44] = 8'h6f;
      expv[45] = 8'h1c;
      expv[46] = 8'h29;
      expv[47] = 8'h3b;
      expv[48] = 8'h37;
      expv[49] = 8'hb4;
      expv[50] = 8'h41;
      expv[51] = 8'h4b;
      expv[52] = 8'hd2;
      expv[53] = 8'hb0;
      expv[54] = 8'h88;
      expv[55] = 8'hd4;
      expv[56] = 8'he0;
      expv[57] = 8'h55;
      expv[58] = 8'h84;
      expv[59] = 8'h75;
      expv[60] = 8'hb1;
      expv[61] = 8'h74;
      expv[62] = 8'hf5;
      expv[63] = 8'h5c;
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
