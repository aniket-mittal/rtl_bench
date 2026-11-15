// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04101 dut (
    .i(in_vec[27:0]),
    .o(out_vec[27:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hf86f523;
    stim[1] = 28'h98c9a1d;
    stim[2] = 28'h94328fb;
    stim[3] = 28'hbb0a93a;
    stim[4] = 28'ha137cdf;
    stim[5] = 28'h9ef3130;
    stim[6] = 28'h848a3d5;
    stim[7] = 28'hfdeb682;
    stim[8] = 28'h4ce5399;
    stim[9] = 28'h9c75987;
    stim[10] = 28'h75250d9;
    stim[11] = 28'h7be31d8;
    stim[12] = 28'h2cb1753;
    stim[13] = 28'h51af2c8;
    stim[14] = 28'hb37a329;
    stim[15] = 28'h88e6c1f;
    stim[16] = 28'h1d61b51;
    stim[17] = 28'h9e4487d;
    stim[18] = 28'hf9db78a;
    stim[19] = 28'h6ea913f;
    stim[20] = 28'h357bfdc;
    stim[21] = 28'h00b8370;
    stim[22] = 28'hf5d8fb1;
    stim[23] = 28'hae9d64a;
    stim[24] = 28'h64c8041;
    stim[25] = 28'hef0b79e;
    stim[26] = 28'h61b231c;
    stim[27] = 28'hcd81182;
    stim[28] = 28'h0d69ae2;
    stim[29] = 28'h5a45fcb;
    stim[30] = 28'hc89225c;
    stim[31] = 28'h0e11de7;
    stim[32] = 28'hcf30079;
    stim[33] = 28'hea66e8a;
    stim[34] = 28'h5224693;
    stim[35] = 28'h8ea4baf;
    stim[36] = 28'h4abf9a6;
    stim[37] = 28'h2a41673;
    stim[38] = 28'hd0494dc;
    stim[39] = 28'h5a44295;
    stim[40] = 28'h69b0bc0;
    stim[41] = 28'hbd467b1;
    stim[42] = 28'ha165cef;
    stim[43] = 28'hdc425bb;
    stim[44] = 28'h3d00ce6;
    stim[45] = 28'h8b5b18f;
    stim[46] = 28'h866c268;
    stim[47] = 28'h1e44ffa;
    stim[48] = 28'heb7a419;
    stim[49] = 28'h1188645;
    stim[50] = 28'hccc4009;
    stim[51] = 28'hb0c463d;
    stim[52] = 28'haebb671;
    stim[53] = 28'hfbfc52b;
    stim[54] = 28'hef88b03;
    stim[55] = 28'h1723c3e;
    stim[56] = 28'h1bd51fc;
    stim[57] = 28'h18e40e9;
    stim[58] = 28'h98f0468;
    stim[59] = 28'h727833e;
    stim[60] = 28'had20b7e;
    stim[61] = 28'h90e3fd3;
    stim[62] = 28'hb75c877;
    stim[63] = 28'hfdca2a0;
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
      expv[0] = 28'hf0dea47;
      expv[1] = 28'h319343b;
      expv[2] = 28'h28651f7;
      expv[3] = 28'h7615275;
      expv[4] = 28'h426f9bf;
      expv[5] = 28'h3de6261;
      expv[6] = 28'h09147ab;
      expv[7] = 28'hfbd6d05;
      expv[8] = 28'h99ca732;
      expv[9] = 28'h38eb30f;
      expv[10] = 28'hea4a1b2;
      expv[11] = 28'hf7c63b0;
      expv[12] = 28'h5962ea6;
      expv[13] = 28'ha35e590;
      expv[14] = 28'h66f4653;
      expv[15] = 28'h11cd83f;
      expv[16] = 28'h3ac36a2;
      expv[17] = 28'h3c890fb;
      expv[18] = 28'hf3b6f15;
      expv[19] = 28'hdd5227e;
      expv[20] = 28'h6af7fb8;
      expv[21] = 28'h01706e0;
      expv[22] = 28'hebb1f63;
      expv[23] = 28'h5d3ac95;
      expv[24] = 28'hc990082;
      expv[25] = 28'hde16f3d;
      expv[26] = 28'hc364638;
      expv[27] = 28'h9b02305;
      expv[28] = 28'h1ad35c4;
      expv[29] = 28'hb48bf96;
      expv[30] = 28'h91244b9;
      expv[31] = 28'h1c23bce;
      expv[32] = 28'h9e600f3;
      expv[33] = 28'hd4cdd15;
      expv[34] = 28'ha448d26;
      expv[35] = 28'h1d4975f;
      expv[36] = 28'h957f34c;
      expv[37] = 28'h5482ce6;
      expv[38] = 28'ha0929b9;
      expv[39] = 28'hb48852a;
      expv[40] = 28'hd361780;
      expv[41] = 28'h7a8cf63;
      expv[42] = 28'h42cb9df;
      expv[43] = 28'hb884b77;
      expv[44] = 28'h7a019cc;
      expv[45] = 28'h16b631f;
      expv[46] = 28'h0cd84d1;
      expv[47] = 28'h3c89ff4;
      expv[48] = 28'hd6f4833;
      expv[49] = 28'h2310c8a;
      expv[50] = 28'h9988013;
      expv[51] = 28'h6188c7b;
      expv[52] = 28'h5d76ce3;
      expv[53] = 28'hf7f8a57;
      expv[54] = 28'hdf11607;
      expv[55] = 28'h2e4787c;
      expv[56] = 28'h37aa3f8;
      expv[57] = 28'h31c81d2;
      expv[58] = 28'h31e08d1;
      expv[59] = 28'he4f067c;
      expv[60] = 28'h5a416fd;
      expv[61] = 28'h21c7fa7;
      expv[62] = 28'h6eb90ef;
      expv[63] = 28'hfb94541;
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
