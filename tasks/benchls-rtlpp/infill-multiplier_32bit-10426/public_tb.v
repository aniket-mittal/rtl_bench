// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10426 dut (
    .clk(clk),
    .E_src1(in_vec[65:34]),
    .E_src2(in_vec[33:2]),
    .M_en(in_vec[1:1]),
    .reset_n(in_vec[0:0]),
    .M_mul_cell_p1(out_vec[95:64]),
    .M_mul_cell_p2(out_vec[63:32]),
    .M_mul_cell_p3(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h0e2d49fbf73cfe806;
    stim[1] = 66'h10f6fc2b92cb8c062;
    stim[2] = 66'h11d2342c7494b3f23;
    stim[3] = 66'h18fd063ee89e915ab;
    stim[4] = 66'h2ef0df87c45241047;
    stim[5] = 66'h3e7b8b70e2571d8dd;
    stim[6] = 66'h15813cd07c82d49d1;
    stim[7] = 66'h254f5127789b89adf;
    stim[8] = 66'h0515feda0ea7b4225;
    stim[9] = 66'h109f3c993fa8222f3;
    stim[10] = 66'h1d77a434b0e9fe22b;
    stim[11] = 66'h395e8904f13113ea9;
    stim[12] = 66'h3a3ee052e5773acc9;
    stim[13] = 66'h0eee2fdfa887cb885;
    stim[14] = 66'h0f97539372f732b0d;
    stim[15] = 66'h37038d5f66a99d175;
    stim[16] = 66'h3c65555b4d68482b9;
    stim[17] = 66'h39e1d4c3d4cdd217d;
    stim[18] = 66'h0f32ca60c3bfe6c1d;
    stim[19] = 66'h092d2dcf1ac5298ef;
    stim[20] = 66'h099eb823d33508e4f;
    stim[21] = 66'h19a57c4ff30bee95b;
    stim[22] = 66'h1daa60b9ec003fafb;
    stim[23] = 66'h3532fef45173e3bb3;
    stim[24] = 66'h17dc17a5139f32a11;
    stim[25] = 66'h28e9e824e2ef01c3b;
    stim[26] = 66'h0114d57a1c111236f;
    stim[27] = 66'h3d99796546bea3b15;
    stim[28] = 66'h1d7393acedff23b71;
    stim[29] = 66'h115cec7ba8fcbcb45;
    stim[30] = 66'h317f54e633c60fbf1;
    stim[31] = 66'h2c776aed8a8aaeb03;
    stim[32] = 66'h1d62b78234a1122ff;
    stim[33] = 66'h0b1a0c9f79418c19f;
    stim[34] = 66'h0367523e43e67cbdf;
    stim[35] = 66'h31bb2081be71410a3;
    stim[36] = 66'h0bc6b061f27440fb1;
    stim[37] = 66'h07d46e43074c641db;
    stim[38] = 66'h3c9df489e203f7f1b;
    stim[39] = 66'h2227d067008f28293;
    stim[40] = 66'h05920deee2e36964f;
    stim[41] = 66'h275d68f464ee882d5;
    stim[42] = 66'h2fb5846a7e38e925d;
    stim[43] = 66'h0191b1bae3d2a387a;
    stim[44] = 66'h38bf574e7e6aa119d;
    stim[45] = 66'h3b90bec0d8e935543;
    stim[46] = 66'h146c3499bc70fcac1;
    stim[47] = 66'h2d9d870bfb2f14f3f;
    stim[48] = 66'h091a8b23da82e8d17;
    stim[49] = 66'h0bceddad4dade4627;
    stim[50] = 66'h263f32133dbdc95e3;
    stim[51] = 66'h33b6ba2dc277e7229;
    stim[52] = 66'h382bdf4d1774650d1;
    stim[53] = 66'h192812ada9f3cd683;
    stim[54] = 66'h324f7082cc76125f5;
    stim[55] = 66'h1cacc26a138194379;
    stim[56] = 66'h00f8b823048aff3bb;
    stim[57] = 66'h0ff168cf7725bebd5;
    stim[58] = 66'h142af294f48e02edb;
    stim[59] = 66'h31500961b10d9d405;
    stim[60] = 66'h38cf51fee0c58b277;
    stim[61] = 66'h14b9f22e5ca6a76ab;
    stim[62] = 66'h160b3abcf4f8abced;
    stim[63] = 66'h048d7d0337feed4f9;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'ha9622948ab740ab239dae840;
      expv[4] = 96'h06c5feee0fdabd9e1b1a2708;
      expv[5] = 96'h0200dc0f088405d702fb83f3;
      expv[6] = 96'h0200dc0f088405d702fb83f3;
      expv[7] = 96'h0200dc0f088405d702fb83f3;
      expv[8] = 96'h0a605a3b3cb015761691bc9b;
      expv[9] = 96'h0a605a3b3cb015761691bc9b;
      expv[10] = 96'h81772170f116b6802382b310;
      expv[11] = 96'h8c9981346eae6efe726e99ac;
      expv[12] = 96'h8c9981346eae6efe726e99ac;
      expv[13] = 96'h8c9981346eae6efe726e99ac;
      expv[14] = 96'h8c9981346eae6efe726e99ac;
      expv[15] = 96'h8c9981346eae6efe726e99ac;
      expv[16] = 96'h8c9981346eae6efe726e99ac;
      expv[17] = 96'h8c9981346eae6efe726e99ac;
      expv[18] = 96'h8c9981346eae6efe726e99ac;
      expv[19] = 96'h8c9981346eae6efe726e99ac;
      expv[20] = 96'h76fb22d44ca464b017d52d7c;
      expv[21] = 96'h1f347f1d43646a6c0558c60e;
      expv[22] = 96'haf98d12ac06a7e914aaab80e;
      expv[23] = 96'h8242597259fed0007613bf6e;
      expv[24] = 96'h8c9612ac44aaf2ff76ccc524;
      expv[25] = 96'h8c9612ac44aaf2ff76ccc524;
      expv[26] = 96'h046ccd0a57a5bcf404828422;
      expv[27] = 96'h1872bd7825ac51a0013b0b01;
      expv[28] = 96'h1872bd7825ac51a0013b0b01;
      expv[29] = 96'h1872bd7825ac51a0013b0b01;
      expv[30] = 96'h1872bd7825ac51a0013b0b01;
      expv[31] = 96'h1872bd7825ac51a0013b0b01;
      expv[32] = 96'h7d4304801c4807dc81bff7c0;
      expv[33] = 96'h3f17e7f8b6950c20216681f6;
      expv[34] = 96'h098bc04b2d2affee08655dd8;
      expv[35] = 96'h4541ca3f047233d10ceb8c7b;
      expv[36] = 96'h021c68f07edbe49e033ac4e0;
      expv[37] = 96'h021c68f07edbe49e033ac4e0;
      expv[38] = 96'h686c0b881519c74c11abff56;
      expv[39] = 96'hb7b2832a6fb10849d3f1310a;
      expv[40] = 96'h292b87f00092989055bae5dc;
      expv[41] = 96'h240b87611e613aff0e693358;
      expv[42] = 96'h240b87611e613aff0e693358;
      expv[43] = 96'h000000000000000000000000;
      expv[44] = 96'h000000000000000000000000;
      expv[45] = 96'h000000000000000000000000;
      expv[46] = 96'hd127eff061b2f6ecc6875ea0;
      expv[47] = 96'hd127eff061b2f6ecc6875ea0;
      expv[48] = 96'h093a07011a1006843bbbcb6a;
      expv[49] = 96'h1c6b0f8b1275202517394e92;
      expv[50] = 96'h437c0bdd195f09631ad9b193;
      expv[51] = 96'h1d50dfa0c13a495416642220;
      expv[52] = 96'h1d50dfa0c13a495416642220;
      expv[53] = 96'h1d50dfa0c13a495416642220;
      expv[54] = 96'h0fa65fc030f9232a15140400;
      expv[55] = 96'h0fa65fc030f9232a15140400;
      expv[56] = 96'h0fa65fc030f9232a15140400;
      expv[57] = 96'hddda92280fef8f8403d6141c;
      expv[58] = 96'hddda92280fef8f8403d6141c;
      expv[59] = 96'h09416802a624582803b0b292;
      expv[60] = 96'h09416802a624582803b0b292;
      expv[61] = 96'h0c8b48ef24dba0922799d869;
      expv[62] = 96'h7b9ebfda59db214a330eb866;
      expv[63] = 96'h7b9ebfda59db214a330eb866;
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
