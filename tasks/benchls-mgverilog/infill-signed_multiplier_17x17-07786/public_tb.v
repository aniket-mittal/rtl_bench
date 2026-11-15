// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07786 dut (
    .clk(clk),
    .a(in_vec[33:17]),
    .b(in_vec[16:0]),
    .p(out_vec[33:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h13d98b7e8;
    stim[1] = 34'h38203ae96;
    stim[2] = 34'h063897036;
    stim[3] = 34'h3efafa702;
    stim[4] = 34'h3a8dc3e62;
    stim[5] = 34'h315f8f19b;
    stim[6] = 34'h38a7c1cc7;
    stim[7] = 34'h07bcdd21e;
    stim[8] = 34'h02bb90cf6;
    stim[9] = 34'h0df841b1d;
    stim[10] = 34'h212cf3fe0;
    stim[11] = 34'h03f536c7b;
    stim[12] = 34'h275f37f91;
    stim[13] = 34'h01c79ec18;
    stim[14] = 34'h13fdced78;
    stim[15] = 34'h0a00635de;
    stim[16] = 34'h15a2202aa;
    stim[17] = 34'h27e5297d3;
    stim[18] = 34'h3b6a3d1a0;
    stim[19] = 34'h34e7b6293;
    stim[20] = 34'h3921a2b72;
    stim[21] = 34'h0145e3f14;
    stim[22] = 34'h3975dda4e;
    stim[23] = 34'h1771da196;
    stim[24] = 34'h0a947d81e;
    stim[25] = 34'h0219ccecb;
    stim[26] = 34'h0f11774de;
    stim[27] = 34'h13c80ab5a;
    stim[28] = 34'h06a2855d7;
    stim[29] = 34'h197789e95;
    stim[30] = 34'h23c8e2eff;
    stim[31] = 34'h1684e61ad;
    stim[32] = 34'h20ca95b8a;
    stim[33] = 34'h3a72ef73b;
    stim[34] = 34'h3eb28e3dc;
    stim[35] = 34'h107065690;
    stim[36] = 34'h3cad858f5;
    stim[37] = 34'h3ab75bf70;
    stim[38] = 34'h061b8b98c;
    stim[39] = 34'h38c19531d;
    stim[40] = 34'h0975331a4;
    stim[41] = 34'h093bcb108;
    stim[42] = 34'h1d7d73b84;
    stim[43] = 34'h34b46c9b3;
    stim[44] = 34'h1f038fe0a;
    stim[45] = 34'h25e373cc3;
    stim[46] = 34'h06142b0c6;
    stim[47] = 34'h31d8dd680;
    stim[48] = 34'h033cfaba0;
    stim[49] = 34'h17001f45b;
    stim[50] = 34'h3b4b2bf55;
    stim[51] = 34'h0c6bac5ec;
    stim[52] = 34'h0e6ef8c33;
    stim[53] = 34'h01ac7ddd2;
    stim[54] = 34'h2d7b82997;
    stim[55] = 34'h12396dd5b;
    stim[56] = 34'h0172c4f02;
    stim[57] = 34'h31fd771ce;
    stim[58] = 34'h0b98359a5;
    stim[59] = 34'h15a5edc6a;
    stim[60] = 34'h1573bb446;
    stim[61] = 34'h2cbfe80e7;
    stim[62] = 34'h154fa7c58;
    stim[63] = 34'h24779ce2c;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h07213bce0;
      expv[2] = 34'h01408c496;
      expv[3] = 34'h3e40c3f58;
      expv[4] = 34'h002d630ae;
      expv[5] = 34'h3f561f61c;
      expv[6] = 34'h391906294;
      expv[7] = 34'h3f9651b32;
      expv[8] = 34'h3f4e7ecf4;
      expv[9] = 34'h3eb3f5168;
      expv[10] = 34'h00bd61efa;
      expv[11] = 34'h0b9119320;
      expv[12] = 34'h3edc18233;
      expv[13] = 34'h062d8ee09;
      expv[14] = 34'h3fee4a5a0;
      expv[15] = 34'h0945a4d90;
      expv[16] = 34'h010d6019a;
      expv[17] = 34'h001cd0f4a;
      expv[18] = 34'h38da23dcb;
      expv[19] = 34'h006a533a0;
      expv[20] = 34'h036956207;
      expv[21] = 34'h3f6acb6ca;
      expv[22] = 34'h002825cac;
      expv[23] = 34'h007b43b04;
      expv[24] = 34'h3bad43334;
      expv[25] = 34'h3f2d0731a;
      expv[26] = 34'h00d93175a;
      expv[27] = 34'h3be7c848a;
      expv[28] = 34'h069ec6280;
      expv[29] = 34'h011cc37cc;
      expv[30] = 34'h07e349c6c;
      expv[31] = 34'h3d68feab9;
      expv[32] = 34'h044bc855b;
      expv[33] = 34'h0a0654548;
      expv[34] = 34'h3d51c74cd;
      expv[35] = 34'h3f6b94730;
      expv[36] = 34'h02c77fbb0;
      expv[37] = 34'h3f6c3b05c;
      expv[38] = 34'h00aa94760;
      expv[39] = 34'h02369b450;
      expv[40] = 34'h02723535c;
      expv[41] = 34'h3c302d144;
      expv[42] = 34'h03314ccf0;
      expv[43] = 34'h34aedce2c;
      expv[44] = 34'h3b8cdcbf9;
      expv[45] = 34'h0f6357918;
      expv[46] = 34'h09f503591;
      expv[47] = 34'h021944c86;
      expv[48] = 34'h0125ae700;
      expv[49] = 34'h3f7767d60;
      expv[50] = 34'h3f7a16800;
      expv[51] = 34'h3e3dbe68d;
      expv[52] = 34'h04cd22abc;
      expv[53] = 34'h3cbc514b5;
      expv[54] = 34'h3fe367236;
      expv[55] = 34'h3e7eedac4;
      expv[56] = 34'h07e101229;
      expv[57] = 34'h00393612c;
      expv[58] = 34'h03e418a1a;
      expv[59] = 34'h3c3b9e165;
      expv[60] = 34'h0951c1976;
      expv[61] = 34'h3cd3c50ee;
      expv[62] = 34'h3b2748919;
      expv[63] = 34'h052cf26f8;
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
