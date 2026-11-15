// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10234 dut (
    .CLK(clk),
    .A(in_vec[63:48]),
    .B(in_vec[47:32]),
    .C(in_vec[31:16]),
    .D(in_vec[15:0]),
    .O(out_vec[32:1]),
    .CO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hd3bb02ab0066bbcd;
    stim[1] = 64'h3942123f38adf449;
    stim[2] = 64'hf4dbb0dc35e00c2a;
    stim[3] = 64'hb8d48d2702959c1f;
    stim[4] = 64'hcd4e7eb96a7e9703;
    stim[5] = 64'h2b864f1f5999fef1;
    stim[6] = 64'h3464c37afff085da;
    stim[7] = 64'hbce2014a04d7344e;
    stim[8] = 64'hb52aa19c1d9e87cd;
    stim[9] = 64'h3da6b923ce4cdf95;
    stim[10] = 64'hbe1531385d0d0ee3;
    stim[11] = 64'hd7b92b6b02d1ce3b;
    stim[12] = 64'hd9f4af8647353a05;
    stim[13] = 64'he205527d2840d42d;
    stim[14] = 64'h26923b6e97d53587;
    stim[15] = 64'h9b384a6b9f89183c;
    stim[16] = 64'h8754e870df17a9f8;
    stim[17] = 64'hd71cc7d6fd203d8e;
    stim[18] = 64'hfe65cc7489d4ebf0;
    stim[19] = 64'h0c75c7bfda5dddd2;
    stim[20] = 64'hf57e8e6d20508db1;
    stim[21] = 64'ha12dc6205b24e581;
    stim[22] = 64'h3c5e35ae0de3e586;
    stim[23] = 64'h354a5c848bd9dcf8;
    stim[24] = 64'hde4002edd9704b95;
    stim[25] = 64'h51d5a86fa95066ce;
    stim[26] = 64'he816d2fe93ae8475;
    stim[27] = 64'he3a0547a3cbba29c;
    stim[28] = 64'h9c5c84d569d04015;
    stim[29] = 64'h981825903dd3ea84;
    stim[30] = 64'hfca162b947bd7760;
    stim[31] = 64'hfbae2948dacc0a2f;
    stim[32] = 64'h72c712223b5c86b5;
    stim[33] = 64'hb32a268d5f678cc2;
    stim[34] = 64'hfd8998f327202b82;
    stim[35] = 64'h7d6474957cbb2a19;
    stim[36] = 64'haaa1126a943c59ff;
    stim[37] = 64'h1f89a00ff5110eea;
    stim[38] = 64'h665074e2a56010df;
    stim[39] = 64'hb791a516fbd2abdd;
    stim[40] = 64'h3f49ffa47a45fbe7;
    stim[41] = 64'h76306f4d857a26ee;
    stim[42] = 64'hc9a86afa68eef8d0;
    stim[43] = 64'h8c48d8d6ad839ed3;
    stim[44] = 64'hb972f8d6c39d3300;
    stim[45] = 64'h0e82f673fe1011f8;
    stim[46] = 64'h87ba4b90196bf7dd;
    stim[47] = 64'ha8f307ca6a7a2352;
    stim[48] = 64'h301f8cf91d10dd24;
    stim[49] = 64'h02fb23f63c43cae2;
    stim[50] = 64'h6d391ceb8a71bf87;
    stim[51] = 64'h26e99a8605d08cc2;
    stim[52] = 64'h94d60baef1a0e837;
    stim[53] = 64'h731df540548dfb12;
    stim[54] = 64'h1627f1760052138c;
    stim[55] = 64'hcb19c24bccd16751;
    stim[56] = 64'h80f5a8fffc74bff6;
    stim[57] = 64'h25f89eb250201128;
    stim[58] = 64'h5c2e28f6f67a5276;
    stim[59] = 64'he5f71bb9c07f3b14;
    stim[60] = 64'h27369c44a04a3035;
    stim[61] = 64'hfae1ebc170a4adcd;
    stim[62] = 64'hea70aaa0905f57f2;
    stim[63] = 64'h3c0f28204ea2f187;
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
      expv[0] = 33'h00000000x;
      expv[1] = 33'h00000000x;
      expv[2] = 33'h00000000x;
      expv[3] = 33'h00000000x;
      expv[4] = 33'h00000000x;
      expv[5] = 33'h00000000x;
      expv[6] = 33'h00000000x;
      expv[7] = 33'h00000000x;
      expv[8] = 33'h00000000x;
      expv[9] = 33'h00000000x;
      expv[10] = 33'h00000000x;
      expv[11] = 33'h00000000x;
      expv[12] = 33'h00000000x;
      expv[13] = 33'h00000000x;
      expv[14] = 33'h00000000x;
      expv[15] = 33'h00000000x;
      expv[16] = 33'h00000000x;
      expv[17] = 33'h00000000x;
      expv[18] = 33'h00000000x;
      expv[19] = 33'h00000000x;
      expv[20] = 33'h00000000x;
      expv[21] = 33'h00000000x;
      expv[22] = 33'h00000000x;
      expv[23] = 33'h00000000x;
      expv[24] = 33'h00000000x;
      expv[25] = 33'h00000000x;
      expv[26] = 33'h00000000x;
      expv[27] = 33'h00000000x;
      expv[28] = 33'h00000000x;
      expv[29] = 33'h00000000x;
      expv[30] = 33'h00000000x;
      expv[31] = 33'h00000000x;
      expv[32] = 33'h00000000x;
      expv[33] = 33'h00000000x;
      expv[34] = 33'h00000000x;
      expv[35] = 33'h00000000x;
      expv[36] = 33'h00000000x;
      expv[37] = 33'h00000000x;
      expv[38] = 33'h00000000x;
      expv[39] = 33'h00000000x;
      expv[40] = 33'h00000000x;
      expv[41] = 33'h00000000x;
      expv[42] = 33'h00000000x;
      expv[43] = 33'h00000000x;
      expv[44] = 33'h00000000x;
      expv[45] = 33'h00000000x;
      expv[46] = 33'h00000000x;
      expv[47] = 33'h00000000x;
      expv[48] = 33'h00000000x;
      expv[49] = 33'h00000000x;
      expv[50] = 33'h00000000x;
      expv[51] = 33'h00000000x;
      expv[52] = 33'h00000000x;
      expv[53] = 33'h00000000x;
      expv[54] = 33'h00000000x;
      expv[55] = 33'h00000000x;
      expv[56] = 33'h00000000x;
      expv[57] = 33'h00000000x;
      expv[58] = 33'h00000000x;
      expv[59] = 33'h00000000x;
      expv[60] = 33'h00000000x;
      expv[61] = 33'h00000000x;
      expv[62] = 33'h00000000x;
      expv[63] = 33'h00000000x;
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
