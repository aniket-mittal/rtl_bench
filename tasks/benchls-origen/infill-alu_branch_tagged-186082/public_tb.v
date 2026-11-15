// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186082 dut (
    .Operand1(in_vec[77:46]),
    .Operand2(in_vec[45:14]),
    .ShfAmt(in_vec[13:9]),
    .TAG_IN(in_vec[8:4]),
    .ALU_OPCODE(in_vec[3:0]),
    .RESULT(out_vec[38:7]),
    .TAG_OUT(out_vec[6:2]),
    .ALU_BRANCH(out_vec[1:1]),
    .ALU_BRANCH_TAKEN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h2491cc97d440511815c1;
    stim[1] = 78'h1f59958a49c769c5bbba;
    stim[2] = 78'h343357f63c5a6289211d;
    stim[3] = 78'h12e1f1daa28353e8d4fa;
    stim[4] = 78'h0c1a70041f03c1ef38c5;
    stim[5] = 78'h3e2039f9683659404031;
    stim[6] = 78'h0a12270f1fc0f6cde6ed;
    stim[7] = 78'h3d34ac51ed9883f82ee1;
    stim[8] = 78'h0fd52ce69d96471e1c90;
    stim[9] = 78'h32fc1a3a5bfe68ea9d31;
    stim[10] = 78'h04f1618024cbabff8f79;
    stim[11] = 78'h3c6090b1329c28ef1761;
    stim[12] = 78'h117fb960498378b3e639;
    stim[13] = 78'h37344d927a1dd3fbfa43;
    stim[14] = 78'h308c0abff465125987b0;
    stim[15] = 78'h3b670da625039aa53413;
    stim[16] = 78'h2ea22802ca65bcc639fb;
    stim[17] = 78'h11e3f224a9e0e49de170;
    stim[18] = 78'h34c46be41e877b8ac2d9;
    stim[19] = 78'h0a09f8d0ef329e024baa;
    stim[20] = 78'h39db24b7f62205b1fc4f;
    stim[21] = 78'h1c53ff4bc841af9c864c;
    stim[22] = 78'h052a7663e38b3eb660a8;
    stim[23] = 78'h0e521d255ef77feecdb7;
    stim[24] = 78'h2a04fd11530900b905bf;
    stim[25] = 78'h3c57fa402061d7b7b4c7;
    stim[26] = 78'h08df0618bd0bd8445fd7;
    stim[27] = 78'h2572873207c44b4796cb;
    stim[28] = 78'h23a1e722a180449eaea4;
    stim[29] = 78'h03aa4cda9f5a993fd54b;
    stim[30] = 78'h2a96a602c235ef776656;
    stim[31] = 78'h0c7654d5455cc8626d50;
    stim[32] = 78'h32797a772598bbc39b93;
    stim[33] = 78'h38a9e7043a9a31e8287b;
    stim[34] = 78'h3a296d90b38346d0c1de;
    stim[35] = 78'h1539b25ee4bd36c08bac;
    stim[36] = 78'h2533cb2e2b76f5433c2c;
    stim[37] = 78'h27cf3d0b8aa42c96a925;
    stim[38] = 78'h2f389d556429be790e68;
    stim[39] = 78'h33f7821f235e490679f0;
    stim[40] = 78'h17f80846871b78ff53ae;
    stim[41] = 78'h21da132a0757f6a354d3;
    stim[42] = 78'h343dc01ac3496ad1616a;
    stim[43] = 78'h2d8c655af92122eb84c8;
    stim[44] = 78'h19369b21c1e33c51e530;
    stim[45] = 78'h07145b5a36d105a086e0;
    stim[46] = 78'h3a1882849c891bf152d0;
    stim[47] = 78'h0e96bb5d2165491141d6;
    stim[48] = 78'h0fe716fff96bdd849561;
    stim[49] = 78'h0fb6eb82ddfd7ac71377;
    stim[50] = 78'h31fbaa7395022975f009;
    stim[51] = 78'h2278ed88713d8b843f13;
    stim[52] = 78'h36fa8d2ca383711f3d60;
    stim[53] = 78'h0071d08447ef1cb46b8b;
    stim[54] = 78'h2b7644232489bf5480f9;
    stim[55] = 78'h0476605e229383f92d00;
    stim[56] = 78'h1e5c858007edc7b4914c;
    stim[57] = 78'h02128b4c080cd629acf0;
    stim[58] = 78'h27870af91f3636410dbd;
    stim[59] = 78'h0586ba0a65222f0198ce;
    stim[60] = 78'h1f3fc468b767a77db295;
    stim[61] = 78'h1ccfca630106b014434d;
    stim[62] = 78'h1edb8971b97eb55f2a0d;
    stim[63] = 78'h2f248489bc997f0e1f5b;
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
      expv[0] = 39'h71a43b5ff0;
      expv[1] = 39'h000000006e;
      expv[2] = 39'h0000000044;
      expv[3] = 39'h000000003e;
      expv[4] = 39'h41c81c21b0;
      expv[5] = 39'h4cad26730c;
      expv[6] = 39'h0000000038;
      expv[7] = 39'h559a6093b8;
      expv[8] = 39'h5ad6e80924;
      expv[9] = 39'h1df50649cc;
      expv[10] = 39'h0013c5865c;
      expv[11] = 39'h5df9734058;
      expv[12] = 39'h0000045f8c;
      expv[13] = 39'h6428832490;
      expv[14] = 39'h49e23a32ec;
      expv[15] = 39'h4206114804;
      expv[16] = 39'h000000007f;
      expv[17] = 39'h7789ad84dc;
      expv[18] = 39'h34c46be434;
      expv[19] = 39'h000000006a;
      expv[20] = 39'h0000000010;
      expv[21] = 39'h0000000010;
      expv[22] = 39'h6cc7800028;
      expv[23] = 39'h00000000ec;
      expv[24] = 39'h000000006c;
      expv[25] = 39'h0000000030;
      expv[26] = 39'h00000000f4;
      expv[27] = 39'h0000000033;
      expv[28] = 39'h4743cf7d28;
      expv[29] = 39'h0000000053;
      expv[30] = 39'h0000000014;
      expv[31] = 39'h23a63a6f54;
      expv[32] = 39'h4030748664;
      expv[33] = 39'h000000001f;
      expv[34] = 39'h0000000074;
      expv[35] = 39'h0000000068;
      expv[36] = 39'h0000000008;
      expv[37] = 39'h202184c0c8;
      expv[38] = 39'h389d554018;
      expv[39] = 39'h2eab964afc;
      expv[40] = 39'h0000000068;
      expv[41] = 39'h02a4244434;
      expv[42] = 39'h000000005a;
      expv[43] = 39'h6c632ad630;
      expv[44] = 39'h3633aee74c;
      expv[45] = 39'h7bcac1f538;
      expv[46] = 39'h2d433cebb4;
      expv[47] = 39'h00000000f4;
      expv[48] = 39'h12a5e908d8;
      expv[49] = 39'h00000000dc;
      expv[50] = 39'h0000006380;
      expv[51] = 39'h4071130044;
      expv[52] = 39'h34fbfc9758;
      expv[53] = 39'h0000000063;
      expv[54] = 39'h56ec88463c;
      expv[55] = 39'h4e13c8ae40;
      expv[56] = 39'h0000000050;
      expv[57] = 39'h143ec2eb3c;
      expv[58] = 39'h000000006c;
      expv[59] = 39'h0000000030;
      expv[60] = 39'h01003104a4;
      expv[61] = 39'h0000000050;
      expv[62] = 39'h0000000000;
      expv[63] = 39'h0000000057;
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
