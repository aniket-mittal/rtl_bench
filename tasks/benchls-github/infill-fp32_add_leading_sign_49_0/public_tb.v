// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  FP32_ADD_leading_sign_49_0 dut (
    .mantissa(in_vec[48:0]),
    .rtn(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0c2626b41c04e;
    stim[1] = 49'h0a0a5fb901bc8;
    stim[2] = 49'h1b9b154d70a2f;
    stim[3] = 49'h140419866c400;
    stim[4] = 49'h074260a3e19dd;
    stim[5] = 49'h1398e6658ff66;
    stim[6] = 49'h13d48b4a54fd1;
    stim[7] = 49'h02613125b837f;
    stim[8] = 49'h1171ba493f25f;
    stim[9] = 49'h1413f355a723e;
    stim[10] = 49'h181998a055023;
    stim[11] = 49'h1fc42d599d889;
    stim[12] = 49'h1f28c516037e5;
    stim[13] = 49'h045c9940ba739;
    stim[14] = 49'h068792cb4fe88;
    stim[15] = 49'h0c63febf46f7d;
    stim[16] = 49'h150e3d7b62af1;
    stim[17] = 49'h1439070b84350;
    stim[18] = 49'h0bef10690cf94;
    stim[19] = 49'h0a21071981ee5;
    stim[20] = 49'h0eaee0aa7d9a6;
    stim[21] = 49'h01232d47696d1;
    stim[22] = 49'h1389c95a67fe3;
    stim[23] = 49'h1bf7d62f1f710;
    stim[24] = 49'h19dc5f58d651c;
    stim[25] = 49'h09b2b1bde0749;
    stim[26] = 49'h15ffdc7ba5c00;
    stim[27] = 49'h0ad3093f21efa;
    stim[28] = 49'h19d9034c729f8;
    stim[29] = 49'h15d0666aee0f9;
    stim[30] = 49'h18c3c86025e34;
    stim[31] = 49'h1d88013f2557f;
    stim[32] = 49'h02585dab8d2ad;
    stim[33] = 49'h1c2ed17fe3668;
    stim[34] = 49'h1ae2b086bf036;
    stim[35] = 49'h0f3c47341b9eb;
    stim[36] = 49'h07a758a96016d;
    stim[37] = 49'h16483bf41d028;
    stim[38] = 49'h18376193fadee;
    stim[39] = 49'h132a9bd33855c;
    stim[40] = 49'h1184948b86996;
    stim[41] = 49'h0900f286f59a1;
    stim[42] = 49'h0f778ad8245cb;
    stim[43] = 49'h0e6e4d2b7cd95;
    stim[44] = 49'h0c774060c96c8;
    stim[45] = 49'h0a58dfec78c97;
    stim[46] = 49'h0055be7d718c1;
    stim[47] = 49'h0166ebf40a39a;
    stim[48] = 49'h1c1b11ad3a43c;
    stim[49] = 49'h0e0c8585c0459;
    stim[50] = 49'h084f6edd27c39;
    stim[51] = 49'h161fe72062844;
    stim[52] = 49'h1b4e2d92a3da2;
    stim[53] = 49'h1a6028235e18f;
    stim[54] = 49'h0128e8ef07a5f;
    stim[55] = 49'h1b70ea3823a8e;
    stim[56] = 49'h13fd5692e5619;
    stim[57] = 49'h0cfd2b2a33aab;
    stim[58] = 49'h0d1e51a85db9b;
    stim[59] = 49'h081ddfaaf911a;
    stim[60] = 49'h151bc87f54838;
    stim[61] = 49'h029076c3dcfd2;
    stim[62] = 49'h0e6533bf2c505;
    stim[63] = 49'h1841d19d834a0;
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
      expv[0] = 6'h01;
      expv[1] = 6'h01;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h02;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h03;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h02;
      expv[14] = 6'h02;
      expv[15] = 6'h01;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h01;
      expv[19] = 6'h01;
      expv[20] = 6'h01;
      expv[21] = 6'h04;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h01;
      expv[26] = 6'h00;
      expv[27] = 6'h01;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h03;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h01;
      expv[36] = 6'h02;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h01;
      expv[42] = 6'h01;
      expv[43] = 6'h01;
      expv[44] = 6'h01;
      expv[45] = 6'h01;
      expv[46] = 6'h06;
      expv[47] = 6'h04;
      expv[48] = 6'h00;
      expv[49] = 6'h01;
      expv[50] = 6'h01;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h04;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h01;
      expv[58] = 6'h01;
      expv[59] = 6'h01;
      expv[60] = 6'h00;
      expv[61] = 6'h03;
      expv[62] = 6'h01;
      expv[63] = 6'h00;
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
