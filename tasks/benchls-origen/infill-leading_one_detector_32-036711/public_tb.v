// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036711 dut (
    .S(in_vec[31:0]),
    .R(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7edab68a;
    stim[1] = 32'hee71fff9;
    stim[2] = 32'h8559d311;
    stim[3] = 32'h3ed8fe57;
    stim[4] = 32'ha383306a;
    stim[5] = 32'h33ab1178;
    stim[6] = 32'h757528de;
    stim[7] = 32'h3c926e68;
    stim[8] = 32'h269c364b;
    stim[9] = 32'hacd3b357;
    stim[10] = 32'h842ff23f;
    stim[11] = 32'h3c9a8a7d;
    stim[12] = 32'h1b522588;
    stim[13] = 32'h328f0de1;
    stim[14] = 32'h47976229;
    stim[15] = 32'h95563316;
    stim[16] = 32'h9cdb9f62;
    stim[17] = 32'hf118b132;
    stim[18] = 32'h329d5a76;
    stim[19] = 32'h7d1804d3;
    stim[20] = 32'h6a635ae3;
    stim[21] = 32'h1166ec56;
    stim[22] = 32'h15dbcd1f;
    stim[23] = 32'h0a376ce0;
    stim[24] = 32'h120dc462;
    stim[25] = 32'hf9334204;
    stim[26] = 32'h9b4e1ee0;
    stim[27] = 32'hf5b9af74;
    stim[28] = 32'h5c5de4db;
    stim[29] = 32'h7f21256e;
    stim[30] = 32'h1ec21dca;
    stim[31] = 32'h190ef824;
    stim[32] = 32'hf448d7ca;
    stim[33] = 32'h7f3deb1d;
    stim[34] = 32'h465a3981;
    stim[35] = 32'h4f38f908;
    stim[36] = 32'h8221b698;
    stim[37] = 32'he2f7898b;
    stim[38] = 32'hce59f2a7;
    stim[39] = 32'h2526982e;
    stim[40] = 32'h735b7d5c;
    stim[41] = 32'h8398f8b7;
    stim[42] = 32'he9d9095e;
    stim[43] = 32'hb56d8fe9;
    stim[44] = 32'h309a1630;
    stim[45] = 32'h1c57f183;
    stim[46] = 32'hb009b551;
    stim[47] = 32'h2efd59d2;
    stim[48] = 32'haa57c2fd;
    stim[49] = 32'h10b899f5;
    stim[50] = 32'hafb4d498;
    stim[51] = 32'hb353ee36;
    stim[52] = 32'h99358190;
    stim[53] = 32'h0e5e7094;
    stim[54] = 32'h09ef457c;
    stim[55] = 32'h57051a0b;
    stim[56] = 32'h9e2ef4e0;
    stim[57] = 32'hb30b05c3;
    stim[58] = 32'h74cbc769;
    stim[59] = 32'h3806a672;
    stim[60] = 32'hf831da5a;
    stim[61] = 32'hc87bb26e;
    stim[62] = 32'h62844c95;
    stim[63] = 32'hb77a85fb;
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
      expv[0] = 5'h1e;
      expv[1] = 5'h1f;
      expv[2] = 5'h1f;
      expv[3] = 5'h1d;
      expv[4] = 5'h1f;
      expv[5] = 5'h1d;
      expv[6] = 5'h1e;
      expv[7] = 5'h1d;
      expv[8] = 5'h1d;
      expv[9] = 5'h1f;
      expv[10] = 5'h1f;
      expv[11] = 5'h1d;
      expv[12] = 5'h1c;
      expv[13] = 5'h1d;
      expv[14] = 5'h1e;
      expv[15] = 5'h1f;
      expv[16] = 5'h1f;
      expv[17] = 5'h1f;
      expv[18] = 5'h1d;
      expv[19] = 5'h1e;
      expv[20] = 5'h1e;
      expv[21] = 5'h1c;
      expv[22] = 5'h1c;
      expv[23] = 5'h1b;
      expv[24] = 5'h1c;
      expv[25] = 5'h1f;
      expv[26] = 5'h1f;
      expv[27] = 5'h1f;
      expv[28] = 5'h1e;
      expv[29] = 5'h1e;
      expv[30] = 5'h1c;
      expv[31] = 5'h1c;
      expv[32] = 5'h1f;
      expv[33] = 5'h1e;
      expv[34] = 5'h1e;
      expv[35] = 5'h1e;
      expv[36] = 5'h1f;
      expv[37] = 5'h1f;
      expv[38] = 5'h1f;
      expv[39] = 5'h1d;
      expv[40] = 5'h1e;
      expv[41] = 5'h1f;
      expv[42] = 5'h1f;
      expv[43] = 5'h1f;
      expv[44] = 5'h1d;
      expv[45] = 5'h1c;
      expv[46] = 5'h1f;
      expv[47] = 5'h1d;
      expv[48] = 5'h1f;
      expv[49] = 5'h1c;
      expv[50] = 5'h1f;
      expv[51] = 5'h1f;
      expv[52] = 5'h1f;
      expv[53] = 5'h1b;
      expv[54] = 5'h1b;
      expv[55] = 5'h1e;
      expv[56] = 5'h1f;
      expv[57] = 5'h1f;
      expv[58] = 5'h1e;
      expv[59] = 5'h1d;
      expv[60] = 5'h1f;
      expv[61] = 5'h1f;
      expv[62] = 5'h1e;
      expv[63] = 5'h1f;
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
