// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02700 dut (
    .Clk(clk),
    .rdEn(in_vec[17:17]),
    .wrEn(in_vec[16:16]),
    .addr(in_vec[15:8]),
    .wrData(in_vec[7:0]),
    .Data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h057db;
    stim[1] = 18'h121ef;
    stim[2] = 18'h12741;
    stim[3] = 18'h32215;
    stim[4] = 18'h21bdd;
    stim[5] = 18'h1abcb;
    stim[6] = 18'h2e4df;
    stim[7] = 18'h1c20a;
    stim[8] = 18'h30ca2;
    stim[9] = 18'h18569;
    stim[10] = 18'h32c3e;
    stim[11] = 18'h3562f;
    stim[12] = 18'h3fb47;
    stim[13] = 18'h209e0;
    stim[14] = 18'h0c95e;
    stim[15] = 18'h00eeb;
    stim[16] = 18'h382b3;
    stim[17] = 18'h0f646;
    stim[18] = 18'h26a74;
    stim[19] = 18'h0fd58;
    stim[20] = 18'h16017;
    stim[21] = 18'h2f764;
    stim[22] = 18'h3b97b;
    stim[23] = 18'h34a39;
    stim[24] = 18'h0d8ea;
    stim[25] = 18'h34dfd;
    stim[26] = 18'h0d752;
    stim[27] = 18'h3741f;
    stim[28] = 18'h1e9a3;
    stim[29] = 18'h3bb45;
    stim[30] = 18'h3053e;
    stim[31] = 18'h2d0ba;
    stim[32] = 18'h06c47;
    stim[33] = 18'h1f088;
    stim[34] = 18'h0bf08;
    stim[35] = 18'h1a49d;
    stim[36] = 18'h38b0b;
    stim[37] = 18'h38d63;
    stim[38] = 18'h332bf;
    stim[39] = 18'h22c20;
    stim[40] = 18'h2caf3;
    stim[41] = 18'h00da6;
    stim[42] = 18'h2e3f5;
    stim[43] = 18'h25ba0;
    stim[44] = 18'h09d1c;
    stim[45] = 18'h07a44;
    stim[46] = 18'h2e397;
    stim[47] = 18'h3a93c;
    stim[48] = 18'h3381b;
    stim[49] = 18'h3c55d;
    stim[50] = 18'h1d635;
    stim[51] = 18'h21cfb;
    stim[52] = 18'h1d013;
    stim[53] = 18'h1bb01;
    stim[54] = 18'h390a4;
    stim[55] = 18'h25f37;
    stim[56] = 18'h1d77b;
    stim[57] = 18'h39679;
    stim[58] = 18'h36f45;
    stim[59] = 18'h0ae48;
    stim[60] = 18'h022d2;
    stim[61] = 18'h23370;
    stim[62] = 18'h1fd44;
    stim[63] = 18'h32418;
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
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
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
      expv[40] = 8'h3e;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
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
