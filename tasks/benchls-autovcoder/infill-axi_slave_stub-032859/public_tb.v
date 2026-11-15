// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 85;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032859 dut (
    .toplevel_io_axiClk(clk),
    .io_axi_arw_valid(in_vec[84:84]),
    .io_axi_arw_payload_addr(in_vec[83:52]),
    .io_axi_arw_payload_size(in_vec[51:49]),
    .io_axi_arw_payload_cache(in_vec[48:45]),
    .io_axi_arw_payload_prot(in_vec[44:42]),
    .io_axi_arw_payload_write(in_vec[41:41]),
    .io_axi_w_valid(in_vec[40:40]),
    .io_axi_w_payload_data(in_vec[39:8]),
    .io_axi_w_payload_strb(in_vec[7:4]),
    .io_axi_w_payload_last(in_vec[3:3]),
    .io_axi_b_ready(in_vec[2:2]),
    .io_axi_r_ready(in_vec[1:1]),
    .toplevel_resetCtrl_axiReset(in_vec[0:0]),
    .io_axi_arw_ready(out_vec[40:40]),
    .io_axi_w_ready(out_vec[39:39]),
    .io_axi_b_valid(out_vec[38:38]),
    .io_axi_b_payload_resp(out_vec[37:36]),
    .io_axi_r_valid(out_vec[35:35]),
    .io_axi_r_payload_data(out_vec[34:3]),
    .io_axi_r_payload_resp(out_vec[2:1]),
    .io_axi_r_payload_last(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 85'h03bcaf253fabe994e76c11;
    stim[1] = 85'h0636a44103ae42864794c3;
    stim[2] = 85'h19f2b7d98212df953e695c;
    stim[3] = 85'h0b1de1b913d5c4f798f3ac;
    stim[4] = 85'h083ef530688aaa834e3af2;
    stim[5] = 85'h13adac271a9103b7e9789e;
    stim[6] = 85'h0d9c6e07ea4cf200a4d6fc;
    stim[7] = 85'h0efc57cc7c54f7e4d76b9c;
    stim[8] = 85'h061432b05da752bb910774;
    stim[9] = 85'h18179e28624dd7ce76229a;
    stim[10] = 85'h195a07c09231b581f3aeba;
    stim[11] = 85'h1f358e95e175f05df30f68;
    stim[12] = 85'h109221cc53ffb9f657e5a2;
    stim[13] = 85'h0888c0d5f523693260394a;
    stim[14] = 85'h02cfc437cab4b2d6a33c26;
    stim[15] = 85'h17a95258ffe9477da7243e;
    stim[16] = 85'h08b64c610e800257c1e6ce;
    stim[17] = 85'h0664c25b9b6a69b4e73dfc;
    stim[18] = 85'h0d010f4a692ce72024ce78;
    stim[19] = 85'h15948c347f88f38f2d0f8e;
    stim[20] = 85'h1f77365d8e0074509f5d2e;
    stim[21] = 85'h122e6f560ac1b45e482b4a;
    stim[22] = 85'h155aaef04f5e4c9c009cf0;
    stim[23] = 85'h03fcc2c0e4232e8a74dfd8;
    stim[24] = 85'h0b8b823de2a940e31b4c82;
    stim[25] = 85'h13e2f1209d9caff09dc9fa;
    stim[26] = 85'h183c0c5cc00e3e45bc6722;
    stim[27] = 85'h0f8ecb05f7acd8d1aaebda;
    stim[28] = 85'h18f058227c7cee98a90832;
    stim[29] = 85'h1ef7ac8932d488a34ef05e;
    stim[30] = 85'h0dd8c983b64b416eecddcc;
    stim[31] = 85'h0087095ea57d6d140b7a46;
    stim[32] = 85'h1f7ff4380cc6a91d476f14;
    stim[33] = 85'h133de95743ba20d88445f8;
    stim[34] = 85'h11eca48cb82a94fce1310a;
    stim[35] = 85'h18fbff3705db26c27a4f0c;
    stim[36] = 85'h1a4bcd38b583a621bcbeb2;
    stim[37] = 85'h16c63c78e5aaab360ac9bc;
    stim[38] = 85'h032dcbc0477a679c2efc14;
    stim[39] = 85'h0bd165dc5071939b5a6432;
    stim[40] = 85'h1faaefe21a2b0203a429a6;
    stim[41] = 85'h175ba3ac6c7393797ea9a2;
    stim[42] = 85'h07751dafdd89fa272d00b4;
    stim[43] = 85'h0bdf04a818b4c1df3c790a;
    stim[44] = 85'h0de4baea670b51ab13cbb0;
    stim[45] = 85'h1a6bc5f1207d6f2441310a;
    stim[46] = 85'h07c66b3fee060228464756;
    stim[47] = 85'h05824a9565ae2ce2381ac8;
    stim[48] = 85'h003de160338038ee2c7ef8;
    stim[49] = 85'h03ed47c4ecbf449d2925ee;
    stim[50] = 85'h01b31a90e5d9a05fdf5b6a;
    stim[51] = 85'h0ac89fbf20e4dc7696aaac;
    stim[52] = 85'h074cef1e27dbb604756ce0;
    stim[53] = 85'h066c36305aa701bbee8ea4;
    stim[54] = 85'h140527e9850ab4cbb367a0;
    stim[55] = 85'h09d75807c4513d017fe75c;
    stim[56] = 85'h035f7e8d074287695542e0;
    stim[57] = 85'h1ecc763b7f67cdc83baf16;
    stim[58] = 85'h1e7900380a56f5c166f1f6;
    stim[59] = 85'h17430c4ec22ec548b13a72;
    stim[60] = 85'h0e5d0b847e7db679951e7a;
    stim[61] = 85'h04efd59c716d87e1ff0a76;
    stim[62] = 85'h1b9f3a13396c35e6e7ac78;
    stim[63] = 85'h130059892d86e03c4533c2;
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
      expv[0] = 41'h13xxxxxxxxx;
      expv[1] = 41'h13xxxxxxxxx;
      expv[2] = 41'h13xxxxxxxxx;
      expv[3] = 41'h0bxxxxxxxxx;
      expv[4] = 41'h07xxxxxxxxx;
      expv[5] = 41'h07xxxxxxxxx;
      expv[6] = 41'h13xxxxxxxxx;
      expv[7] = 41'h13xxxxxxxxx;
      expv[8] = 41'h13xxxxxxxxx;
      expv[9] = 41'h13xxxxxxxxx;
      expv[10] = 41'h03xxxxxxxxx;
      expv[11] = 41'h13xxxxxxxxx;
      expv[12] = 41'h03xxxxxxxxx;
      expv[13] = 41'h13xxxxxxxxx;
      expv[14] = 41'h13xxxxxxxxx;
      expv[15] = 41'h13xxxxxxxxx;
      expv[16] = 41'h03xxxxxxxxx;
      expv[17] = 41'h13xxxxxxxxx;
      expv[18] = 41'h13xxxxxxxxx;
      expv[19] = 41'h13xxxxxxxxx;
      expv[20] = 41'h03xxxxxxxxx;
      expv[21] = 41'h13xxxxxxxxx;
      expv[22] = 41'h03xxxxxxxxx;
      expv[23] = 41'h03xxxxxxxxx;
      expv[24] = 41'h03xxxxxxxxx;
      expv[25] = 41'h13xxxxxxxxx;
      expv[26] = 41'h03xxxxxxxxx;
      expv[27] = 41'h13xxxxxxxxx;
      expv[28] = 41'h13xxxxxxxxx;
      expv[29] = 41'h03xxxxxxxxx;
      expv[30] = 41'h13xxxxxxxxx;
      expv[31] = 41'h13xxxxxxxxx;
      expv[32] = 41'h13xxxxxxxxx;
      expv[33] = 41'h0bxxxxxxxxx;
      expv[34] = 41'h0bxxxxxxxxx;
      expv[35] = 41'h0bxxxxxxxxx;
      expv[36] = 41'h07xxxxxxxxx;
      expv[37] = 41'h07xxxxxxxxx;
      expv[38] = 41'h13xxxxxxxxx;
      expv[39] = 41'h13xxxxxxxxx;
      expv[40] = 41'h13xxxxxxxxx;
      expv[41] = 41'h0bxxxxxxxxx;
      expv[42] = 41'h0bxxxxxxxxx;
      expv[43] = 41'h0bxxxxxxxxx;
      expv[44] = 41'h0bxxxxxxxxx;
      expv[45] = 41'h0bxxxxxxxxx;
      expv[46] = 41'h07xxxxxxxxx;
      expv[47] = 41'h13xxxxxxxxx;
      expv[48] = 41'h13xxxxxxxxx;
      expv[49] = 41'h13xxxxxxxxx;
      expv[50] = 41'h13xxxxxxxxx;
      expv[51] = 41'h13xxxxxxxxx;
      expv[52] = 41'h13xxxxxxxxx;
      expv[53] = 41'h13xxxxxxxxx;
      expv[54] = 41'h13xxxxxxxxx;
      expv[55] = 41'h0bxxxxxxxxx;
      expv[56] = 41'h07xxxxxxxxx;
      expv[57] = 41'h07xxxxxxxxx;
      expv[58] = 41'h13xxxxxxxxx;
      expv[59] = 41'h0bxxxxxxxxx;
      expv[60] = 41'h0bxxxxxxxxx;
      expv[61] = 41'h07xxxxxxxxx;
      expv[62] = 41'h13xxxxxxxxx;
      expv[63] = 41'h03xxxxxxxxx;
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
