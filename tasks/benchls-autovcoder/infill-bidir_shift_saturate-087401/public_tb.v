// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087401 dut (
    .data_in(in_vec[54:6]),
    .shift_num(in_vec[5:0]),
    .data_out(out_vec[66:35]),
    .frac_out(out_vec[34:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h2c2b2731b3ba0e;
    stim[1] = 55'h5d658ebc1b6c6d;
    stim[2] = 55'h07998668d4f1bb;
    stim[3] = 55'h7cb1c0ffbe5fbb;
    stim[4] = 55'h532d595dbd84fe;
    stim[5] = 55'h525d14833a4715;
    stim[6] = 55'h58a47967d30173;
    stim[7] = 55'h0468d7e654fa88;
    stim[8] = 55'h7adf18ec971e1a;
    stim[9] = 55'h0792dc0ac54445;
    stim[10] = 55'h49f3a086fa888b;
    stim[11] = 55'h3e36a5ddec30f4;
    stim[12] = 55'h5704d32e9bd2d0;
    stim[13] = 55'h688047c5bc1180;
    stim[14] = 55'h2cd49bc67f0f36;
    stim[15] = 55'h7775e10c984ced;
    stim[16] = 55'h101f0ddbc37f30;
    stim[17] = 55'h45ab5036d23949;
    stim[18] = 55'h694c2dcc8785ee;
    stim[19] = 55'h6821303dcbc77d;
    stim[20] = 55'h3b4cf229c89e87;
    stim[21] = 55'h541cb7dff7b4ad;
    stim[22] = 55'h442bdf2b216cb5;
    stim[23] = 55'h4ef9287c0d4c70;
    stim[24] = 55'h4c82b7ae85d528;
    stim[25] = 55'h5018034ea3e91b;
    stim[26] = 55'h196487a61f6082;
    stim[27] = 55'h55271f2a044724;
    stim[28] = 55'h446060f63dc5ca;
    stim[29] = 55'h3de30d920d02cb;
    stim[30] = 55'h03bd7092cb7ed8;
    stim[31] = 55'h59c84d748422c9;
    stim[32] = 55'h5e9dd1f2476507;
    stim[33] = 55'h7daa67331b654b;
    stim[34] = 55'h6f92311b6d2369;
    stim[35] = 55'h47f8a682efbe54;
    stim[36] = 55'h003aa15763faed;
    stim[37] = 55'h7fc964ab066dbc;
    stim[38] = 55'h020f95c14b87f0;
    stim[39] = 55'h0e1f5a2207692b;
    stim[40] = 55'h685c4aeaab7ea2;
    stim[41] = 55'h3a9b4d554bb4ee;
    stim[42] = 55'h4e4dd4559fd29f;
    stim[43] = 55'h23d5163d4e35fc;
    stim[44] = 55'h5075dade005f9a;
    stim[45] = 55'h4346ccf20f8d7f;
    stim[46] = 55'h61c9e7c2c09c73;
    stim[47] = 55'h419d0cd9f6e4e1;
    stim[48] = 55'h356499ead4cc40;
    stim[49] = 55'h7ad158e5e55ad4;
    stim[50] = 55'h5c28f3c870eebb;
    stim[51] = 55'h2a98af045eee9d;
    stim[52] = 55'h4b2a214400644c;
    stim[53] = 55'h760eb4b4531cd2;
    stim[54] = 55'h51277fe9b822c8;
    stim[55] = 55'h67637c8f2c66da;
    stim[56] = 55'h5ce052040ef151;
    stim[57] = 55'h30ffda41152dff;
    stim[58] = 55'h5d5633419fec61;
    stim[59] = 55'h1cee3cd3be9ebc;
    stim[60] = 55'h761bdc011f7fb1;
    stim[61] = 55'h08bf131a8c59f5;
    stim[62] = 55'h216a796e88ed61;
    stim[63] = 55'h38465857d492e6;
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
      expv[0] = 67'h7fffffff9dd000000;
      expv[1] = 67'h7fffffff800000000;
      expv[2] = 67'h7fffffff800000000;
      expv[3] = 67'h7fffffff800000000;
      expv[4] = 67'h7fffffff800000000;
      expv[5] = 67'h0525d14833a470000;
      expv[6] = 67'h7fffffff800000000;
      expv[7] = 67'h7ffffffff50000000;
      expv[8] = 67'h003d6f8c764b8f000;
      expv[9] = 67'h7fffffffc40000000;
      expv[10] = 67'h7fffffffa22000000;
      expv[11] = 67'h7fffffff800000000;
      expv[12] = 67'h7fffffffb7a580000;
      expv[13] = 67'h7fffffff800000000;
      expv[14] = 67'h7fffffff800000000;
      expv[15] = 67'h7fffffff800000000;
      expv[16] = 67'h7fffffff800000000;
      expv[17] = 67'h7fffffffb94000000;
      expv[18] = 67'h7fffffff800000000;
      expv[19] = 67'h7fffffff800000000;
      expv[20] = 67'h7ffffffffa0000000;
      expv[21] = 67'h7fffffff800000000;
      expv[22] = 67'h7fffffff800000000;
      expv[23] = 67'h7fffffff800000000;
      expv[24] = 67'h7fffffff800000000;
      expv[25] = 67'h00140600d3a8fa400;
      expv[26] = 67'h7fffffffc00000000;
      expv[27] = 67'h7fffffff800000000;
      expv[28] = 67'h7fffffffe2e000000;
      expv[29] = 67'h7fffffffc0b000000;
      expv[30] = 67'h00077ae12596fd800;
      expv[31] = 67'h7fffffffa2c000000;
      expv[32] = 67'h7fffffff940000000;
      expv[33] = 67'h7fffffffd95000000;
      expv[34] = 67'h7fffffff800000000;
      expv[35] = 67'h08ff14d05df7c8000;
      expv[36] = 67'h7fffffff800000000;
      expv[37] = 67'h7fffffff800000000;
      expv[38] = 67'h7fffffff800000000;
      expv[39] = 67'h7fffffff800000000;
      expv[40] = 67'h7fffffff800000000;
      expv[41] = 67'h7fffffff800000000;
      expv[42] = 67'h0001393751567f4a0;
      expv[43] = 67'h7fffffff800000000;
      expv[44] = 67'h00283aed6f002fc00;
      expv[45] = 67'h7fffffff800000000;
      expv[46] = 67'h7fffffff800000000;
      expv[47] = 67'h7fffffff800000000;
      expv[48] = 67'h7fffffff800000000;
      expv[49] = 67'h0f5a2b1cbcab58000;
      expv[50] = 67'h7fffffff800000000;
      expv[51] = 67'h0002a98af045eee80;
      expv[52] = 67'h7fffffff8c8800000;
      expv[53] = 67'h3b075a5a298e60000;
      expv[54] = 67'h7fffffffc58000000;
      expv[55] = 67'h0033b1be479633600;
      expv[56] = 67'h5ce052040ef140000;
      expv[57] = 67'h7fffffff800000000;
      expv[58] = 67'h7fffffff800000000;
      expv[59] = 67'h7fffffff800000000;
      expv[60] = 67'h7fffffff800000000;
      expv[61] = 67'h7fffffff800000000;
      expv[62] = 67'h7fffffff800000000;
      expv[63] = 67'h7fffffff800000000;
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
