// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199535 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .move(in_vec[24:24]),
    .fire(in_vec[23:23]),
    .collision(in_vec[22:22]),
    .inx(in_vec[21:11]),
    .iny(in_vec[10:0]),
    .ox(out_vec[21:11]),
    .oy(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2080f76;
    stim[1] = 26'h29fe48b;
    stim[2] = 26'h0abedf7;
    stim[3] = 26'h0fece54;
    stim[4] = 26'h007e900;
    stim[5] = 26'h00ddda2;
    stim[6] = 26'h1b15c7e;
    stim[7] = 26'h113bebe;
    stim[8] = 26'h06f861f;
    stim[9] = 26'h009ebf0;
    stim[10] = 26'h199e1bb;
    stim[11] = 26'h1474917;
    stim[12] = 26'h00c3041;
    stim[13] = 26'h09abd77;
    stim[14] = 26'h1759405;
    stim[15] = 26'h09904d6;
    stim[16] = 26'h0912aa6;
    stim[17] = 26'h04a3d22;
    stim[18] = 26'h0d4f551;
    stim[19] = 26'h1b448fc;
    stim[20] = 26'h17eb69b;
    stim[21] = 26'h09d7ad3;
    stim[22] = 26'h0c3d30f;
    stim[23] = 26'h04f6a77;
    stim[24] = 26'h0606987;
    stim[25] = 26'h04fe8ae;
    stim[26] = 26'h1c68d5e;
    stim[27] = 26'h1c73c44;
    stim[28] = 26'h0614498;
    stim[29] = 26'h0b22021;
    stim[30] = 26'h1609b5e;
    stim[31] = 26'h1f9f256;
    stim[32] = 26'h0451e80;
    stim[33] = 26'h02a0d61;
    stim[34] = 26'h19d6b94;
    stim[35] = 26'h017aa15;
    stim[36] = 26'h0f75690;
    stim[37] = 26'h126faff;
    stim[38] = 26'h064c181;
    stim[39] = 26'h09e350b;
    stim[40] = 26'h0215e70;
    stim[41] = 26'h05bdd98;
    stim[42] = 26'h05a4a04;
    stim[43] = 26'h1cc9427;
    stim[44] = 26'h1481790;
    stim[45] = 26'h3b616de;
    stim[46] = 26'h0189f62;
    stim[47] = 26'h131a9ed;
    stim[48] = 26'h0f5c244;
    stim[49] = 26'h0180e69;
    stim[50] = 26'h0017250;
    stim[51] = 26'h0f28618;
    stim[52] = 26'h0a424c6;
    stim[53] = 26'h0ca4800;
    stim[54] = 26'h0c3c00b;
    stim[55] = 26'h06d0a14;
    stim[56] = 26'h1cb0bfd;
    stim[57] = 26'h13ae47f;
    stim[58] = 26'h0b28bda;
    stim[59] = 26'h12cf0ff;
    stim[60] = 26'h1cf2071;
    stim[61] = 26'h114fa6a;
    stim[62] = 26'h1343286;
    stim[63] = 26'h12a1ec9;
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
      expv[0] = 22'h20d080;
      expv[1] = 22'h20d080;
      expv[2] = 22'h20d080;
      expv[3] = 22'h2bedf7;
      expv[4] = 22'h2bedf7;
      expv[5] = 22'h20d080;
      expv[6] = 22'h20d080;
      expv[7] = 22'h315c7e;
      expv[8] = 22'h315c76;
      expv[9] = 22'h315c76;
      expv[10] = 22'h20d080;
      expv[11] = 22'h19e1bb;
      expv[12] = 22'h19e1b3;
      expv[13] = 22'h20d080;
      expv[14] = 22'h1abd77;
      expv[15] = 22'h1abd6f;
      expv[16] = 22'h1904d6;
      expv[17] = 22'h1904d6;
      expv[18] = 22'h1904d6;
      expv[19] = 22'h14f551;
      expv[20] = 22'h14f549;
      expv[21] = 22'h14f541;
      expv[22] = 22'h1d7ad3;
      expv[23] = 22'h1d7ad3;
      expv[24] = 22'h20d080;
      expv[25] = 22'h20d080;
      expv[26] = 22'h20d080;
      expv[27] = 22'h068d5e;
      expv[28] = 22'h068d56;
      expv[29] = 22'h20d080;
      expv[30] = 22'h322021;
      expv[31] = 22'h322019;
      expv[32] = 22'h39f256;
      expv[33] = 22'h39f256;
      expv[34] = 22'h20d080;
      expv[35] = 22'h1d6b94;
      expv[36] = 22'h1d6b94;
      expv[37] = 22'h1d6b94;
      expv[38] = 22'h20d080;
      expv[39] = 22'h20d080;
      expv[40] = 22'h1e350b;
      expv[41] = 22'h1e350b;
      expv[42] = 22'h1e350b;
      expv[43] = 22'h20d080;
      expv[44] = 22'h0c9427;
      expv[45] = 22'h20d080;
      expv[46] = 22'h20d080;
      expv[47] = 22'h20d080;
      expv[48] = 22'h20d080;
      expv[49] = 22'h35c244;
      expv[50] = 22'h35c244;
      expv[51] = 22'h35c244;
      expv[52] = 22'h35c244;
      expv[53] = 22'h2424c6;
      expv[54] = 22'h2424c6;
      expv[55] = 22'h03c00b;
      expv[56] = 22'h03c00b;
      expv[57] = 22'h0b0bfd;
      expv[58] = 22'h0b0bf5;
      expv[59] = 22'h0b0bf5;
      expv[60] = 22'h0b0bed;
      expv[61] = 22'h0b0be5;
      expv[62] = 22'h20d080;
      expv[63] = 22'h20d080;
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
