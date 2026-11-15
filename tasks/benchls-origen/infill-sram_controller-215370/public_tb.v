// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215370 dut (
    .clk(clk),
    .rst(in_vec[86:86]),
    .read_ce(in_vec[85:85]),
    .write_ce(in_vec[84:84]),
    .write_data(in_vec[83:52]),
    .addr(in_vec[51:32]),
    .rom_rdata(in_vec[31:0]),
    .fin(out_vec[87:87]),
    .rom_wdata(out_vec[86:55]),
    .rom_addr(out_vec[54:35]),
    .ce(out_vec[34:34]),
    .we(out_vec[33:33]),
    .oe(out_vec[32:32]),
    .read_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h48af69f55bd78c7500df0b;
    stim[1] = 87'h478585b7eafd40f827646f;
    stim[2] = 87'h02c3219dede0cc7747e7f8;
    stim[3] = 87'h2fb391161a2e826a5ba4c6;
    stim[4] = 87'h3e85b51993f5d7abd00819;
    stim[5] = 87'h0df1d6bb2fdee29a270493;
    stim[6] = 87'h21bc05783f086011435107;
    stim[7] = 87'h1a16210c41c838edcdeb93;
    stim[8] = 87'h0fa3cb3c97b042461f9a57;
    stim[9] = 87'h332716b08c620a87660f92;
    stim[10] = 87'h05efef76f38ea4e7137197;
    stim[11] = 87'h0375e024283fe5fb6bcdb9;
    stim[12] = 87'h05a3e88effdf0d085b9bed;
    stim[13] = 87'h06c32db39c4f35b0ce3c56;
    stim[14] = 87'h01371bd92483a249d11989;
    stim[15] = 87'h122327a5d5dfc6385b1392;
    stim[16] = 87'h3dc322635ddf15832df315;
    stim[17] = 87'h3eb80c9860ef4ad6a10933;
    stim[18] = 87'h3e388ff7fc58f02614b89a;
    stim[19] = 87'h3b1c72a46eb751b45754f9;
    stim[20] = 87'h049c1e4ea864d7163616ca;
    stim[21] = 87'h1088214786a78276e67087;
    stim[22] = 87'h2bae40f1e9ff9388097c2f;
    stim[23] = 87'h1e1863059dd826b1950741;
    stim[24] = 87'h3414f20ce13b6e9912b494;
    stim[25] = 87'h0d71e0073254960c20d2dc;
    stim[26] = 87'h3c11725a0b0a03c7098028;
    stim[27] = 87'h0ae06d9dcf1dc686fa7228;
    stim[28] = 87'h1e44b0190ef35e6a2e160c;
    stim[29] = 87'h15b46856ebb604de52220b;
    stim[30] = 87'h394a7460022a6ff4c2a239;
    stim[31] = 87'h2b5df5f2181c884ab45945;
    stim[32] = 87'h01e13a2aacb72a6fdc3955;
    stim[33] = 87'h21c6a70de5e30201800516;
    stim[34] = 87'h5a3697ed29c20eeb1a313d;
    stim[35] = 87'h39cd2198288742ac7697b3;
    stim[36] = 87'h06b4fee7b5bd47b5790e7d;
    stim[37] = 87'h26da929f45ea343eaf8a86;
    stim[38] = 87'h175f723aaba8e2b349670e;
    stim[39] = 87'h383888dd88c99b2c886d80;
    stim[40] = 87'h352d88e06296c21539a002;
    stim[41] = 87'h1980ee4f774182560b6d29;
    stim[42] = 87'h200562a4aec3ff7d06d40a;
    stim[43] = 87'h054102aa18a3ed613292d9;
    stim[44] = 87'h0775ee1395b1dc6bd129cd;
    stim[45] = 87'h0c09c7021ecd473795d82e;
    stim[46] = 87'h3e50797245466e22d1a2a4;
    stim[47] = 87'h37804e580b2995d65aa9a6;
    stim[48] = 87'h0452980ba252880b152db2;
    stim[49] = 87'h1eba8fa9d7ec80420ad2f9;
    stim[50] = 87'h18fc826ff7981e8159f045;
    stim[51] = 87'h2083f7e48c0c4798cc8dab;
    stim[52] = 87'h0d786685cbac4af284c2a6;
    stim[53] = 87'h25a1a388ffbfa989f71bd1;
    stim[54] = 87'h20efc04551c17a69b89c7f;
    stim[55] = 87'h25e5e3dfd7966997969130;
    stim[56] = 87'h240c6a0ba03e976c4f02b0;
    stim[57] = 87'h1f124a5f991bd76b4b446d;
    stim[58] = 87'h0693b0b31b0f186f1d531f;
    stim[59] = 87'h3154108e06d92d026626f1;
    stim[60] = 87'h62e4047963c6cdc0a9f018;
    stim[61] = 87'h1705152a74f953405a6cc4;
    stim[62] = 87'h15d6ddb7517cfe78661c7e;
    stim[63] = 87'h376bd6e37fc1613e86389d;
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
      expv[0] = 88'hxxxxxxxxx0000000000000;
      expv[1] = 88'hxxxxxxxxx0000000000000;
      expv[2] = 88'hxxxxxxxxx0000000000000;
      expv[3] = 88'hxxxxxxxxx0000000000000;
      expv[4] = 88'hxxxxxxxxx0000000000000;
      expv[5] = 88'hxxxxxxxxx0000000000000;
      expv[6] = 88'hxxxxxxxxx0000000000000;
      expv[7] = 88'hxxxxxxxxx0000000000000;
      expv[8] = 88'hxxxxxxxxx0000000000000;
      expv[9] = 88'hxxxxxxxxx0000000000000;
      expv[10] = 88'hxxxxxxxxx0000000000000;
      expv[11] = 88'hxxxxxxxxx0000000000000;
      expv[12] = 88'hxxxxxxxxx0000000000000;
      expv[13] = 88'hxxxxxxxxx0000000000000;
      expv[14] = 88'hxxxxxxxxx0000000000000;
      expv[15] = 88'hxxxxxxxxx0000000000000;
      expv[16] = 88'hxxxxxxxxx0000000000000;
      expv[17] = 88'hxxxxxxxxx0000000000000;
      expv[18] = 88'hxxxxxxxxx0000000000000;
      expv[19] = 88'hxxxxxxxxx0000000000000;
      expv[20] = 88'hxxxxxxxxx0000000000000;
      expv[21] = 88'hxxxxxxxxx0000000000000;
      expv[22] = 88'hxxxxxxxxx0000000000000;
      expv[23] = 88'hxxxxxxxxx0000000000000;
      expv[24] = 88'hxxxxxxxxx0000000000000;
      expv[25] = 88'hxxxxxxxxx0000000000000;
      expv[26] = 88'hxxxxxxxxx0000000000000;
      expv[27] = 88'hxxxxxxxxx0000000000000;
      expv[28] = 88'hxxxxxxxxx0000000000000;
      expv[29] = 88'hxxxxxxxxx0000000000000;
      expv[30] = 88'hxxxxxxxxx0000000000000;
      expv[31] = 88'hxxxxxxxxx0000000000000;
      expv[32] = 88'hxxxxxxxxx0000000000000;
      expv[33] = 88'hxxxxxxxxx0000000000000;
      expv[34] = 88'hxxxxxxxxx0000000000000;
      expv[35] = 88'hxxxxxxxxx0000000000000;
      expv[36] = 88'hxxxxxxxxx0000000000000;
      expv[37] = 88'hxxxxxxxxx0000000000000;
      expv[38] = 88'hxxxxxxxxx0000000000000;
      expv[39] = 88'hxxxxxxxxx0000000000000;
      expv[40] = 88'hxxxxxxxxx0000000000000;
      expv[41] = 88'hxxxxxxxxx0000000000000;
      expv[42] = 88'hxxxxxxxxx0000000000000;
      expv[43] = 88'hxxxxxxxxx0000000000000;
      expv[44] = 88'hxxxxxxxxx0000000000000;
      expv[45] = 88'hxxxxxxxxx0000000000000;
      expv[46] = 88'hxxxxxxxxx0000000000000;
      expv[47] = 88'hxxxxxxxxx0000000000000;
      expv[48] = 88'hxxxxxxxxx0000000000000;
      expv[49] = 88'hxxxxxxxxx0000000000000;
      expv[50] = 88'hxxxxxxxxx0000000000000;
      expv[51] = 88'hxxxxxxxxx0000000000000;
      expv[52] = 88'hxxxxxxxxx0000000000000;
      expv[53] = 88'hxxxxxxxxx0000000000000;
      expv[54] = 88'hxxxxxxxxx0000000000000;
      expv[55] = 88'hxxxxxxxxx0000000000000;
      expv[56] = 88'hxxxxxxxxx0000000000000;
      expv[57] = 88'hxxxxxxxxx0000000000000;
      expv[58] = 88'hxxxxxxxxx0000000000000;
      expv[59] = 88'hxxxxxxxxx0000000000000;
      expv[60] = 88'hxxxxxxxxx0000000000000;
      expv[61] = 88'hxxxxxxxxx0000000000000;
      expv[62] = 88'hxxxxxxxxx0000000000000;
      expv[63] = 88'hxxxxxxxxx0000000000000;
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
