// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 117;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091485 dut (
    .clk(clk),
    .rn_num(in_vec[116:113]),
    .rm_num(in_vec[112:109]),
    .rs_num(in_vec[108:105]),
    .rd_num(in_vec[104:101]),
    .rd_data(in_vec[100:69]),
    .pc_in(in_vec[68:37]),
    .cpsr_in(in_vec[36:5]),
    .rd_we(in_vec[4:4]),
    .pc_we(in_vec[3:3]),
    .cpsr_we(in_vec[2:2]),
    .rst_b(in_vec[1:1]),
    .halted(in_vec[0:0]),
    .rn_data(out_vec[159:128]),
    .rm_data(out_vec[127:96]),
    .rs_data(out_vec[95:64]),
    .pc_out(out_vec[63:32]),
    .cpsr_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 117'h17dfb72c4d18f6a31e500514b180dd;
    stim[1] = 117'h189737bbce34bb51f81dfa6ae6fea5;
    stim[2] = 117'h08df4628287b6f7787780df83a8cd2;
    stim[3] = 117'h08b0f7cc28922cefd13e605a3005e2;
    stim[4] = 117'h11b9308186ea7134de24e1ad021f06;
    stim[5] = 117'h16a48df38f8775a59e6020b3dca506;
    stim[6] = 117'h1f4bbcf5cefe168daae44a50cabe22;
    stim[7] = 117'h066294f159563f344f98334b213622;
    stim[8] = 117'h0f758548c35de705cfca5fd7aff34e;
    stim[9] = 117'h1fdd5d741b3cad195e0759f588a356;
    stim[10] = 117'h146f29ace37a7c212faa29e6fe8e37;
    stim[11] = 117'h1ae8b6ed298b15cc4553c0fa5ddf72;
    stim[12] = 117'h11a3b1e7cf3017832f56dab3a72693;
    stim[13] = 117'h02790d72c6e00492bda633b7ea0767;
    stim[14] = 117'h1ef74b7c6d78a0856af09fa693a20e;
    stim[15] = 117'h088fbf0a14633a403ed6720d7b2c12;
    stim[16] = 117'h147641a377ce39f7a8d86a6ac3908f;
    stim[17] = 117'h063be9a71ef15a9e3fff0d374765fa;
    stim[18] = 117'h0ef5733195d14f4da56797803809ef;
    stim[19] = 117'h000424300b5b5051078402ce5b4728;
    stim[20] = 117'h14929d08c1e7b323a088b13cbddf77;
    stim[21] = 117'h0b78727d0e78e5e8751e4d3a6d7ad3;
    stim[22] = 117'h02ab2841b9a42f9bb0c65266129bc7;
    stim[23] = 117'h0be830972c39c3aa12577bc09cd947;
    stim[24] = 117'h0746d819e6b5cd6c92f8c32d91a2b7;
    stim[25] = 117'h18513be0ad7a01b0d899031297de8b;
    stim[26] = 117'h1aad2ace4878a241e19ecc7a1af477;
    stim[27] = 117'h0df7746ee4683407e13d23a1fcd903;
    stim[28] = 117'h15f631547bf41906058dced4638263;
    stim[29] = 117'h01ec3967404fec77bcce314979b0fa;
    stim[30] = 117'h0b387fbc640a91be6d828eab376e3f;
    stim[31] = 117'h0173838cca25ce89cb2cb6d1a21c67;
    stim[32] = 117'h1a748a9b3872c148ae8702e6ddff2e;
    stim[33] = 117'h1f761cf91f0b82fede1e6ed822c98f;
    stim[34] = 117'h0157cf7fa96eb31de9721363bb5402;
    stim[35] = 117'h1624be688cf2e187c6e32ae364376f;
    stim[36] = 117'h17b44ddc2e723b8f2eacc7e66a78ab;
    stim[37] = 117'h014ea24eb9f5d1599ba88feed67237;
    stim[38] = 117'h1f1b4f911727651992a8ec965123e6;
    stim[39] = 117'h020a3122e958eee812310fcc2b14ba;
    stim[40] = 117'h0e5915c47473947979b63cee453c22;
    stim[41] = 117'h1a894ca846368b22734e3a998ec35f;
    stim[42] = 117'h000824ee48edb3c5c9fea8de4980f3;
    stim[43] = 117'h1a4abeffa6f8455c8eaddb914ad2bf;
    stim[44] = 117'h0035ab97dee9e2459ce7017f555fde;
    stim[45] = 117'h16ccc9398c3afe6e5bb4bfa7e2c53f;
    stim[46] = 117'h0171cccb18a8ab099fe3b0e892b033;
    stim[47] = 117'h0466462614337f531c0b1eb04e4b5e;
    stim[48] = 117'h0ba92f5e3e59adaf81af4ff8566060;
    stim[49] = 117'h07dac5879c45054d7692c99dfb814a;
    stim[50] = 117'h137b8e5a2419bb67799528413d4f87;
    stim[51] = 117'h142333d31ef34242d0c91ea734bb16;
    stim[52] = 117'h1d2963d21fa275ac6ed7bc11286c67;
    stim[53] = 117'h13f93d858f52dfaa94bca885ac4fde;
    stim[54] = 117'h0e3a0461d6f76d1e1ad82a7b4f5483;
    stim[55] = 117'h1690931d6cf0427e2889cb8418ddc2;
    stim[56] = 117'h006a5cff358971913c3f45a337e332;
    stim[57] = 117'h1e4f8ff1c2e594da503393dc42f17a;
    stim[58] = 117'h11a2bbe1a007193ebf9c09fbefda0b;
    stim[59] = 117'h0e5c676b1f48e355344f098aab4d92;
    stim[60] = 117'h1ebef835aa2b1a62979e622b0c1f56;
    stim[61] = 117'h07d685419c2057f8901dd410a2539f;
    stim[62] = 117'h1e877526b7d033e5c21145c2180dde;
    stim[63] = 117'h12f4c3b3660b687597ba086e3bd42f;
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
      expv[0] = 160'h0000000000000000004000000040000000000000;
      expv[1] = 160'h0000000000000000000000000040000000000000;
      expv[2] = 160'h0000000000000000004000000040000000000000;
      expv[3] = 160'h0000000000000000000000000040000000000000;
      expv[4] = 160'h0000000000000000000000000040000000000000;
      expv[5] = 160'h000000000000000000000000004000000d6810f8;
      expv[6] = 160'h00400000314143db0000000000400000059ee528;
      expv[7] = 160'h00000000000000000000000000400000059ee528;
      expv[8] = 160'h0000000000000000314143db00400000059ee528;
      expv[9] = 160'h382e7e520000000000000000382e7e52febd7f9a;
      expv[10] = 160'heba0d9e50000000000000000382e7e52cfac451a;
      expv[11] = 160'h000000000000000000000000382e7e524f37f471;
      expv[12] = 160'h000000000000000000000000382e7e524f37f471;
      expv[13] = 160'h000000000000000000000000382e7e524f37f471;
      expv[14] = 160'h382e7e520000000000000000382e7e529dbf503b;
      expv[15] = 160'h000000000000000000000000042b5784fd349d10;
      expv[16] = 160'heba0d9e50000000000000000042b5784fd349d10;
      expv[17] = 160'h0000000000000000f850a319cfbd46c353561c84;
      expv[18] = 160'h0000000000000000eba0d9e5d4f1fff853561c84;
      expv[19] = 160'h0000000000000000000000000040000000000000;
      expv[20] = 160'h0000000000000000000000000040000000000000;
      expv[21] = 160'h0000000000000000000000000040000089e5eefb;
      expv[22] = 160'h0000000000000000000000000040000089e5eefb;
      expv[23] = 160'h0000000000400000e8460f3d00400000933094de;
      expv[24] = 160'h93e873c70000000093e873c700400000de04e6ca;
      expv[25] = 160'h00000000000000000000000000400000196c8d15;
      expv[26] = 160'h0000000000000000c0cf35ae0d86c4c8196c8d15;
      expv[27] = 160'hc0cf35ae0d86c4c8000000000d86c4c863d0d7a3;
      expv[28] = 160'h000000000d86c4c8000000000d86c4c863d0d7a3;
      expv[29] = 160'h000000000d86c4c8c0cf35ae0d86c4c863d0d7a3;
      expv[30] = 160'h00000000567243c50000000063bde67163d0d7a3;
      expv[31] = 160'h0000000000000000567243c58df36c147559bb71;
      expv[32] = 160'h00000000fde32054000000008df36c14b68d10e3;
      expv[33] = 160'h0a45743800000000000000000a4574381736eff9;
      expv[34] = 160'h00000000000000000000000017f6f0f376c1164c;
      expv[35] = 160'h00000000cb3a027f0000000017f6f0f376c1164c;
      expv[36] = 160'h0000000000000000000000000c3e3719571b21bb;
      expv[37] = 160'h000000000000000000000000dc797566571b21bb;
      expv[38] = 160'hdc7975660000000000000000dc7975667f76b391;
      expv[39] = 160'hcb3a027f000000001275cfaedc79756664b2891f;
      expv[40] = 160'h0000000000000000000000007740918864b2891f;
      expv[41] = 160'h00000000e8460f3de8460f3d7740918864b2891f;
      expv[42] = 160'h0000000000000000e8460f3d59139a71d4cc761a;
      expv[43] = 160'h00000000000000001275cfae59139a71d4cc761a;
      expv[44] = 160'h000000002772476d654231b42ae4756edc8a5695;
      expv[45] = 160'h00000000c0cf35aec0cf35ae122ce7380bfaaafe;
      expv[46] = 160'h000000000000000000000000f372dda5fd3f1629;
      expv[47] = 160'h00000000fde32054fde32054f372dda5fd3f1629;
      expv[48] = 160'h0000000000000000000000000040000000000000;
      expv[49] = 160'h0000000000000000000000000040000000000000;
      expv[50] = 160'h0000000000000000000000002a6bb49600000000;
      expv[51] = 160'h0000000000000000000000002a6bb4964209ea7c;
      expv[52] = 160'h000000009e98f79a000000002a6bb496f539a5d8;
      expv[53] = 160'h9e98f79a2a6bb496000000002a6bb496e0894363;
      expv[54] = 160'h000000000000000000000000fd54a5e5442d627e;
      expv[55] = 160'h000000000000000000000000fd54a5e5442d627e;
      expv[56] = 160'h000000000000000000000000fd54a5e5442d627e;
      expv[57] = 160'hfd54a5e5e7f9ac4b00000000fd54a5e5442d627e;
      expv[58] = 160'h000000000000000000000000a6d2819c442d627e;
      expv[59] = 160'h00000000e7f9ac4b00000000c9f5fce0442d627e;
      expv[60] = 160'hc9f5fce000000000c9f5fce0c9f5fce0442d627e;
      expv[61] = 160'h3b58fa470000000000000000c9f5fce0115860fa;
      expv[62] = 160'hbfc480ee2a0ce1023b58fa47bfc480eea085129c;
      expv[63] = 160'hec2c7a96c1ad5158000000009f2e108a2e10c06e;
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
