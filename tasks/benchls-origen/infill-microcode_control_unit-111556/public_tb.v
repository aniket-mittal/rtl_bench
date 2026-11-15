// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111556 dut (
    .instruction(in_vec[6:3]),
    .nC(in_vec[2:2]),
    .nZ(in_vec[1:1]),
    .ph(in_vec[0:0]),
    .notIncPC(out_vec[15:15]),
    .notLoadPC(out_vec[14:14]),
    .notLoadA(out_vec[13:13]),
    .notLoadFlags(out_vec[12:12]),
    .notCarryIn(out_vec[11:11]),
    .M(out_vec[10:10]),
    .S(out_vec[9:6]),
    .notCsRam(out_vec[5:5]),
    .notWeRam(out_vec[4:4]),
    .notOeALU(out_vec[3:3]),
    .notOeIn(out_vec[2:2]),
    .notOeOprnd(out_vec[1:1]),
    .notLoadOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h57;
    stim[1] = 7'h1a;
    stim[2] = 7'h13;
    stim[3] = 7'h36;
    stim[4] = 7'h73;
    stim[5] = 7'h26;
    stim[6] = 7'h5c;
    stim[7] = 7'h26;
    stim[8] = 7'h5b;
    stim[9] = 7'h22;
    stim[10] = 7'h60;
    stim[11] = 7'h45;
    stim[12] = 7'h38;
    stim[13] = 7'h55;
    stim[14] = 7'h26;
    stim[15] = 7'h4a;
    stim[16] = 7'h4b;
    stim[17] = 7'h35;
    stim[18] = 7'h12;
    stim[19] = 7'h26;
    stim[20] = 7'h01;
    stim[21] = 7'h6f;
    stim[22] = 7'h1c;
    stim[23] = 7'h54;
    stim[24] = 7'h41;
    stim[25] = 7'h3c;
    stim[26] = 7'h42;
    stim[27] = 7'h60;
    stim[28] = 7'h2a;
    stim[29] = 7'h2a;
    stim[30] = 7'h18;
    stim[31] = 7'h1a;
    stim[32] = 7'h78;
    stim[33] = 7'h28;
    stim[34] = 7'h4c;
    stim[35] = 7'h02;
    stim[36] = 7'h5f;
    stim[37] = 7'h0d;
    stim[38] = 7'h0f;
    stim[39] = 7'h0e;
    stim[40] = 7'h3a;
    stim[41] = 7'h3d;
    stim[42] = 7'h0c;
    stim[43] = 7'h65;
    stim[44] = 7'h72;
    stim[45] = 7'h34;
    stim[46] = 7'h58;
    stim[47] = 7'h01;
    stim[48] = 7'h3a;
    stim[49] = 7'h3d;
    stim[50] = 7'h6b;
    stim[51] = 7'h0e;
    stim[52] = 7'h18;
    stim[53] = 7'h20;
    stim[54] = 7'h54;
    stim[55] = 7'h40;
    stim[56] = 7'h19;
    stim[57] = 7'h42;
    stim[58] = 7'h24;
    stim[59] = 7'h6d;
    stim[60] = 7'h32;
    stim[61] = 7'h4d;
    stim[62] = 7'h57;
    stim[63] = 7'h47;
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
      expv[0] = 16'h1fff;
      expv[1] = 16'h1fff;
      expv[2] = 16'h0c77;
      expv[3] = 16'h1fff;
      expv[4] = 16'h1fff;
      expv[5] = 16'h1fff;
      expv[6] = 16'h1fff;
      expv[7] = 16'h1fff;
      expv[8] = 16'h1ffb;
      expv[9] = 16'h1fff;
      expv[10] = 16'h1fff;
      expv[11] = 16'h1ffd;
      expv[12] = 16'h1fff;
      expv[13] = 16'h1fff;
      expv[14] = 16'h1fff;
      expv[15] = 16'h1fff;
      expv[16] = 16'h1fff;
      expv[17] = 16'h1fdd;
      expv[18] = 16'h1fff;
      expv[19] = 16'h1fff;
      expv[20] = 16'h1fff;
      expv[21] = 16'h1fff;
      expv[22] = 16'h1fff;
      expv[23] = 16'h1fff;
      expv[24] = 16'h1ffd;
      expv[25] = 16'h1fff;
      expv[26] = 16'h1fff;
      expv[27] = 16'h1fff;
      expv[28] = 16'h1fff;
      expv[29] = 16'h1fff;
      expv[30] = 16'h1fff;
      expv[31] = 16'h1fff;
      expv[32] = 16'h1fff;
      expv[33] = 16'h1fff;
      expv[34] = 16'h1fff;
      expv[35] = 16'h1fff;
      expv[36] = 16'h1ffb;
      expv[37] = 16'h0c37;
      expv[38] = 16'h0c37;
      expv[39] = 16'h1fff;
      expv[40] = 16'h1fff;
      expv[41] = 16'h1fcf;
      expv[42] = 16'h1fff;
      expv[43] = 16'h1ffe;
      expv[44] = 16'h1fff;
      expv[45] = 16'h1fff;
      expv[46] = 16'h1fff;
      expv[47] = 16'h1fff;
      expv[48] = 16'h1fff;
      expv[49] = 16'h1fcf;
      expv[50] = 16'h1fff;
      expv[51] = 16'h1fff;
      expv[52] = 16'h1fff;
      expv[53] = 16'h1fff;
      expv[54] = 16'h1fff;
      expv[55] = 16'h1fff;
      expv[56] = 16'h0cb7;
      expv[57] = 16'h1fff;
      expv[58] = 16'h1fff;
      expv[59] = 16'h1fff;
      expv[60] = 16'h1fff;
      expv[61] = 16'h1ffd;
      expv[62] = 16'h1fff;
      expv[63] = 16'h1ffd;
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
