// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h24315f3a182df8b96;
    stim[1] = 68'h05b9e1e81564e4edd;
    stim[2] = 68'h9ceb222a377985d33;
    stim[3] = 68'h550b98f62ba51929e;
    stim[4] = 68'h95d883cb5df33fac8;
    stim[5] = 68'h2d3f30f437a555f12;
    stim[6] = 68'h4937d0c49d1e2836f;
    stim[7] = 68'h84ae519ab6b1456e6;
    stim[8] = 68'h7c6a9c62a7d812c0e;
    stim[9] = 68'h44aef0e622239570b;
    stim[10] = 68'hdfbbd9e37eee7d309;
    stim[11] = 68'h4bb4ee90348a5d581;
    stim[12] = 68'h72919da6f1a3d52d1;
    stim[13] = 68'h2c156b38425d6ca5a;
    stim[14] = 68'h69de0d5070151205f;
    stim[15] = 68'hd72be91ccef8685c5;
    stim[16] = 68'h92dfa9b0934b18ff7;
    stim[17] = 68'h705e4f009b8bc9c53;
    stim[18] = 68'h7c55ce6904bc05f78;
    stim[19] = 68'ha457847f66c720ec0;
    stim[20] = 68'hb719bf858dac50bb3;
    stim[21] = 68'h04a1eeec461ba5a3a;
    stim[22] = 68'h0abc60f556a5cad93;
    stim[23] = 68'h146c8f46fc0683f94;
    stim[24] = 68'heb271dc44c9d00771;
    stim[25] = 68'hc241f309e74fd13cf;
    stim[26] = 68'hae93bd43a7d9526a2;
    stim[27] = 68'h8d904fec97789a08a;
    stim[28] = 68'h7f4a8ffd4804c6762;
    stim[29] = 68'h1011363a374723986;
    stim[30] = 68'hf33ff3ceba9365889;
    stim[31] = 68'h76d6c69c584e4cad1;
    stim[32] = 68'h424480b0afaf3a1c8;
    stim[33] = 68'h71f1ebc6cd583085a;
    stim[34] = 68'ha94b24082bd55a9bf;
    stim[35] = 68'hfcd9051ce72489bbf;
    stim[36] = 68'h24450b329df5695b2;
    stim[37] = 68'ha92ddda6d8b160888;
    stim[38] = 68'h5fa1f7aea34c88810;
    stim[39] = 68'h5ae56aa54567be59e;
    stim[40] = 68'h40517f8729e7e2b39;
    stim[41] = 68'h7cfc42202b77ed531;
    stim[42] = 68'hb64892987fff3eed1;
    stim[43] = 68'h48cb7972aaaf80864;
    stim[44] = 68'h54d2b31ba9765e8ed;
    stim[45] = 68'heac42fb2a214e5c54;
    stim[46] = 68'h097689b24bca6d97b;
    stim[47] = 68'h058a0487fa5455d49;
    stim[48] = 68'hf6a082bca6f30336d;
    stim[49] = 68'h54241db073397465a;
    stim[50] = 68'h40747052be6da2b89;
    stim[51] = 68'hd68d68baa62dc8258;
    stim[52] = 68'hbe817f4324ab943cf;
    stim[53] = 68'h23faa1c4db838c918;
    stim[54] = 68'h015ad8c1f61183a5b;
    stim[55] = 68'hc32b4cbf6dd74ba36;
    stim[56] = 68'hfde93db79499b8223;
    stim[57] = 68'h5b3198cf75ce1a761;
    stim[58] = 68'h420c7a15f953706c2;
    stim[59] = 68'h40744d54ef619302c;
    stim[60] = 68'hbe1470b75658f63d9;
    stim[61] = 68'had5c3742faf369ed2;
    stim[62] = 68'h377c5a485f1d44445;
    stim[63] = 68'h0b018b4b8a7167788;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hceb222a377985d33;
      expv[4] = 64'hceb222a377985d33;
      expv[5] = 64'h5d883cb5df33fac8;
      expv[6] = 64'h2ec41e5aef99fd64;
      expv[7] = 64'h2ec41e5aef99fd64;
      expv[8] = 64'h4ae519ab6b1456e6;
      expv[9] = 64'h4ae519ab6b1456e6;
      expv[10] = 64'h4ae519ab6b1456e6;
      expv[11] = 64'hfbbd9e37eee7d309;
      expv[12] = 64'hfbbd9e37eee7d309;
      expv[13] = 64'hfbbd9e37eee7d309;
      expv[14] = 64'hfddecf1bf773e984;
      expv[15] = 64'hfddecf1bf773e984;
      expv[16] = 64'h72be91ccef8685c5;
      expv[17] = 64'h2dfa9b0934b18ff7;
      expv[18] = 64'h2dfa9b0934b18ff7;
      expv[19] = 64'h2dfa9b0934b18ff7;
      expv[20] = 64'h457847f66c720ec0;
      expv[21] = 64'h719bf858dac50bb3;
      expv[22] = 64'he337f0b1b58a1766;
      expv[23] = 64'hc66fe1636b142ecc;
      expv[24] = 64'h6fe1636b142ecc00;
      expv[25] = 64'hb271dc44c9d00771;
      expv[26] = 64'h241f309e74fd13cf;
      expv[27] = 64'he93bd43a7d9526a2;
      expv[28] = 64'hd904fec97789a08a;
      expv[29] = 64'hd904fec97789a08a;
      expv[30] = 64'h04fec97789a08a00;
      expv[31] = 64'h33ff3ceba9365889;
      expv[32] = 64'h33ff3ceba9365889;
      expv[33] = 64'h33ff3ceba9365889;
      expv[34] = 64'h33ff3ceba9365889;
      expv[35] = 64'h94b24082bd55a9bf;
      expv[36] = 64'hcd9051ce72489bbf;
      expv[37] = 64'he6c828e739244ddf;
      expv[38] = 64'h92ddda6d8b160888;
      expv[39] = 64'h92ddda6d8b160888;
      expv[40] = 64'h92ddda6d8b160888;
      expv[41] = 64'h92ddda6d8b160888;
      expv[42] = 64'h92ddda6d8b160888;
      expv[43] = 64'h64892987fff3eed1;
      expv[44] = 64'h64892987fff3eed1;
      expv[45] = 64'h64892987fff3eed1;
      expv[46] = 64'hac42fb2a214e5c54;
      expv[47] = 64'h5885f654429cb8a8;
      expv[48] = 64'hb10beca885397150;
      expv[49] = 64'h6a082bca6f30336d;
      expv[50] = 64'h6a082bca6f30336d;
      expv[51] = 64'h6a082bca6f30336d;
      expv[52] = 64'h68d68baa62dc8258;
      expv[53] = 64'he817f4324ab943cf;
      expv[54] = 64'hf40bfa19255ca1e7;
      expv[55] = 64'he817f4324ab943ce;
      expv[56] = 64'h32b4cbf6dd74ba36;
      expv[57] = 64'hde93db79499b8223;
      expv[58] = 64'hde93db79499b8223;
      expv[59] = 64'hde93db79499b8223;
      expv[60] = 64'hde93db79499b8223;
      expv[61] = 64'he1470b75658f63d9;
      expv[62] = 64'hd5c3742faf369ed2;
      expv[63] = 64'hffd5c3742faf369e;
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
