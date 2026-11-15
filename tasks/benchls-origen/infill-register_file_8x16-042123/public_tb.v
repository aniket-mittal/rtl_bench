// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042123 dut (
    .clk(clk),
    .bus_in(in_vec[25:10]),
    .ld_reg(in_vec[9:9]),
    .dr(in_vec[8:6]),
    .sr1(in_vec[5:3]),
    .sr2(in_vec[2:0]),
    .sr1_out(out_vec[31:16]),
    .sr2_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h048401b;
    stim[1] = 26'h3bf456b;
    stim[2] = 26'h2e189aa;
    stim[3] = 26'h0494fd0;
    stim[4] = 26'h3a78a44;
    stim[5] = 26'h034ddc3;
    stim[6] = 26'h3d48037;
    stim[7] = 26'h0d86da8;
    stim[8] = 26'h2f88825;
    stim[9] = 26'h3ee9f58;
    stim[10] = 26'h2a3c7ae;
    stim[11] = 26'h22424a8;
    stim[12] = 26'h2125052;
    stim[13] = 26'h250ea96;
    stim[14] = 26'h1819c1f;
    stim[15] = 26'h35686cb;
    stim[16] = 26'h28daf01;
    stim[17] = 26'h37abedb;
    stim[18] = 26'h2e45b5a;
    stim[19] = 26'h09da57b;
    stim[20] = 26'h0973752;
    stim[21] = 26'h01a9cc3;
    stim[22] = 26'h0087565;
    stim[23] = 26'h1c44008;
    stim[24] = 26'h2b9ecc4;
    stim[25] = 26'h3b965de;
    stim[26] = 26'h16ebae6;
    stim[27] = 26'h18ae75f;
    stim[28] = 26'h16a8930;
    stim[29] = 26'h10ec0ee;
    stim[30] = 26'h00b6228;
    stim[31] = 26'h3c8aa84;
    stim[32] = 26'h392a7cf;
    stim[33] = 26'h128eb2a;
    stim[34] = 26'h3ca96d8;
    stim[35] = 26'h14edd9b;
    stim[36] = 26'h14931b5;
    stim[37] = 26'h25baf95;
    stim[38] = 26'h2d1b552;
    stim[39] = 26'h34b4901;
    stim[40] = 26'h1d4fce3;
    stim[41] = 26'h09e8933;
    stim[42] = 26'h2418a67;
    stim[43] = 26'h22dd102;
    stim[44] = 26'h1073c6b;
    stim[45] = 26'h32604e8;
    stim[46] = 26'h2b6f0f9;
    stim[47] = 26'h100a72e;
    stim[48] = 26'h3237e4c;
    stim[49] = 26'h2c667a2;
    stim[50] = 26'h3cd5dc4;
    stim[51] = 26'h0356b84;
    stim[52] = 26'h28bef1c;
    stim[53] = 26'h3e02e8b;
    stim[54] = 26'h089ced0;
    stim[55] = 26'h10a6ade;
    stim[56] = 26'h3f19df6;
    stim[57] = 26'h3b10b29;
    stim[58] = 26'h0c8b204;
    stim[59] = 26'h3d9d928;
    stim[60] = 26'h3ddf90c;
    stim[61] = 26'h1cbb2da;
    stim[62] = 26'h1b4ee14;
    stim[63] = 26'h1509984;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00001253;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'hfba70000;
      expv[11] = 32'hfba70000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h0000a8f1;
      expv[14] = 32'h00001253;
      expv[15] = 32'he9e20000;
      expv[16] = 32'h0000e9e2;
      expv[17] = 32'hd5a1d5a1;
      expv[18] = 32'hdeaf943a;
      expv[19] = 32'h1253deaf;
      expv[20] = 32'h943a943a;
      expv[21] = 32'h0000deaf;
      expv[22] = 32'ha36b25cd;
      expv[23] = 32'he9e20000;
      expv[24] = 32'h0000a36b;
      expv[25] = 32'hdeafa8f1;
      expv[26] = 32'ha36ba8f1;
      expv[27] = 32'h5bae1253;
      expv[28] = 32'ha8f10000;
      expv[29] = 32'h62b9a8f1;
      expv[30] = 32'h62b90000;
      expv[31] = 32'h02d8a36b;
      expv[32] = 32'he9e21253;
      expv[33] = 32'h62b9f22a;
      expv[34] = 32'h5bae02d8;
      expv[35] = 32'hf2a5f2a5;
      expv[36] = 32'ha8f162b9;
      expv[37] = 32'hf22a62b9;
      expv[38] = 32'hf22af22a;
      expv[39] = 32'h02d8e9e2;
      expv[40] = 32'h4a3af2a5;
      expv[41] = 32'h96ebf2a5;
      expv[42] = 32'h4a3ae4a9;
      expv[43] = 32'h02d8f22a;
      expv[44] = 32'h62b9f2a5;
      expv[45] = 32'h62b902d8;
      expv[46] = 32'he4a99062;
      expv[47] = 32'h62b996eb;
      expv[48] = 32'h90624029;
      expv[49] = 32'h4029f22a;
      expv[50] = 32'h02d84029;
      expv[51] = 32'h02d84029;
      expv[52] = 32'hf2a54029;
      expv[53] = 32'hc8dff2a5;
      expv[54] = 32'hf80b02d8;
      expv[55] = 32'h22730d5a;
      expv[56] = 32'h0d5a0d5a;
      expv[57] = 32'h62b9c8df;
      expv[58] = 32'h02d8ec42;
      expv[59] = 32'h62b9322c;
      expv[60] = 32'hc8dfec42;
      expv[61] = 32'h429af80b;
      expv[62] = 32'hf80bec42;
      expv[63] = 32'h6d3bec42;
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
