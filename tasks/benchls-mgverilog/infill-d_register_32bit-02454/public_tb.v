// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02454 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .d_in(in_vec[31:0]),
    .d_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h10216e5ff;
    stim[1] = 33'h1c8527ab5;
    stim[2] = 33'h0a90122bd;
    stim[3] = 33'h01672dfe8;
    stim[4] = 33'h0eaff6fb4;
    stim[5] = 33'h0c6a8a7b9;
    stim[6] = 33'h0e5104fe1;
    stim[7] = 33'h0eccb4e7f;
    stim[8] = 33'h00158c13b;
    stim[9] = 33'h0f11ad804;
    stim[10] = 33'h04dbd811d;
    stim[11] = 33'h02add02d5;
    stim[12] = 33'h16dcfb81f;
    stim[13] = 33'h03bb11e0a;
    stim[14] = 33'h074914ba0;
    stim[15] = 33'h1713718de;
    stim[16] = 33'h097f66784;
    stim[17] = 33'h07728a544;
    stim[18] = 33'h0f3b8c77d;
    stim[19] = 33'h0ff40625c;
    stim[20] = 33'h0396ee054;
    stim[21] = 33'h0ab881a54;
    stim[22] = 33'h0bf6ddfae;
    stim[23] = 33'h05d708c80;
    stim[24] = 33'h0cbee2b69;
    stim[25] = 33'h097df8412;
    stim[26] = 33'h04034ec61;
    stim[27] = 33'h1c0862b97;
    stim[28] = 33'h09fe8846b;
    stim[29] = 33'h00a27de4f;
    stim[30] = 33'h051338763;
    stim[31] = 33'h0616c0edb;
    stim[32] = 33'h008b3d917;
    stim[33] = 33'h061fea716;
    stim[34] = 33'h080814050;
    stim[35] = 33'h0a63f3c9e;
    stim[36] = 33'h0573ccdc2;
    stim[37] = 33'h0788a4739;
    stim[38] = 33'h04d9ec44d;
    stim[39] = 33'h040de8388;
    stim[40] = 33'h0325829a4;
    stim[41] = 33'h0f3ef6991;
    stim[42] = 33'h0c2819d20;
    stim[43] = 33'h02f3f77d5;
    stim[44] = 33'h032ee99c8;
    stim[45] = 33'h0f35ff820;
    stim[46] = 33'h0241daec8;
    stim[47] = 33'h09963ed2a;
    stim[48] = 33'h0698e0137;
    stim[49] = 33'h05f8b27ed;
    stim[50] = 33'h09e7d086c;
    stim[51] = 33'h037f32de7;
    stim[52] = 33'h0e3720e4f;
    stim[53] = 33'h0f1b1d626;
    stim[54] = 33'h0d13e5103;
    stim[55] = 33'h006292d4f;
    stim[56] = 33'h08cc19aab;
    stim[57] = 33'h03cd346ce;
    stim[58] = 33'h05c80efb4;
    stim[59] = 33'h0844fbf38;
    stim[60] = 33'h0baf5f55b;
    stim[61] = 33'h086b0a3a6;
    stim[62] = 33'h0a40350b3;
    stim[63] = 33'h0457b2fa3;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'ha90122bd;
      expv[4] = 32'h1672dfe8;
      expv[5] = 32'heaff6fb4;
      expv[6] = 32'hc6a8a7b9;
      expv[7] = 32'he5104fe1;
      expv[8] = 32'heccb4e7f;
      expv[9] = 32'h0158c13b;
      expv[10] = 32'hf11ad804;
      expv[11] = 32'h4dbd811d;
      expv[12] = 32'h2add02d5;
      expv[13] = 32'h00000000;
      expv[14] = 32'h3bb11e0a;
      expv[15] = 32'h74914ba0;
      expv[16] = 32'h00000000;
      expv[17] = 32'h97f66784;
      expv[18] = 32'h7728a544;
      expv[19] = 32'hf3b8c77d;
      expv[20] = 32'hff40625c;
      expv[21] = 32'h396ee054;
      expv[22] = 32'hab881a54;
      expv[23] = 32'hbf6ddfae;
      expv[24] = 32'h5d708c80;
      expv[25] = 32'hcbee2b69;
      expv[26] = 32'h97df8412;
      expv[27] = 32'h4034ec61;
      expv[28] = 32'h00000000;
      expv[29] = 32'h9fe8846b;
      expv[30] = 32'h0a27de4f;
      expv[31] = 32'h51338763;
      expv[32] = 32'h616c0edb;
      expv[33] = 32'h08b3d917;
      expv[34] = 32'h61fea716;
      expv[35] = 32'h80814050;
      expv[36] = 32'ha63f3c9e;
      expv[37] = 32'h573ccdc2;
      expv[38] = 32'h788a4739;
      expv[39] = 32'h4d9ec44d;
      expv[40] = 32'h40de8388;
      expv[41] = 32'h325829a4;
      expv[42] = 32'hf3ef6991;
      expv[43] = 32'hc2819d20;
      expv[44] = 32'h2f3f77d5;
      expv[45] = 32'h32ee99c8;
      expv[46] = 32'hf35ff820;
      expv[47] = 32'h241daec8;
      expv[48] = 32'h9963ed2a;
      expv[49] = 32'h698e0137;
      expv[50] = 32'h5f8b27ed;
      expv[51] = 32'h9e7d086c;
      expv[52] = 32'h37f32de7;
      expv[53] = 32'he3720e4f;
      expv[54] = 32'hf1b1d626;
      expv[55] = 32'hd13e5103;
      expv[56] = 32'h06292d4f;
      expv[57] = 32'h8cc19aab;
      expv[58] = 32'h3cd346ce;
      expv[59] = 32'h5c80efb4;
      expv[60] = 32'h844fbf38;
      expv[61] = 32'hbaf5f55b;
      expv[62] = 32'h86b0a3a6;
      expv[63] = 32'ha40350b3;
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
