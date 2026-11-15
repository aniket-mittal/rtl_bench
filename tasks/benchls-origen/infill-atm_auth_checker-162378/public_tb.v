// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162378 dut (
    .acc_number(in_vec[9:6]),
    .pin(in_vec[5:2]),
    .action(in_vec[1:1]),
    .deAuth(in_vec[0:0]),
    .wasSuccessful(out_vec[4:4]),
    .accIndex(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h23c;
    stim[1] = 10'h259;
    stim[2] = 10'h3c5;
    stim[3] = 10'h178;
    stim[4] = 10'h2c6;
    stim[5] = 10'h1d7;
    stim[6] = 10'h2b2;
    stim[7] = 10'h007;
    stim[8] = 10'h30c;
    stim[9] = 10'h0b1;
    stim[10] = 10'h2f9;
    stim[11] = 10'h1ed;
    stim[12] = 10'h33a;
    stim[13] = 10'h095;
    stim[14] = 10'h159;
    stim[15] = 10'h2be;
    stim[16] = 10'h122;
    stim[17] = 10'h22c;
    stim[18] = 10'h036;
    stim[19] = 10'h3d8;
    stim[20] = 10'h16c;
    stim[21] = 10'h15f;
    stim[22] = 10'h040;
    stim[23] = 10'h3ca;
    stim[24] = 10'h050;
    stim[25] = 10'h2ff;
    stim[26] = 10'h20d;
    stim[27] = 10'h09e;
    stim[28] = 10'h36b;
    stim[29] = 10'h2a4;
    stim[30] = 10'h117;
    stim[31] = 10'h020;
    stim[32] = 10'h09d;
    stim[33] = 10'h1c2;
    stim[34] = 10'h361;
    stim[35] = 10'h32d;
    stim[36] = 10'h044;
    stim[37] = 10'h001;
    stim[38] = 10'h3ef;
    stim[39] = 10'h27f;
    stim[40] = 10'h181;
    stim[41] = 10'h063;
    stim[42] = 10'h104;
    stim[43] = 10'h33b;
    stim[44] = 10'h062;
    stim[45] = 10'h09e;
    stim[46] = 10'h1db;
    stim[47] = 10'h2a9;
    stim[48] = 10'h121;
    stim[49] = 10'h0c7;
    stim[50] = 10'h28b;
    stim[51] = 10'h3d6;
    stim[52] = 10'h22b;
    stim[53] = 10'h19d;
    stim[54] = 10'h060;
    stim[55] = 10'h08d;
    stim[56] = 10'h17b;
    stim[57] = 10'h2a0;
    stim[58] = 10'h3a8;
    stim[59] = 10'h080;
    stim[60] = 10'h180;
    stim[61] = 10'h145;
    stim[62] = 10'h0d6;
    stim[63] = 10'h00a;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h03;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h11;
      expv[10] = 5'h00;
      expv[11] = 5'h13;
      expv[12] = 5'h00;
      expv[13] = 5'h11;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h02;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h10;
      expv[23] = 5'h00;
      expv[24] = 5'h10;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h01;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h02;
      expv[31] = 5'h00;
      expv[32] = 5'h11;
      expv[33] = 5'h03;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h10;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h12;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h01;
      expv[46] = 5'h03;
      expv[47] = 5'h00;
      expv[48] = 5'h12;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h10;
      expv[55] = 5'h11;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h11;
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
