// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03516 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .a(in_vec[9:5]),
    .b(in_vec[4:0]),
    .c(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h439;
    stim[1] = 11'h642;
    stim[2] = 11'h303;
    stim[3] = 11'h261;
    stim[4] = 11'h206;
    stim[5] = 11'h0f4;
    stim[6] = 11'h002;
    stim[7] = 11'h10b;
    stim[8] = 11'h110;
    stim[9] = 11'h0dc;
    stim[10] = 11'h3b1;
    stim[11] = 11'h143;
    stim[12] = 11'h20b;
    stim[13] = 11'h0ce;
    stim[14] = 11'h3fd;
    stim[15] = 11'h16e;
    stim[16] = 11'h01f;
    stim[17] = 11'h3c1;
    stim[18] = 11'h064;
    stim[19] = 11'h28e;
    stim[20] = 11'h184;
    stim[21] = 11'h13d;
    stim[22] = 11'h28b;
    stim[23] = 11'h18d;
    stim[24] = 11'h39c;
    stim[25] = 11'h345;
    stim[26] = 11'h36f;
    stim[27] = 11'h05a;
    stim[28] = 11'h0b3;
    stim[29] = 11'h225;
    stim[30] = 11'h06a;
    stim[31] = 11'h1b0;
    stim[32] = 11'h041;
    stim[33] = 11'h235;
    stim[34] = 11'h32d;
    stim[35] = 11'h09c;
    stim[36] = 11'h3a9;
    stim[37] = 11'h062;
    stim[38] = 11'h187;
    stim[39] = 11'h26a;
    stim[40] = 11'h2d9;
    stim[41] = 11'h361;
    stim[42] = 11'h0f2;
    stim[43] = 11'h349;
    stim[44] = 11'h39f;
    stim[45] = 11'h74a;
    stim[46] = 11'h22e;
    stim[47] = 11'h24a;
    stim[48] = 11'h089;
    stim[49] = 11'h02e;
    stim[50] = 11'h1ff;
    stim[51] = 11'h293;
    stim[52] = 11'h31a;
    stim[53] = 11'h0fc;
    stim[54] = 11'h19b;
    stim[55] = 11'h41b;
    stim[56] = 11'h1fb;
    stim[57] = 11'h26b;
    stim[58] = 11'h092;
    stim[59] = 11'h30f;
    stim[60] = 11'h12e;
    stim[61] = 11'h06d;
    stim[62] = 11'h2c1;
    stim[63] = 11'h0b4;
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
      expv[3] = 5'h03;
      expv[4] = 5'h01;
      expv[5] = 5'h06;
      expv[6] = 5'h07;
      expv[7] = 5'h00;
      expv[8] = 5'h08;
      expv[9] = 5'h08;
      expv[10] = 5'h06;
      expv[11] = 5'h11;
      expv[12] = 5'h03;
      expv[13] = 5'h0b;
      expv[14] = 5'h06;
      expv[15] = 5'h1d;
      expv[16] = 5'h0b;
      expv[17] = 5'h00;
      expv[18] = 5'h01;
      expv[19] = 5'h03;
      expv[20] = 5'h0e;
      expv[21] = 5'h04;
      expv[22] = 5'h09;
      expv[23] = 5'h0b;
      expv[24] = 5'h0c;
      expv[25] = 5'h1c;
      expv[26] = 5'h05;
      expv[27] = 5'h0f;
      expv[28] = 5'h02;
      expv[29] = 5'h05;
      expv[30] = 5'h05;
      expv[31] = 5'h03;
      expv[32] = 5'h0d;
      expv[33] = 5'h01;
      expv[34] = 5'h11;
      expv[35] = 5'h0d;
      expv[36] = 5'h04;
      expv[37] = 5'h09;
      expv[38] = 5'h02;
      expv[39] = 5'h07;
      expv[40] = 5'h0a;
      expv[41] = 5'h16;
      expv[42] = 5'h01;
      expv[43] = 5'h07;
      expv[44] = 5'h09;
      expv[45] = 5'h1c;
      expv[46] = 5'h00;
      expv[47] = 5'h0e;
      expv[48] = 5'h0a;
      expv[49] = 5'h04;
      expv[50] = 5'h01;
      expv[51] = 5'h0f;
      expv[52] = 5'h13;
      expv[53] = 5'h18;
      expv[54] = 5'h07;
      expv[55] = 5'h0c;
      expv[56] = 5'h00;
      expv[57] = 5'h0f;
      expv[58] = 5'h0b;
      expv[59] = 5'h04;
      expv[60] = 5'h0f;
      expv[61] = 5'h09;
      expv[62] = 5'h03;
      expv[63] = 5'h01;
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
