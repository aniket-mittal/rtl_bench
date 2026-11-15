// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116361 dut (
    .clk(clk),
    .rst(in_vec[107:107]),
    .ALUInPipeIn(in_vec[106:75]),
    .PCSrcInPipeIn(in_vec[74:74]),
    .WriteData2InPipeIn(in_vec[73:42]),
    .PCDataInPipeIn(in_vec[41:10]),
    .RegWrite(in_vec[9:9]),
    .MemRead(in_vec[8:8]),
    .MemWrite(in_vec[7:7]),
    .MemToReg(in_vec[6:6]),
    .WriteRegInPipeIn(in_vec[5:1]),
    .ControlHazard(in_vec[0:0]),
    .ALUInPipeOut(out_vec[105:74]),
    .PCSrcInPipeOut(out_vec[73:73]),
    .WriteData2InPipeOut(out_vec[72:41]),
    .PCDataInPipeOut(out_vec[40:9]),
    .RegWriteOut(out_vec[8:8]),
    .MemReadOut(out_vec[7:7]),
    .MemWriteOut(out_vec[6:6]),
    .MemToRegOut(out_vec[5:5]),
    .WriteRegInPipeOut(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'he7e05c02915ef2b8f5a10777ce5;
    stim[1] = 108'hc967ee2c35615f2cbb8154fd81f;
    stim[2] = 108'h5ea1f4b43c79677e1b9efdcf0ad;
    stim[3] = 108'h4bc10e996fd9c7f0a624a7034dc;
    stim[4] = 108'h1ae87ad4b2bc9aed621a24f3f2f;
    stim[5] = 108'h3b6dbb7ffb56928c2c13c98bce3;
    stim[6] = 108'h43d31ad314816ab9a6821b8beaf;
    stim[7] = 108'h6a2bb8a79ceb8d9c66de83335b8;
    stim[8] = 108'h24fcd42ad8d515ae55bc020d2c3;
    stim[9] = 108'h0992b09b70a89bc4e07a1aaa546;
    stim[10] = 108'h35a1f864e6518644561680416cc;
    stim[11] = 108'h0deeb8a960e667c9add4d46d843;
    stim[12] = 108'h7cb6427f1ba0333f0ef685c5124;
    stim[13] = 108'h2c1e64e74ca0c4e552d3304b51d;
    stim[14] = 108'h45635ef0e3c7566c6f41130c259;
    stim[15] = 108'h01d4c155f4db243e33e66079af4;
    stim[16] = 108'h28827fb39b9fd8a27e84d816f36;
    stim[17] = 108'h51174f895048dd91aba06466203;
    stim[18] = 108'h16c5d4c48a015603db84dc31420;
    stim[19] = 108'h610da447f087ac56a2acae1995a;
    stim[20] = 108'h52824b0c2fd59fc561a636bcce9;
    stim[21] = 108'h3d3e94d80cdf4aaa9ddb487900c;
    stim[22] = 108'h312f5903aefe8a02b314453ba24;
    stim[23] = 108'h7fa617bd604cc0f0e3fd7264edf;
    stim[24] = 108'h4b35a0e114c248eea4e49560346;
    stim[25] = 108'h07803b5ac5bf504ff64b740d22e;
    stim[26] = 108'h4734d31efe9f1d3a23f58248701;
    stim[27] = 108'h7012b754773729e3cf6e2411646;
    stim[28] = 108'h563fd9d4fa2d8dddc9c89256244;
    stim[29] = 108'h5ab1442a88ef2e942cc44559cc8;
    stim[30] = 108'h63f7b78f8537267810ac69b1274;
    stim[31] = 108'h52e87c53ad3a5958ee20752ad53;
    stim[32] = 108'h044ced29cdf484e95986d97620a;
    stim[33] = 108'h79d7fed085c1f32f8025548ef15;
    stim[34] = 108'h719cd5eb8e0ba371211780a37f2;
    stim[35] = 108'h0b714e93254cc0ba41e5043b550;
    stim[36] = 108'h6b7371e62620a3466baf155f733;
    stim[37] = 108'h70a57d7f3e491b86b0eb57919d2;
    stim[38] = 108'h39d2fb73e878168792697e5c666;
    stim[39] = 108'h58ccc2e7b64f98db56eab61acfa;
    stim[40] = 108'h620312eab5bdcc33344a99d2054;
    stim[41] = 108'h48dbaca3b9634571de02bf2a164;
    stim[42] = 108'h28900cd29f6786d6b1829ec613d;
    stim[43] = 108'h07fb321f11bc9ddfd11f85f57fc;
    stim[44] = 108'h30eaee83608f0af0d39acc1390b;
    stim[45] = 108'h0c099d545dcf8925c62d589b615;
    stim[46] = 108'h6d19f03ae73f55ba4d29040a550;
    stim[47] = 108'h5116d1324b354c9c760b1fa5eda;
    stim[48] = 108'h4a7b65ab39d86746c7806c3e13a;
    stim[49] = 108'h5709dd9ccb6aee1119308681143;
    stim[50] = 108'h790807f9def82dec24735b6509f;
    stim[51] = 108'h552546c6ff67f38f000d8b90852;
    stim[52] = 108'h5c0e1afc87ee0de46b656d538af;
    stim[53] = 108'h59dd38d969c4e0e94edaa6aad41;
    stim[54] = 108'h70e93b9d95ff03dbd921490a14a;
    stim[55] = 108'h0e42a07f4a91c045f94bdeef1ae;
    stim[56] = 108'h20742c8026c0e423b6ee86ba3d7;
    stim[57] = 108'h70fe5228008358e1495b2a61c27;
    stim[58] = 108'h3075fdc8ba0083378f3cabdf369;
    stim[59] = 108'h31c1bdb3dff5aa1df271c19ec86;
    stim[60] = 108'h5c67dc66b2f7daf43076a4bf5b7;
    stim[61] = 108'hc0503e1927e217347c4b911a59f;
    stim[62] = 108'h3f4745a916a1dfc8b341cd01726;
    stim[63] = 108'h6c42c9fde4062858d22b0db6f94;
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
      expv[0] = 106'h000000000000000000000000000;
      expv[1] = 106'h33f02e0148af795c7ad083bbe72;
      expv[2] = 106'h000000000000000000000000000;
      expv[3] = 106'h000000000000000000000000000;
      expv[4] = 106'h000000000000000000000000000;
      expv[5] = 106'h000000000000000000000000000;
      expv[6] = 106'h000000000000000000000000000;
      expv[7] = 106'h000000000000000000000000000;
      expv[8] = 106'h000000000000000000000000000;
      expv[9] = 106'h000000000000000000000000000;
      expv[10] = 106'h000000000000000000000000000;
      expv[11] = 106'h000000000000000000000000000;
      expv[12] = 106'h000000000000000000000000000;
      expv[13] = 106'h000000000000000000000000000;
      expv[14] = 106'h000000000000000000000000000;
      expv[15] = 106'h000000000000000000000000000;
      expv[16] = 106'h000000000000000000000000000;
      expv[17] = 106'h000000000000000000000000000;
      expv[18] = 106'h000000000000000000000000000;
      expv[19] = 106'h000000000000000000000000000;
      expv[20] = 106'h000000000000000000000000000;
      expv[21] = 106'h000000000000000000000000000;
      expv[22] = 106'h000000000000000000000000000;
      expv[23] = 106'h000000000000000000000000000;
      expv[24] = 106'h000000000000000000000000000;
      expv[25] = 106'h000000000000000000000000000;
      expv[26] = 106'h000000000000000000000000000;
      expv[27] = 106'h000000000000000000000000000;
      expv[28] = 106'h000000000000000000000000000;
      expv[29] = 106'h000000000000000000000000000;
      expv[30] = 106'h000000000000000000000000000;
      expv[31] = 106'h000000000000000000000000000;
      expv[32] = 106'h000000000000000000000000000;
      expv[33] = 106'h000000000000000000000000000;
      expv[34] = 106'h000000000000000000000000000;
      expv[35] = 106'h000000000000000000000000000;
      expv[36] = 106'h000000000000000000000000000;
      expv[37] = 106'h000000000000000000000000000;
      expv[38] = 106'h000000000000000000000000000;
      expv[39] = 106'h000000000000000000000000000;
      expv[40] = 106'h000000000000000000000000000;
      expv[41] = 106'h000000000000000000000000000;
      expv[42] = 106'h000000000000000000000000000;
      expv[43] = 106'h000000000000000000000000000;
      expv[44] = 106'h000000000000000000000000000;
      expv[45] = 106'h000000000000000000000000000;
      expv[46] = 106'h000000000000000000000000000;
      expv[47] = 106'h000000000000000000000000000;
      expv[48] = 106'h000000000000000000000000000;
      expv[49] = 106'h000000000000000000000000000;
      expv[50] = 106'h000000000000000000000000000;
      expv[51] = 106'h000000000000000000000000000;
      expv[52] = 106'h000000000000000000000000000;
      expv[53] = 106'h000000000000000000000000000;
      expv[54] = 106'h000000000000000000000000000;
      expv[55] = 106'h000000000000000000000000000;
      expv[56] = 106'h000000000000000000000000000;
      expv[57] = 106'h000000000000000000000000000;
      expv[58] = 106'h000000000000000000000000000;
      expv[59] = 106'h000000000000000000000000000;
      expv[60] = 106'h000000000000000000000000000;
      expv[61] = 106'h000000000000000000000000000;
      expv[62] = 106'h000000000000000000000000000;
      expv[63] = 106'h000000000000000000000000000;
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
