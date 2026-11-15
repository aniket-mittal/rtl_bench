// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09015 dut (
    .clk_i(clk),
    .rstn_i(in_vec[98:98]),
    .pwm0_i(in_vec[97:84]),
    .pwm1_i(in_vec[83:70]),
    .sys_addr(in_vec[69:38]),
    .sys_wdata(in_vec[37:6]),
    .sys_sel(in_vec[5:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h4748e09a4fe9944394ffb4c07;
    stim[1] = 99'h62df7fcde59171b235cae0468;
    stim[2] = 99'h040c69436ab37e81db2198e75;
    stim[3] = 99'h25ed40a678b4275a59f0d5ebc;
    stim[4] = 99'h2a88c6a825adf1cc20a1432a3;
    stim[5] = 99'h1631c7f9d32feca2ad7c1fabf;
    stim[6] = 99'h124af5845e1d77c5e143c69f7;
    stim[7] = 99'h27a396d31b1eacb41eb5b1278;
    stim[8] = 99'h0d5936b9ab03b623bd9227afb;
    stim[9] = 99'h1d24f1f540f1c6cc8623ba72e;
    stim[10] = 99'h3dae28d2d6fb08a82ee177e4a;
    stim[11] = 99'h0167ee0894b970d90c1c95fd7;
    stim[12] = 99'h320ecee9ea7d91a21ef9b276b;
    stim[13] = 99'h2dfc1353293c53f01bc766a77;
    stim[14] = 99'h0fd27176d27c624b1a1cc2080;
    stim[15] = 99'h0753d36e0f4881eb0c5a35780;
    stim[16] = 99'h2f0cea4c86156bee45af313ec;
    stim[17] = 99'h240f8c4c814d5decc2effeb1b;
    stim[18] = 99'h09522337b63f60a8e884c66df;
    stim[19] = 99'h02272ba26c609b1be8a7465e3;
    stim[20] = 99'h0a8e5780d11dd2e0d4c0c74d9;
    stim[21] = 99'h3fde71ba94598f176131e0e93;
    stim[22] = 99'h2620ca960bf8d1586310a6042;
    stim[23] = 99'h08d747af38e2af894d22c4132;
    stim[24] = 99'h7163b0c1eadf865fe0cea06ab;
    stim[25] = 99'h2fa585748ff3d8068fea91c71;
    stim[26] = 99'h06048f9d8c61367fa524c2829;
    stim[27] = 99'h25423d83b5af1caaceffe7a3d;
    stim[28] = 99'h4d5877a8a3d45fae45887eabb;
    stim[29] = 99'h10a8e894cd0229c643bb0d764;
    stim[30] = 99'h17399a37ddd49c01c7288e315;
    stim[31] = 99'h1fa8592ba7bb80fe1b1d7e911;
    stim[32] = 99'h37e8b32c2608cdab767bef077;
    stim[33] = 99'h329a9507419d1adfa66f74136;
    stim[34] = 99'h12bc3630b19e7b698aa3a205f;
    stim[35] = 99'h3453ed6ec4d46147ba594eacd;
    stim[36] = 99'h06a60f8e3516b94dc9d6570ba;
    stim[37] = 99'h270b30364599b82b442a4b403;
    stim[38] = 99'h2a5dc2b2f81e8dec1cc130b40;
    stim[39] = 99'h1d3c089d83975024f9122cf61;
    stim[40] = 99'h1e7b38f80799c5d74f56fcf14;
    stim[41] = 99'h00d2372dd60a7a5f00809904b;
    stim[42] = 99'h752d30495244ec473c33d4c7c;
    stim[43] = 99'h1dc9effc4f917b4d7dd7916d9;
    stim[44] = 99'h35afa2ddb942c763132d885a3;
    stim[45] = 99'h2d0232ee3af5aeb0f2b4c0573;
    stim[46] = 99'h7acdd9309d09bd4ebbeac525f;
    stim[47] = 99'h174ce4e253623981bbf999a92;
    stim[48] = 99'h2f808067e1b24b862fffcba85;
    stim[49] = 99'h2fb6e796db2c6f4696bee401b;
    stim[50] = 99'h2b399ed29d3a1780050bbcf28;
    stim[51] = 99'h137b99b2e8b91f4e8a4567efb;
    stim[52] = 99'h2e051796f6089b2ed9677ffb4;
    stim[53] = 99'h200ac52119b3264e07e4db458;
    stim[54] = 99'h0db2e717c27f27ce7fd134756;
    stim[55] = 99'h2e601ea427d76595eefe6c054;
    stim[56] = 99'h0b7f77e967c327ad5c5ff2908;
    stim[57] = 99'h0720eb2e4038e3cd78045d8aa;
    stim[58] = 99'h15327240dbc81414b3e996694;
    stim[59] = 99'h38af1795e214654ae3e0738b2;
    stim[60] = 99'h128c2a1bd05c6c286b98205df;
    stim[61] = 99'h08c9811b99db0248a6f8c1aac;
    stim[62] = 99'h2a44d4911a9b5e0cb192e6863;
    stim[63] = 99'h338b84a1b2ea24a3c30a5989e;
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
      expv[0] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000001;
      expv[2] = 130'h0e8888b02666xxxxxxxxxxxxx00000000;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h000000000000000000000000000000000;
      expv[5] = 130'h000000000000000000000000000000000;
      expv[6] = 130'h000000000000000000000000000000000;
      expv[7] = 130'h000000000000000000000000000000000;
      expv[8] = 130'h000000000000000000000000000000000;
      expv[9] = 130'h000000000000000000000000000000000;
      expv[10] = 130'h000000000000000000000000000000000;
      expv[11] = 130'h000000000000000000000000000000000;
      expv[12] = 130'h000000000000000000000000000000000;
      expv[13] = 130'h000000000000000000000000000000000;
      expv[14] = 130'h000000000000000000000000000000000;
      expv[15] = 130'h000000000000000000000000000000000;
      expv[16] = 130'h000000000000000000000000000000000;
      expv[17] = 130'h000000000000000000000000000000000;
      expv[18] = 130'h000000000000000000000000000000000;
      expv[19] = 130'h000000000000000000000000000000000;
      expv[20] = 130'h000000000000000000000000000000000;
      expv[21] = 130'h000000000000000000000000000000000;
      expv[22] = 130'h000000000000000000000000000000000;
      expv[23] = 130'h000000000000000000000000000000000;
      expv[24] = 130'h000000000000000000000000000000000;
      expv[25] = 130'h000000000000000000000000000000001;
      expv[26] = 130'h000000000000000000000000000000000;
      expv[27] = 130'h000000000000000000000000000000000;
      expv[28] = 130'h000000000000000000000000000000000;
      expv[29] = 130'h000000000000000000000000000000001;
      expv[30] = 130'h000000000000000000000000000000000;
      expv[31] = 130'h000000000000000000000000000000000;
      expv[32] = 130'h000000000000000000000000000000000;
      expv[33] = 130'h000000000000000000000000000000000;
      expv[34] = 130'h000000000000000000000000000000000;
      expv[35] = 130'h000000000000000000000000000000000;
      expv[36] = 130'h000000000000000000000000000000000;
      expv[37] = 130'h000000000000000000000000000000000;
      expv[38] = 130'h000000000000000000000000000000000;
      expv[39] = 130'h000000000000000000000000000000000;
      expv[40] = 130'h000000000000000000000000000000000;
      expv[41] = 130'h000000000000000000000000000000000;
      expv[42] = 130'h000000000000000000000000000000000;
      expv[43] = 130'h000000000000000000000000000000000;
      expv[44] = 130'h000000000000000000000000000000000;
      expv[45] = 130'h000000000000000000000000000000000;
      expv[46] = 130'h000000000000000000000000000000000;
      expv[47] = 130'h000000000000000000000000000000001;
      expv[48] = 130'h000000000000000000000000000000000;
      expv[49] = 130'h000000000000000000000000000000000;
      expv[50] = 130'h000000000000000000000000000000000;
      expv[51] = 130'h000000000000000000000000000000000;
      expv[52] = 130'h000000000000000000000000000000000;
      expv[53] = 130'h000000000000000000000000000000000;
      expv[54] = 130'h000000000000000000000000000000000;
      expv[55] = 130'h000000000000000000000000000000000;
      expv[56] = 130'h000000000000000000000000000000000;
      expv[57] = 130'h000000000000000000000000000000000;
      expv[58] = 130'h000000000000000000000000000000000;
      expv[59] = 130'h000000000000000000000000000000000;
      expv[60] = 130'h000000000000000000000000000000000;
      expv[61] = 130'h000000000000000000000000000000000;
      expv[62] = 130'h000000000000000000000000000000000;
      expv[63] = 130'h000000000000000000000000000000000;
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
