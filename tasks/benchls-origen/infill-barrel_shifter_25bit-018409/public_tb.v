// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018409 dut (
    .DI(in_vec[29:5]),
    .sel(in_vec[4:0]),
    .DO(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h1d3c3c3e;
    stim[1] = 30'h33853c98;
    stim[2] = 30'h07d035a9;
    stim[3] = 30'h1be6c6e9;
    stim[4] = 30'h3627820e;
    stim[5] = 30'h2b7f7766;
    stim[6] = 30'h07520f91;
    stim[7] = 30'h1055e780;
    stim[8] = 30'h25595e52;
    stim[9] = 30'h1a57c698;
    stim[10] = 30'h2c37e06c;
    stim[11] = 30'h3200be58;
    stim[12] = 30'h105ea29d;
    stim[13] = 30'h3811d4ff;
    stim[14] = 30'h06c1312f;
    stim[15] = 30'h1ea44598;
    stim[16] = 30'h2a0c583a;
    stim[17] = 30'h059703dd;
    stim[18] = 30'h21298ea1;
    stim[19] = 30'h23feb5a0;
    stim[20] = 30'h0a775797;
    stim[21] = 30'h2a00a1a5;
    stim[22] = 30'h34b68b69;
    stim[23] = 30'h22aeaef0;
    stim[24] = 30'h32d5d492;
    stim[25] = 30'h1c5dd493;
    stim[26] = 30'h1e9c9b62;
    stim[27] = 30'h1f0a1bff;
    stim[28] = 30'h31b46bc6;
    stim[29] = 30'h1d5cf739;
    stim[30] = 30'h32227de4;
    stim[31] = 30'h3163dcec;
    stim[32] = 30'h21157632;
    stim[33] = 30'h307ab04c;
    stim[34] = 30'h178f0606;
    stim[35] = 30'h05d4ad32;
    stim[36] = 30'h3c11668f;
    stim[37] = 30'h2d4e6ed1;
    stim[38] = 30'h1669c790;
    stim[39] = 30'h211a3c7f;
    stim[40] = 30'h29299698;
    stim[41] = 30'h2072c1fd;
    stim[42] = 30'h25a6c340;
    stim[43] = 30'h10d6025a;
    stim[44] = 30'h25b4b93b;
    stim[45] = 30'h33e95818;
    stim[46] = 30'h0fd79bc5;
    stim[47] = 30'h2e509a99;
    stim[48] = 30'h308b2e92;
    stim[49] = 30'h37d7fd55;
    stim[50] = 30'h2e50e7c4;
    stim[51] = 30'h35c5a904;
    stim[52] = 30'h37308af3;
    stim[53] = 30'h3e4e1c4c;
    stim[54] = 30'h1d77d836;
    stim[55] = 30'h3c0679d0;
    stim[56] = 30'h208b4072;
    stim[57] = 30'h27fae187;
    stim[58] = 30'h3a880b81;
    stim[59] = 30'h1de23311;
    stim[60] = 30'h35a79395;
    stim[61] = 30'h11e4ce2d;
    stim[62] = 30'h3aa628e0;
    stim[63] = 30'h0814017b;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h1035a00;
      expv[3] = 25'h06c6e00;
      expv[4] = 25'h1040000;
      expv[5] = 25'h0feeec0;
      expv[6] = 25'h0f80000;
      expv[7] = 25'h082af3c;
      expv[8] = 25'h1c80000;
      expv[9] = 25'h0000000;
      expv[10] = 25'h1f03000;
      expv[11] = 25'h0000000;
      expv[12] = 25'h0000000;
      expv[13] = 25'h0000000;
      expv[14] = 25'h0c48000;
      expv[15] = 25'h0000000;
      expv[16] = 25'h0000000;
      expv[17] = 25'h0000000;
      expv[18] = 25'h01298ea;
      expv[19] = 25'h11ff5ad;
      expv[20] = 25'h0000000;
      expv[21] = 25'h000a1a0;
      expv[22] = 25'h168b600;
      expv[23] = 25'h1770000;
      expv[24] = 25'h0900000;
      expv[25] = 25'h1200000;
      expv[26] = 25'h1d3936c;
      expv[27] = 25'h0000000;
      expv[28] = 25'h168d780;
      expv[29] = 25'h0000000;
      expv[30] = 25'h1113ef0;
      expv[31] = 25'h1ee7000;
      expv[32] = 25'h0c40000;
      expv[33] = 25'h1582000;
      expv[34] = 25'h11e0c00;
      expv[35] = 25'h1a40000;
      expv[36] = 25'h19a0000;
      expv[37] = 25'h0ec0000;
      expv[38] = 25'h03c0000;
      expv[39] = 25'h0000000;
      expv[40] = 25'h0000000;
      expv[41] = 25'h0000000;
      expv[42] = 25'h12d361a;
      expv[43] = 25'h0000000;
      expv[44] = 25'h0000000;
      expv[45] = 25'h0000000;
      expv[46] = 25'h1d79bc0;
      expv[47] = 25'h0000000;
      expv[48] = 25'h1d00000;
      expv[49] = 25'h1400000;
      expv[50] = 25'h12873e0;
      expv[51] = 25'h0e2d480;
      expv[52] = 25'h0b80000;
      expv[53] = 25'h10e2000;
      expv[54] = 25'h0400000;
      expv[55] = 25'h1ce0000;
      expv[56] = 25'h00c0000;
      expv[57] = 25'h1eb8600;
      expv[58] = 25'h1a880b8;
      expv[59] = 25'h1300000;
      expv[60] = 25'h1800000;
      expv[61] = 25'h0ce2000;
      expv[62] = 25'h1d53147;
      expv[63] = 25'h0000000;
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
