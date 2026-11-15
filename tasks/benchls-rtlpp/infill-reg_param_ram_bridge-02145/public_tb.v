// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 85;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02145 dut (
    .clk(clk),
    .regReq(in_vec[84:84]),
    .regWriteEn(in_vec[83:83]),
    .regAddr(in_vec[82:71]),
    .regWData(in_vec[70:39]),
    .regWStrb(in_vec[38:35]),
    .paramAddrValid(in_vec[34:34]),
    .paramAddr(in_vec[33:2]),
    .paramDataStop(in_vec[1:1]),
    .srst(in_vec[0:0]),
    .regAck(out_vec[66:66]),
    .regRData(out_vec[65:34]),
    .paramAddrStop(out_vec[33:33]),
    .paramDataValid(out_vec[32:32]),
    .paramData(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 85'h05b76620bcc98fc772ae39;
    stim[1] = 85'h1365f8af3ee259c35838c3;
    stim[2] = 85'h0ee33ab54adc7779dfb770;
    stim[3] = 85'h1519ba2e34365015df831a;
    stim[4] = 85'h030f93f34a376b99b08b24;
    stim[5] = 85'h1e2a53940cbf146db4879a;
    stim[6] = 85'h0b061788b23c164e7fecbc;
    stim[7] = 85'h18203c3a82a26ee63a1e04;
    stim[8] = 85'h1de74311256107e4f08a1e;
    stim[9] = 85'h1d91d2ebfa7e08d2e0c5f4;
    stim[10] = 85'h0676e73ebd330510036dc8;
    stim[11] = 85'h0eaec56db97d9152110d8f;
    stim[12] = 85'h19c989b7cfd24ad7e205a6;
    stim[13] = 85'h06148b85d57441ac854414;
    stim[14] = 85'h17477c1c471f45e5048efc;
    stim[15] = 85'h0f9eb87328afbad6f7ac58;
    stim[16] = 85'h13ee51f21ddf6cbfc14f6e;
    stim[17] = 85'h0a669b6c79bcba6a062a86;
    stim[18] = 85'h0dba45bf6ab40026d97fa8;
    stim[19] = 85'h120a9231d0cdbfbd035366;
    stim[20] = 85'h16c1b625c963527e3d6fd4;
    stim[21] = 85'h0a7653a4f7c63e371e4652;
    stim[22] = 85'h021999250e62d9287b4770;
    stim[23] = 85'h1de758a6efb473ae8c1dbe;
    stim[24] = 85'h1366427ab5a3541cdd5d64;
    stim[25] = 85'h160926aa062c4f438b11ea;
    stim[26] = 85'h02f29630134355ace68a34;
    stim[27] = 85'h153bb1cfcfcb869589cd32;
    stim[28] = 85'h02e26d5ff5c9ff5abb5f26;
    stim[29] = 85'h1ae89d4fe2ebd0744eba0c;
    stim[30] = 85'h1fd48c7d1ade26d791517e;
    stim[31] = 85'h0c901f2ba85b8bb2a81bf6;
    stim[32] = 85'h00e0edad827ce761402972;
    stim[33] = 85'h184987bea5a2a114ce0bba;
    stim[34] = 85'h092e8673f81e81cf24d1e2;
    stim[35] = 85'h0a621e9f225795eec874ec;
    stim[36] = 85'h07a0489365f7bc5af26b26;
    stim[37] = 85'h0d00aae4ed85d77e21c38c;
    stim[38] = 85'h0f7bc3d0eaff95eb6b4384;
    stim[39] = 85'h1c6fcb10328f6bbaaeb490;
    stim[40] = 85'h05d5e8bc18029468229dae;
    stim[41] = 85'h074787ec4565f1a3406ee6;
    stim[42] = 85'h1c763477acbb0f1b618482;
    stim[43] = 85'h1be2ea777696a3f7f4fab8;
    stim[44] = 85'h030fb3aea0f9dae5e72690;
    stim[45] = 85'h05a0d6821242eae796f278;
    stim[46] = 85'h05ece07414534357e3ac70;
    stim[47] = 85'h19b0fbdd441a94555bce34;
    stim[48] = 85'h1d02606202d901d0c8915e;
    stim[49] = 85'h08395380b2c1b99baf2ac8;
    stim[50] = 85'h1362325c4e13fe733216a8;
    stim[51] = 85'h167af2d136f898a1cab8d4;
    stim[52] = 85'h048cb27193a4a218557818;
    stim[53] = 85'h00be56c6236eff4310aafc;
    stim[54] = 85'h1fd910659d7e9fc272675a;
    stim[55] = 85'h0d8e9be9a8235cd4a9eb6c;
    stim[56] = 85'h1d4fe535db9761660e866a;
    stim[57] = 85'h0c1017088bf478c3dec28a;
    stim[58] = 85'h15fea32bb7b7cec74717d4;
    stim[59] = 85'h0866b77df17d8e44cdfda4;
    stim[60] = 85'h09472ec85b9e249fd43ea8;
    stim[61] = 85'h1fc7c7c3c7e5c7d000a3da;
    stim[62] = 85'h02a5e1b223281ded1a94f2;
    stim[63] = 85'h1346986f7903e15731cb22;
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
      expv[0] = 67'hxxxxxxxxxxxxxxxxx;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h000000002xxxxxxxx;
      expv[4] = 67'h000000000xxxxxxxx;
      expv[5] = 67'h000000000xxxxxxxx;
      expv[6] = 67'h000000002xxxxxxxx;
      expv[7] = 67'hxxxxxxxxxxxxxxxxx;
      expv[8] = 67'h000000002xxxxxxxx;
      expv[9] = 67'h400000000xxxxxxxx;
      expv[10] = 67'h000000001xxxxxxxx;
      expv[11] = 67'h000000002xxxxxxxx;
      expv[12] = 67'h00000000000000000;
      expv[13] = 67'h0000000007875xx44;
      expv[14] = 67'h4000000007875xx44;
      expv[15] = 67'h0000000027875xx44;
      expv[16] = 67'h0000000007875xx44;
      expv[17] = 67'h0000000027875xx44;
      expv[18] = 67'hxxxxxxxxx7875xx44;
      expv[19] = 67'h0000000017875xx44;
      expv[20] = 67'hxxxxxxxxx7875xx44;
      expv[21] = 67'h0000000007875xx44;
      expv[22] = 67'h0000000037875xx44;
      expv[23] = 67'hxxxxxxxxx7875xx44;
      expv[24] = 67'h0000000017875xx44;
      expv[25] = 67'h4000000027875xx44;
      expv[26] = 67'h0000000017875xx44;
      expv[27] = 67'h0000000027875xx44;
      expv[28] = 67'h0000000007875xx44;
      expv[29] = 67'h0000000037875xx44;
      expv[30] = 67'h0000000007875xx44;
      expv[31] = 67'hxxxxxxxxx7875xx44;
      expv[32] = 67'h0000000017875xx44;
      expv[33] = 67'h0000000037875xx44;
      expv[34] = 67'h0000000017875xx44;
      expv[35] = 67'h4000000017875xx44;
      expv[36] = 67'h0000000027875xx44;
      expv[37] = 67'h0000000017875xx44;
      expv[38] = 67'h0000000027875xx44;
      expv[39] = 67'h0000000017875xx44;
      expv[40] = 67'h0000000007875xx44;
      expv[41] = 67'h4000000037875xx44;
      expv[42] = 67'h0000000017875xx44;
      expv[43] = 67'h0000000037875xx44;
      expv[44] = 67'h4000000027875xx44;
      expv[45] = 67'h0000000017875xx44;
      expv[46] = 67'h0000000007875xx44;
      expv[47] = 67'h0000000017875xx44;
      expv[48] = 67'h0000000027875xx44;
      expv[49] = 67'h4000000017875xx44;
      expv[50] = 67'h0000000007875xx44;
      expv[51] = 67'h0000000037875xx44;
      expv[52] = 67'h0000000007875xx44;
      expv[53] = 67'h0000000017875xx44;
      expv[54] = 67'hxxxxxxxxx7875xx44;
      expv[55] = 67'h0000000017875xx44;
      expv[56] = 67'h4000000027875xx44;
      expv[57] = 67'h0000000007875xx44;
      expv[58] = 67'h4000000017875xx44;
      expv[59] = 67'h0000000027875xx44;
      expv[60] = 67'h0000000017875xx44;
      expv[61] = 67'h0000000027875xx44;
      expv[62] = 67'hxxxxxxxxx7875xx44;
      expv[63] = 67'h4000000037875xx44;
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
