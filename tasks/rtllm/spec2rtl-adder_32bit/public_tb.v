// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  adder_32bit dut (
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .S(out_vec[32:1]),
    .C32(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h444954b184cc5565;
    stim[1] = 64'h767329b39471c0cb;
    stim[2] = 64'hf0da8adc3a36b15a;
    stim[3] = 64'haba02ffbcfd753ec;
    stim[4] = 64'h4793af7f2e44f163;
    stim[5] = 64'h5a7d96db34de4cc8;
    stim[6] = 64'hd80e9055ee1f30ec;
    stim[7] = 64'hb4cb4e0418899418;
    stim[8] = 64'hf8fa93d779d2f8d0;
    stim[9] = 64'hc5f602f41614d356;
    stim[10] = 64'h72c6d9f24f2a8132;
    stim[11] = 64'h3b30868448387e9e;
    stim[12] = 64'hdfc9fe0bef031acd;
    stim[13] = 64'h3754dc6b470c1507;
    stim[14] = 64'h92335e97f0d3c697;
    stim[15] = 64'hf93a016833e63414;
    stim[16] = 64'ha5befdb5868f3817;
    stim[17] = 64'hdf94096a556d41dc;
    stim[18] = 64'ha7ea0c87efd8f855;
    stim[19] = 64'ha892f940ee810116;
    stim[20] = 64'h4f1d8e225e8a163c;
    stim[21] = 64'h39e846ab4140ddd6;
    stim[22] = 64'hb9d4a47502ef9b24;
    stim[23] = 64'h7ad6efd3b2d02715;
    stim[24] = 64'haaac4161074d4597;
    stim[25] = 64'h8961917899b9c0d9;
    stim[26] = 64'hb93fedd3febfba39;
    stim[27] = 64'h224878b0d138335f;
    stim[28] = 64'h227e48d6099f600e;
    stim[29] = 64'h1ea2cd46d5213290;
    stim[30] = 64'hbd45c3a265b8c3a7;
    stim[31] = 64'hd5de0645ac138919;
    stim[32] = 64'h4b9c61683b0e07e3;
    stim[33] = 64'h942bfcd6ecf040ad;
    stim[34] = 64'h50733218593fd534;
    stim[35] = 64'h4839ca5878ab4ffa;
    stim[36] = 64'ha3773d96948c977f;
    stim[37] = 64'hb60dc0bc602a7dcf;
    stim[38] = 64'h3c4444ec0442cf17;
    stim[39] = 64'h39b712ea9e482ac2;
    stim[40] = 64'hd4c4b274215a59b9;
    stim[41] = 64'h6682f08cf8b0f40e;
    stim[42] = 64'hb196898008bac2c0;
    stim[43] = 64'h0f9ffd67d0e5387c;
    stim[44] = 64'h5ba1319aceb00707;
    stim[45] = 64'hd9d67ddaafd7c566;
    stim[46] = 64'had5510760637db24;
    stim[47] = 64'hbdbc96cb6d2744b8;
    stim[48] = 64'hf858eaff96619662;
    stim[49] = 64'h9d5311afbcf4292e;
    stim[50] = 64'h307a768b9e26927d;
    stim[51] = 64'he43131fefcf236fd;
    stim[52] = 64'he506023391e7dcab;
    stim[53] = 64'h6ab3b2e998848671;
    stim[54] = 64'h160c2bbc6adbe789;
    stim[55] = 64'h8295284b05ca2cf1;
    stim[56] = 64'h23476b4c0f67fc8b;
    stim[57] = 64'hacc970e4e738333d;
    stim[58] = 64'h54e818d34ede6e04;
    stim[59] = 64'h7fe1016bb2fb7e36;
    stim[60] = 64'h01b30144f8520b89;
    stim[61] = 64'h35546a184ae2964a;
    stim[62] = 64'h25f51a4b1982d67b;
    stim[63] = 64'h5a8563d3c2a66271;
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
      expv[0] = 33'h1922b542c;
      expv[1] = 33'h015c9d4fd;
      expv[2] = 33'h05622786d;
      expv[3] = 33'h0f6ef07cf;
      expv[4] = 33'h0ebb141c4;
      expv[5] = 33'h11eb7c746;
      expv[6] = 33'h18c5b8283;
      expv[7] = 33'h19aa9c438;
      expv[8] = 33'h0e59b194f;
      expv[9] = 33'h1b815ac94;
      expv[10] = 33'h183e2b648;
      expv[11] = 33'h106d20a44;
      expv[12] = 33'h19d9a31b1;
      expv[13] = 33'h0fcc1e2e4;
      expv[14] = 33'h1060e4a5d;
      expv[15] = 33'h05a406af9;
      expv[16] = 33'h0589c6b99;
      expv[17] = 33'h06a02968d;
      expv[18] = 33'h12f8609b9;
      expv[19] = 33'h12e27f4ad;
      expv[20] = 33'h15b4f48bc;
      expv[21] = 33'h0f6524902;
      expv[22] = 33'h179887f32;
      expv[23] = 33'h05b4e2dd1;
      expv[24] = 33'h163f30df0;
      expv[25] = 33'h04636a4a3;
      expv[26] = 33'h16fff5019;
      expv[27] = 33'h1e701581e;
      expv[28] = 33'h0583b51c8;
      expv[29] = 33'h1e787ffac;
      expv[30] = 33'h045fd0e93;
      expv[31] = 33'h103e31ebd;
      expv[32] = 33'h10d54d296;
      expv[33] = 33'h102387b07;
      expv[34] = 33'h153660e98;
      expv[35] = 33'h181ca34a4;
      expv[36] = 33'h07007aa2b;
      expv[37] = 33'h02c707d17;
      expv[38] = 33'h0810e2806;
      expv[39] = 33'h1affe7b58;
      expv[40] = 33'h1ec3e185a;
      expv[41] = 33'h0be67c935;
      expv[42] = 33'h174a29880;
      expv[43] = 33'h1c10a6bc6;
      expv[44] = 33'h054a27143;
      expv[45] = 33'h1135c8681;
      expv[46] = 33'h16719d734;
      expv[47] = 33'h055c7b707;
      expv[48] = 33'h11d7502c3;
      expv[49] = 33'h0b48e75bb;
      expv[50] = 33'h19d421210;
      expv[51] = 33'h1c246d1f7;
      expv[52] = 33'h0eddbbdbd;
      expv[53] = 33'h0067072b5;
      expv[54] = 33'h101d0268a;
      expv[55] = 33'h110beaa78;
      expv[56] = 33'h0655ecfae;
      expv[57] = 33'h128034843;
      expv[58] = 33'h1478d0dae;
      expv[59] = 33'h065b8ff43;
      expv[60] = 33'h1f40a199a;
      expv[61] = 33'h1006e00c4;
      expv[62] = 33'h07eefe18c;
      expv[63] = 33'h03a578c89;
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
