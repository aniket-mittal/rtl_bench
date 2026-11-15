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

  radar dut (
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
    stim[0] = 72'h4a5bdbed02871863a1;
    stim[1] = 72'h9b89e03a5ecb5f54da;
    stim[2] = 72'h95ce940505bc2e38e2;
    stim[3] = 72'h161200ff8414a8bd5d;
    stim[4] = 72'h9b837106601f31b3f9;
    stim[5] = 72'h2ed63786691f27cefa;
    stim[6] = 72'h00704c0227323a89e7;
    stim[7] = 72'h26c6f4ec8dcb2df703;
    stim[8] = 72'h4b73b458cef2568203;
    stim[9] = 72'he825370c04b3fc5f18;
    stim[10] = 72'h7f3215b039cd94e8ca;
    stim[11] = 72'h0f4bcc2a34ee894be4;
    stim[12] = 72'h7120bd1c2c712de0aa;
    stim[13] = 72'hb01d85276dd1a33981;
    stim[14] = 72'hc22d7276129018dbba;
    stim[15] = 72'ha7cdd504f6e5c84122;
    stim[16] = 72'hba91d150d90e02737e;
    stim[17] = 72'h7ee8b2033b003bde88;
    stim[18] = 72'ha2a100e9e8d8c94e1d;
    stim[19] = 72'h7c193a7178058e8687;
    stim[20] = 72'h31501257b422b8ef2c;
    stim[21] = 72'h9c08ca1883048fe6ec;
    stim[22] = 72'h21d4477150fb2ac4fe;
    stim[23] = 72'h6ba7dee99dc75ee326;
    stim[24] = 72'h9cc8ba54cd00424457;
    stim[25] = 72'hb32cd9a109a91c44ce;
    stim[26] = 72'hb723d68c0da915b318;
    stim[27] = 72'hbc0ee8a6246f45ff62;
    stim[28] = 72'h5fc589bd0576cc1f90;
    stim[29] = 72'hc513f5a91478f4f89e;
    stim[30] = 72'h5097ecd437095f979f;
    stim[31] = 72'h8b7cec5624837cb2f1;
    stim[32] = 72'h5347df30fb7c2d55ad;
    stim[33] = 72'h33788261fa7b17c473;
    stim[34] = 72'hf807ee1571acb46ed3;
    stim[35] = 72'hbdcd5e6768ef9d3d20;
    stim[36] = 72'h80b71357c4f8dd0cca;
    stim[37] = 72'h9a80d6574554355d79;
    stim[38] = 72'h0b354de327a6ea03cb;
    stim[39] = 72'h1b8c1eb516ac5ec599;
    stim[40] = 72'hef5c8e1af7325a7e80;
    stim[41] = 72'h07e0d403b6b4bf4f9e;
    stim[42] = 72'hdc4afac1b0f713a374;
    stim[43] = 72'h4ce22f729327954557;
    stim[44] = 72'h1abac5ee1d56df8bd6;
    stim[45] = 72'h22eade7c7cb7b3ee8f;
    stim[46] = 72'h2ef582c20313baf7bf;
    stim[47] = 72'h1e85241242a06d7b30;
    stim[48] = 72'h7a88174104da9c3641;
    stim[49] = 72'h928a1d4776d6251455;
    stim[50] = 72'hd64b7d93a63d646983;
    stim[51] = 72'hde625c2ed36df9b30f;
    stim[52] = 72'h4c5af4db4f1aeebdc3;
    stim[53] = 72'h6634a01f99db0b0ba4;
    stim[54] = 72'h11954765cec61c2756;
    stim[55] = 72'h4119bb38db9d2a075f;
    stim[56] = 72'h3598fdb5cc0aa61411;
    stim[57] = 72'h6c9958564afbf23d36;
    stim[58] = 72'h581b08608eab9cec48;
    stim[59] = 72'h94d0499db82d88ebd4;
    stim[60] = 72'h9905b2c00212996468;
    stim[61] = 72'hd8ece4be0f6f2e88e0;
    stim[62] = 72'h8e418a4fcba35fc52c;
    stim[63] = 72'h89a65b17d6c48bf158;
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
      expv[0] = 64'hx000000x00000000;
      expv[1] = 64'hx000000x00000000;
      expv[2] = 64'hx000000x00000000;
      expv[3] = 64'hx000000x00000000;
      expv[4] = 64'hx000000x00000000;
      expv[5] = 64'hx000000x00000000;
      expv[6] = 64'hx000000x00000000;
      expv[7] = 64'hx000000x00000000;
      expv[8] = 64'hx000000x00000000;
      expv[9] = 64'hx000000x00000000;
      expv[10] = 64'hx000000x00000000;
      expv[11] = 64'hx000000x00000000;
      expv[12] = 64'hx000000x00000000;
      expv[13] = 64'hx000000x00000000;
      expv[14] = 64'hx000000x00000000;
      expv[15] = 64'hx000000x00000000;
      expv[16] = 64'hx000000x00000000;
      expv[17] = 64'hx000000x00000000;
      expv[18] = 64'hx000000x00000000;
      expv[19] = 64'hx000000x00000000;
      expv[20] = 64'hx000000x00000000;
      expv[21] = 64'hx000000x00000000;
      expv[22] = 64'hx000000x00000000;
      expv[23] = 64'hx000000x00000000;
      expv[24] = 64'hx000000x00000000;
      expv[25] = 64'hx000000x00000000;
      expv[26] = 64'hx000000x00000000;
      expv[27] = 64'hx000000x00000000;
      expv[28] = 64'hx000000x00000000;
      expv[29] = 64'hx000000x00000000;
      expv[30] = 64'hx000000x00000000;
      expv[31] = 64'hx000000x00000000;
      expv[32] = 64'hx000000x00000000;
      expv[33] = 64'hx000000x00000000;
      expv[34] = 64'hx000000x00000000;
      expv[35] = 64'hx000000x00000000;
      expv[36] = 64'hx000000x00000000;
      expv[37] = 64'hx000000x00000000;
      expv[38] = 64'hx000000x00000000;
      expv[39] = 64'hx000000x00000000;
      expv[40] = 64'hx000000x00000000;
      expv[41] = 64'hx000000x00000000;
      expv[42] = 64'hx000000x00000000;
      expv[43] = 64'hx000000x00000000;
      expv[44] = 64'hx000000x00000000;
      expv[45] = 64'hx000000x00000000;
      expv[46] = 64'hx000000x00000000;
      expv[47] = 64'hx000000x00000000;
      expv[48] = 64'hx000000x00000000;
      expv[49] = 64'hx000000x00000000;
      expv[50] = 64'hx000000x00000000;
      expv[51] = 64'hx000000x00000000;
      expv[52] = 64'hx000000x00000000;
      expv[53] = 64'hx000000x00000000;
      expv[54] = 64'hx000000x00000000;
      expv[55] = 64'hx000000x00000000;
      expv[56] = 64'hx000000x00000000;
      expv[57] = 64'hx000000x00000000;
      expv[58] = 64'hx000000x00000000;
      expv[59] = 64'hx000000x00000000;
      expv[60] = 64'hx000000x00000000;
      expv[61] = 64'hx000000x00000000;
      expv[62] = 64'hx000000x00000000;
      expv[63] = 64'hx000000x00000000;
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
