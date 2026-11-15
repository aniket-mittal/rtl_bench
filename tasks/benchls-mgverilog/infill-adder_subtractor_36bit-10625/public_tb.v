// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10625 dut (
    .dataa(in_vec[72:37]),
    .datab(in_vec[36:1]),
    .add_sub(in_vec[0:0]),
    .result(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h16c3868c3903c5bb997;
    stim[1] = 73'h047f9e3a7312c96f171;
    stim[2] = 73'h0f6e084b4e1552f63df;
    stim[3] = 73'h1295d520b9822d54d51;
    stim[4] = 73'h0fd4aef504dc73af6ac;
    stim[5] = 73'h18e3bca01c28f4ab685;
    stim[6] = 73'h1899ad4d5613701a4dd;
    stim[7] = 73'h08606662635d70e1339;
    stim[8] = 73'h188a0b8c5cffb0cbb15;
    stim[9] = 73'h1e26479aa9baaa6c25a;
    stim[10] = 73'h1f0ca9e5bd467e4c3e8;
    stim[11] = 73'h1567b038947e6f4f07a;
    stim[12] = 73'h1b233e8959b8815a19d;
    stim[13] = 73'h1b4ac9d685374f3fdfc;
    stim[14] = 73'h15d9fd9a69f922fa5b5;
    stim[15] = 73'h0fc00fdf4f0c569466c;
    stim[16] = 73'h163cecee8a8e264152f;
    stim[17] = 73'h0d0bc63c2b5aed90172;
    stim[18] = 73'h10235a6020cc431ed87;
    stim[19] = 73'h16676c267eff6bcf0b8;
    stim[20] = 73'h0b814631afbb8aa32f8;
    stim[21] = 73'h1e7a000bd8e7f44b2f3;
    stim[22] = 73'h0604c176487f47981e0;
    stim[23] = 73'h1d579514ab561e0c410;
    stim[24] = 73'h1305d53a0e9f87069e1;
    stim[25] = 73'h18426a45150f460fc45;
    stim[26] = 73'h0cc51c1031c0d77b488;
    stim[27] = 73'h1e6e8a4cf3cb852ff3a;
    stim[28] = 73'h16302eef1f03e0056d8;
    stim[29] = 73'h078a133dd996971a360;
    stim[30] = 73'h19ea0c85802f7d2e821;
    stim[31] = 73'h19e39fac4d623d5ee98;
    stim[32] = 73'h079384630537c3620f9;
    stim[33] = 73'h1eabc695c4039857237;
    stim[34] = 73'h0f0a4a8c6e78af15a66;
    stim[35] = 73'h058814eb6db98ef2615;
    stim[36] = 73'h1b0422e18dc438d6b83;
    stim[37] = 73'h171d9665862e230aa75;
    stim[38] = 73'h0ca2838e8c30e18d70a;
    stim[39] = 73'h033f79847d05c0f8935;
    stim[40] = 73'h0b1b8fe6425064e5ea2;
    stim[41] = 73'h18eeb87137408630574;
    stim[42] = 73'h103df2dff72d38034c4;
    stim[43] = 73'h19fd34dc2ba5c93dd90;
    stim[44] = 73'h10613726c01d190abf8;
    stim[45] = 73'h13e209e0f1aecfcbcd4;
    stim[46] = 73'h03b312dca12c995e7a6;
    stim[47] = 73'h1e796bece64d6a62128;
    stim[48] = 73'h1b3216b3b4f21cad7de;
    stim[49] = 73'h1381293e2f9474032de;
    stim[50] = 73'h089711f1c67451755fc;
    stim[51] = 73'h03ab6e9f246399fe20b;
    stim[52] = 73'h0b767a637c6e0549c60;
    stim[53] = 73'h1d0b2e7bf2610e3e35d;
    stim[54] = 73'h121a25182dce1519d08;
    stim[55] = 73'h1c84277be7064302eb1;
    stim[56] = 73'h1624635f2d7c0b1f5d2;
    stim[57] = 73'h0aca9854f5431d010a8;
    stim[58] = 73'h1506476ab0dccff6f0e;
    stim[59] = 73'h15b3ad0e5aefa357632;
    stim[60] = 73'h1e2109634bc1caa3148;
    stim[61] = 73'h0a6312b67e01b0e7b51;
    stim[62] = 73'h0365d66189875b879d6;
    stim[63] = 73'h1d0e70066a17eff49c9;
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
      expv[0] = 36'h37ff122e7;
      expv[1] = 36'had61a95f1;
      expv[2] = 36'h8619bd796;
      expv[3] = 36'h55c553704;
      expv[4] = 36'h106b9ff2c;
      expv[5] = 36'hdb983ab50;
      expv[6] = 36'hce8577919;
      expv[7] = 36'hf1bba3acd;
      expv[8] = 36'h4428c23b8;
      expv[9] = 36'h13dd06c27;
      expv[10] = 36'h5526290ea;
      expv[11] = 36'h6c05da40d;
      expv[12] = 36'hb55aa157a;
      expv[13] = 36'h3eaeaec44;
      expv[14] = 36'hab616a00e;
      expv[15] = 36'hf7d534c71;
      expv[16] = 36'hf8fa881dc;
      expv[17] = 36'hbae769d5c;
      expv[18] = 36'he73c626d3;
      expv[19] = 36'h338579ae3;
      expv[20] = 36'h7e44dff5b;
      expv[21] = 36'h67ca25f65;
      expv[22] = 36'hf0823fa34;
      expv[23] = 36'h3fada284d;
      expv[24] = 36'he7f22d1f7;
      expv[25] = 36'h49b65a0ac;
      expv[26] = 36'h85bd22dd4;
      expv[27] = 36'h0db1ba6dc;
      expv[28] = 36'h2f9174c23;
      expv[29] = 36'h71050cd3c;
      expv[30] = 36'he70efb6d0;
      expv[31] = 36'h1dfe4deda;
      expv[32] = 36'hd87dd41fe;
      expv[33] = 36'hf72a603fd;
      expv[34] = 36'h3bfac9904;
      expv[35] = 36'h0908208c0;
      expv[36] = 36'hba3d82687;
      expv[37] = 36'hcffe387fd;
      expv[38] = 36'h4ca355bc1;
      expv[39] = 36'h9cdc486d8;
      expv[40] = 36'h30aa0c3d0;
      expv[41] = 36'h2732ab5e1;
      expv[42] = 36'heb5395599;
      expv[43] = 36'hfd0507f4d;
      expv[44] = 36'h747d33d64;
      expv[45] = 36'hc7a86920e;
      expv[46] = 36'h874be7a7d;
      expv[47] = 36'hcd162e5df;
      expv[48] = 36'h60825edeb;
      expv[49] = 36'hd1cf485a8;
      expv[50] = 36'h0a8fd4de5;
      expv[51] = 36'h4f2874097;
      expv[52] = 36'h24b12e38e;
      expv[53] = 36'h18e092fa7;
      expv[54] = 36'ha9c69bd92;
      expv[55] = 36'h6742bd54b;
      expv[56] = 36'hf31d8b4ad;
      expv[57] = 36'hb4c642226;
      expv[58] = 36'h39ca3fdd1;
      expv[59] = 36'h35cbbcc14;
      expv[60] = 36'h1022f9901;
      expv[61] = 36'h53f1098e7;
      expv[62] = 36'h5780ef3d9;
      expv[63] = 36'hf46b7a819;
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
