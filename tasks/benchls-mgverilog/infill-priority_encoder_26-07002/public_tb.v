// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07002 dut (
    .Data_Dec_i(in_vec[25:0]),
    .Data_Bin_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2e47ce9;
    stim[1] = 26'h2711ad7;
    stim[2] = 26'h3a8fd0b;
    stim[3] = 26'h16193a5;
    stim[4] = 26'h2b73605;
    stim[5] = 26'h2199740;
    stim[6] = 26'h032154b;
    stim[7] = 26'h10a8073;
    stim[8] = 26'h1f12a18;
    stim[9] = 26'h31acdb3;
    stim[10] = 26'h15a756b;
    stim[11] = 26'h33f8edc;
    stim[12] = 26'h002ddc3;
    stim[13] = 26'h2d4989e;
    stim[14] = 26'h0c32dec;
    stim[15] = 26'h1eacc29;
    stim[16] = 26'h3b0afa1;
    stim[17] = 26'h2c9efed;
    stim[18] = 26'h113aa62;
    stim[19] = 26'h3f7a0b5;
    stim[20] = 26'h1a59378;
    stim[21] = 26'h3875b7e;
    stim[22] = 26'h234b15f;
    stim[23] = 26'h35bfaf2;
    stim[24] = 26'h1b7990b;
    stim[25] = 26'h06ba62d;
    stim[26] = 26'h2ebdd40;
    stim[27] = 26'h30a0bee;
    stim[28] = 26'h14fe012;
    stim[29] = 26'h2827513;
    stim[30] = 26'h35512a9;
    stim[31] = 26'h30dc87d;
    stim[32] = 26'h2df2952;
    stim[33] = 26'h19e56cc;
    stim[34] = 26'h31d9a96;
    stim[35] = 26'h38f32f9;
    stim[36] = 26'h11e4e23;
    stim[37] = 26'h3a32427;
    stim[38] = 26'h152b86c;
    stim[39] = 26'h0a98093;
    stim[40] = 26'h24e149b;
    stim[41] = 26'h14f1e81;
    stim[42] = 26'h02b65ff;
    stim[43] = 26'h3d53a8b;
    stim[44] = 26'h260cbcc;
    stim[45] = 26'h0e7a503;
    stim[46] = 26'h1ee4649;
    stim[47] = 26'h0522eec;
    stim[48] = 26'h3bf3a88;
    stim[49] = 26'h3466dd8;
    stim[50] = 26'h30bb369;
    stim[51] = 26'h26779f7;
    stim[52] = 26'h3d826c3;
    stim[53] = 26'h25166ac;
    stim[54] = 26'h1fbe9f3;
    stim[55] = 26'h0cb0291;
    stim[56] = 26'h25b3c6f;
    stim[57] = 26'h054cef8;
    stim[58] = 26'h1c35163;
    stim[59] = 26'h1373459;
    stim[60] = 26'h0b147b3;
    stim[61] = 26'h19385aa;
    stim[62] = 26'h19834af;
    stim[63] = 26'h26ef715;
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
      expv[0] = 5'h01;
      expv[1] = 5'h01;
      expv[2] = 5'h03;
      expv[3] = 5'h00;
      expv[4] = 5'h01;
      expv[5] = 5'h01;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h02;
      expv[10] = 5'h00;
      expv[11] = 5'h02;
      expv[12] = 5'h00;
      expv[13] = 5'h01;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h03;
      expv[17] = 5'h01;
      expv[18] = 5'h00;
      expv[19] = 5'h06;
      expv[20] = 5'h00;
      expv[21] = 5'h03;
      expv[22] = 5'h01;
      expv[23] = 5'h02;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h01;
      expv[27] = 5'h02;
      expv[28] = 5'h00;
      expv[29] = 5'h01;
      expv[30] = 5'h02;
      expv[31] = 5'h02;
      expv[32] = 5'h01;
      expv[33] = 5'h00;
      expv[34] = 5'h02;
      expv[35] = 5'h03;
      expv[36] = 5'h00;
      expv[37] = 5'h03;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h01;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h04;
      expv[44] = 5'h01;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h03;
      expv[49] = 5'h02;
      expv[50] = 5'h02;
      expv[51] = 5'h01;
      expv[52] = 5'h04;
      expv[53] = 5'h01;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h01;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
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
