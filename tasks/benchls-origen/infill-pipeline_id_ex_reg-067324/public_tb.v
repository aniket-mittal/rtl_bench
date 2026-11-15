// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 146;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067324 dut (
    .clk(clk),
    .Reset(in_vec[146:146]),
    .PCSrc_in(in_vec[145:145]),
    .RegDst_in(in_vec[144:144]),
    .RegWr_in(in_vec[143:143]),
    .ALUSrc1_in(in_vec[142:142]),
    .ALUSrc2_in(in_vec[141:141]),
    .Sign_in(in_vec[140:140]),
    .MemWr_in(in_vec[139:139]),
    .MemRd_in(in_vec[138:138]),
    .MemToReg_in(in_vec[137:137]),
    .ALUFun_in(in_vec[136:133]),
    .PC4_in(in_vec[132:101]),
    .R1_in(in_vec[100:69]),
    .R2_in(in_vec[68:37]),
    .Imm_in(in_vec[36:5]),
    .RdAdress_in(in_vec[4:0]),
    .PCSrc_out(out_vec[145:145]),
    .RegDst_out(out_vec[144:144]),
    .RegWr_out(out_vec[143:143]),
    .ALUSrc1_out(out_vec[142:142]),
    .ALUSrc2_out(out_vec[141:141]),
    .Sign_out(out_vec[140:140]),
    .MemWr_out(out_vec[139:139]),
    .MemRd_out(out_vec[138:138]),
    .MemToReg_out(out_vec[137:137]),
    .ALUFun_out(out_vec[136:133]),
    .PC4_out(out_vec[132:101]),
    .R1_out(out_vec[100:69]),
    .R2_out(out_vec[68:37]),
    .Imm_out(out_vec[36:5]),
    .RdAdress_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h48c6c8b27267bde5d53f202fda2be2eeae0b8;
    stim[1] = 147'h41352c04e6715d1985e2b14a5cf845f5e1fd9;
    stim[2] = 147'h19c3f85eac03fb6bca7989d67e71aa7e3966e;
    stim[3] = 147'h368553661d43534e68ca1d1010517df93f326;
    stim[4] = 147'h276fa25da6ee864e03cb78863029ed3603a15;
    stim[5] = 147'h311da16a8d28ab32b527364ab4ceac97de376;
    stim[6] = 147'h1336b97f4f699135b85aeecf5ee60fd8c5b20;
    stim[7] = 147'h333f308f5b6d01265c5669eccc5d645a2513b;
    stim[8] = 147'h2f4ef50f0f4ca80ba52ad3d33b291f1a21f02;
    stim[9] = 147'h3a31c43b19c19d517c09c86108a66a910b8e2;
    stim[10] = 147'h25a3ddf937a230830173370569b31c11467c8;
    stim[11] = 147'h116ee47df386ccd9378954fcbb66f8ea4d58d;
    stim[12] = 147'h29cd517e5ca5e03738dc2ecdba51a0f4da35d;
    stim[13] = 147'h1b73ce6d34bf1ddb62b1cc3b7550400e6f728;
    stim[14] = 147'h0b5d86bb09820a435573569198907eb940f56;
    stim[15] = 147'h35578866aa788ea1c666c78af8606b0ef2d52;
    stim[16] = 147'h393b448d0912bdd1b0755b38f941b7815a23e;
    stim[17] = 147'h1ac56db1892b67ec1a9fe37a42e5d05ad2f64;
    stim[18] = 147'h3686cd1bc51ad02a77b032929146854ce7971;
    stim[19] = 147'h0ae10fb16ec4ead871aab8c77b78f47c1deb0;
    stim[20] = 147'h36121ad42e62e91699bcd9b5485dc8616ec9b;
    stim[21] = 147'h0272844b3787626d70f1f027f8900e1c60bf0;
    stim[22] = 147'h3e6e7c6fd6744a26d8d5cec103b821cf39636;
    stim[23] = 147'h3800a89e597e2c6323bc47d94c688b219f730;
    stim[24] = 147'h07383acffcfe5597dba8e0f20716449fa54ea;
    stim[25] = 147'h0761d2dadf475e2f63f5e2346868e2a2004bd;
    stim[26] = 147'h2574d00b09b134c4004c6aab90961fc560e71;
    stim[27] = 147'h224fed957151949e7032c2394041b1a215e88;
    stim[28] = 147'h211588561815bfa8832ae29b2598fd84071a3;
    stim[29] = 147'h3d01565f424425bd636453b3ecee1e4e5fb04;
    stim[30] = 147'h37fb698c3e788605bf299d81483a9586105bd;
    stim[31] = 147'h24a2e76d8ce7e93238b74392b1ac850c2071a;
    stim[32] = 147'h2d3d030ef972b0f45a3f42b5c112054bb35fb;
    stim[33] = 147'h1fd5bc5b82e71ce7d5ffafe405e68ae289531;
    stim[34] = 147'h3ceb5900205c28d0262d9595e3edebbd7214b;
    stim[35] = 147'h01e51321dc7425fae09c403fa551e66feac44;
    stim[36] = 147'h2788a15bdce703550eeb75eb29cb79ce8c543;
    stim[37] = 147'h388f36d9451941e54c48b5c66e1c3159708c8;
    stim[38] = 147'h22b870f069451ba86aa32a6e5b3caa50bddff;
    stim[39] = 147'h16950c5e20b4668de51524b59eef6d7a5d35c;
    stim[40] = 147'h1940e4e98a2e408b27ee4f464e15a41767576;
    stim[41] = 147'h32fbddb54845e1567e365a70fd57cc24edcd0;
    stim[42] = 147'h0f56d05db03ef75f0667360f16efe3d88d52b;
    stim[43] = 147'h26ee550f9b05df07ca372fa5ab88843b59bbe;
    stim[44] = 147'h0ffefb242c586ea47cdd97b90f15eabb5f741;
    stim[45] = 147'h38b2c706cc410e972bbcd8b79800e6b8d4f2d;
    stim[46] = 147'h23028c0552462b6ccb7bdcfa49c1f60eb281b;
    stim[47] = 147'h16183aebf79f896739b24d910c8d3cfe2034a;
    stim[48] = 147'h08a4c5fd30d5fe05238adb1602596a9beed0d;
    stim[49] = 147'h168ee33082e7040aea04beb4baa5150e05810;
    stim[50] = 147'h116e1e24c0a745b9db1e184d30421d11906ae;
    stim[51] = 147'h0acd5bf3003ad2835e3b7041318c2b58ee2bf;
    stim[52] = 147'h0fa32be9adac96fbbf96a706537fba17bd071;
    stim[53] = 147'h0e114a16ed2b0c80f4c17ccd9b9075d6c8b67;
    stim[54] = 147'h24d04d5c5f1b258786847b87df3ea169a0a2b;
    stim[55] = 147'h7b9a0762c921f0e85cf95e9d257998639ec9a;
    stim[56] = 147'h1021d4cb89e810874d4bf624058bddeaf0fd2;
    stim[57] = 147'h1a2ddae906be2739de548e3ccc85a876b41bf;
    stim[58] = 147'h25feab8c99874a28c46238783b23a11c9457f;
    stim[59] = 147'h199029576e500d8e112ecd600f3d574a64998;
    stim[60] = 147'h358ed0dfd77a3510b97967f653f002145351d;
    stim[61] = 147'h3b727bc4b4e438c9efa591103e7272608144c;
    stim[62] = 147'h1e75a6e602a43484582be023348c13227e6ee;
    stim[63] = 147'h23a38338dba9f50dad870c3dc94b24cc003f0;
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
      expv[0] = 146'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 146'h0000c8b272660000000000000000000000000;
      expv[2] = 146'h00012c04e6700000000000000000000000000;
      expv[3] = 146'h19c3f85eac03fb6bca7989d67e71aa7e3966e;
      expv[4] = 146'h368553661d43534e68ca1d1010517df93f326;
      expv[5] = 146'h276fa25da6ee864e03cb78863029ed3603a15;
      expv[6] = 146'h311da16a8d28ab32b527364ab4ceac97de376;
      expv[7] = 146'h1336b97f4f699135b85aeecf5ee60fd8c5b20;
      expv[8] = 146'h333f308f5b6d01265c5669eccc5d645a2513b;
      expv[9] = 146'h2f4ef50f0f4ca80ba52ad3d33b291f1a21f02;
      expv[10] = 146'h3a31c43b19c19d517c09c86108a66a910b8e2;
      expv[11] = 146'h25a3ddf937a230830173370569b31c11467c8;
      expv[12] = 146'h116ee47df386ccd9378954fcbb66f8ea4d58d;
      expv[13] = 146'h29cd517e5ca5e03738dc2ecdba51a0f4da35d;
      expv[14] = 146'h1b73ce6d34bf1ddb62b1cc3b7550400e6f728;
      expv[15] = 146'h0b5d86bb09820a435573569198907eb940f56;
      expv[16] = 146'h35578866aa788ea1c666c78af8606b0ef2d52;
      expv[17] = 146'h393b448d0912bdd1b0755b38f941b7815a23e;
      expv[18] = 146'h1ac56db1892b67ec1a9fe37a42e5d05ad2f64;
      expv[19] = 146'h3686cd1bc51ad02a77b032929146854ce7971;
      expv[20] = 146'h0ae10fb16ec4ead871aab8c77b78f47c1deb0;
      expv[21] = 146'h36121ad42e62e91699bcd9b5485dc8616ec9b;
      expv[22] = 146'h0272844b3787626d70f1f027f8900e1c60bf0;
      expv[23] = 146'h3e6e7c6fd6744a26d8d5cec103b821cf39636;
      expv[24] = 146'h3800a89e597e2c6323bc47d94c688b219f730;
      expv[25] = 146'h07383acffcfe5597dba8e0f20716449fa54ea;
      expv[26] = 146'h0761d2dadf475e2f63f5e2346868e2a2004bd;
      expv[27] = 146'h2574d00b09b134c4004c6aab90961fc560e71;
      expv[28] = 146'h224fed957151949e7032c2394041b1a215e88;
      expv[29] = 146'h211588561815bfa8832ae29b2598fd84071a3;
      expv[30] = 146'h3d01565f424425bd636453b3ecee1e4e5fb04;
      expv[31] = 146'h37fb698c3e788605bf299d81483a9586105bd;
      expv[32] = 146'h24a2e76d8ce7e93238b74392b1ac850c2071a;
      expv[33] = 146'h2d3d030ef972b0f45a3f42b5c112054bb35fb;
      expv[34] = 146'h1fd5bc5b82e71ce7d5ffafe405e68ae289531;
      expv[35] = 146'h3ceb5900205c28d0262d9595e3edebbd7214b;
      expv[36] = 146'h01e51321dc7425fae09c403fa551e66feac44;
      expv[37] = 146'h2788a15bdce703550eeb75eb29cb79ce8c543;
      expv[38] = 146'h388f36d9451941e54c48b5c66e1c3159708c8;
      expv[39] = 146'h22b870f069451ba86aa32a6e5b3caa50bddff;
      expv[40] = 146'h16950c5e20b4668de51524b59eef6d7a5d35c;
      expv[41] = 146'h1940e4e98a2e408b27ee4f464e15a41767576;
      expv[42] = 146'h32fbddb54845e1567e365a70fd57cc24edcd0;
      expv[43] = 146'h0f56d05db03ef75f0667360f16efe3d88d52b;
      expv[44] = 146'h26ee550f9b05df07ca372fa5ab88843b59bbe;
      expv[45] = 146'h0ffefb242c586ea47cdd97b90f15eabb5f741;
      expv[46] = 146'h38b2c706cc410e972bbcd8b79800e6b8d4f2d;
      expv[47] = 146'h23028c0552462b6ccb7bdcfa49c1f60eb281b;
      expv[48] = 146'h16183aebf79f896739b24d910c8d3cfe2034a;
      expv[49] = 146'h08a4c5fd30d5fe05238adb1602596a9beed0d;
      expv[50] = 146'h168ee33082e7040aea04beb4baa5150e05810;
      expv[51] = 146'h116e1e24c0a745b9db1e184d30421d11906ae;
      expv[52] = 146'h0acd5bf3003ad2835e3b7041318c2b58ee2bf;
      expv[53] = 146'h0fa32be9adac96fbbf96a706537fba17bd071;
      expv[54] = 146'h0e114a16ed2b0c80f4c17ccd9b9075d6c8b67;
      expv[55] = 146'h24d04d5c5f1b258786847b87df3ea169a0a2b;
      expv[56] = 146'h00000762c9200000000000000000000000000;
      expv[57] = 146'h1021d4cb89e810874d4bf624058bddeaf0fd2;
      expv[58] = 146'h1a2ddae906be2739de548e3ccc85a876b41bf;
      expv[59] = 146'h25feab8c99874a28c46238783b23a11c9457f;
      expv[60] = 146'h199029576e500d8e112ecd600f3d574a64998;
      expv[61] = 146'h358ed0dfd77a3510b97967f653f002145351d;
      expv[62] = 146'h3b727bc4b4e438c9efa591103e7272608144c;
      expv[63] = 146'h1e75a6e602a43484582be023348c13227e6ee;
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
