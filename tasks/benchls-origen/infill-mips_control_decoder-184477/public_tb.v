// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184477 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .wreg(out_vec[7:7]),
    .m2reg(out_vec[6:6]),
    .wmem(out_vec[5:5]),
    .aluimm(out_vec[4:4]),
    .regrt(out_vec[3:3]),
    .aluc(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h4fd;
    stim[1] = 12'h11c;
    stim[2] = 12'hb80;
    stim[3] = 12'h0b6;
    stim[4] = 12'h06a;
    stim[5] = 12'h393;
    stim[6] = 12'hf70;
    stim[7] = 12'h58c;
    stim[8] = 12'h5bd;
    stim[9] = 12'hbf8;
    stim[10] = 12'h701;
    stim[11] = 12'hb3f;
    stim[12] = 12'hff2;
    stim[13] = 12'h69a;
    stim[14] = 12'hec5;
    stim[15] = 12'h9d0;
    stim[16] = 12'h0a3;
    stim[17] = 12'h0fe;
    stim[18] = 12'hd1e;
    stim[19] = 12'h8de;
    stim[20] = 12'h379;
    stim[21] = 12'hc43;
    stim[22] = 12'hb3a;
    stim[23] = 12'h471;
    stim[24] = 12'h789;
    stim[25] = 12'heae;
    stim[26] = 12'h612;
    stim[27] = 12'h0c8;
    stim[28] = 12'hd06;
    stim[29] = 12'hb87;
    stim[30] = 12'h0ee;
    stim[31] = 12'h459;
    stim[32] = 12'hf94;
    stim[33] = 12'h938;
    stim[34] = 12'hfed;
    stim[35] = 12'h84b;
    stim[36] = 12'h6fa;
    stim[37] = 12'h55d;
    stim[38] = 12'hbad;
    stim[39] = 12'h16c;
    stim[40] = 12'he4a;
    stim[41] = 12'hd1d;
    stim[42] = 12'hd4e;
    stim[43] = 12'hec4;
    stim[44] = 12'h8c3;
    stim[45] = 12'he65;
    stim[46] = 12'he46;
    stim[47] = 12'h037;
    stim[48] = 12'h8fe;
    stim[49] = 12'h21b;
    stim[50] = 12'hba7;
    stim[51] = 12'h86b;
    stim[52] = 12'h1e4;
    stim[53] = 12'h838;
    stim[54] = 12'h3e8;
    stim[55] = 12'h219;
    stim[56] = 12'hb4a;
    stim[57] = 12'h08a;
    stim[58] = 12'h165;
    stim[59] = 12'hbdb;
    stim[60] = 12'h986;
    stim[61] = 12'h62f;
    stim[62] = 12'hb90;
    stim[63] = 12'hda4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hd8;
      expv[20] = 8'h9b;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hd8;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hd8;
      expv[49] = 8'h98;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'h98;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
