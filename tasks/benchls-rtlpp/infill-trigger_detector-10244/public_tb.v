// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10244 dut (
    .clk(clk),
    .rst(in_vec[65:65]),
    .in_data_valid(in_vec[64:64]),
    .in_data(in_vec[63:48]),
    .in_dma_master_address(in_vec[47:16]),
    .trigger_level(in_vec[15:0]),
    .out_data_offset(out_vec[48:17]),
    .trigger_response(out_vec[16:1]),
    .trigger(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h29c4ba3d636ec218e;
    stim[1] = 66'h2d7550339eb54d0b1;
    stim[2] = 66'h0c4979f5499627228;
    stim[3] = 66'h1b98d538487dcc61b;
    stim[4] = 66'h1b9f9839f3b0b42bb;
    stim[5] = 66'h15e2dea4c0edb3767;
    stim[6] = 66'h0efd34cc517f2c80d;
    stim[7] = 66'h10a48b4a1c327cfbd;
    stim[8] = 66'h18ec8994849f9d379;
    stim[9] = 66'h157b6b07ff3a96b9d;
    stim[10] = 66'h01e21b02ef98c0ee6;
    stim[11] = 66'h19c37a2744941841f;
    stim[12] = 66'h124455fcb7063695c;
    stim[13] = 66'h1cbdf36171ee8349b;
    stim[14] = 66'h18cba6b1ad1c2dcc8;
    stim[15] = 66'h16e2cd1707c50c8c0;
    stim[16] = 66'h15cacc76e70e77c15;
    stim[17] = 66'h178888c6ce8eddf14;
    stim[18] = 66'h0337b60baed9a9d6e;
    stim[19] = 66'h12c98f7052da84a55;
    stim[20] = 66'h02547d03b46fb2a02;
    stim[21] = 66'h1a35c6f95da8c5ec1;
    stim[22] = 66'h1f619c3180eafad4f;
    stim[23] = 66'h14624d926ae3bf5f2;
    stim[24] = 66'h1b5763331ceba2ef2;
    stim[25] = 66'h161a91bbb8c800e09;
    stim[26] = 66'h1239cd04dfdd07f08;
    stim[27] = 66'h362758d703f84e54c;
    stim[28] = 66'h0bac24cbef26cb72b;
    stim[29] = 66'h10992d8c6858b2f7a;
    stim[30] = 66'h0224b2b9356512135;
    stim[31] = 66'h1a81acd13ba106812;
    stim[32] = 66'h121bfbc4ab80049e3;
    stim[33] = 66'h1d86acc65818ed527;
    stim[34] = 66'h15c82b107539f6f0b;
    stim[35] = 66'h1302f0a37dbf18534;
    stim[36] = 66'h1d0452434e6179e4d;
    stim[37] = 66'h158aaa28387c91041;
    stim[38] = 66'h046f2183a84b4f57e;
    stim[39] = 66'h0f9af9ab7318f61fd;
    stim[40] = 66'h0f6ba48c44ed13c87;
    stim[41] = 66'h174e03c9de7ab7812;
    stim[42] = 66'h04ba07502e4aa1804;
    stim[43] = 66'h1229ebb87114c103f;
    stim[44] = 66'h159283981dadb5c62;
    stim[45] = 66'h1bee0540200cff0e8;
    stim[46] = 66'h197bcd54d1ffb2994;
    stim[47] = 66'h1bc184da38d19668e;
    stim[48] = 66'h07f8cef0c0ba0a90d;
    stim[49] = 66'h10f1fe35343e4f874;
    stim[50] = 66'h1fc174dae8cf35cee;
    stim[51] = 66'h1ce506de68bd359e7;
    stim[52] = 66'h08dcfba1ebef05ab1;
    stim[53] = 66'h07297a96eee33916b;
    stim[54] = 66'h1a408b5e282ae0d1b;
    stim[55] = 66'h1329fa44e44270790;
    stim[56] = 66'h0cb2cd42d19037c3b;
    stim[57] = 66'h178061e7aa0a9c387;
    stim[58] = 66'h11fae8ea7ac18e560;
    stim[59] = 66'h0e3ba93c6fe2d3126;
    stim[60] = 66'h188442077f3397184;
    stim[61] = 66'h10d401bf020d77e51;
    stim[62] = 66'h1518744e27fbeaa4f;
    stim[63] = 66'h15a842114fe5638a8;
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
      expv[0] = 49'hxxxxxxxxxxxxx;
      expv[1] = 49'h0000000000000;
      expv[2] = 49'h0000000000000;
      expv[3] = 49'h0000000000002;
      expv[4] = 49'h0000000000002;
      expv[5] = 49'h0000000000002;
      expv[6] = 49'h0000000000002;
      expv[7] = 49'h0000000000002;
      expv[8] = 49'h0000000000003;
      expv[9] = 49'h0000000000002;
      expv[10] = 49'h0000000000002;
      expv[11] = 49'h0000000000002;
      expv[12] = 49'h0000000000002;
      expv[13] = 49'h0000000000002;
      expv[14] = 49'h0000000000002;
      expv[15] = 49'h0000000000002;
      expv[16] = 49'h0000000000002;
      expv[17] = 49'h0000000000002;
      expv[18] = 49'h0000000000002;
      expv[19] = 49'h0000000000002;
      expv[20] = 49'h0000000000002;
      expv[21] = 49'h0000000000002;
      expv[22] = 49'h0000000000002;
      expv[23] = 49'h0000000000002;
      expv[24] = 49'h0000000000002;
      expv[25] = 49'h0000000000002;
      expv[26] = 49'h0000000000002;
      expv[27] = 49'h0000000000002;
      expv[28] = 49'h0000000000000;
      expv[29] = 49'h0000000000002;
      expv[30] = 49'h0000000000002;
      expv[31] = 49'h0000000000002;
      expv[32] = 49'h0000000000002;
      expv[33] = 49'h0000000000002;
      expv[34] = 49'h0000000000002;
      expv[35] = 49'h0000000000002;
      expv[36] = 49'h0000000000002;
      expv[37] = 49'h0000000000002;
      expv[38] = 49'h0000000000002;
      expv[39] = 49'h0000000000002;
      expv[40] = 49'h0000000000002;
      expv[41] = 49'h0000000000002;
      expv[42] = 49'h0000000000002;
      expv[43] = 49'h0000000000002;
      expv[44] = 49'h0000000000002;
      expv[45] = 49'h0000000000002;
      expv[46] = 49'h0000000000002;
      expv[47] = 49'h0000000000002;
      expv[48] = 49'h0000000000002;
      expv[49] = 49'h0000000000002;
      expv[50] = 49'h0000000000002;
      expv[51] = 49'h0000000000002;
      expv[52] = 49'h0000000000002;
      expv[53] = 49'h0000000000002;
      expv[54] = 49'h0000000000002;
      expv[55] = 49'h0000000000002;
      expv[56] = 49'h0000000000003;
      expv[57] = 49'h0000000000002;
      expv[58] = 49'h0000000000002;
      expv[59] = 49'h0000000000002;
      expv[60] = 49'h0000000000002;
      expv[61] = 49'h0000000000002;
      expv[62] = 49'h0000000000002;
      expv[63] = 49'h0000000000002;
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
