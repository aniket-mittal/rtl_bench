// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104435 dut (
    .clock(clk),
    .io_d(in_vec[79:0]),
    .io_q(out_vec[79:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h586f11d4de98b8856a9a;
    stim[1] = 80'ha23467c3a0ba93bc2d60;
    stim[2] = 80'h7de1d41c19d93c53904d;
    stim[3] = 80'hb668ec92d505e86722cc;
    stim[4] = 80'h3e13d1fea3ab55f97655;
    stim[5] = 80'h930f1fc62d69eaa0cdde;
    stim[6] = 80'ha4c7865ea38a62937a2d;
    stim[7] = 80'h62725c6fd15f4f9ed006;
    stim[8] = 80'h2824bd8319421ff4e7db;
    stim[9] = 80'h855ccad7eda9b41e18df;
    stim[10] = 80'hec6ac76555f0e9872508;
    stim[11] = 80'h7a68980695ed111a5b55;
    stim[12] = 80'h57112af52ca3e63e4f2e;
    stim[13] = 80'hea854c349b93872d00da;
    stim[14] = 80'ha27fe1642b8f89f1cbba;
    stim[15] = 80'h643d22602c894392128b;
    stim[16] = 80'h7a38407e4a9908446057;
    stim[17] = 80'h1b44eafa212c0fc19a82;
    stim[18] = 80'h399ac265cca6a4aed08f;
    stim[19] = 80'hbf20b300f31d0fd52a37;
    stim[20] = 80'h0e43e37036f16f3eea12;
    stim[21] = 80'h8cd1f48d6da89ecba25b;
    stim[22] = 80'hf408f4b651de900926c8;
    stim[23] = 80'h41169065b56feb9a7aaa;
    stim[24] = 80'h864244c6d3c31ec9dbc6;
    stim[25] = 80'hdd217badd866eec085f1;
    stim[26] = 80'hbc69a6ac49686e271acb;
    stim[27] = 80'h9b3c8386e252b4db86db;
    stim[28] = 80'hb2a77e58b515308fa7ab;
    stim[29] = 80'h741d2e2c277c988c57da;
    stim[30] = 80'h76171e5eb338bd9b3a15;
    stim[31] = 80'h2f63851a949fae7ffb48;
    stim[32] = 80'hc98584b7807981b938aa;
    stim[33] = 80'h5856765c3966ffcdb60e;
    stim[34] = 80'hf4123fbcc5095be935f8;
    stim[35] = 80'h9d35b3e5e74d27950fd7;
    stim[36] = 80'h30723b5fcc695cf2ecfc;
    stim[37] = 80'h7eee6d321ee906560fd3;
    stim[38] = 80'h022c81f60caa066c51a7;
    stim[39] = 80'hd246a5a1800dbf27133a;
    stim[40] = 80'h28f9b7cdc46f505401aa;
    stim[41] = 80'h5372ec441de1f601f3e3;
    stim[42] = 80'h9a446fe65a5757e8ae74;
    stim[43] = 80'h0fb933caec5d2e557c31;
    stim[44] = 80'he554b3d0bc979a57aa25;
    stim[45] = 80'h22d4612a0175547621b8;
    stim[46] = 80'ha0711475b79a5a8a87aa;
    stim[47] = 80'hbc4e5416d1b58ff1a85d;
    stim[48] = 80'hfa08472f43a9c0fec31c;
    stim[49] = 80'h1c3c2a9d602c106a2e8d;
    stim[50] = 80'h87a77368dd55a0a5c27a;
    stim[51] = 80'h53d222f29953c2283ef5;
    stim[52] = 80'h7123977698ab342f42f3;
    stim[53] = 80'h145c05d2930ad072c384;
    stim[54] = 80'h2be33965d4c4e3c2dafa;
    stim[55] = 80'h70f23fc88761eab2be8e;
    stim[56] = 80'h465868695e87f046cd08;
    stim[57] = 80'hdf960985c4f57099e61c;
    stim[58] = 80'h460c0927bd82be910cfa;
    stim[59] = 80'ha555429d9faa36b53248;
    stim[60] = 80'hf440c2fa1a5b758bcb2a;
    stim[61] = 80'hc88a6c7d4612be0e849b;
    stim[62] = 80'h5a763ea14b99144e6290;
    stim[63] = 80'h531ec4c29be8b493a4a6;
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
      expv[0] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 80'h586f11d4de98b8856a9a;
      expv[2] = 80'ha23467c3a0ba93bc2d60;
      expv[3] = 80'h7de1d41c19d93c53904d;
      expv[4] = 80'hb668ec92d505e86722cc;
      expv[5] = 80'h3e13d1fea3ab55f97655;
      expv[6] = 80'h930f1fc62d69eaa0cdde;
      expv[7] = 80'ha4c7865ea38a62937a2d;
      expv[8] = 80'h62725c6fd15f4f9ed006;
      expv[9] = 80'h2824bd8319421ff4e7db;
      expv[10] = 80'h855ccad7eda9b41e18df;
      expv[11] = 80'hec6ac76555f0e9872508;
      expv[12] = 80'h7a68980695ed111a5b55;
      expv[13] = 80'h57112af52ca3e63e4f2e;
      expv[14] = 80'hea854c349b93872d00da;
      expv[15] = 80'ha27fe1642b8f89f1cbba;
      expv[16] = 80'h643d22602c894392128b;
      expv[17] = 80'h7a38407e4a9908446057;
      expv[18] = 80'h1b44eafa212c0fc19a82;
      expv[19] = 80'h399ac265cca6a4aed08f;
      expv[20] = 80'hbf20b300f31d0fd52a37;
      expv[21] = 80'h0e43e37036f16f3eea12;
      expv[22] = 80'h8cd1f48d6da89ecba25b;
      expv[23] = 80'hf408f4b651de900926c8;
      expv[24] = 80'h41169065b56feb9a7aaa;
      expv[25] = 80'h864244c6d3c31ec9dbc6;
      expv[26] = 80'hdd217badd866eec085f1;
      expv[27] = 80'hbc69a6ac49686e271acb;
      expv[28] = 80'h9b3c8386e252b4db86db;
      expv[29] = 80'hb2a77e58b515308fa7ab;
      expv[30] = 80'h741d2e2c277c988c57da;
      expv[31] = 80'h76171e5eb338bd9b3a15;
      expv[32] = 80'h2f63851a949fae7ffb48;
      expv[33] = 80'hc98584b7807981b938aa;
      expv[34] = 80'h5856765c3966ffcdb60e;
      expv[35] = 80'hf4123fbcc5095be935f8;
      expv[36] = 80'h9d35b3e5e74d27950fd7;
      expv[37] = 80'h30723b5fcc695cf2ecfc;
      expv[38] = 80'h7eee6d321ee906560fd3;
      expv[39] = 80'h022c81f60caa066c51a7;
      expv[40] = 80'hd246a5a1800dbf27133a;
      expv[41] = 80'h28f9b7cdc46f505401aa;
      expv[42] = 80'h5372ec441de1f601f3e3;
      expv[43] = 80'h9a446fe65a5757e8ae74;
      expv[44] = 80'h0fb933caec5d2e557c31;
      expv[45] = 80'he554b3d0bc979a57aa25;
      expv[46] = 80'h22d4612a0175547621b8;
      expv[47] = 80'ha0711475b79a5a8a87aa;
      expv[48] = 80'hbc4e5416d1b58ff1a85d;
      expv[49] = 80'hfa08472f43a9c0fec31c;
      expv[50] = 80'h1c3c2a9d602c106a2e8d;
      expv[51] = 80'h87a77368dd55a0a5c27a;
      expv[52] = 80'h53d222f29953c2283ef5;
      expv[53] = 80'h7123977698ab342f42f3;
      expv[54] = 80'h145c05d2930ad072c384;
      expv[55] = 80'h2be33965d4c4e3c2dafa;
      expv[56] = 80'h70f23fc88761eab2be8e;
      expv[57] = 80'h465868695e87f046cd08;
      expv[58] = 80'hdf960985c4f57099e61c;
      expv[59] = 80'h460c0927bd82be910cfa;
      expv[60] = 80'ha555429d9faa36b53248;
      expv[61] = 80'hf440c2fa1a5b758bcb2a;
      expv[62] = 80'hc88a6c7d4612be0e849b;
      expv[63] = 80'h5a763ea14b99144e6290;
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
