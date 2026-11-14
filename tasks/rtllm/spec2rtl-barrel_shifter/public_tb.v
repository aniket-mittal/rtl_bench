// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  barrel_shifter dut (
    .in(in_vec[10:3]),
    .ctrl(in_vec[2:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5da;
    stim[1] = 11'h24e;
    stim[2] = 11'h36a;
    stim[3] = 11'h69f;
    stim[4] = 11'h6c9;
    stim[5] = 11'h391;
    stim[6] = 11'h2a1;
    stim[7] = 11'h17e;
    stim[8] = 11'h2d1;
    stim[9] = 11'h0f8;
    stim[10] = 11'h649;
    stim[11] = 11'h545;
    stim[12] = 11'h720;
    stim[13] = 11'h15e;
    stim[14] = 11'h5f6;
    stim[15] = 11'h5bc;
    stim[16] = 11'h66e;
    stim[17] = 11'h681;
    stim[18] = 11'h140;
    stim[19] = 11'h657;
    stim[20] = 11'h197;
    stim[21] = 11'h189;
    stim[22] = 11'h1b3;
    stim[23] = 11'h2eb;
    stim[24] = 11'h6ae;
    stim[25] = 11'h26e;
    stim[26] = 11'h355;
    stim[27] = 11'h1ec;
    stim[28] = 11'h2c4;
    stim[29] = 11'h1c1;
    stim[30] = 11'h7e8;
    stim[31] = 11'h5ea;
    stim[32] = 11'h729;
    stim[33] = 11'h095;
    stim[34] = 11'h34c;
    stim[35] = 11'h4ba;
    stim[36] = 11'h70a;
    stim[37] = 11'h1b9;
    stim[38] = 11'h251;
    stim[39] = 11'h2af;
    stim[40] = 11'h0bd;
    stim[41] = 11'h27d;
    stim[42] = 11'h507;
    stim[43] = 11'h7ae;
    stim[44] = 11'h02f;
    stim[45] = 11'h608;
    stim[46] = 11'h661;
    stim[47] = 11'h5ef;
    stim[48] = 11'h53e;
    stim[49] = 11'h12f;
    stim[50] = 11'h0b5;
    stim[51] = 11'h63e;
    stim[52] = 11'h36a;
    stim[53] = 11'h312;
    stim[54] = 11'h395;
    stim[55] = 11'h607;
    stim[56] = 11'h1f9;
    stim[57] = 11'h32f;
    stim[58] = 11'h4f1;
    stim[59] = 11'h4e6;
    stim[60] = 11'h445;
    stim[61] = 11'h29d;
    stim[62] = 11'h1cd;
    stim[63] = 11'h030;
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
      expv[0] = 8'h2e;
      expv[1] = 8'h01;
      expv[2] = 8'h1b;
      expv[3] = 8'h01;
      expv[4] = 8'h6c;
      expv[5] = 8'h39;
      expv[6] = 8'h2a;
      expv[7] = 8'h00;
      expv[8] = 8'h2d;
      expv[9] = 8'h1f;
      expv[10] = 8'h64;
      expv[11] = 8'h05;
      expv[12] = 8'he4;
      expv[13] = 8'h00;
      expv[14] = 8'h02;
      expv[15] = 8'h0b;
      expv[16] = 8'h03;
      expv[17] = 8'h68;
      expv[18] = 8'h28;
      expv[19] = 8'h01;
      expv[20] = 8'h00;
      expv[21] = 8'h18;
      expv[22] = 8'h06;
      expv[23] = 8'h0b;
      expv[24] = 8'h03;
      expv[25] = 8'h01;
      expv[26] = 8'h03;
      expv[27] = 8'h03;
      expv[28] = 8'h05;
      expv[29] = 8'h1c;
      expv[30] = 8'hfd;
      expv[31] = 8'h2f;
      expv[32] = 8'h72;
      expv[33] = 8'h00;
      expv[34] = 8'h06;
      expv[35] = 8'h25;
      expv[36] = 8'h38;
      expv[37] = 8'h1b;
      expv[38] = 8'h25;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h02;
      expv[42] = 8'h01;
      expv[43] = 8'h03;
      expv[44] = 8'h00;
      expv[45] = 8'hc1;
      expv[46] = 8'h66;
      expv[47] = 8'h01;
      expv[48] = 8'h02;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h03;
      expv[52] = 8'h1b;
      expv[53] = 8'h18;
      expv[54] = 8'h03;
      expv[55] = 8'h01;
      expv[56] = 8'h1f;
      expv[57] = 8'h00;
      expv[58] = 8'h4f;
      expv[59] = 8'h02;
      expv[60] = 8'h04;
      expv[61] = 8'h02;
      expv[62] = 8'h01;
      expv[63] = 8'h06;
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
