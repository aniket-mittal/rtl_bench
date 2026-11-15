// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04113 dut (
    .CLK(clk),
    .CE(in_vec[33:33]),
    .process_input(in_vec[32:0]),
    .process_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h058dea971;
    stim[1] = 34'h30fc2d777;
    stim[2] = 34'h2be1f4dd1;
    stim[3] = 34'h285343be5;
    stim[4] = 34'h273d2e0ce;
    stim[5] = 34'h231b10889;
    stim[6] = 34'h34e145d0b;
    stim[7] = 34'h1e164fdb4;
    stim[8] = 34'h3d1d61ea0;
    stim[9] = 34'h3f49c47b1;
    stim[10] = 34'h1efc11c4b;
    stim[11] = 34'h2736a3f96;
    stim[12] = 34'h2b57c7ec4;
    stim[13] = 34'h0a8179b31;
    stim[14] = 34'h1833f5c4c;
    stim[15] = 34'h15f4223ab;
    stim[16] = 34'h05c52ba54;
    stim[17] = 34'h09ef1a2d5;
    stim[18] = 34'h0072232a2;
    stim[19] = 34'h194a169fb;
    stim[20] = 34'h0172ab4b5;
    stim[21] = 34'h333b85088;
    stim[22] = 34'h2e812e3a4;
    stim[23] = 34'h2882ce22b;
    stim[24] = 34'h19dd41e02;
    stim[25] = 34'h067627871;
    stim[26] = 34'h005b94175;
    stim[27] = 34'h3057194b7;
    stim[28] = 34'h0cd49739a;
    stim[29] = 34'h231e724aa;
    stim[30] = 34'h292457fd7;
    stim[31] = 34'h38b97502c;
    stim[32] = 34'h0d55d94b2;
    stim[33] = 34'h0ac01f0fd;
    stim[34] = 34'h29ddf4532;
    stim[35] = 34'h3a17a6fcd;
    stim[36] = 34'h2b04ed5bf;
    stim[37] = 34'h3e36c85a4;
    stim[38] = 34'h1247f6937;
    stim[39] = 34'h1779e7b8c;
    stim[40] = 34'h2bd7ec0cb;
    stim[41] = 34'h0aef7a444;
    stim[42] = 34'h00893229f;
    stim[43] = 34'h28030fa20;
    stim[44] = 34'h18461d23c;
    stim[45] = 34'h0db901340;
    stim[46] = 34'h0fbf94518;
    stim[47] = 34'h282641f25;
    stim[48] = 34'h04e00ddc8;
    stim[49] = 34'h343776f83;
    stim[50] = 34'h23c860a9c;
    stim[51] = 34'h1a03d1afe;
    stim[52] = 34'h05768c5fd;
    stim[53] = 34'h26fb8ec43;
    stim[54] = 34'h28490bb30;
    stim[55] = 34'h3ec534af7;
    stim[56] = 34'h0dd3a2b1f;
    stim[57] = 34'h260a34d6a;
    stim[58] = 34'h3f771d37e;
    stim[59] = 34'h06fda64e5;
    stim[60] = 34'h0561dd751;
    stim[61] = 34'h129129f7c;
    stim[62] = 34'h01f1be563;
    stim[63] = 34'h243ffc5b0;
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
      expv[0] = 32'h58dea971;
      expv[1] = 32'h0fc2d778;
      expv[2] = 32'hbe1f4dd1;
      expv[3] = 32'h85343be5;
      expv[4] = 32'h73d2e0ce;
      expv[5] = 32'h31b10889;
      expv[6] = 32'h4e145d0c;
      expv[7] = 32'he164fdb5;
      expv[8] = 32'hd1d61ea1;
      expv[9] = 32'hf49c47b2;
      expv[10] = 32'hefc11c4c;
      expv[11] = 32'h736a3f96;
      expv[12] = 32'hb57c7ec4;
      expv[13] = 32'ha8179b31;
      expv[14] = 32'h833f5c4d;
      expv[15] = 32'h5f4223ac;
      expv[16] = 32'h5c52ba54;
      expv[17] = 32'h9ef1a2d5;
      expv[18] = 32'h072232a2;
      expv[19] = 32'h94a169fc;
      expv[20] = 32'h172ab4b5;
      expv[21] = 32'h33b85089;
      expv[22] = 32'he812e3a4;
      expv[23] = 32'h882ce22b;
      expv[24] = 32'h9dd41e03;
      expv[25] = 32'h67627871;
      expv[26] = 32'h05b94175;
      expv[27] = 32'h057194b8;
      expv[28] = 32'hcd49739a;
      expv[29] = 32'h31e724aa;
      expv[30] = 32'h92457fd7;
      expv[31] = 32'h8b97502d;
      expv[32] = 32'hd55d94b2;
      expv[33] = 32'hac01f0fd;
      expv[34] = 32'h9ddf4532;
      expv[35] = 32'ha17a6fce;
      expv[36] = 32'hb04ed5bf;
      expv[37] = 32'he36c85a5;
      expv[38] = 32'h247f6938;
      expv[39] = 32'h779e7b8d;
      expv[40] = 32'hbd7ec0cb;
      expv[41] = 32'haef7a444;
      expv[42] = 32'h0893229f;
      expv[43] = 32'h8030fa20;
      expv[44] = 32'h8461d23d;
      expv[45] = 32'hdb901340;
      expv[46] = 32'hfbf94518;
      expv[47] = 32'h82641f25;
      expv[48] = 32'h4e00ddc8;
      expv[49] = 32'h43776f84;
      expv[50] = 32'h3c860a9c;
      expv[51] = 32'ha03d1aff;
      expv[52] = 32'h5768c5fd;
      expv[53] = 32'h6fb8ec43;
      expv[54] = 32'h8490bb30;
      expv[55] = 32'hec534af8;
      expv[56] = 32'hdd3a2b1f;
      expv[57] = 32'h60a34d6a;
      expv[58] = 32'hf771d37f;
      expv[59] = 32'h6fda64e5;
      expv[60] = 32'h561dd751;
      expv[61] = 32'h29129f7d;
      expv[62] = 32'h1f1be563;
      expv[63] = 32'h43ffc5b0;
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
