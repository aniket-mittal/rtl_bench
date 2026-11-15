// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02946 dut (
    .clock(clk),
    .IEN_d(in_vec[16:16]),
    .IOF_d(in_vec[15:15]),
    .RTI_d(in_vec[14:14]),
    .branch_d(in_vec[13:13]),
    .IRQ(in_vec[12:12]),
    .PC(in_vec[11:0]),
    .branch_ISR(out_vec[12:12]),
    .ISR_adr(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0783f;
    stim[1] = 17'h1e1c6;
    stim[2] = 17'h1030e;
    stim[3] = 17'h06238;
    stim[4] = 17'h094a0;
    stim[5] = 17'h03bbf;
    stim[6] = 17'h1312a;
    stim[7] = 17'h1ed82;
    stim[8] = 17'h1cb9a;
    stim[9] = 17'h10922;
    stim[10] = 17'h1418e;
    stim[11] = 17'h1b53f;
    stim[12] = 17'h1fdda;
    stim[13] = 17'h0abbb;
    stim[14] = 17'h086f0;
    stim[15] = 17'h1da56;
    stim[16] = 17'h093b1;
    stim[17] = 17'h1e61f;
    stim[18] = 17'h149d1;
    stim[19] = 17'h09ba5;
    stim[20] = 17'h07c31;
    stim[21] = 17'h16cb0;
    stim[22] = 17'h04dbf;
    stim[23] = 17'h0a498;
    stim[24] = 17'h1b1bf;
    stim[25] = 17'h1e5d8;
    stim[26] = 17'h03672;
    stim[27] = 17'h034db;
    stim[28] = 17'h0127e;
    stim[29] = 17'h1096a;
    stim[30] = 17'h0a95d;
    stim[31] = 17'h0ec2f;
    stim[32] = 17'h04a3f;
    stim[33] = 17'h1e89d;
    stim[34] = 17'h1ef0f;
    stim[35] = 17'h0f5cc;
    stim[36] = 17'h09809;
    stim[37] = 17'h0963c;
    stim[38] = 17'h0cec2;
    stim[39] = 17'h06781;
    stim[40] = 17'h17134;
    stim[41] = 17'h1a6e2;
    stim[42] = 17'h0d07c;
    stim[43] = 17'h16558;
    stim[44] = 17'h16c7b;
    stim[45] = 17'h0570a;
    stim[46] = 17'h1fd6b;
    stim[47] = 17'h1e74b;
    stim[48] = 17'h00e26;
    stim[49] = 17'h1d6c4;
    stim[50] = 17'h04ba8;
    stim[51] = 17'h08490;
    stim[52] = 17'h10217;
    stim[53] = 17'h06269;
    stim[54] = 17'h1e5d0;
    stim[55] = 17'h1febf;
    stim[56] = 17'h0b660;
    stim[57] = 17'h0ca50;
    stim[58] = 17'h0a4a1;
    stim[59] = 17'h1a761;
    stim[60] = 17'h12a79;
    stim[61] = 17'h073d9;
    stim[62] = 17'h0f967;
    stim[63] = 17'h11d20;
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
      expv[0] = 13'h1000;
      expv[1] = 13'h1000;
      expv[2] = 13'h0000;
      expv[3] = 13'h1000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h1000;
      expv[8] = 13'h1000;
      expv[9] = 13'h0000;
      expv[10] = 13'h1000;
      expv[11] = 13'h0000;
      expv[12] = 13'h1000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h1000;
      expv[16] = 13'h0000;
      expv[17] = 13'h1000;
      expv[18] = 13'h1000;
      expv[19] = 13'h0000;
      expv[20] = 13'h1000;
      expv[21] = 13'h1000;
      expv[22] = 13'h1000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h1000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h1000;
      expv[32] = 13'h1000;
      expv[33] = 13'h1000;
      expv[34] = 13'h1000;
      expv[35] = 13'h1000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h1000;
      expv[39] = 13'h1000;
      expv[40] = 13'h1000;
      expv[41] = 13'h0000;
      expv[42] = 13'h1000;
      expv[43] = 13'h1000;
      expv[44] = 13'h1000;
      expv[45] = 13'h1000;
      expv[46] = 13'h1000;
      expv[47] = 13'h1000;
      expv[48] = 13'h0000;
      expv[49] = 13'h1000;
      expv[50] = 13'h1000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h1000;
      expv[54] = 13'h1000;
      expv[55] = 13'h1000;
      expv[56] = 13'h0000;
      expv[57] = 13'h1000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h1000;
      expv[62] = 13'h1000;
      expv[63] = 13'h0000;
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
