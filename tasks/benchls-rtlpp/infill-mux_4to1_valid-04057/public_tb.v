// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04057 dut (
    .clk(clk),
    .reset(in_vec[22:22]),
    .select(in_vec[21:20]),
    .in0(in_vec[19:16]),
    .in1(in_vec[15:12]),
    .in2(in_vec[11:8]),
    .in3(in_vec[7:4]),
    .in0_valid(in_vec[3:3]),
    .in1_valid(in_vec[2:2]),
    .in2_valid(in_vec[1:1]),
    .in3_valid(in_vec[0:0]),
    .out_b(out_vec[4:1]),
    .out_valid_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h6a120a;
    stim[1] = 23'h7d2f04;
    stim[2] = 23'h02e409;
    stim[3] = 23'h2c65c4;
    stim[4] = 23'h0be491;
    stim[5] = 23'h31f179;
    stim[6] = 23'h098917;
    stim[7] = 23'h1de99d;
    stim[8] = 23'h1f628c;
    stim[9] = 23'h1431af;
    stim[10] = 23'h3a1eeb;
    stim[11] = 23'h218960;
    stim[12] = 23'h0908c1;
    stim[13] = 23'h3545c8;
    stim[14] = 23'h326e86;
    stim[15] = 23'h0fabbe;
    stim[16] = 23'h12c1f0;
    stim[17] = 23'h23fd99;
    stim[18] = 23'h3ed0e9;
    stim[19] = 23'h3b1285;
    stim[20] = 23'h15a545;
    stim[21] = 23'h18ba5d;
    stim[22] = 23'h02dd53;
    stim[23] = 23'h094759;
    stim[24] = 23'h323c73;
    stim[25] = 23'h3e87e0;
    stim[26] = 23'h1271ff;
    stim[27] = 23'h21517d;
    stim[28] = 23'h27298f;
    stim[29] = 23'h08ec2b;
    stim[30] = 23'h3cedcf;
    stim[31] = 23'h798f98;
    stim[32] = 23'h0adf39;
    stim[33] = 23'h1cb9dd;
    stim[34] = 23'h1592a2;
    stim[35] = 23'h36c1c1;
    stim[36] = 23'h37e443;
    stim[37] = 23'h3ba205;
    stim[38] = 23'h256c19;
    stim[39] = 23'h3fa4eb;
    stim[40] = 23'h020720;
    stim[41] = 23'h30a284;
    stim[42] = 23'h2ae411;
    stim[43] = 23'h1219e7;
    stim[44] = 23'h3f375f;
    stim[45] = 23'h1aaf38;
    stim[46] = 23'h33a658;
    stim[47] = 23'h0f35b2;
    stim[48] = 23'h3e759c;
    stim[49] = 23'h2710bc;
    stim[50] = 23'h0e5533;
    stim[51] = 23'h0db2e2;
    stim[52] = 23'h282ae6;
    stim[53] = 23'h24c53a;
    stim[54] = 23'h269fd1;
    stim[55] = 23'h3bf173;
    stim[56] = 23'h0aebda;
    stim[57] = 23'h0afc4c;
    stim[58] = 23'h07e54c;
    stim[59] = 23'h24d13c;
    stim[60] = 23'h1b2a3d;
    stim[61] = 23'h2c0959;
    stim[62] = 23'h2a50bc;
    stim[63] = 23'h167573;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h05;
      expv[3] = 5'h0a;
      expv[4] = 5'h16;
      expv[5] = 5'h0f;
      expv[6] = 5'h12;
      expv[7] = 5'h1d;
      expv[8] = 5'h0d;
      expv[9] = 5'h07;
      expv[10] = 5'h1d;
      expv[11] = 5'h12;
      expv[12] = 5'h12;
      expv[13] = 5'h18;
      expv[14] = 5'h10;
      expv[15] = 5'h1f;
      expv[16] = 5'h18;
      expv[17] = 5'h1a;
      expv[18] = 5'h1d;
      expv[19] = 5'h11;
      expv[20] = 5'h15;
      expv[21] = 5'h17;
      expv[22] = 5'h04;
      expv[23] = 5'h13;
      expv[24] = 5'h0f;
      expv[25] = 5'h1c;
      expv[26] = 5'h0f;
      expv[27] = 5'h02;
      expv[28] = 5'h13;
      expv[29] = 5'h11;
      expv[30] = 5'h19;
      expv[31] = 5'h00;
      expv[32] = 5'h15;
      expv[33] = 5'h17;
      expv[34] = 5'h12;
      expv[35] = 5'h19;
      expv[36] = 5'h09;
      expv[37] = 5'h01;
      expv[38] = 5'h18;
      expv[39] = 5'h1d;
      expv[40] = 5'h04;
      expv[41] = 5'h10;
      expv[42] = 5'h08;
      expv[43] = 5'h03;
      expv[44] = 5'h0b;
      expv[45] = 5'h14;
      expv[46] = 5'h0a;
      expv[47] = 5'h1e;
      expv[48] = 5'h12;
      expv[49] = 5'h00;
      expv[50] = 5'h1c;
      expv[51] = 5'h1a;
      expv[52] = 5'h15;
      expv[53] = 5'h0b;
      expv[54] = 5'h1e;
      expv[55] = 5'h0f;
      expv[56] = 5'h15;
      expv[57] = 5'h15;
      expv[58] = 5'h0f;
      expv[59] = 5'h02;
      expv[60] = 5'h05;
      expv[61] = 5'h12;
      expv[62] = 5'h00;
      expv[63] = 5'h0e;
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
