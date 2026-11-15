// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10340 dut (
    .clk(clk),
    .ce(in_vec[24:24]),
    .reset(in_vec[23:23]),
    .sq2(in_vec[22:22]),
    .Addr(in_vec[21:20]),
    .DIN(in_vec[19:12]),
    .MW(in_vec[11:11]),
    .LenCtr_Clock(in_vec[10:10]),
    .Env_Clock(in_vec[9:9]),
    .Enabled(in_vec[8:8]),
    .LenCtr_In(in_vec[7:0]),
    .Sample(out_vec[4:1]),
    .IsNonZero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1a35b6e;
    stim[1] = 25'h0f5282c;
    stim[2] = 25'h0531e50;
    stim[3] = 25'h03c4854;
    stim[4] = 25'h15b2be5;
    stim[5] = 25'h1162f88;
    stim[6] = 25'h13f6bc0;
    stim[7] = 25'h033ef62;
    stim[8] = 25'h0759f4b;
    stim[9] = 25'h0150c05;
    stim[10] = 25'h12f0f60;
    stim[11] = 25'h142f5bf;
    stim[12] = 25'h135fd2c;
    stim[13] = 25'h00b6fd5;
    stim[14] = 25'h07384dc;
    stim[15] = 25'h1769b91;
    stim[16] = 25'h16eb43c;
    stim[17] = 25'h07c5b56;
    stim[18] = 25'h136861d;
    stim[19] = 25'h13712d9;
    stim[20] = 25'h15981d4;
    stim[21] = 25'h16f16e6;
    stim[22] = 25'h177cbc2;
    stim[23] = 25'h005e34a;
    stim[24] = 25'h1800539;
    stim[25] = 25'h036c2ff;
    stim[26] = 25'h15787c3;
    stim[27] = 25'h14ece4b;
    stim[28] = 25'h04fa0cf;
    stim[29] = 25'h031b6aa;
    stim[30] = 25'h0519116;
    stim[31] = 25'h107f4a7;
    stim[32] = 25'h00b8b4b;
    stim[33] = 25'h05af5bc;
    stim[34] = 25'h10b291b;
    stim[35] = 25'h1519406;
    stim[36] = 25'h03ae3d8;
    stim[37] = 25'h1592ff5;
    stim[38] = 25'h14b1ac8;
    stim[39] = 25'h1438c12;
    stim[40] = 25'h0139feb;
    stim[41] = 25'h15b0b13;
    stim[42] = 25'h10b3058;
    stim[43] = 25'h01154cc;
    stim[44] = 25'h1529cfc;
    stim[45] = 25'h06c9863;
    stim[46] = 25'h10dd457;
    stim[47] = 25'h170f643;
    stim[48] = 25'h12c4a27;
    stim[49] = 25'h12f2305;
    stim[50] = 25'h14cc8b7;
    stim[51] = 25'h0225147;
    stim[52] = 25'h032c394;
    stim[53] = 25'h020ad3d;
    stim[54] = 25'h17fd43b;
    stim[55] = 25'h12ae801;
    stim[56] = 25'h0108fa6;
    stim[57] = 25'h056ae53;
    stim[58] = 25'h14d40dc;
    stim[59] = 25'h1598b4a;
    stim[60] = 25'h04e193f;
    stim[61] = 25'h14296bc;
    stim[62] = 25'h057baf1;
    stim[63] = 25'h0572922;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h01;
      expv[8] = 5'h01;
      expv[9] = 5'h01;
      expv[10] = 5'h01;
      expv[11] = 5'h01;
      expv[12] = 5'h01;
      expv[13] = 5'h01;
      expv[14] = 5'h01;
      expv[15] = 5'h01;
      expv[16] = 5'h01;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h01;
      expv[24] = 5'h01;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
