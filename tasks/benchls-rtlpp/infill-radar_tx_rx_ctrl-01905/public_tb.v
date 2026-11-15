// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01905 dut (
    .clk_i(clk),
    .saddr_i(in_vec[71:65]),
    .sdata_i(in_vec[64:33]),
    .s_strobe_i(in_vec[32:32]),
    .rx_adc_i_i(in_vec[31:16]),
    .rx_adc_q_i(in_vec[15:0]),
    .tx_side_o(out_vec[63:63]),
    .tx_strobe_o(out_vec[62:62]),
    .tx_dac_i_o(out_vec[61:48]),
    .tx_dac_q_o(out_vec[47:34]),
    .io_tx_ena_o(out_vec[33:33]),
    .rx_strobe_o(out_vec[32:32]),
    .rx_ech_i_o(out_vec[31:16]),
    .rx_ech_q_o(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hf5d47618bd962d63d7;
    stim[1] = 72'h6f9a5de46972461925;
    stim[2] = 72'h0c8ddb701dc8d892ee;
    stim[3] = 72'h779f312cae0c79ddcf;
    stim[4] = 72'h3997b474c87072aea3;
    stim[5] = 72'had42377727285d7fb5;
    stim[6] = 72'h58969e0ebf137c9bfb;
    stim[7] = 72'hc8b8fbac03d045616e;
    stim[8] = 72'h015e675a01d8ee2d0b;
    stim[9] = 72'h5915bc26023234904f;
    stim[10] = 72'h82d53c75a0cace31ab;
    stim[11] = 72'h8b3a14612a3ef00c2d;
    stim[12] = 72'h636177dc97ebb5d67b;
    stim[13] = 72'h8ab2d7a8fc9497e2ed;
    stim[14] = 72'h831e104075e8fd1de1;
    stim[15] = 72'h0fa64df4bd66a54e01;
    stim[16] = 72'h6f24f1717d18c215b5;
    stim[17] = 72'hf9351ea6b9d524f4d9;
    stim[18] = 72'h0c45fcaab4860ef097;
    stim[19] = 72'he24ab9fef7a153a285;
    stim[20] = 72'h9eed460925a7068c8d;
    stim[21] = 72'h051b6c268dba472650;
    stim[22] = 72'hcff8c113ad11e048f2;
    stim[23] = 72'hdf59c062fb55020db3;
    stim[24] = 72'hc9878ee887c9a2e042;
    stim[25] = 72'h5cebc29eb9452f964d;
    stim[26] = 72'hce2bef8785379b521b;
    stim[27] = 72'hbc0d479695c92f76c8;
    stim[28] = 72'hae3be926ebdd57c71b;
    stim[29] = 72'h8c8fcb0de1c664ef49;
    stim[30] = 72'h0645b7deff90fbbe95;
    stim[31] = 72'h0650b2df033c800c2b;
    stim[32] = 72'ha3bf9d3f4b0b7186e7;
    stim[33] = 72'hbe223fa009dd9149a0;
    stim[34] = 72'h76be44de2c989c0c3b;
    stim[35] = 72'hdc9043e7f8bc99837c;
    stim[36] = 72'h53c840360fe47da43f;
    stim[37] = 72'h6c7c2239a691df1e81;
    stim[38] = 72'hf9bfbfc2a30cf03be5;
    stim[39] = 72'h765b0fc10501f95730;
    stim[40] = 72'h6c985601e25a5bee16;
    stim[41] = 72'h4411cdb05c64858a8d;
    stim[42] = 72'ha18be805d416a35569;
    stim[43] = 72'h44c7c2147567242a42;
    stim[44] = 72'hc461a0525607cf4e6a;
    stim[45] = 72'hd0979b8fe695adad6a;
    stim[46] = 72'hb3efe6b936fd085bd8;
    stim[47] = 72'hde5bdea4fe91c531d7;
    stim[48] = 72'hb775b15c9cffbd8d8f;
    stim[49] = 72'hef134f30b344a3934c;
    stim[50] = 72'h3307cae7797430663c;
    stim[51] = 72'h402187d8e1943fb24d;
    stim[52] = 72'hc5b61611683bf2543e;
    stim[53] = 72'h3d4e19680e294a1067;
    stim[54] = 72'h00a1df21fcc5b199d0;
    stim[55] = 72'h171f87f7c0d6c6e849;
    stim[56] = 72'ha292ec7f00628d89b6;
    stim[57] = 72'h8ff424e8189c36e29f;
    stim[58] = 72'h917d0814cb970af323;
    stim[59] = 72'h384de5eb51fe7a0280;
    stim[60] = 72'h9c0946a62bd43ae2e0;
    stim[61] = 72'hc19776269459741f45;
    stim[62] = 72'ha70c44abe79cc668e3;
    stim[63] = 72'h9ab9053bb759152cc6;
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
      expv[0] = 64'hcc5e317b962d63d7;
      expv[1] = 64'h7234c8d172461925;
      expv[2] = 64'h4000000000000000;
      expv[3] = 64'h1657595d0c79ddcf;
      expv[4] = 64'h000000017072aea3;
      expv[5] = 64'hc0000001285d7fb5;
      expv[6] = 64'h475f1d7e00000000;
      expv[7] = 64'hd601580400000000;
      expv[8] = 64'h4000000000000000;
      expv[9] = 64'h13014c0400000000;
      expv[10] = 64'h8000000000000000;
      expv[11] = 64'h8000000000000000;
      expv[12] = 64'h6e4bb92debb5d67b;
      expv[13] = 64'h8000000000000000;
      expv[14] = 64'hc000000000000000;
      expv[15] = 64'h4000000000000000;
      expv[16] = 64'h78bee2f918c215b5;
      expv[17] = 64'hd35c4d73d524f4d9;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'hff7bfdeca153a285;
      expv[20] = 64'hc000000200000000;
      expv[21] = 64'h4000000000000000;
      expv[22] = 64'hc9d6275800000000;
      expv[23] = 64'hf17dc5f600000000;
      expv[24] = 64'hf443d10c00000000;
      expv[25] = 64'h4f5c3d7200000000;
      expv[26] = 64'hc3c20f0800000000;
      expv[27] = 64'hc0000002c92f76c8;
      expv[28] = 64'hc0000000dd57c71b;
      expv[29] = 64'hc000000000000000;
      expv[30] = 64'h4000000000000000;
      expv[31] = 64'h4000000000000000;
      expv[32] = 64'hc00000010b7186e7;
      expv[33] = 64'hc0000002dd9149a0;
      expv[34] = 64'h2f16bc58989c0c3b;
      expv[35] = 64'hb3fccff000000000;
      expv[36] = 64'h5b076c1e00000000;
      expv[37] = 64'h1cd3734c91df1e81;
      expv[38] = 64'he15185470cf03be5;
      expv[39] = 64'h6082820a01f95730;
      expv[40] = 64'h00f103c45a5bee16;
      expv[41] = 64'h182e60b800000000;
      expv[42] = 64'h8000000116a35569;
      expv[43] = 64'h4a3a28e800000000;
      expv[44] = 64'ha92ba4ac00000000;
      expv[45] = 64'h87f31fcc00000000;
      expv[46] = 64'h80000001fd085bd8;
      expv[47] = 64'h927f49fc00000000;
      expv[48] = 64'h80000001ffbd8d8f;
      expv[49] = 64'hd859616544a3934c;
      expv[50] = 64'h400000037430663c;
      expv[51] = 64'h6c70b1c000000000;
      expv[52] = 64'h88b422d000000000;
      expv[53] = 64'h00000001294a1067;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h80000000628d89b6;
      expv[57] = 64'h8000000000000000;
      expv[58] = 64'hc000000200000000;
      expv[59] = 64'h40000002fe7a0280;
      expv[60] = 64'hc000000200000000;
      expv[61] = 64'h934a4d2800000000;
      expv[62] = 64'hc00000019cc668e3;
      expv[63] = 64'hc000000200000000;
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
