// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029983 dut (
    .ALU_ctrl(in_vec[72:69]),
    .ALU_operand_1(in_vec[68:37]),
    .ALU_operand_2(in_vec[36:5]),
    .shamnt(in_vec[4:0]),
    .ALU_result(out_vec[39:8]),
    .ALU_status(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1e72874be569dcb33ca;
    stim[1] = 73'h1a471363bca0e27c34b;
    stim[2] = 73'h1263891fb001ff2eac2;
    stim[3] = 73'h00f9cd2e67a650a13c1;
    stim[4] = 73'h036b9b58f11de937595;
    stim[5] = 73'h1344c5682b78a199534;
    stim[6] = 73'h13de87cf1d07291b341;
    stim[7] = 73'h0e65967f0659c561404;
    stim[8] = 73'h15b365c0b1b7c47869c;
    stim[9] = 73'h1d9b044be95f56d8a1f;
    stim[10] = 73'h090736f819d5bd6dce6;
    stim[11] = 73'h0c93d439c2f871f4b2d;
    stim[12] = 73'h051f22c37705d9e04a8;
    stim[13] = 73'h17fa829d7108cf5bebf;
    stim[14] = 73'h154aac431e7a3023ad5;
    stim[15] = 73'h0fa76b6c284733695e2;
    stim[16] = 73'h06cb8e4dd54f91214d2;
    stim[17] = 73'h0c310be9eaf426072cb;
    stim[18] = 73'h137cb6ab2db2e30bfda;
    stim[19] = 73'h0ec053304a82084c1b2;
    stim[20] = 73'h0fb9b35afdf68d0b6c1;
    stim[21] = 73'h1185c439d2add59ae81;
    stim[22] = 73'h14bda12a4a8f400f6e2;
    stim[23] = 73'h06167943a9d9a5f02ad;
    stim[24] = 73'h194276dfccfca8542c8;
    stim[25] = 73'h1b2cd6c25f5eab6b56b;
    stim[26] = 73'h1d5edec26476f7fed66;
    stim[27] = 73'h1e8349686b21ef22669;
    stim[28] = 73'h176b4b60915a965cca8;
    stim[29] = 73'h0af06524b44a6c9f70f;
    stim[30] = 73'h14475eb169ec4748a78;
    stim[31] = 73'h03643e08fe41161b5e6;
    stim[32] = 73'h01fe4a82bfde7576cbb;
    stim[33] = 73'h08458725fadc389331a;
    stim[34] = 73'h1be244007e2aaeb12da;
    stim[35] = 73'h1425fa46317f5098f76;
    stim[36] = 73'h1761599bd36055c6add;
    stim[37] = 73'h1997e5fe5613edd14d5;
    stim[38] = 73'h1433470ef3f04331173;
    stim[39] = 73'h1d852a7b0dc913ccbc0;
    stim[40] = 73'h11871b93e257d777822;
    stim[41] = 73'h0ff0c1f4e7d4f283057;
    stim[42] = 73'h1b093316745689305ca;
    stim[43] = 73'h07455088e92bcaf99b8;
    stim[44] = 73'h071aca12b37f715307b;
    stim[45] = 73'h1e61a1487274baf19b5;
    stim[46] = 73'h0e0b6616c2f477e82b4;
    stim[47] = 73'h1ceabdb30fbcf0ca4e2;
    stim[48] = 73'h142e090e069b8066be9;
    stim[49] = 73'h1d4b9a92aca447a74fe;
    stim[50] = 73'h1d8c64352fdbc465079;
    stim[51] = 73'h09421e4e22a2086b417;
    stim[52] = 73'h05fb63e565664edda2d;
    stim[53] = 73'h04528e166af85204c0e;
    stim[54] = 73'h13ccc9f34a1a2dd2b25;
    stim[55] = 73'h0d2030537c79fc89663;
    stim[56] = 73'h0b112243d5cda7347ae;
    stim[57] = 73'h0d88c6c0f0edefa1e3c;
    stim[58] = 73'h0718824232fde8a35e2;
    stim[59] = 73'h17d4cc951e3ccc676b2;
    stim[60] = 73'h13505eeb7dd650e0cfa;
    stim[61] = 73'h04d64c51d6ac043a723;
    stim[62] = 73'h0c7f74e4e0c849dfc77;
    stim[63] = 73'h0689210470bf457d28c;
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
      expv[0] = 40'h0000000080;
      expv[1] = 40'h0004713600;
      expv[2] = 40'h0000003108;
      expv[3] = 40'h5020101200;
      expv[4] = 40'hbffdbffc10;
      expv[5] = 40'h0000000108;
      expv[6] = 40'h0000000080;
      expv[7] = 40'h0000000080;
      expv[8] = 40'h0250dc6c00;
      expv[9] = 40'h0000000080;
      expv[10] = 40'h0000000080;
      expv[11] = 40'hcdb1228810;
      expv[12] = 40'h127e51e060;
      expv[13] = 40'h0000000080;
      expv[14] = 40'h984e305918;
      expv[15] = 40'h0000000080;
      expv[16] = 40'h0000000080;
      expv[17] = 40'h9e72f15f18;
      expv[18] = 40'h0000000108;
      expv[19] = 40'h0000000080;
      expv[20] = 40'h0000000080;
      expv[21] = 40'h1295ae9440;
      expv[22] = 40'h1970929200;
      expv[23] = 40'h0000000080;
      expv[24] = 40'h3b6fe60000;
      expv[25] = 40'h0012cd6c00;
      expv[26] = 40'h0000000080;
      expv[27] = 40'h0000000080;
      expv[28] = 40'h0000000080;
      expv[29] = 40'h0000000080;
      expv[30] = 40'hd58cfce718;
      expv[31] = 40'hb29f0dff18;
      expv[32] = 40'hef20014518;
      expv[33] = 40'h0000000080;
      expv[34] = 40'h0000003c00;
      expv[35] = 40'had556f6318;
      expv[36] = 40'h0000000080;
      expv[37] = 40'he560000010;
      expv[38] = 40'he1821ff210;
      expv[39] = 40'h0000000080;
      expv[40] = 40'hdba349b158;
      expv[41] = 40'h0000000080;
      expv[42] = 40'h0021266200;
      expv[43] = 40'h0000000080;
      expv[44] = 40'h0000000080;
      expv[45] = 40'h0000000080;
      expv[46] = 40'h0000000080;
      expv[47] = 40'h0000000080;
      expv[48] = 40'h5ac4b45c00;
      expv[49] = 40'h0000000080;
      expv[50] = 40'h0000000080;
      expv[51] = 40'h0000000080;
      expv[52] = 40'hb0d9618338;
      expv[53] = 40'ha5700d9558;
      expv[54] = 40'hffffffff18;
      expv[55] = 40'h5319e50b48;
      expv[56] = 40'h0000000080;
      expv[57] = 40'h4d6b8f8748;
      expv[58] = 40'h0000000080;
      expv[59] = 40'h0000000080;
      expv[60] = 40'h0000000400;
      expv[61] = 40'hc128462450;
      expv[62] = 40'hdb95828d18;
      expv[63] = 40'h0000000080;
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
