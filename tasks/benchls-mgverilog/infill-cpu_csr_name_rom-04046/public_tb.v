// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04046 dut (
    .r(in_vec[4:0]),
    .str(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h15;
    stim[1] = 5'h1a;
    stim[2] = 5'h07;
    stim[3] = 5'h0d;
    stim[4] = 5'h15;
    stim[5] = 5'h07;
    stim[6] = 5'h0f;
    stim[7] = 5'h16;
    stim[8] = 5'h1c;
    stim[9] = 5'h12;
    stim[10] = 5'h0c;
    stim[11] = 5'h14;
    stim[12] = 5'h0e;
    stim[13] = 5'h1b;
    stim[14] = 5'h1e;
    stim[15] = 5'h04;
    stim[16] = 5'h0f;
    stim[17] = 5'h14;
    stim[18] = 5'h16;
    stim[19] = 5'h12;
    stim[20] = 5'h05;
    stim[21] = 5'h19;
    stim[22] = 5'h02;
    stim[23] = 5'h0d;
    stim[24] = 5'h12;
    stim[25] = 5'h1b;
    stim[26] = 5'h0e;
    stim[27] = 5'h0e;
    stim[28] = 5'h12;
    stim[29] = 5'h0f;
    stim[30] = 5'h17;
    stim[31] = 5'h06;
    stim[32] = 5'h11;
    stim[33] = 5'h0b;
    stim[34] = 5'h0d;
    stim[35] = 5'h07;
    stim[36] = 5'h10;
    stim[37] = 5'h14;
    stim[38] = 5'h19;
    stim[39] = 5'h13;
    stim[40] = 5'h16;
    stim[41] = 5'h08;
    stim[42] = 5'h16;
    stim[43] = 5'h0b;
    stim[44] = 5'h16;
    stim[45] = 5'h04;
    stim[46] = 5'h1a;
    stim[47] = 5'h14;
    stim[48] = 5'h01;
    stim[49] = 5'h06;
    stim[50] = 5'h11;
    stim[51] = 5'h1e;
    stim[52] = 5'h0b;
    stim[53] = 5'h17;
    stim[54] = 5'h10;
    stim[55] = 5'h0a;
    stim[56] = 5'h1c;
    stim[57] = 5'h1f;
    stim[58] = 5'h1c;
    stim[59] = 5'h14;
    stim[60] = 5'h10;
    stim[61] = 5'h02;
    stim[62] = 5'h18;
    stim[63] = 5'h1f;
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
      expv[0] = 64'h00000000003f3f3f;
      expv[1] = 64'h00000000003f3f3f;
      expv[2] = 64'h0000002070746272;
      expv[3] = 64'h0000000000206b31;
      expv[4] = 64'h00000000003f3f3f;
      expv[5] = 64'h0000002070746272;
      expv[6] = 64'h00000000003f3f3f;
      expv[7] = 64'h00000000003f3f3f;
      expv[8] = 64'h00000000003f3f3f;
      expv[9] = 64'h00000000003f3f3f;
      expv[10] = 64'h0000000000206b30;
      expv[11] = 64'h00000000003f3f3f;
      expv[12] = 64'h00000000003f3f3f;
      expv[13] = 64'h00000000003f3f3f;
      expv[14] = 64'h0020746f686f7374;
      expv[15] = 64'h000020636f756e74;
      expv[16] = 64'h00000000003f3f3f;
      expv[17] = 64'h00000000003f3f3f;
      expv[18] = 64'h00000000003f3f3f;
      expv[19] = 64'h00000000003f3f3f;
      expv[20] = 64'h20636f6d70617265;
      expv[21] = 64'h00000000003f3f3f;
      expv[22] = 64'h6261647661646472;
      expv[23] = 64'h0000000000206b31;
      expv[24] = 64'h00000000003f3f3f;
      expv[25] = 64'h00000000003f3f3f;
      expv[26] = 64'h00000000003f3f3f;
      expv[27] = 64'h00000000003f3f3f;
      expv[28] = 64'h00000000003f3f3f;
      expv[29] = 64'h00000000003f3f3f;
      expv[30] = 64'h00000000003f3f3f;
      expv[31] = 64'h0000206361757365;
      expv[32] = 64'h00000000003f3f3f;
      expv[33] = 64'h00000000003f3f3f;
      expv[34] = 64'h0000000000206b31;
      expv[35] = 64'h0000002070746272;
      expv[36] = 64'h00000000003f3f3f;
      expv[37] = 64'h00000000003f3f3f;
      expv[38] = 64'h00000000003f3f3f;
      expv[39] = 64'h00000000003f3f3f;
      expv[40] = 64'h00000000003f3f3f;
      expv[41] = 64'h00000000003f3f3f;
      expv[42] = 64'h00000000003f3f3f;
      expv[43] = 64'h00000000003f3f3f;
      expv[44] = 64'h00000000003f3f3f;
      expv[45] = 64'h000020636f756e74;
      expv[46] = 64'h00000000003f3f3f;
      expv[47] = 64'h00000000003f3f3f;
      expv[48] = 64'h0000000020657063;
      expv[49] = 64'h0000206361757365;
      expv[50] = 64'h00000000003f3f3f;
      expv[51] = 64'h0020746f686f7374;
      expv[52] = 64'h00000000003f3f3f;
      expv[53] = 64'h00000000003f3f3f;
      expv[54] = 64'h00000000003f3f3f;
      expv[55] = 64'h00000000003f3f3f;
      expv[56] = 64'h00000000003f3f3f;
      expv[57] = 64'h66726f6d686f7374;
      expv[58] = 64'h00000000003f3f3f;
      expv[59] = 64'h00000000003f3f3f;
      expv[60] = 64'h00000000003f3f3f;
      expv[61] = 64'h6261647661646472;
      expv[62] = 64'h00000000003f3f3f;
      expv[63] = 64'h66726f6d686f7374;
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
