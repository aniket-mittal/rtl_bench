// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_074377 dut (
    .clk(clk),
    .ready(in_vec[128:128]),
    .line(in_vec[127:0]),
    .char(out_vec[9:2]),
    .writeChar(out_vec[1:1]),
    .home(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h09b6c3680e3bf905f3008806436199b70;
    stim[1] = 129'h1d1cca60f61fc367f6ee16d3d8e220a7a;
    stim[2] = 129'h0f06f2965dfeb529faa9eea066d93bff8;
    stim[3] = 129'h182ad79efcec65bfd1e0af6bac2a4f5c4;
    stim[4] = 129'h04343fdbf14da1c7ed873edfe736f46c0;
    stim[5] = 129'h0074c37fa3639c07fdfef72550c9805f4;
    stim[6] = 129'h119ec65766a340000f641e042d6a7581b;
    stim[7] = 129'h19b9f04b1070499deec178e9c4b13e1c5;
    stim[8] = 129'h16a3ed9b7e65abab05c3fa0738b50b7b3;
    stim[9] = 129'h12d19c917329c67dc94aa1efd1580c79b;
    stim[10] = 129'h1c616b2aaf63657c1150d921f5e6ee142;
    stim[11] = 129'h1e15644b9eb7f32a5546a63514249ea95;
    stim[12] = 129'h04c4cbb01aa3eed114b58be9aeede703f;
    stim[13] = 129'h1b2924b77fd6d48b14a1346b09ca92d73;
    stim[14] = 129'h09db5b299efdecb50bcfb26c1945b1f47;
    stim[15] = 129'h0642e29c6ee0aabad1f3e1cbf56afc677;
    stim[16] = 129'h08cc587030c7707b0c518e065c9be458e;
    stim[17] = 129'h14b4fba291154bc7095157092f2fdbb8c;
    stim[18] = 129'h0d479a0ddcfb587f6c99b7781a98c3963;
    stim[19] = 129'h1c188b4ecbe290ffab67aeb2298cf3f61;
    stim[20] = 129'h0bdef98ae4365ab1e89550ba6e3cf6580;
    stim[21] = 129'h1fd271f9c1dd70f95fd619546ebb3b896;
    stim[22] = 129'h099e21ac8d72f5e15a96dcc3e2dced3e6;
    stim[23] = 129'h0b01783a2f94ae0528c2134247b8458b0;
    stim[24] = 129'h09e961ae598c7c759ea985f79e071b6ac;
    stim[25] = 129'h15f63e36a51bd6f36fc6a66431cac07b7;
    stim[26] = 129'h1bd010e296f4979607b7244128c9b3377;
    stim[27] = 129'h19b2dd53a1781938894a2eadda10f87fe;
    stim[28] = 129'h03812db1ec8f349c9a6b08ed6c8fb8d03;
    stim[29] = 129'h1d94292a8a4090166f07f7164d0f9a72c;
    stim[30] = 129'h0d4f6ba30c4b857a2facff5bad16c6511;
    stim[31] = 129'h14f2b749aea8ff7600fec769716fd099b;
    stim[32] = 129'h123c9ad3971f41f3bdb90129e97b837b2;
    stim[33] = 129'h0cc49fa6a47c3e6a4f1023d9ebf814827;
    stim[34] = 129'h16a32f909dbe9a194fcec022251090f8b;
    stim[35] = 129'h119e89d7542b71384072ee28db365d094;
    stim[36] = 129'h1522987812c576990a94c1e8eebf8f110;
    stim[37] = 129'h0a36dac3148e90c8a0e2f2646e13a14aa;
    stim[38] = 129'h0142db7310213ff7ecec76f0a3d05a7df;
    stim[39] = 129'h04df5610daca3db3aeab39b9163ee63dc;
    stim[40] = 129'h1d0d856b09d6a39079fafc55da4d88399;
    stim[41] = 129'h18e5958169da32a533c02ec758f3b0a6d;
    stim[42] = 129'h0009a69cd20034a8aff2cd51b48098919;
    stim[43] = 129'h153ab8a2c877e0edf0165321fd7f8d626;
    stim[44] = 129'h134483bc6540d22fcab9f38baae0bf469;
    stim[45] = 129'h1ead2e9b95905963a833da1aaed2fa899;
    stim[46] = 129'h135355d833afd5d7f1369fe1df8745e04;
    stim[47] = 129'h1706dd04c57ab80c000aa966cda2230b7;
    stim[48] = 129'h125a7f9e140129d80d998903eeca363d2;
    stim[49] = 129'h19d2400adc5bad5199d6ee3dca69a3dd7;
    stim[50] = 129'h0530677edfbdbe2d474188ff5cde2d82e;
    stim[51] = 129'h111e21b3768d376c5e33bbeda9768cd9a;
    stim[52] = 129'h07ae7e0e702fe9b88c3cf9da07ca7e122;
    stim[53] = 129'h1468e53487728d7570b0dd3c2ce801c81;
    stim[54] = 129'h151f66bc170f2ab0539dff578fb67ed2d;
    stim[55] = 129'h089e76d5274b132edfad0eb1cc9be1f61;
    stim[56] = 129'h0241d259f8a0d81d16a94319ea1abe448;
    stim[57] = 129'h0b4435b9607c6c0fd8ae610f15981d2ae;
    stim[58] = 129'h1d58b5387f92163456ff322feb6b7bdcc;
    stim[59] = 129'h1be56f54db077601ee7e909a153a89f29;
    stim[60] = 129'h10b2cd94f2866250d86928836c78bc088;
    stim[61] = 129'h0eb14394f1ad461822d4c9800768078be;
    stim[62] = 129'h17f8826379db615bac705079bddbb069e;
    stim[63] = 129'h13814161f39ac4106e2f52601b428f6ed;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h1ea;
      expv[3] = 10'h1e8;
      expv[4] = 10'h3d6;
      expv[5] = 10'h3d4;
      expv[6] = 10'h3d4;
      expv[7] = 10'h29e;
      expv[8] = 10'h29e;
      expv[9] = 10'h29e;
      expv[10] = 10'h29e;
      expv[11] = 10'h29e;
      expv[12] = 10'h29e;
      expv[13] = 10'h29c;
      expv[14] = 10'h272;
      expv[15] = 10'h270;
      expv[16] = 10'h270;
      expv[17] = 10'h270;
      expv[18] = 10'h24a;
      expv[19] = 10'h248;
      expv[20] = 10'h3ae;
      expv[21] = 10'h3ac;
      expv[22] = 10'h186;
      expv[23] = 10'h184;
      expv[24] = 10'h184;
      expv[25] = 10'h184;
      expv[26] = 10'h3f2;
      expv[27] = 10'h3f2;
      expv[28] = 10'h3f2;
      expv[29] = 10'h3f0;
      expv[30] = 10'h19a;
      expv[31] = 10'h198;
      expv[32] = 10'h3de;
      expv[33] = 10'h3de;
      expv[34] = 10'h3dc;
      expv[35] = 10'h3a6;
      expv[36] = 10'h3a6;
      expv[37] = 10'h3a6;
      expv[38] = 10'h3a4;
      expv[39] = 10'h3a4;
      expv[40] = 10'h3a4;
      expv[41] = 10'h276;
      expv[42] = 10'h276;
      expv[43] = 10'h274;
      expv[44] = 10'h0b2;
      expv[45] = 10'h0b2;
      expv[46] = 10'h0b2;
      expv[47] = 10'h0b2;
      expv[48] = 10'h0b2;
      expv[49] = 10'h0b2;
      expv[50] = 10'h0b2;
      expv[51] = 10'h0b0;
      expv[52] = 10'h06e;
      expv[53] = 10'h06c;
      expv[54] = 10'h23a;
      expv[55] = 10'h23a;
      expv[56] = 10'h238;
      expv[57] = 10'h238;
      expv[58] = 10'h238;
      expv[59] = 10'h356;
      expv[60] = 10'h356;
      expv[61] = 10'h356;
      expv[62] = 10'h354;
      expv[63] = 10'h355;
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
