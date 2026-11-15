// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08148 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2cba1444af;
    stim[1] = 38'h3166b246ef;
    stim[2] = 38'h135df04665;
    stim[3] = 38'h02b3e3d63a;
    stim[4] = 38'h37c7ac8a3f;
    stim[5] = 38'h1c0a2cddea;
    stim[6] = 38'h07cfbf6e45;
    stim[7] = 38'h0289ceb541;
    stim[8] = 38'h02d337a9a6;
    stim[9] = 38'h0ec18192e3;
    stim[10] = 38'h03f6a84298;
    stim[11] = 38'h270b828909;
    stim[12] = 38'h3a02f655b3;
    stim[13] = 38'h1fa7403eca;
    stim[14] = 38'h3e2008a139;
    stim[15] = 38'h3e0c504a34;
    stim[16] = 38'h1f6c8f7c98;
    stim[17] = 38'h1e20f8f1ea;
    stim[18] = 38'h22795360af;
    stim[19] = 38'h3a4eaa5894;
    stim[20] = 38'h3b449ea188;
    stim[21] = 38'h3f973a5d38;
    stim[22] = 38'h2e102eea7d;
    stim[23] = 38'h1bf22d852f;
    stim[24] = 38'h1e4748a5cd;
    stim[25] = 38'h03873ffead;
    stim[26] = 38'h23d900f366;
    stim[27] = 38'h3e354a4c7f;
    stim[28] = 38'h0ea4474580;
    stim[29] = 38'h2f9fbde2a1;
    stim[30] = 38'h06447b527b;
    stim[31] = 38'h3bcfb7ac8a;
    stim[32] = 38'h077acb6a25;
    stim[33] = 38'h0f5e1988ca;
    stim[34] = 38'h0d367cff3a;
    stim[35] = 38'h06f76c12bf;
    stim[36] = 38'h3b82cc76dc;
    stim[37] = 38'h0bf165cda7;
    stim[38] = 38'h1b22b3e5bc;
    stim[39] = 38'h2e6c68091f;
    stim[40] = 38'h0b3e40d2b2;
    stim[41] = 38'h1e88ee0372;
    stim[42] = 38'h0ee685167b;
    stim[43] = 38'h176144df30;
    stim[44] = 38'h225517bec9;
    stim[45] = 38'h02a677ee27;
    stim[46] = 38'h1fa9136f16;
    stim[47] = 38'h2613eaf303;
    stim[48] = 38'h320357bd9e;
    stim[49] = 38'h33cc3281c7;
    stim[50] = 38'h1e275c7564;
    stim[51] = 38'h2e01b7c582;
    stim[52] = 38'h1605f3c8a7;
    stim[53] = 38'h2e0ab63b7a;
    stim[54] = 38'h16758ae7af;
    stim[55] = 38'h1afe90cf39;
    stim[56] = 38'h3effc50ddd;
    stim[57] = 38'h2f05c79cd6;
    stim[58] = 38'h1a98cc71ad;
    stim[59] = 38'h335244d8e6;
    stim[60] = 38'h07d99eaa41;
    stim[61] = 38'h326bd76f65;
    stim[62] = 38'h2278467762;
    stim[63] = 38'h2b48aea180;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000000;
      expv[33] = 33'h100000001;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000001;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000001;
      expv[49] = 33'h100000001;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000000;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
