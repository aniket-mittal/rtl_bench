// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_prefetch_buffer dut (
    .clk_i(clk),
    .rst_ni(in_vec[71:71]),
    .req_i(in_vec[70:70]),
    .branch_i(in_vec[69:69]),
    .addr_i(in_vec[68:37]),
    .ready_i(in_vec[36:36]),
    .instr_gnt_i(in_vec[35:35]),
    .instr_rdata_i(in_vec[34:3]),
    .instr_err_i(in_vec[2:2]),
    .instr_pmp_err_i(in_vec[1:1]),
    .instr_rvalid_i(in_vec[0:0]),
    .valid_o(out_vec[99:99]),
    .rdata_o(out_vec[98:67]),
    .addr_o(out_vec[66:35]),
    .err_o(out_vec[34:34]),
    .instr_req_o(out_vec[33:33]),
    .instr_addr_o(out_vec[32:1]),
    .busy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h0b5fb230fd239963dc;
    stim[1] = 72'h0cb39de56bf61edec1;
    stim[2] = 72'hf57e867c8b986a4108;
    stim[3] = 72'he378d19d738ade0a55;
    stim[4] = 72'hc776ada630785560b5;
    stim[5] = 72'hb437712f1cd649b18f;
    stim[6] = 72'h947945d5402abd5c79;
    stim[7] = 72'hfc86e57de86f68a401;
    stim[8] = 72'hd6df22018432dd4177;
    stim[9] = 72'hf5e56f393fbfaa6955;
    stim[10] = 72'hc2d7db5e73bfb446a2;
    stim[11] = 72'h8b3ee6a37601c6a28c;
    stim[12] = 72'hf4f26d90e6798cd831;
    stim[13] = 72'hdb8337a82cf7f54a62;
    stim[14] = 72'hcd5504a07aadbb74ff;
    stim[15] = 72'h909fd79d66c5ba07ac;
    stim[16] = 72'hde8addcf1b2b0c25b8;
    stim[17] = 72'ha315bfbb891af4e188;
    stim[18] = 72'h91273903855145003f;
    stim[19] = 72'hefc65a96daefbab344;
    stim[20] = 72'hc06f280fc6279904fc;
    stim[21] = 72'h9b26a3b25fb9dfad60;
    stim[22] = 72'ha735ada6b3c821242c;
    stim[23] = 72'h9ca67c4594dc2e149d;
    stim[24] = 72'hab14048f4ce52a3c9b;
    stim[25] = 72'hc1d1205f2517fc49e1;
    stim[26] = 72'hca1e6586f7797b9685;
    stim[27] = 72'h9daa0c07b68915fdaf;
    stim[28] = 72'hb772e14eb5577315cd;
    stim[29] = 72'h0b32e6bd7dc7278f3f;
    stim[30] = 72'h89be7cabce50df4efe;
    stim[31] = 72'h80feedc58af4371c7c;
    stim[32] = 72'hbc6c89ec506976f60d;
    stim[33] = 72'he89271a0172e8df8bd;
    stim[34] = 72'h9024d7e04425f5cab9;
    stim[35] = 72'hde98e86050504a24d0;
    stim[36] = 72'ha535cd4d69ed10c3f4;
    stim[37] = 72'hc3bd9722d88a8a642c;
    stim[38] = 72'hb6280134fc380a901d;
    stim[39] = 72'h8f62731e097db6cd28;
    stim[40] = 72'h9c95ee4a1389cb7f7e;
    stim[41] = 72'h924af03e960f588c9d;
    stim[42] = 72'hb7671aa5ced5533552;
    stim[43] = 72'ha2349d14caa6ae11d4;
    stim[44] = 72'hbac1bfe776a45f4c38;
    stim[45] = 72'hde3f1f8b383147849f;
    stim[46] = 72'he23a68c4be5bcefcd0;
    stim[47] = 72'ha7397d2579bf98cd8d;
    stim[48] = 72'hc978eea3bfcff55bcb;
    stim[49] = 72'hcc51b5c71f71b0ebd9;
    stim[50] = 72'h8777abbe6c7575dae1;
    stim[51] = 72'he4170f67d52327b442;
    stim[52] = 72'hd7d4b52a941a3fc05f;
    stim[53] = 72'h8cf476c458c0dfd8fc;
    stim[54] = 72'h8dabe0788afd23b07c;
    stim[55] = 72'h87379a1befcab64aa6;
    stim[56] = 72'hb73a1774c0d7e3d04c;
    stim[57] = 72'hbfbe024af1c3ab8013;
    stim[58] = 72'hd43ac138f6fec49284;
    stim[59] = 72'hd76ac756079f9bcdb4;
    stim[60] = 72'hebed84218959c8fa4b;
    stim[61] = 72'hda5bd2d3fc2ad34290;
    stim[62] = 72'hf5d26a6cddd4303065;
    stim[63] = 72'hbeced220a11ae9bc5a;
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
      expv[0] = 100'h5239963dxxxxxxxxxxxxxxxxx;
      expv[1] = 100'h3f61edecxxxxxxxxxxxxxxxxx;
      expv[2] = 100'h3986a410xxxxxxxxx57e867c9;
      expv[3] = 100'hx8ade0a555fa19f26378d19d1;
      expv[4] = 100'h560b07850de346756378d19d1;
      expv[5] = 100'h1b18cd648de346755437712f0;
      expv[6] = 100'h02abd5c7d0ddc4bc5437712f0;
      expv[7] = 100'h06f68a4050ddc4bc7c86e57d9;
      expv[8] = 100'h5417432df21b95f77c86e57e1;
      expv[9] = 100'h7bfaa695721b95f875e56f391;
      expv[10] = 100'h3bfb446a5795bce435e56f399;
      expv[11] = 100'h601c6a28d795bce655e56f3a0;
      expv[12] = 100'h6798cd835795bce674f26d909;
      expv[13] = 100'h54a64f7f53c9b64334f26d909;
      expv[14] = 100'h374faadbd3c9b64374f26d911;
      expv[15] = 100'ha07aaadbd3c9b64354f26d919;
      expv[16] = 100'ha07aaadbd3c9b64354f26d918;
      expv[17] = 100'h4e18ec5bd3c9b6454315bfbb8;
      expv[18] = 100'h551450038c56feee4315bfbb8;
      expv[19] = 100'h2efbab340c56feee6fc65a969;
      expv[20] = 100'h104fe279bf196a5b6fc65a971;
      expv[21] = 100'h7ad67b9dbf196a5b0fc65a971;
      expv[22] = 100'h1242bc823f196a5b4735ada69;
      expv[23] = 100'h4dc2e1499cd6b69a4735ada69;
      expv[24] = 100'h4e52a3c99cd6b69a0b14048f0;
      expv[25] = 100'h449e517fac50123d6b14048f1;
      expv[26] = 100'h39687797ac50123d6b14048f1;
      expv[27] = 100'h5fdae8912c50123d4b14048f0;
      expv[28] = 100'h315cd5772c50123d5772e14e8;
      expv[29] = 100'h5c7278f3ddcb853a5772e14f0;
      expv[30] = 100'h650df4efddcb853a5772e14f0;
      expv[31] = 100'h2f4371c7ddcb853a5772e14f0;
      expv[32] = 100'h06976f60ddcb853a5c6c89ec0;
      expv[33] = 100'h5f8bf2e8f1b227b1689271a01;
      expv[34] = 100'h425f5caba249c680089271a00;
      expv[35] = 100'h0504a24d2249c680289271a01;
      expv[36] = 100'h1ed10c3f2249c6804535cd4d0;
      expv[37] = 100'h264288a894d735356535cd4d1;
      expv[38] = 100'ha901c38094d73535562801349;
      expv[39] = 100'h6cd297db58a004d3162801348;
      expv[40] = 100'h37f7b89cd8a004d3562801348;
      expv[41] = 100'h08c9e0f5d8a004d3562801348;
      expv[42] = 100'h33556d5558a004d317671aa58;
      expv[43] = 100'h611d2a6add9c6a9742349d148;
      expv[44] = 100'h74c3ea4588d274531ac1bfe70;
      expv[45] = 100'h784983146b06ff9d7ac1bfe71;
      expv[46] = 100'h6fcd65bceb06ff9d623a68c49;
      expv[47] = 100'h1bf98cd888e9a31247397d250;
      expv[48] = 100'h55bcfcff1ce5f49527397d251;
      expv[49] = 100'h0ebdf71b1ce5f49567397d259;
      expv[50] = 100'h47575dae1ce5f49607397d260;
      expv[51] = 100'h52327b441ce5f49624170f679;
      expv[52] = 100'h7c05c1a3905c3d9f64170f679;
      expv[53] = 100'h7d8f8c0d905c3d9f44170f678;
      expv[54] = 100'h3b07afd2105c3d9f44170f678;
      expv[55] = 100'h64aa7cab105c3d9f44170f678;
      expv[56] = 100'h3d048d7e105c3d9f573a17748;
      expv[57] = 100'h38011c3adce85dd31fbe024a8;
      expv[58] = 100'h49286fec7ef8092b7fbe024a9;
      expv[59] = 100'h3cdb79f9fef8092b7fbe024a9;
      expv[60] = 100'h0fa4959cfef8092b2bed84219;
      expv[61] = 100'h42ad34292fb610866bed84221;
      expv[62] = 100'h5d4303062fb6108875d26a6c9;
      expv[63] = 100'h1bc591aed749a9b31eced2208;
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
