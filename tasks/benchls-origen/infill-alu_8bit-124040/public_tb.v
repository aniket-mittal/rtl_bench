// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124040 dut (
    .clk(clk),
    .reset(in_vec[18:18]),
    .op(in_vec[17:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .result(out_vec[8:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4fa9c;
    stim[1] = 19'h61670;
    stim[2] = 19'h07bf8;
    stim[3] = 19'h10d71;
    stim[4] = 19'h3a465;
    stim[5] = 19'h1e1e1;
    stim[6] = 19'h0bf62;
    stim[7] = 19'h07bdf;
    stim[8] = 19'h2ccee;
    stim[9] = 19'h13630;
    stim[10] = 19'h38c26;
    stim[11] = 19'h23621;
    stim[12] = 19'h0250c;
    stim[13] = 19'h21413;
    stim[14] = 19'h22dc4;
    stim[15] = 19'h1dbcb;
    stim[16] = 19'h175da;
    stim[17] = 19'h1ad95;
    stim[18] = 19'h30632;
    stim[19] = 19'h137ae;
    stim[20] = 19'h308e7;
    stim[21] = 19'h28c4d;
    stim[22] = 19'h080aa;
    stim[23] = 19'h1c656;
    stim[24] = 19'h31bce;
    stim[25] = 19'h0e302;
    stim[26] = 19'h2af74;
    stim[27] = 19'h099e9;
    stim[28] = 19'h01b81;
    stim[29] = 19'h28f20;
    stim[30] = 19'h38db5;
    stim[31] = 19'h0b4f7;
    stim[32] = 19'h0eaa4;
    stim[33] = 19'h043b6;
    stim[34] = 19'h2a355;
    stim[35] = 19'h109b2;
    stim[36] = 19'h014be;
    stim[37] = 19'h13ad9;
    stim[38] = 19'h3ba49;
    stim[39] = 19'h3dfa7;
    stim[40] = 19'h5eba7;
    stim[41] = 19'h1b581;
    stim[42] = 19'h38935;
    stim[43] = 19'h3251d;
    stim[44] = 19'h11397;
    stim[45] = 19'h08306;
    stim[46] = 19'h17226;
    stim[47] = 19'h15d47;
    stim[48] = 19'h3bc94;
    stim[49] = 19'h0f2a0;
    stim[50] = 19'h31980;
    stim[51] = 19'h2694f;
    stim[52] = 19'h2f2b7;
    stim[53] = 19'h30f82;
    stim[54] = 19'h213a6;
    stim[55] = 19'h0f6e0;
    stim[56] = 19'h344d2;
    stim[57] = 19'h00e95;
    stim[58] = 19'h1255d;
    stim[59] = 19'h3ab66;
    stim[60] = 19'h2a3d6;
    stim[61] = 19'h0d94c;
    stim[62] = 19'h2740a;
    stim[63] = 19'h410a1;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h0e7;
      expv[4] = 9'h139;
      expv[5] = 9'h003;
      expv[6] = 9'h001;
      expv[7] = 9'h043;
      expv[8] = 9'h0b5;
      expv[9] = 9'h151;
      expv[10] = 9'h00d;
      expv[11] = 9'h007;
      expv[12] = 9'h1ed;
      expv[13] = 9'h063;
      expv[14] = 9'h0f9;
      expv[15] = 9'h0e9;
      expv[16] = 9'h021;
      expv[17] = 9'h137;
      expv[18] = 9'h031;
      expv[19] = 9'h001;
      expv[20] = 9'h113;
      expv[21] = 9'h001;
      expv[22] = 9'h039;
      expv[23] = 9'h055;
      expv[24] = 9'h0e1;
      expv[25] = 9'h001;
      expv[26] = 9'h1cb;
      expv[27] = 9'h099;
      expv[28] = 9'h105;
      expv[29] = 9'h139;
      expv[30] = 9'h1c1;
      expv[31] = 9'h001;
      expv[32] = 9'h157;
      expv[33] = 9'h11d;
      expv[34] = 9'h1f3;
      expv[35] = 9'h03f;
      expv[36] = 9'h0af;
      expv[37] = 9'h1a5;
      expv[38] = 9'h0c3;
      expv[39] = 9'h005;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h069;
      expv[43] = 9'h005;
      expv[44] = 9'h003;
      expv[45] = 9'h0f9;
      expv[46] = 9'h113;
      expv[47] = 9'h099;
      expv[48] = 9'h02d;
      expv[49] = 9'h003;
      expv[50] = 9'h125;
      expv[51] = 9'h001;
      expv[52] = 9'h0cf;
      expv[53] = 9'h1fd;
      expv[54] = 9'h001;
      expv[55] = 9'h0a5;
      expv[56] = 9'h1ad;
      expv[57] = 9'h001;
      expv[58] = 9'h147;
      expv[59] = 9'h191;
      expv[60] = 9'h003;
      expv[61] = 9'h085;
      expv[62] = 9'h04b;
      expv[63] = 9'h000;
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
