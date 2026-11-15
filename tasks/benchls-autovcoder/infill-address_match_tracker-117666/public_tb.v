// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117666 dut (
    .clk(clk),
    .rst(in_vec[37:37]),
    .except(in_vec[36:36]),
    .except_thread(in_vec[35:35]),
    .new_addr(in_vec[34:24]),
    .new_thread(in_vec[23:23]),
    .new_en(in_vec[22:22]),
    .chk_addr0(in_vec[21:11]),
    .chk_addr1(in_vec[10:0]),
    .chk_match0(out_vec[2:2]),
    .chk_match1(out_vec[1:1]),
    .free(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h213bc95ec4;
    stim[1] = 38'h21cc59816b;
    stim[2] = 38'h1121285d00;
    stim[3] = 38'h0baadb3c3e;
    stim[4] = 38'h1ce2f931ec;
    stim[5] = 38'h0cf4c8e1b3;
    stim[6] = 38'h059ec3b974;
    stim[7] = 38'h028a95e1df;
    stim[8] = 38'h0045664ba5;
    stim[9] = 38'h1b978ef034;
    stim[10] = 38'h00f335266e;
    stim[11] = 38'h16b2a51fbb;
    stim[12] = 38'h11576b7925;
    stim[13] = 38'h03e73d1db1;
    stim[14] = 38'h1e585cc689;
    stim[15] = 38'h0ee5282026;
    stim[16] = 38'h146ce9c654;
    stim[17] = 38'h0e1ae693b0;
    stim[18] = 38'h1456f1de54;
    stim[19] = 38'h16b3d744be;
    stim[20] = 38'h097473fb3a;
    stim[21] = 38'h0e13b7f445;
    stim[22] = 38'h019f6bbf6a;
    stim[23] = 38'h1b8d262dad;
    stim[24] = 38'h15edb4c7b4;
    stim[25] = 38'h1f2a0429cf;
    stim[26] = 38'h1627fb6584;
    stim[27] = 38'h051d6308f4;
    stim[28] = 38'h0949e89b3c;
    stim[29] = 38'h0c46354c09;
    stim[30] = 38'h0f05d9841a;
    stim[31] = 38'h1b83d754cb;
    stim[32] = 38'h149c8df94e;
    stim[33] = 38'h11271b968b;
    stim[34] = 38'h0cc79eb0dc;
    stim[35] = 38'h0a289da324;
    stim[36] = 38'h1fd74708fc;
    stim[37] = 38'h198dcc87b9;
    stim[38] = 38'h080e9ad320;
    stim[39] = 38'h19671ec218;
    stim[40] = 38'h06e814935d;
    stim[41] = 38'h09d0c824a3;
    stim[42] = 38'h1b58201df7;
    stim[43] = 38'h0a32dc92b5;
    stim[44] = 38'h125873ca31;
    stim[45] = 38'h080d5206db;
    stim[46] = 38'h0819ef39a2;
    stim[47] = 38'h17a83440d3;
    stim[48] = 38'h0d581ddd76;
    stim[49] = 38'h1fc27957c3;
    stim[50] = 38'h1b7ace2748;
    stim[51] = 38'h11b7354db1;
    stim[52] = 38'h0ec91d2cc2;
    stim[53] = 38'h05b484a34b;
    stim[54] = 38'h19d3c0fc23;
    stim[55] = 38'h0dbe619ef3;
    stim[56] = 38'h0a368de7fb;
    stim[57] = 38'h000851fa61;
    stim[58] = 38'h0589b1eae2;
    stim[59] = 38'h0f807fc8ad;
    stim[60] = 38'h0c00a36d97;
    stim[61] = 38'h0eb32ce1a1;
    stim[62] = 38'h19ebb7359a;
    stim[63] = 38'h1af3fce9bf;
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
      expv[0] = 3'hx;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h1;
      expv[4] = 3'h0;
      expv[5] = 3'h1;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h1;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h1;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h0;
      expv[43] = 3'h1;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h1;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h1;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
