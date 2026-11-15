// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068461 dut (
    .io_clk(clk),
    .io_push_valid(in_vec[36:36]),
    .io_push_payload_error(in_vec[35:35]),
    .io_push_payload_inst(in_vec[34:3]),
    .io_pop_ready(in_vec[2:2]),
    .io_flush(in_vec[1:1]),
    .resetCtrl_systemReset(in_vec[0:0]),
    .io_push_ready(out_vec[35:35]),
    .io_pop_valid(out_vec[34:34]),
    .io_pop_payload_error(out_vec[33:33]),
    .io_pop_payload_inst(out_vec[32:1]),
    .io_occupancy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h17f177d70f;
    stim[1] = 37'h1021917b8b;
    stim[2] = 37'h1345d5a316;
    stim[3] = 37'h0adebd3652;
    stim[4] = 37'h009b36d5a0;
    stim[5] = 37'h1e33edfb40;
    stim[6] = 37'h1ddb1db7ba;
    stim[7] = 37'h0b930cf182;
    stim[8] = 37'h1d2164b2a4;
    stim[9] = 37'h06473e81f8;
    stim[10] = 37'h193e7dc65e;
    stim[11] = 37'h195fc76578;
    stim[12] = 37'h07fb8b5844;
    stim[13] = 37'h06e932a1be;
    stim[14] = 37'h064db704aa;
    stim[15] = 37'h1f3f903a78;
    stim[16] = 37'h07404c42e4;
    stim[17] = 37'h12c7e71778;
    stim[18] = 37'h00aba49a82;
    stim[19] = 37'h01c2444f66;
    stim[20] = 37'h049771354e;
    stim[21] = 37'h1641bba7e4;
    stim[22] = 37'h086b8d8296;
    stim[23] = 37'h04e5f1ca38;
    stim[24] = 37'h0e4a6a7d18;
    stim[25] = 37'h1837d583fe;
    stim[26] = 37'h10ae0978a8;
    stim[27] = 37'h12798db6ba;
    stim[28] = 37'h09f462a3e6;
    stim[29] = 37'h140606b256;
    stim[30] = 37'h122a45675e;
    stim[31] = 37'h1df56fb7f4;
    stim[32] = 37'h0bbfe98a46;
    stim[33] = 37'h18cb2b054c;
    stim[34] = 37'h11b162820c;
    stim[35] = 37'h00aa092b60;
    stim[36] = 37'h0cbeee7964;
    stim[37] = 37'h192c6d47f6;
    stim[38] = 37'h1558c05964;
    stim[39] = 37'h1a2796420a;
    stim[40] = 37'h09588776c0;
    stim[41] = 37'h15aaf9442c;
    stim[42] = 37'h0c6fee2906;
    stim[43] = 37'h069e77f16c;
    stim[44] = 37'h1c93c78320;
    stim[45] = 37'h0cb8a2ce66;
    stim[46] = 37'h088d8c6a94;
    stim[47] = 37'h139894b40e;
    stim[48] = 37'h000e771920;
    stim[49] = 37'h1825217b1a;
    stim[50] = 37'h07ccea277a;
    stim[51] = 37'h0f48b8f7e8;
    stim[52] = 37'h06760fd55a;
    stim[53] = 37'h1e9da00dea;
    stim[54] = 37'h112146482a;
    stim[55] = 37'h18dfaf0a34;
    stim[56] = 37'h0c431f2f7e;
    stim[57] = 37'h05aa28ea24;
    stim[58] = 37'h1e033abfcc;
    stim[59] = 37'h1a7ead4934;
    stim[60] = 37'h0cf6b8dc4a;
    stim[61] = 37'h13ffe5a31a;
    stim[62] = 37'h0046d472f4;
    stim[63] = 37'h15aea8456a;
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
      expv[0] = 36'hdfc5df5c2;
      expv[1] = 36'hc08645ee2;
      expv[2] = 36'hcd17568c4;
      expv[3] = 36'hab7af4d94;
      expv[4] = 36'h826cdb568;
      expv[5] = 36'hf8cfb7ed0;
      expv[6] = 36'h78cfb7ed1;
      expv[7] = 36'hae4c33c60;
      expv[8] = 36'hf48592ca8;
      expv[9] = 36'h991cfa07e;
      expv[10] = 36'he4f9f7196;
      expv[11] = 36'he57f1d95e;
      expv[12] = 36'h657f1d95f;
      expv[13] = 36'h9ba4ca86e;
      expv[14] = 36'h9936dc12a;
      expv[15] = 36'hfcfe40e9e;
      expv[16] = 36'h7cfe40e9f;
      expv[17] = 36'hcb1f9c5de;
      expv[18] = 36'h4b1f9c5df;
      expv[19] = 36'h8709113d8;
      expv[20] = 36'h925dc4d52;
      expv[21] = 36'hd906ee9f8;
      expv[22] = 36'ha1ae360a4;
      expv[23] = 36'h9397c728e;
      expv[24] = 36'hb929a9f46;
      expv[25] = 36'he0df560fe;
      expv[26] = 36'hc2b825e2a;
      expv[27] = 36'h42b825e2b;
      expv[28] = 36'ha7d18a8f8;
      expv[29] = 36'hd0181ac94;
      expv[30] = 36'hc8a9159d6;
      expv[31] = 36'hf7d5bedfc;
      expv[32] = 36'haeffa6290;
      expv[33] = 36'he32cac152;
      expv[34] = 36'hc6c58a082;
      expv[35] = 36'h82a824ad8;
      expv[36] = 36'hb2fbb9e58;
      expv[37] = 36'he4b1b51fc;
      expv[38] = 36'hd56301658;
      expv[39] = 36'he89e59082;
      expv[40] = 36'ha5621ddb0;
      expv[41] = 36'hd6abe510a;
      expv[42] = 36'hb1bfb8a40;
      expv[43] = 36'h9a79dfc5a;
      expv[44] = 36'hf24f1e0c8;
      expv[45] = 36'h724f1e0c9;
      expv[46] = 36'ha23631aa4;
      expv[47] = 36'hce6252d02;
      expv[48] = 36'h8039dc648;
      expv[49] = 36'he09485ec6;
      expv[50] = 36'h9f33a89de;
      expv[51] = 36'hbd22e3dfa;
      expv[52] = 36'h99d83f556;
      expv[53] = 36'hfa768037a;
      expv[54] = 36'hc4851920a;
      expv[55] = 36'he37ebc28c;
      expv[56] = 36'hb10c7cbde;
      expv[57] = 36'h96a8a3a88;
      expv[58] = 36'hf80ceaff2;
      expv[59] = 36'he9fab524c;
      expv[60] = 36'hb3dae3712;
      expv[61] = 36'hcfff968c6;
      expv[62] = 36'h811b51cbc;
      expv[63] = 36'hd6baa115a;
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
