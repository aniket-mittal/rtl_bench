// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02280 dut (
    .ph_seg_p_1_1_1_V_read(in_vec[29:18]),
    .th_seg_p_1_1_0_V_read(in_vec[17:11]),
    .th_seg_p_1_1_1_V_read(in_vec[10:4]),
    .cpat_seg_p_1_1_1_V_read(in_vec[3:0]),
    .ap_return_0(out_vec[29:18]),
    .ap_return_1(out_vec[17:14]),
    .ap_return_2(out_vec[13:7]),
    .ap_return_3(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3019d63f;
    stim[1] = 30'h060ee0ac;
    stim[2] = 30'h363cbbb1;
    stim[3] = 30'h00a30cfe;
    stim[4] = 30'h186c749b;
    stim[5] = 30'h0dff9e7c;
    stim[6] = 30'h0d236ea6;
    stim[7] = 30'h23b3087e;
    stim[8] = 30'h1cc4b0fa;
    stim[9] = 30'h384b6d36;
    stim[10] = 30'h17b2b4ca;
    stim[11] = 30'h1d9578a8;
    stim[12] = 30'h1d359772;
    stim[13] = 30'h17286214;
    stim[14] = 30'h1f2c2552;
    stim[15] = 30'h3f58cff0;
    stim[16] = 30'h019cd618;
    stim[17] = 30'h1f844a80;
    stim[18] = 30'h20a1e4d7;
    stim[19] = 30'h3f827575;
    stim[20] = 30'h3af4dea5;
    stim[21] = 30'h364f9e07;
    stim[22] = 30'h0316fa82;
    stim[23] = 30'h29b967a3;
    stim[24] = 30'h17fe66d5;
    stim[25] = 30'h103365a5;
    stim[26] = 30'h3436d49a;
    stim[27] = 30'h37837477;
    stim[28] = 30'h06b6346e;
    stim[29] = 30'h38368086;
    stim[30] = 30'h11c3c05f;
    stim[31] = 30'h2cf22744;
    stim[32] = 30'h131404f1;
    stim[33] = 30'h3781a2d0;
    stim[34] = 30'h0d548d57;
    stim[35] = 30'h153e8547;
    stim[36] = 30'h27c4a857;
    stim[37] = 30'h25f06032;
    stim[38] = 30'h314c49ed;
    stim[39] = 30'h302f3baa;
    stim[40] = 30'h1fbe1367;
    stim[41] = 30'h3207e1fc;
    stim[42] = 30'h3144570a;
    stim[43] = 30'h2c630be2;
    stim[44] = 30'h0744f96d;
    stim[45] = 30'h25572021;
    stim[46] = 30'h35ea9320;
    stim[47] = 30'h2fbd36d4;
    stim[48] = 30'h0bc9ee29;
    stim[49] = 30'h368a8209;
    stim[50] = 30'h3a71d04f;
    stim[51] = 30'h3334e715;
    stim[52] = 30'h3ced7807;
    stim[53] = 30'h0d89664a;
    stim[54] = 30'h1cef7388;
    stim[55] = 30'h0359d762;
    stim[56] = 30'h2ce9186a;
    stim[57] = 30'h2656c289;
    stim[58] = 30'h06a6b9b7;
    stim[59] = 30'h11ec3f92;
    stim[60] = 30'h08c117c1;
    stim[61] = 30'h337ccb9d;
    stim[62] = 30'h0a41a1b4;
    stim[63] = 30'h0782561a;
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
      expv[0] = 30'h301bdd63;
      expv[1] = 30'h060f2e0a;
      expv[2] = 30'h363c4bbb;
      expv[3] = 30'h00a3b0cf;
      expv[4] = 30'h186ec749;
      expv[5] = 30'h0dff39e7;
      expv[6] = 30'h0d21b6ea;
      expv[7] = 30'h23b3b087;
      expv[8] = 30'h1cc68b0f;
      expv[9] = 30'h3849b6d3;
      expv[10] = 30'h17b2ab4c;
      expv[11] = 30'h1d96178a;
      expv[12] = 30'h1d349977;
      expv[13] = 30'h17290621;
      expv[14] = 30'h1f2c8255;
      expv[15] = 30'h3f580cff;
      expv[16] = 30'h019e0d61;
      expv[17] = 30'h1f8404a8;
      expv[18] = 30'h20a1de4d;
      expv[19] = 30'h3f816757;
      expv[20] = 30'h3af54dea;
      expv[21] = 30'h364df9e0;
      expv[22] = 30'h0314afa8;
      expv[23] = 30'h29b8d67a;
      expv[24] = 30'h17fd666d;
      expv[25] = 30'h1031765a;
      expv[26] = 30'h3436ad49;
      expv[27] = 30'h3781f747;
      expv[28] = 30'h06b7a346;
      expv[29] = 30'h3835a808;
      expv[30] = 30'h11c3fc05;
      expv[31] = 30'h2cf12274;
      expv[32] = 30'h1314404f;
      expv[33] = 30'h37801a2d;
      expv[34] = 30'h0d55c8d5;
      expv[35] = 30'h153de854;
      expv[36] = 30'h27c5ca85;
      expv[37] = 30'h25f08603;
      expv[38] = 30'h314f449e;
      expv[39] = 30'h302eb3ba;
      expv[40] = 30'h1fbde136;
      expv[41] = 30'h32073e1f;
      expv[42] = 30'h31468570;
      expv[43] = 30'h2c60b0be;
      expv[44] = 30'h07474f96;
      expv[45] = 30'h25547202;
      expv[46] = 30'h35e82932;
      expv[47] = 30'h2fbd136d;
      expv[48] = 30'h0bca5ee2;
      expv[49] = 30'h368a6820;
      expv[50] = 30'h3a73dd04;
      expv[51] = 30'h33354e71;
      expv[52] = 30'h3cedd780;
      expv[53] = 30'h0d8a9664;
      expv[54] = 30'h1cee3738;
      expv[55] = 30'h03589d76;
      expv[56] = 30'h2cea9186;
      expv[57] = 30'h26566c28;
      expv[58] = 30'h06a5eb9b;
      expv[59] = 30'h11ec83f9;
      expv[60] = 30'h08c0517c;
      expv[61] = 30'h337f4cb9;
      expv[62] = 30'h0a411a1b;
      expv[63] = 30'h0782a561;
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
