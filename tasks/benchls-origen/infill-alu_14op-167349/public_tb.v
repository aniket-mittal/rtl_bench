// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167349 dut (
    .A(in_vec[67:36]),
    .B(in_vec[35:4]),
    .Fin(in_vec[3:0]),
    .Y(out_vec[32:1]),
    .Cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h5e28b020494437c2d;
    stim[1] = 68'h89f081e1cca7131ef;
    stim[2] = 68'ha4fc8f5a5a30f5474;
    stim[3] = 68'h48391f05a12d920fb;
    stim[4] = 68'h4683c509b8c719b62;
    stim[5] = 68'h1728b3aa67ea4f4e5;
    stim[6] = 68'h18863e596d444ce8a;
    stim[7] = 68'hd150090d5eb0b1086;
    stim[8] = 68'hce86ddc15cf9f6329;
    stim[9] = 68'h44340e5758ff992c6;
    stim[10] = 68'h79537f5cbdd15018c;
    stim[11] = 68'hd03043e1b9df08ebb;
    stim[12] = 68'h7733d1ac86e624617;
    stim[13] = 68'h3cc67a3d3114879b1;
    stim[14] = 68'h52502af7d8ec8e2ed;
    stim[15] = 68'h992c0ba4bdedb5835;
    stim[16] = 68'h162af9b6fb3feb7f5;
    stim[17] = 68'h6535af248ead807fa;
    stim[18] = 68'hee3dd15fbc6a4ccc7;
    stim[19] = 68'h1c260f3e30f0ae810;
    stim[20] = 68'h7807867c3a3fc2bd6;
    stim[21] = 68'hfe1c6ecf3c8331887;
    stim[22] = 68'h8288069871f26c395;
    stim[23] = 68'h720dbe0917b4d6636;
    stim[24] = 68'h39dbee5173ca8cc43;
    stim[25] = 68'h4de651e89adba7c1e;
    stim[26] = 68'he734459e69b9a07fa;
    stim[27] = 68'h42ac5673d780ffcb6;
    stim[28] = 68'h75cde0c23d44ae877;
    stim[29] = 68'h9a2bc6d60d9e7b036;
    stim[30] = 68'hbd509ccf6bb050d25;
    stim[31] = 68'heaa51c3a3fdee6755;
    stim[32] = 68'h89807abd02df8d937;
    stim[33] = 68'h640a66f4a944eb80b;
    stim[34] = 68'ha4ec666f0ccf40e32;
    stim[35] = 68'heb2792badf33a1254;
    stim[36] = 68'h811fae85f1d343b26;
    stim[37] = 68'h5ec3c1f30dc20f83c;
    stim[38] = 68'hc06364ef693919a3a;
    stim[39] = 68'he4ffb6a657df5a7e7;
    stim[40] = 68'h98dd9afd6d6a1ab31;
    stim[41] = 68'hcc2f24c0966303fc8;
    stim[42] = 68'heb08c078c1e62e56b;
    stim[43] = 68'h2dcebbf1a28acc6ce;
    stim[44] = 68'h881d9e3e65a5ebd96;
    stim[45] = 68'ha621643914a7711c0;
    stim[46] = 68'h7076fd7d4cb5c8672;
    stim[47] = 68'h405814e08f3793068;
    stim[48] = 68'h6b23ec7a38d69835f;
    stim[49] = 68'h90e0e11f5be558c9f;
    stim[50] = 68'ha3b501d2d040f3c5a;
    stim[51] = 68'hfe0a11f1e151fc704;
    stim[52] = 68'h5479092a99cf33025;
    stim[53] = 68'hc40d05b5717e03ddf;
    stim[54] = 68'h3004b5a8718acc86e;
    stim[55] = 68'h345c70ef54b90d9bb;
    stim[56] = 68'h57aaf843a20e1eeb6;
    stim[57] = 68'hbc5d7b653847f487f;
    stim[58] = 68'h6d3dd8e9c21394b0b;
    stim[59] = 68'h75064592dc9035e2e;
    stim[60] = 68'h10f2f02bb2126df25;
    stim[61] = 68'h67aa62ad3a67300d3;
    stim[62] = 68'h8cb57c097d3f206cc;
    stim[63] = 68'h67dbe553174537cb8;
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
      expv[0] = 33'h178a2c080;
      expv[1] = 33'h000000000;
      expv[2] = 33'h14bff1ff4;
      expv[3] = 33'h1d2cd6228;
      expv[4] = 33'h1fe95bd7e;
      expv[5] = 33'h15e7cc8b9;
      expv[6] = 33'h018863e58;
      expv[7] = 33'h000000000;
      expv[8] = 33'h13a1b7704;
      expv[9] = 33'h000000002;
      expv[10] = 33'h079537f5c;
      expv[11] = 33'h1ffffffff;
      expv[12] = 33'h1e3abeb9a;
      expv[13] = 33'h07badff7e;
      expv[14] = 33'h14940abdc;
      expv[15] = 33'h1b67cac43;
      expv[16] = 33'h035d61c6f;
      expv[17] = 33'h06535af24;
      expv[18] = 33'h0a4af3b26;
      expv[19] = 33'h020401c00;
      expv[20] = 33'h000000000;
      expv[21] = 33'h1853ebe8e;
      expv[22] = 33'h0212b34be;
      expv[23] = 33'h000000000;
      expv[24] = 33'h01022c422;
      expv[25] = 33'h04de651e8;
      expv[26] = 33'h0e734459e;
      expv[27] = 33'h000000002;
      expv[28] = 33'h091129c8a;
      expv[29] = 33'h000000000;
      expv[30] = 33'h0a34097fa;
      expv[31] = 33'h1558c6b8a;
      expv[32] = 33'h116bfee5c;
      expv[33] = 33'h1ffffffff;
      expv[34] = 33'h163774ea4;
      expv[35] = 33'h1d7dfbdf4;
      expv[36] = 33'h000000002;
      expv[37] = 33'h05ec3c1f2;
      expv[38] = 33'h0c06364ee;
      expv[39] = 33'h16641d9b0;
      expv[40] = 33'h1fbff35fe;
      expv[41] = 33'h14b67b186;
      expv[42] = 33'h1ffffffff;
      expv[43] = 33'h12dcebbf0;
      expv[44] = 33'h000000000;
      expv[45] = 33'h00842c030;
      expv[46] = 33'h17a598bc8;
      expv[47] = 33'h06120f032;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h0a3b501d2;
      expv[51] = 33'h1fd5c27fe;
      expv[52] = 33'h17553ac51;
      expv[53] = 33'h000000000;
      expv[54] = 33'h03004b5a8;
      expv[55] = 33'h1122afd14;
      expv[56] = 33'h000000002;
      expv[57] = 33'h000000000;
      expv[58] = 33'h1ffffffff;
      expv[59] = 33'h075064592;
      expv[60] = 33'h0bdc10473;
      expv[61] = 33'h08b108540;
      expv[62] = 33'h18cb57c08;
      expv[63] = 33'h11ec25ace;
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
