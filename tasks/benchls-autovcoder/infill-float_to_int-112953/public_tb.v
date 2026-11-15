// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112953 dut (
    .isInputStable(in_vec[65:65]),
    .isFloat(in_vec[64:64]),
    .sign(in_vec[63:63]),
    .exponent(in_vec[62:52]),
    .mantissa(in_vec[51:0]),
    .out(out_vec[64:1]),
    .isInputNormalized(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2f44c3b81ca3e1b58;
    stim[1] = 66'h04e278bc2ff64b60d;
    stim[2] = 66'h2f128f4a88addcd26;
    stim[3] = 66'h0f6173196ef47387a;
    stim[4] = 66'h1ba00a7d4d09054d2;
    stim[5] = 66'h2acd0b3a6f76b8dbf;
    stim[6] = 66'h2995f40e95204bc6f;
    stim[7] = 66'h17f4adc0938fc1ee7;
    stim[8] = 66'h28850d97762f417c3;
    stim[9] = 66'h11d152fb6d4656544;
    stim[10] = 66'h3a0bdd076fdf036e9;
    stim[11] = 66'h1d8443c13aa8baffb;
    stim[12] = 66'h26914f09786eb1ac8;
    stim[13] = 66'h2e8711858673d3ca1;
    stim[14] = 66'h211232fd7645427ae;
    stim[15] = 66'h258d4df18e0f140dd;
    stim[16] = 66'h3bfebee5a6f23f0e6;
    stim[17] = 66'h1c27ed6dfb9445be0;
    stim[18] = 66'h09809161be5dc5c36;
    stim[19] = 66'h13af184a64735ec8d;
    stim[20] = 66'h0de0a91017dbc4fd4;
    stim[21] = 66'h1aaab09607e90592a;
    stim[22] = 66'h3e171ef8b638a1a4d;
    stim[23] = 66'h27bb40ccaa6fb8abd;
    stim[24] = 66'h1fb291cb303b39047;
    stim[25] = 66'h2db7b3eb5fc23df0e;
    stim[26] = 66'h1b0b836a015746cf5;
    stim[27] = 66'h1fb16510ee578c85c;
    stim[28] = 66'h38c1c0fa4e7986ab8;
    stim[29] = 66'h21503f0e851a3ec2e;
    stim[30] = 66'h34612f9a7f5231974;
    stim[31] = 66'h0ad90ea245d5965e8;
    stim[32] = 66'h185139ef4662a987d;
    stim[33] = 66'h07f3ca41da2529358;
    stim[34] = 66'h326bf1aa0849357fc;
    stim[35] = 66'h269e6d527b1642d1f;
    stim[36] = 66'h201841d1eff442dd7;
    stim[37] = 66'h04ede056ea7508c1f;
    stim[38] = 66'h1e5031417b48fb77e;
    stim[39] = 66'h214d9176d68147509;
    stim[40] = 66'h1dacfdaf18d87d356;
    stim[41] = 66'h11f38c397428d872a;
    stim[42] = 66'h0f7b62fc0f7342657;
    stim[43] = 66'h2ba02592da0c5101b;
    stim[44] = 66'h38efd593745477d9d;
    stim[45] = 66'h14ea772e035ef57a0;
    stim[46] = 66'h11d357f879d2fc1a6;
    stim[47] = 66'h1328aeed0bf2d25cc;
    stim[48] = 66'h13f790f79a8553f77;
    stim[49] = 66'h12a349798a239dde6;
    stim[50] = 66'h0b120c86ea672aaf7;
    stim[51] = 66'h33458ab3d0086e394;
    stim[52] = 66'h29ebcee53f91118fc;
    stim[53] = 66'h1664c08688aa34a81;
    stim[54] = 66'h39b1e29b7a21cafc7;
    stim[55] = 66'h3bd72a5f8b841b159;
    stim[56] = 66'h03345ef4e02e0579b;
    stim[57] = 66'h1727ee0109b0ee53a;
    stim[58] = 66'h2081f604aead5809b;
    stim[59] = 66'h08898f14fc2804ead;
    stim[60] = 66'h05cb8854110f09fe4;
    stim[61] = 66'h1ed4c4546ff6d6bfe;
    stim[62] = 66'h3975dd0083617e484;
    stim[63] = 66'h3c1272397414ec090;
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
      expv[0] = 65'h1fff0000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h1fff0000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h1fff0000000000000;
      expv[6] = 65'h1fff0000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h1fff0000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h000000001ff800000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h0d229e12f0dd63591;
      expv[13] = 65'h1fff0000000000000;
      expv[14] = 65'h022465faec8a84f5d;
      expv[15] = 65'h0b1a9be31c1e281bb;
      expv[16] = 65'h0b1a9be31ff800000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h000000001ff800000;
      expv[23] = 65'h0f76819954df7157b;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h1fff0000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h000000001ff800000;
      expv[29] = 65'h02a07e1d0a347d85d;
      expv[30] = 65'h08c25f34fea4632e9;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h04d7e35410926aff9;
      expv[35] = 65'h0d3cdaa4f62c85a3f;
      expv[36] = 65'h003083a3dfe885baf;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h029b22edad028ea13;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h1fff0000000000000;
      expv[44] = 65'h1fff00001ff800000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h068b1567a010dc729;
      expv[52] = 65'h1fff0000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h000000001ff800000;
      expv[55] = 65'h000000001ff800000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h0103ec095d5ab0137;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h000000001ff800000;
      expv[63] = 65'h000000001ff800000;
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
