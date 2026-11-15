// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03373 dut (
    .CLK(clk),
    .featurebits(in_vec[90:83]),
    .MAPPER(in_vec[82:80]),
    .SNES_ADDR(in_vec[79:56]),
    .SNES_PA(in_vec[55:48]),
    .SAVERAM_MASK(in_vec[47:24]),
    .ROM_MASK(in_vec[23:0]),
    .ROM_ADDR(out_vec[35:12]),
    .ROM_HIT(out_vec[11:11]),
    .IS_SAVERAM(out_vec[10:10]),
    .IS_ROM(out_vec[9:9]),
    .IS_WRITABLE(out_vec[8:8]),
    .msu_enable(out_vec[7:7]),
    .r213f_enable(out_vec[6:6]),
    .snescmd_enable(out_vec[5:5]),
    .nmicmd_enable(out_vec[4:4]),
    .return_vector_enable(out_vec[3:3]),
    .branch1_enable(out_vec[2:2]),
    .branch2_enable(out_vec[1:1]),
    .obc1_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h01b5c3ca2563d0df8ac3f37;
    stim[1] = 91'h11fe87fd12f68e32f0932ec;
    stim[2] = 91'h206dcefb2c79f88be01a984;
    stim[3] = 91'h69e6eeb3a78209c6e0ee636;
    stim[4] = 91'h4a436a9fb836980e67a7017;
    stim[5] = 91'h467d0ebd12ef703e9250999;
    stim[6] = 91'h0762af94f1d4bc2b881c1df;
    stim[7] = 91'h3050bc5e6501ff10372837d;
    stim[8] = 91'h4c0323c9703762f6801b1d7;
    stim[9] = 91'h6d85249aa3763f14f2ea653;
    stim[10] = 91'h0c31080272862c051c5cc54;
    stim[11] = 91'h403e902830daae54331f82f;
    stim[12] = 91'h73a6a0f2ec14789f635d54e;
    stim[13] = 91'h7394b46aab113c988d3c7f4;
    stim[14] = 91'h729332a21f5123b8bf3f3aa;
    stim[15] = 91'h3acba5b6627741fce371a34;
    stim[16] = 91'h19ecd63aef842571174b947;
    stim[17] = 91'h6925517d99af4da18c9667e;
    stim[18] = 91'h55ec60786eea917aa968c19;
    stim[19] = 91'h00123450d77edee93531b9e;
    stim[20] = 91'h15161f0e8c71b8a249862d0;
    stim[21] = 91'h47f1e962791d77a8a7cb599;
    stim[22] = 91'h42ea870fc76cff7ab4881e1;
    stim[23] = 91'h59a95e86512e063c3b44286;
    stim[24] = 91'h7ab35f0094f2b5543af54c5;
    stim[25] = 91'h58d6216937de767d60a3241;
    stim[26] = 91'h55f2d7507823a17b5a8c7dd;
    stim[27] = 91'h40ea7552cf89e9bff49c8a0;
    stim[28] = 91'h080eedee5ea44d3f078c592;
    stim[29] = 91'h5b92e919fd8d1daac01c40a;
    stim[30] = 91'h6b3e97737b3a9afe4c15595;
    stim[31] = 91'h1d865409bc9868c6924c2c0;
    stim[32] = 91'h35bbd59795b00e5c5e2cd2e;
    stim[33] = 91'h0254c004c512fd5626ecc05;
    stim[34] = 91'h66cfa997e3dc631aaacc2e6;
    stim[35] = 91'h6860c31faef7f96c051fe8c;
    stim[36] = 91'h2d70652c18728381c299707;
    stim[37] = 91'h42de5f0e030228e1ff6e3c0;
    stim[38] = 91'h33bde78fe470cfad376a769;
    stim[39] = 91'h51adfd864cb2c8c28d4e9d5;
    stim[40] = 91'h7a9730072affe136859a63d;
    stim[41] = 91'h0296184d48c94cad461e4ae;
    stim[42] = 91'h1021077078901dcc209a804;
    stim[43] = 91'h5b0a42a96f4f28cd0bdda91;
    stim[44] = 91'h299f242d29e7dfb2b87563c;
    stim[45] = 91'h7c45ddbb8b830704119a357;
    stim[46] = 91'h7f5158ca8beff91a570fb79;
    stim[47] = 91'h2ffdf9351f2ca7705affd46;
    stim[48] = 91'h0131d64914bef65d2cdb276;
    stim[49] = 91'h569328eb53073cd28a0316f;
    stim[50] = 91'h59266baa9e2a573efb22b2a;
    stim[51] = 91'h64daba40ca0b1f16101a871;
    stim[52] = 91'h677b35d1f739cfc36105508;
    stim[53] = 91'h68f8a1daee993e234be6e17;
    stim[54] = 91'h177b8657accc1daa78969af;
    stim[55] = 91'h13a9c24ef3d5e04a4f28ecd;
    stim[56] = 91'h7f3ccf7067edc265ed0d403;
    stim[57] = 91'h7115d6254e91c86afd15fcc;
    stim[58] = 91'h3937dfa512ce99f9562ffb5;
    stim[59] = 91'h1da78fbcf3fd74f49205ef8;
    stim[60] = 91'h6d8292f67941db604d9390e;
    stim[61] = 91'h0d28bae4e62cda453a7e317;
    stim[62] = 91'h7fc774a78407a9ea6449224;
    stim[63] = 91'h2a159c9f5fe451616c0e28c;
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
      expv[0] = 36'h000000a00;
      expv[1] = 36'h000000a00;
      expv[2] = 36'h000000a00;
      expv[3] = 36'h000000a00;
      expv[4] = 36'h000000a00;
      expv[5] = 36'h000000a00;
      expv[6] = 36'h000000a00;
      expv[7] = 36'h000000a00;
      expv[8] = 36'h003097000;
      expv[9] = 36'h020002a00;
      expv[10] = 36'h000000a00;
      expv[11] = 36'h000000a00;
      expv[12] = 36'h20050ea00;
      expv[13] = 36'h01c6a0a00;
      expv[14] = 36'h11a220020;
      expv[15] = 36'h000000000;
      expv[16] = 36'h000000a00;
      expv[17] = 36'h410658a00;
      expv[18] = 36'h000000a00;
      expv[19] = 36'h11010c000;
      expv[20] = 36'h1060c0a00;
      expv[21] = 36'h000000a00;
      expv[22] = 36'h000000000;
      expv[23] = 36'h144004a00;
      expv[24] = 36'h000000a00;
      expv[25] = 36'h000000a00;
      expv[26] = 36'h000000000;
      expv[27] = 36'h000000000;
      expv[28] = 36'h68c480a00;
      expv[29] = 36'h01000aa00;
      expv[30] = 36'h000000a00;
      expv[31] = 36'h244080a00;
      expv[32] = 36'h000000000;
      expv[33] = 36'h000000a00;
      expv[34] = 36'h000000a00;
      expv[35] = 36'h000000000;
      expv[36] = 36'h000000000;
      expv[37] = 36'h000000a00;
      expv[38] = 36'h000000a00;
      expv[39] = 36'h14c844a00;
      expv[40] = 36'h198030a00;
      expv[41] = 36'h208484a00;
      expv[42] = 36'h002004000;
      expv[43] = 36'h240a90020;
      expv[44] = 36'he94202f00;
      expv[45] = 36'h000000a00;
      expv[46] = 36'h000000a00;
      expv[47] = 36'h000000a00;
      expv[48] = 36'h000000000;
      expv[49] = 36'h000025a00;
      expv[50] = 36'h222a28a00;
      expv[51] = 36'h000000a00;
      expv[52] = 36'h000000000;
      expv[53] = 36'h000000000;
      expv[54] = 36'h000000000;
      expv[55] = 36'h1004cd000;
      expv[56] = 36'h000000a00;
      expv[57] = 36'h004244a00;
      expv[58] = 36'h000000a00;
      expv[59] = 36'h205ac8a40;
      expv[60] = 36'h092906000;
      expv[61] = 36'h03a206a00;
      expv[62] = 36'h000000a00;
      expv[63] = 36'h00c084a00;
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
