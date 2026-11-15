// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01907 dut (
    .clk_i(clk),
    .rst_i(in_vec[69:69]),
    .opcode_valid_i(in_vec[68:68]),
    .inst_div_w(in_vec[67:67]),
    .inst_divu_w(in_vec[66:66]),
    .inst_rem_w(in_vec[65:65]),
    .inst_remu_w(in_vec[64:64]),
    .opcode_ra_operand_i(in_vec[63:32]),
    .opcode_rb_operand_i(in_vec[31:0]),
    .writeback_valid_o(out_vec[32:32]),
    .writeback_value_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3aba9695fba35d9198;
    stim[1] = 70'h22ce47e9853fd207f2;
    stim[2] = 70'h1758111ed8cd8379a5;
    stim[3] = 70'h19378242140dc9f0ad;
    stim[4] = 70'h098c5f9892055a5d1c;
    stim[5] = 70'h09b1a08451c40a7e91;
    stim[6] = 70'h1d3fcde971a661612e;
    stim[7] = 70'h10464ec8145c7a67da;
    stim[8] = 70'h1471b9b8cf4dfc75cc;
    stim[9] = 70'h00995d6c1902dddab3;
    stim[10] = 70'h10395afdf75b3385f6;
    stim[11] = 70'h0097416f4e08642729;
    stim[12] = 70'h11aab159e4e395a2b7;
    stim[13] = 70'h082e54ec0566edb63e;
    stim[14] = 70'h19c78bff83eb3533ba;
    stim[15] = 70'h17b5181a9826830538;
    stim[16] = 70'h1c7fb9ba754ecfcabe;
    stim[17] = 70'h1f1f64429710e3ea35;
    stim[18] = 70'h24533edd78a156c4aa;
    stim[19] = 70'h0a54648c8452e82619;
    stim[20] = 70'h19f5eca81841a0c6ef;
    stim[21] = 70'h078041b2ffd5cff392;
    stim[22] = 70'h1fbf6082152bc678ed;
    stim[23] = 70'h0e2a8fc560e3e473cc;
    stim[24] = 70'h10bb2f784f3789c286;
    stim[25] = 70'h1524588e1822e440ae;
    stim[26] = 70'h089b451ae18e60628d;
    stim[27] = 70'h175fd826da713d8add;
    stim[28] = 70'h01a26e21f865ba3e4c;
    stim[29] = 70'h1ffc62a18dd904fe2b;
    stim[30] = 70'h01c46bc7fa3af6a91c;
    stim[31] = 70'h1cb6245427239c2fc6;
    stim[32] = 70'h114377b67c69dd62df;
    stim[33] = 70'h34468d90d67c490c83;
    stim[34] = 70'h0c0795ea61036648be;
    stim[35] = 70'h0343317e5d2b1131a8;
    stim[36] = 70'h12918b43ca52817ba0;
    stim[37] = 70'h13a3eba05ba63e48d3;
    stim[38] = 70'h067fee6c3f9ec96fea;
    stim[39] = 70'h054a39b9201afdfee2;
    stim[40] = 70'h163ac7cbda11c26680;
    stim[41] = 70'h175d5018efa6d67375;
    stim[42] = 70'h01738f96ae0a250d37;
    stim[43] = 70'h0d17088fed1459f3a4;
    stim[44] = 70'h0be90f0240dc5aae9b;
    stim[45] = 70'h1afc7b3956e352e49b;
    stim[46] = 70'h14c5c21ccdfae1ef14;
    stim[47] = 70'h12ce50e2595e27b15f;
    stim[48] = 70'h11f2fa5824718f34f8;
    stim[49] = 70'h02b9eb4a4e9c22b1f9;
    stim[50] = 70'h18f5bf95c2f16aa248;
    stim[51] = 70'h1822a5104f1f8909ca;
    stim[52] = 70'h075522126dc3c91565;
    stim[53] = 70'h13470d27b8dba617f4;
    stim[54] = 70'h18d4e4501b2ff0d505;
    stim[55] = 70'h1d2755bda4f4261dc0;
    stim[56] = 70'h18157a2508757f8a5e;
    stim[57] = 70'h1f3ea15f8f9be1e743;
    stim[58] = 70'h118eda533dc0d0a69a;
    stim[59] = 70'h14625155cd1227237b;
    stim[60] = 70'h037eb468dd9e2ad66d;
    stim[61] = 70'h16f99319eeabc975b9;
    stim[62] = 70'h131f0e24804babbc10;
    stim[63] = 70'h042b274efdad8ebb4b;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
