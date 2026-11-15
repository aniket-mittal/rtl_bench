// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01562 dut (
    .clk(clk),
    .db(in_vec[5:0]),
    .lin(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h06;
    stim[1] = 6'h0a;
    stim[2] = 6'h30;
    stim[3] = 6'h13;
    stim[4] = 6'h37;
    stim[5] = 6'h16;
    stim[6] = 6'h1d;
    stim[7] = 6'h18;
    stim[8] = 6'h36;
    stim[9] = 6'h2c;
    stim[10] = 6'h1a;
    stim[11] = 6'h1e;
    stim[12] = 6'h24;
    stim[13] = 6'h24;
    stim[14] = 6'h1b;
    stim[15] = 6'h10;
    stim[16] = 6'h16;
    stim[17] = 6'h22;
    stim[18] = 6'h39;
    stim[19] = 6'h1d;
    stim[20] = 6'h37;
    stim[21] = 6'h16;
    stim[22] = 6'h3f;
    stim[23] = 6'h13;
    stim[24] = 6'h3e;
    stim[25] = 6'h24;
    stim[26] = 6'h22;
    stim[27] = 6'h06;
    stim[28] = 6'h08;
    stim[29] = 6'h29;
    stim[30] = 6'h33;
    stim[31] = 6'h1d;
    stim[32] = 6'h26;
    stim[33] = 6'h39;
    stim[34] = 6'h0b;
    stim[35] = 6'h30;
    stim[36] = 6'h11;
    stim[37] = 6'h02;
    stim[38] = 6'h3b;
    stim[39] = 6'h2a;
    stim[40] = 6'h3f;
    stim[41] = 6'h38;
    stim[42] = 6'h3a;
    stim[43] = 6'h0c;
    stim[44] = 6'h0c;
    stim[45] = 6'h36;
    stim[46] = 6'h21;
    stim[47] = 6'h03;
    stim[48] = 6'h0d;
    stim[49] = 6'h21;
    stim[50] = 6'h28;
    stim[51] = 6'h36;
    stim[52] = 6'h32;
    stim[53] = 6'h3f;
    stim[54] = 6'h2c;
    stim[55] = 6'h26;
    stim[56] = 6'h22;
    stim[57] = 6'h3c;
    stim[58] = 6'h0e;
    stim[59] = 6'h0e;
    stim[60] = 6'h02;
    stim[61] = 6'h1d;
    stim[62] = 6'h3c;
    stim[63] = 6'h35;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h130;
      expv[2] = 9'h0d7;
      expv[3] = 9'h008;
      expv[4] = 9'h063;
      expv[5] = 9'h004;
      expv[6] = 9'h04c;
      expv[7] = 9'h029;
      expv[8] = 9'h040;
      expv[9] = 9'h004;
      expv[10] = 9'h00b;
      expv[11] = 9'h036;
      expv[12] = 9'h026;
      expv[13] = 9'h016;
      expv[14] = 9'h016;
      expv[15] = 9'h031;
      expv[16] = 9'h080;
      expv[17] = 9'h04c;
      expv[18] = 9'h01b;
      expv[19] = 9'h003;
      expv[20] = 9'h029;
      expv[21] = 9'h004;
      expv[22] = 9'h04c;
      expv[23] = 9'h002;
      expv[24] = 9'h063;
      expv[25] = 9'h002;
      expv[26] = 9'h016;
      expv[27] = 9'h01b;
      expv[28] = 9'h130;
      expv[29] = 9'h100;
      expv[30] = 9'h00e;
      expv[31] = 9'h006;
      expv[32] = 9'h029;
      expv[33] = 9'h013;
      expv[34] = 9'h003;
      expv[35] = 9'h0c5;
      expv[36] = 9'h008;
      expv[37] = 9'h075;
      expv[38] = 9'h1ad;
      expv[39] = 9'h003;
      expv[40] = 9'h00d;
      expv[41] = 9'h002;
      expv[42] = 9'h004;
      expv[43] = 9'h003;
      expv[44] = 9'h0b5;
      expv[45] = 9'h0b5;
      expv[46] = 9'h004;
      expv[47] = 9'h01d;
      expv[48] = 9'h18a;
      expv[49] = 9'h0a6;
      expv[50] = 9'h01d;
      expv[51] = 9'h010;
      expv[52] = 9'h004;
      expv[53] = 9'h006;
      expv[54] = 9'h002;
      expv[55] = 9'h00b;
      expv[56] = 9'h013;
      expv[57] = 9'h01b;
      expv[58] = 9'h002;
      expv[59] = 9'h098;
      expv[60] = 9'h098;
      expv[61] = 9'h1ad;
      expv[62] = 9'h029;
      expv[63] = 9'h002;
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
