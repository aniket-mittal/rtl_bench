// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168975 dut (
    .clk(clk),
    .clr(in_vec[16:16]),
    .x(in_vec[15:0]),
    .en(out_vec[10:7]),
    .a_to_g(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h16abd;
    stim[1] = 17'h10913;
    stim[2] = 17'h04707;
    stim[3] = 17'h065f6;
    stim[4] = 17'h0b420;
    stim[5] = 17'h0bad4;
    stim[6] = 17'h01ed1;
    stim[7] = 17'h0a005;
    stim[8] = 17'h04d50;
    stim[9] = 17'h04ca9;
    stim[10] = 17'h0b212;
    stim[11] = 17'h09e26;
    stim[12] = 17'h03f7a;
    stim[13] = 17'h04f42;
    stim[14] = 17'h06b4f;
    stim[15] = 17'h08f18;
    stim[16] = 17'h02337;
    stim[17] = 17'h05bfa;
    stim[18] = 17'h0ba3a;
    stim[19] = 17'h0ed48;
    stim[20] = 17'h0f678;
    stim[21] = 17'h07cf1;
    stim[22] = 17'h0eebd;
    stim[23] = 17'h06504;
    stim[24] = 17'h14656;
    stim[25] = 17'h01899;
    stim[26] = 17'h0107a;
    stim[27] = 17'h07f77;
    stim[28] = 17'h0e7a2;
    stim[29] = 17'h05846;
    stim[30] = 17'h07caf;
    stim[31] = 17'h07107;
    stim[32] = 17'h0c8c3;
    stim[33] = 17'h01cc9;
    stim[34] = 17'h05b17;
    stim[35] = 17'h0811f;
    stim[36] = 17'h03c6f;
    stim[37] = 17'h07389;
    stim[38] = 17'h06a10;
    stim[39] = 17'h0a94b;
    stim[40] = 17'h0210e;
    stim[41] = 17'h057c3;
    stim[42] = 17'h0ae03;
    stim[43] = 17'h0363d;
    stim[44] = 17'h07364;
    stim[45] = 17'h0d423;
    stim[46] = 17'h0bdd6;
    stim[47] = 17'h013ff;
    stim[48] = 17'h0a31b;
    stim[49] = 17'h0e18b;
    stim[50] = 17'h0c028;
    stim[51] = 17'h056c1;
    stim[52] = 17'h0be7a;
    stim[53] = 17'h0ad0f;
    stim[54] = 17'h0012d;
    stim[55] = 17'h0a6bf;
    stim[56] = 17'h06f8a;
    stim[57] = 17'h027ec;
    stim[58] = 17'h057b0;
    stim[59] = 17'h0ddba;
    stim[60] = 17'h08fa2;
    stim[61] = 17'h0057e;
    stim[62] = 17'h041de;
    stim[63] = 17'h0ff2b;
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
      expv[0] = 11'h0c0;
      expv[1] = 11'h0b0;
      expv[2] = 11'h0f8;
      expv[3] = 11'h082;
      expv[4] = 11'h0c0;
      expv[5] = 11'h099;
      expv[6] = 11'h0f9;
      expv[7] = 11'h092;
      expv[8] = 11'h0c0;
      expv[9] = 11'h090;
      expv[10] = 11'h0a4;
      expv[11] = 11'h082;
      expv[12] = 11'h0c0;
      expv[13] = 11'h0a4;
      expv[14] = 11'h0c0;
      expv[15] = 11'h080;
      expv[16] = 11'h0f8;
      expv[17] = 11'h0c0;
      expv[18] = 11'h0c0;
      expv[19] = 11'h080;
      expv[20] = 11'h080;
      expv[21] = 11'h0f9;
      expv[22] = 11'h0c0;
      expv[23] = 11'h099;
      expv[24] = 11'h082;
      expv[25] = 11'h090;
      expv[26] = 11'h0c0;
      expv[27] = 11'h0f8;
      expv[28] = 11'h0a4;
      expv[29] = 11'h082;
      expv[30] = 11'h0c0;
      expv[31] = 11'h0f8;
      expv[32] = 11'h0b0;
      expv[33] = 11'h090;
      expv[34] = 11'h0f8;
      expv[35] = 11'h0c0;
      expv[36] = 11'h0c0;
      expv[37] = 11'h090;
      expv[38] = 11'h0c0;
      expv[39] = 11'h0c0;
      expv[40] = 11'h0c0;
      expv[41] = 11'h0b0;
      expv[42] = 11'h0b0;
      expv[43] = 11'h0c0;
      expv[44] = 11'h099;
      expv[45] = 11'h0b0;
      expv[46] = 11'h082;
      expv[47] = 11'h0c0;
      expv[48] = 11'h0c0;
      expv[49] = 11'h0c0;
      expv[50] = 11'h080;
      expv[51] = 11'h0f9;
      expv[52] = 11'h0c0;
      expv[53] = 11'h0c0;
      expv[54] = 11'h0c0;
      expv[55] = 11'h0c0;
      expv[56] = 11'h0c0;
      expv[57] = 11'h0c0;
      expv[58] = 11'h0c0;
      expv[59] = 11'h0c0;
      expv[60] = 11'h0a4;
      expv[61] = 11'h0c0;
      expv[62] = 11'h0c0;
      expv[63] = 11'h0c0;
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
