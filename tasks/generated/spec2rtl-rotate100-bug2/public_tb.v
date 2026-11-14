// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[102:102]),
    .ena(in_vec[101:100]),
    .data(in_vec[99:0]),
    .q(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h01d8a9c71dab37c56b4d211fef;
    stim[1] = 103'h740c8e909ec3d256f292c31b4d;
    stim[2] = 103'h772126fcce82ccad0ef23d73e7;
    stim[3] = 103'h5223fbbb7de522b43a15ab5421;
    stim[4] = 103'h2e3fc8be8481ca953cc986e1d6;
    stim[5] = 103'h58a6da7ad00c72a726ff157beb;
    stim[6] = 103'h5e890309dcf3fb33fd85226218;
    stim[7] = 103'h6ce7557d106aa88993de56ac20;
    stim[8] = 103'h0e098f9a6931bf1934bc3e0518;
    stim[9] = 103'h7b809775d94bd1a9b289dd9bbf;
    stim[10] = 103'h467daf2cf023dd23d72a23ab6b;
    stim[11] = 103'h39c52d24475d039040b8d9d010;
    stim[12] = 103'h48c104b2182513dc550fbb16eb;
    stim[13] = 103'h48ebd1197cc40fda720e8a09c3;
    stim[14] = 103'h586c4ff3de485ce30b1f832838;
    stim[15] = 103'h4a72f98828e8c9c11b63f80532;
    stim[16] = 103'h714b3c8e1e85a396488f1de464;
    stim[17] = 103'h0a4bc4c03ec7bee8763e304356;
    stim[18] = 103'h307e06eaaa7da145be8269cd5f;
    stim[19] = 103'h669641558a6d5dd28f5990efed;
    stim[20] = 103'h1d2f9896f740c75fb702216b52;
    stim[21] = 103'h52343c2cd8d76282dcd123864f;
    stim[22] = 103'h7faa6472f22adf1a01cc870fd4;
    stim[23] = 103'h76fd37723dbf4bcbe231acac39;
    stim[24] = 103'h4cee40f2e78f32f581d87c144d;
    stim[25] = 103'h3b2b659663bc1fe3361145a8c5;
    stim[26] = 103'h15b778a9be371339d6174e41d5;
    stim[27] = 103'h38e2eff9145bfb22f62d47d9ea;
    stim[28] = 103'h42fa7a6e3b339b24b50c7953f5;
    stim[29] = 103'h6e47e3583d06125abeb9a95ce9;
    stim[30] = 103'h62b405c406b13659b6aef7e5fb;
    stim[31] = 103'h6fb2950d7145164d188b18cb31;
    stim[32] = 103'h7bd4d95696933570034dcec414;
    stim[33] = 103'h382ccaabf0f30417e2291027be;
    stim[34] = 103'h740153262f22f062f51acf0d71;
    stim[35] = 103'h65a3e7252fc7d4b8aff7654ba2;
    stim[36] = 103'h4add1d780efcf157162c8004af;
    stim[37] = 103'h5e7e68d5f0f47dd6c801ae1e4f;
    stim[38] = 103'h77f950173f7650bf7a3c6bba97;
    stim[39] = 103'h0822089f65249691a73dda72ab;
    stim[40] = 103'h78da7532e8738858858037266e;
    stim[41] = 103'h57859882b49db0da51f7554851;
    stim[42] = 103'h6baf24dbaa876f69e5559c7298;
    stim[43] = 103'h13c19c88f701df6f3857b9ef06;
    stim[44] = 103'h7c8b375d31cf2fecf724d0fbbb;
    stim[45] = 103'h6caa05ae41fb711c6218509f41;
    stim[46] = 103'h12e7dec130b30a06424f4c4db8;
    stim[47] = 103'h20011d56bebe0bf7f89daa3184;
    stim[48] = 103'h079848489c88d01ef65a808da5;
    stim[49] = 103'h24a1429d2d924f8832deee6ede;
    stim[50] = 103'h3244e652d077ff9e3379be773d;
    stim[51] = 103'h70ef08b895e7b692a829b2dbc4;
    stim[52] = 103'h1e4c78cf76af84aae624b469b9;
    stim[53] = 103'h10568904f3eb008947db35205b;
    stim[54] = 103'h58686d9b66562748f55ee0783a;
    stim[55] = 103'h1c167f96615e90f5ecd9e56857;
    stim[56] = 103'h259e14e0dad130844f9dae59c3;
    stim[57] = 103'h19b39f11c0f680cbfd7440a374;
    stim[58] = 103'h618f49f07d5e9303c9c6356a62;
    stim[59] = 103'h7acac1c1cb0a5703cfc30c16ec;
    stim[60] = 103'h5ae2ae3f2cccf48c59cbb9ebda;
    stim[61] = 103'h2b6ed1eaff099eef89f463c7d9;
    stim[62] = 103'h637e6ca7c95afdcd87f1e2cd17;
    stim[63] = 103'h0b3dec18219d474042ade7f6a3;
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
      expv[0] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 100'h0000000000000000000000000;
      expv[2] = 100'h40c8e909ec3d256f292c31b4d;
      expv[3] = 100'h72126fcce82ccad0ef23d73e7;
      expv[4] = 100'h223fbbb7de522b43a15ab5421;
      expv[5] = 100'h447f776fbca4568742b56a842;
      expv[6] = 100'h8a6da7ad00c72a726ff157beb;
      expv[7] = 100'he890309dcf3fb33fd85226218;
      expv[8] = 100'hce7557d106aa88993de56ac20;
      expv[9] = 100'h0000000000000000000000000;
      expv[10] = 100'hb809775d94bd1a9b289dd9bbf;
      expv[11] = 100'h67daf2cf023dd23d72a23ab6b;
      expv[12] = 100'h0000000000000000000000000;
      expv[13] = 100'h8c104b2182513dc550fbb16eb;
      expv[14] = 100'h8ebd1197cc40fda720e8a09c3;
      expv[15] = 100'h86c4ff3de485ce30b1f832838;
      expv[16] = 100'ha72f98828e8c9c11b63f80532;
      expv[17] = 100'h14b3c8e1e85a396488f1de464;
      expv[18] = 100'h0000000000000000000000000;
      expv[19] = 100'h0000000000000000000000000;
      expv[20] = 100'h69641558a6d5dd28f5990efed;
      expv[21] = 100'hb4b20aac536aee947acc877f6;
      expv[22] = 100'h2343c2cd8d76282dcd123864f;
      expv[23] = 100'hfaa6472f22adf1a01cc870fd4;
      expv[24] = 100'h6fd37723dbf4bcbe231acac39;
      expv[25] = 100'hcee40f2e78f32f581d87c144d;
      expv[26] = 100'h0000000000000000000000000;
      expv[27] = 100'h0000000000000000000000000;
      expv[28] = 100'h0000000000000000000000000;
      expv[29] = 100'h2fa7a6e3b339b24b50c7953f5;
      expv[30] = 100'he47e3583d06125abeb9a95ce9;
      expv[31] = 100'h2b405c406b13659b6aef7e5fb;
      expv[32] = 100'hfb2950d7145164d188b18cb31;
      expv[33] = 100'hbd4d95696933570034dcec414;
      expv[34] = 100'h0000000000000000000000000;
      expv[35] = 100'h40153262f22f062f51acf0d71;
      expv[36] = 100'h5a3e7252fc7d4b8aff7654ba2;
      expv[37] = 100'hadd1d780efcf157162c8004af;
      expv[38] = 100'he7e68d5f0f47dd6c801ae1e4f;
      expv[39] = 100'h7f950173f7650bf7a3c6bba97;
      expv[40] = 100'h0000000000000000000000000;
      expv[41] = 100'h8da7532e8738858858037266e;
      expv[42] = 100'h7859882b49db0da51f7554851;
      expv[43] = 100'hbaf24dbaa876f69e5559c7298;
      expv[44] = 100'h5d7926dd543b7b4f2aace394c;
      expv[45] = 100'hc8b375d31cf2fecf724d0fbbb;
      expv[46] = 100'hcaa05ae41fb711c6218509f41;
      expv[47] = 100'he5502d720fdb88e310c284fa0;
      expv[48] = 100'hcaa05ae41fb711c6218509f41;
      expv[49] = 100'h0000000000000000000000000;
      expv[50] = 100'h0000000000000000000000000;
      expv[51] = 100'h0000000000000000000000000;
      expv[52] = 100'h0ef08b895e7b692a829b2dbc4;
      expv[53] = 100'h077845c4af3db495414d96de2;
      expv[54] = 100'h03bc22e2579eda4aa0a6cb6f1;
      expv[55] = 100'h8686d9b66562748f55ee0783a;
      expv[56] = 100'h43436cdb32b13a47aaf703c1d;
      expv[57] = 100'h8686d9b66562748f55ee0783a;
      expv[58] = 100'h43436cdb32b13a47aaf703c1d;
      expv[59] = 100'h18f49f07d5e9303c9c6356a62;
      expv[60] = 100'hacac1c1cb0a5703cfc30c16ec;
      expv[61] = 100'hae2ae3f2cccf48c59cbb9ebda;
      expv[62] = 100'h5c55c7e5999e918b39773d7b5;
      expv[63] = 100'h37e6ca7c95afdcd87f1e2cd17;
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
