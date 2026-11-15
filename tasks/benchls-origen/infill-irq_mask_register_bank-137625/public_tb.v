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

  origen_137625 dut (
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
    stim[0] = 38'h251b277641;
    stim[1] = 38'h2444addf4e;
    stim[2] = 38'h1612b56573;
    stim[3] = 38'h1a40448b1f;
    stim[4] = 38'h361c10ee06;
    stim[5] = 38'h1ee9fb747d;
    stim[6] = 38'h0a9a772eb4;
    stim[7] = 38'h0bea1d2db5;
    stim[8] = 38'h0eecd1baf1;
    stim[9] = 38'h3662eadf43;
    stim[10] = 38'h023ee41bbf;
    stim[11] = 38'h2207799b27;
    stim[12] = 38'h3b4cdf4796;
    stim[13] = 38'h07310f3c21;
    stim[14] = 38'h2f778a14c2;
    stim[15] = 38'h2a1d763e99;
    stim[16] = 38'h3b3ddb68b1;
    stim[17] = 38'h1e89cf9b27;
    stim[18] = 38'h362c3bef70;
    stim[19] = 38'h1b05a9786c;
    stim[20] = 38'h0fc3a6a97a;
    stim[21] = 38'h3a398021da;
    stim[22] = 38'h26c97ec261;
    stim[23] = 38'h1f5b5794e9;
    stim[24] = 38'h0bdb4c513b;
    stim[25] = 38'h03a9dd3fbc;
    stim[26] = 38'h06a47fa7e4;
    stim[27] = 38'h3f18867bc6;
    stim[28] = 38'h2a90ba3eb7;
    stim[29] = 38'h2bf77a886f;
    stim[30] = 38'h3a826dc420;
    stim[31] = 38'h2314875335;
    stim[32] = 38'h0ec9767015;
    stim[33] = 38'h37a6635a20;
    stim[34] = 38'h1e25589b00;
    stim[35] = 38'h06698f87dc;
    stim[36] = 38'h2bc4721e78;
    stim[37] = 38'h265751dac3;
    stim[38] = 38'h126ba06391;
    stim[39] = 38'h1aad7f9470;
    stim[40] = 38'h1fca455d6f;
    stim[41] = 38'h3f3eb042b5;
    stim[42] = 38'h27628ce677;
    stim[43] = 38'h33db9b5f2c;
    stim[44] = 38'h3ac3beefd4;
    stim[45] = 38'h26c840e631;
    stim[46] = 38'h0b8244509a;
    stim[47] = 38'h1f93d06b19;
    stim[48] = 38'h3fd39b62b8;
    stim[49] = 38'h0b2c1cc875;
    stim[50] = 38'h0a78235d2e;
    stim[51] = 38'h13ce63402b;
    stim[52] = 38'h137466fda7;
    stim[53] = 38'h2ef1a16868;
    stim[54] = 38'h16d7eb61cf;
    stim[55] = 38'h1377ba6512;
    stim[56] = 38'h0f58022c2d;
    stim[57] = 38'h176ec178e0;
    stim[58] = 38'h3ecadf22a4;
    stim[59] = 38'h0e73f30337;
    stim[60] = 38'h0bd3e44f06;
    stim[61] = 38'h06103f6b47;
    stim[62] = 38'h224da64528;
    stim[63] = 38'h028cefc4ef;
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
      expv[7] = 33'h000000000;
      expv[8] = 33'h09a772eb4;
      expv[9] = 33'h09a772eb4;
      expv[10] = 33'h09a772eb4;
      expv[11] = 33'h09a772eb4;
      expv[12] = 33'h09a772eb4;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h089cf9b27;
      expv[21] = 33'h0ecd1baf1;
      expv[22] = 33'h0ecd1baf1;
      expv[23] = 33'h0ecd1baf1;
      expv[24] = 33'h189cf9b27;
      expv[25] = 33'h0ecd1baf1;
      expv[26] = 33'h0ecd1baf1;
      expv[27] = 33'h0ecd1baf1;
      expv[28] = 33'h10000000a;
      expv[29] = 33'h00000000a;
      expv[30] = 33'h090ba3eb7;
      expv[31] = 33'h090ba3eb7;
      expv[32] = 33'h090ba3eb7;
      expv[33] = 33'h090ba3eb7;
      expv[34] = 33'h090ba3eb7;
      expv[35] = 33'h090ba3eb7;
      expv[36] = 33'h090ba3eb7;
      expv[37] = 33'h090ba3eb7;
      expv[38] = 33'h090ba3eb7;
      expv[39] = 33'h090ba3eb7;
      expv[40] = 33'h090ba3eb7;
      expv[41] = 33'h0ad7f9470;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h0c9767015;
      expv[48] = 33'h0ad7f9470;
      expv[49] = 33'h000000004;
      expv[50] = 33'h0c9767015;
      expv[51] = 33'h0c9767015;
      expv[52] = 33'h0c9767015;
      expv[53] = 33'h0c9767015;
      expv[54] = 33'h1c9767015;
      expv[55] = 33'h1c9767015;
      expv[56] = 33'h1c9767015;
      expv[57] = 33'h078235d2e;
      expv[58] = 33'h078235d2e;
      expv[59] = 33'h078235d2e;
      expv[60] = 33'h078235d2e;
      expv[61] = 33'h073f30337;
      expv[62] = 33'h073f30337;
      expv[63] = 33'h073f30337;
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
