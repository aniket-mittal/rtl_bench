// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 107;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150187 dut (
    .Clk(clk),
    .MemtoReg(in_vec[106:106]),
    .DontMove(in_vec[105:105]),
    .jal(in_vec[104:104]),
    .RegWrite(in_vec[103:103]),
    .MemRead(in_vec[102:102]),
    .MemWrite(in_vec[101:101]),
    .ReadData(in_vec[100:69]),
    .ALUResult(in_vec[68:37]),
    .PCResult(in_vec[36:5]),
    .WriteRegister(in_vec[4:0]),
    .MemtoReg_o(out_vec[106:106]),
    .DontMove_o(out_vec[105:105]),
    .jal_o(out_vec[104:104]),
    .RegWrite_o(out_vec[103:103]),
    .MemRead_o(out_vec[102:102]),
    .MemWrite_o(out_vec[101:101]),
    .ReadData_o(out_vec[100:69]),
    .ALUResult_o(out_vec[68:37]),
    .PCResult_o(out_vec[36:5]),
    .WriteRegister_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h0c2f6d6637e030dbf731c74c1af;
    stim[1] = 107'h3e504e30b97d1cc1c97404cda2c;
    stim[2] = 107'h0c652ae7f3e32a93d7db6c6ef82;
    stim[3] = 107'h65c5a4037385852a66af92f7e47;
    stim[4] = 107'h6c57eef9db6d267879213e94931;
    stim[5] = 107'h18603e5e8e74c2f7aeb734f420d;
    stim[6] = 107'h4345c1b80293bfde4ce9657e690;
    stim[7] = 107'h3097087899c015e74e5d057fb60;
    stim[8] = 107'h7d0d926d03f020c3dc89a18c468;
    stim[9] = 107'h06c861550afd43a96343eade033;
    stim[10] = 107'h4ff93e73d1cc03936b216ff646d;
    stim[11] = 107'h656d8fbe9c074a5d45be792cf9b;
    stim[12] = 107'h1e70421fc2492130240f5d5f91e;
    stim[13] = 107'h7c623e8fc087173043858486947;
    stim[14] = 107'h379def2ef3ef906d4933e1e6888;
    stim[15] = 107'h5a518d89908cbdb15679d600e0b;
    stim[16] = 107'h377f995761845f9095315c732a6;
    stim[17] = 107'h2eab2def346191e87974eeac387;
    stim[18] = 107'h3bc2eb62b410055ec251572fa87;
    stim[19] = 107'h1e0063e5aeff23a24a6f6871ce9;
    stim[20] = 107'h699ef99df363c27bec21af7672a;
    stim[21] = 107'h31804df6b78661aea4607db07bf;
    stim[22] = 107'h7c8a4ad5c8d5e4dc5ccb10059d3;
    stim[23] = 107'h120e623d722dca898ceb7fddb3d;
    stim[24] = 107'h710a0e4d3e027c28c9d928d273d;
    stim[25] = 107'h63cfd4e785fc9462239611b6a84;
    stim[26] = 107'h0710e44b01c02f699436248eaef;
    stim[27] = 107'h41fb4925cf5b36cd86bb5d65307;
    stim[28] = 107'h1b97356a87a0d6933312a4094ff;
    stim[29] = 107'h5f5dd5ed96258b22f270a36041c;
    stim[30] = 107'h57a956c12d0ffdd842b7765783b;
    stim[31] = 107'h5db5bffc3fa0c6f84b380b08933;
    stim[32] = 107'h54aeaa6a999341ac059f2b0e943;
    stim[33] = 107'h469db75ce688e44692bbec3e78a;
    stim[34] = 107'h6d816e8b773a8ffff72d5a3e751;
    stim[35] = 107'h72d1fdf8c336b077a936cb0f33f;
    stim[36] = 107'h111353c76da601964b18480f17f;
    stim[37] = 107'h36e09b0f1eb7f355420eb08e858;
    stim[38] = 107'h0ae5b8887d5fada1c77591650fe;
    stim[39] = 107'h26640c9db445a2a1cd68d10ddf7;
    stim[40] = 107'h40cbf34383022bdfbc9c34b0cc0;
    stim[41] = 107'h3cf426b817ee9e02afaeee3521c;
    stim[42] = 107'h3ae6dd0e186b7ab839601d36fb7;
    stim[43] = 107'h73289cf1163cada50cb80c87812;
    stim[44] = 107'h614d1f9d8d97d3180ff1dccc62e;
    stim[45] = 107'h2c62f62be7e2926b1607f9a7232;
    stim[46] = 107'h63d5fffcb631666f3b984da6cf6;
    stim[47] = 107'h0bd530e1381d08f28ef2dac002f;
    stim[48] = 107'h3438ef36c18e700e76916ae8d01;
    stim[49] = 107'h093788db729a9f170c29c95edbf;
    stim[50] = 107'h00bafdfd2dec879aae88ec34a45;
    stim[51] = 107'h1521eacb114e936d3fd40d91ff1;
    stim[52] = 107'h7151168cbb51c45c8cd4482864f;
    stim[53] = 107'h49295918fa306d797d7e9869032;
    stim[54] = 107'h1908f04750ccd128ba0e1fcfb31;
    stim[55] = 107'h461e3f472c72544e02078047ff8;
    stim[56] = 107'h3850006638878f801697288d7a0;
    stim[57] = 107'h55efcea1fb2ee098a9bf70754c0;
    stim[58] = 107'h3c12786100986d2603f64cde3cd;
    stim[59] = 107'h269f1c0040dd7aeedaad29e9e1a;
    stim[60] = 107'h27b2eac8f6c694d360efddc8dec;
    stim[61] = 107'h4d6fbcd0e30263d5f508a643171;
    stim[62] = 107'h2f4cc6d41478b30f93f6603af37;
    stim[63] = 107'h4bfb597833cabfab4913f8f5546;
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
      expv[0] = 107'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 107'h0c2f6d6637e030dbf731c74c1af;
      expv[2] = 107'h3e504e30b97d1cc1c97404cda2c;
      expv[3] = 107'h0c652ae7f3e32a93d7db6c6ef82;
      expv[4] = 107'h65c5a4037385852a66af92f7e47;
      expv[5] = 107'h6c57eef9db6d267879213e94931;
      expv[6] = 107'h18603e5e8e74c2f7aeb734f420d;
      expv[7] = 107'h4345c1b80293bfde4ce9657e690;
      expv[8] = 107'h3097087899c015e74e5d057fb60;
      expv[9] = 107'h7d0d926d03f020c3dc89a18c468;
      expv[10] = 107'h06c861550afd43a96343eade033;
      expv[11] = 107'h4ff93e73d1cc03936b216ff646d;
      expv[12] = 107'h656d8fbe9c074a5d45be792cf9b;
      expv[13] = 107'h1e70421fc2492130240f5d5f91e;
      expv[14] = 107'h7c623e8fc087173043858486947;
      expv[15] = 107'h379def2ef3ef906d4933e1e6888;
      expv[16] = 107'h5a518d89908cbdb15679d600e0b;
      expv[17] = 107'h377f995761845f9095315c732a6;
      expv[18] = 107'h2eab2def346191e87974eeac387;
      expv[19] = 107'h3bc2eb62b410055ec251572fa87;
      expv[20] = 107'h1e0063e5aeff23a24a6f6871ce9;
      expv[21] = 107'h699ef99df363c27bec21af7672a;
      expv[22] = 107'h31804df6b78661aea4607db07bf;
      expv[23] = 107'h7c8a4ad5c8d5e4dc5ccb10059d3;
      expv[24] = 107'h120e623d722dca898ceb7fddb3d;
      expv[25] = 107'h710a0e4d3e027c28c9d928d273d;
      expv[26] = 107'h63cfd4e785fc9462239611b6a84;
      expv[27] = 107'h0710e44b01c02f699436248eaef;
      expv[28] = 107'h41fb4925cf5b36cd86bb5d65307;
      expv[29] = 107'h1b97356a87a0d6933312a4094ff;
      expv[30] = 107'h5f5dd5ed96258b22f270a36041c;
      expv[31] = 107'h57a956c12d0ffdd842b7765783b;
      expv[32] = 107'h5db5bffc3fa0c6f84b380b08933;
      expv[33] = 107'h54aeaa6a999341ac059f2b0e943;
      expv[34] = 107'h469db75ce688e44692bbec3e78a;
      expv[35] = 107'h6d816e8b773a8ffff72d5a3e751;
      expv[36] = 107'h72d1fdf8c336b077a936cb0f33f;
      expv[37] = 107'h111353c76da601964b18480f17f;
      expv[38] = 107'h36e09b0f1eb7f355420eb08e858;
      expv[39] = 107'h0ae5b8887d5fada1c77591650fe;
      expv[40] = 107'h26640c9db445a2a1cd68d10ddf7;
      expv[41] = 107'h40cbf34383022bdfbc9c34b0cc0;
      expv[42] = 107'h3cf426b817ee9e02afaeee3521c;
      expv[43] = 107'h3ae6dd0e186b7ab839601d36fb7;
      expv[44] = 107'h73289cf1163cada50cb80c87812;
      expv[45] = 107'h614d1f9d8d97d3180ff1dccc62e;
      expv[46] = 107'h2c62f62be7e2926b1607f9a7232;
      expv[47] = 107'h63d5fffcb631666f3b984da6cf6;
      expv[48] = 107'h0bd530e1381d08f28ef2dac002f;
      expv[49] = 107'h3438ef36c18e700e76916ae8d01;
      expv[50] = 107'h093788db729a9f170c29c95edbf;
      expv[51] = 107'h00bafdfd2dec879aae88ec34a45;
      expv[52] = 107'h1521eacb114e936d3fd40d91ff1;
      expv[53] = 107'h7151168cbb51c45c8cd4482864f;
      expv[54] = 107'h49295918fa306d797d7e9869032;
      expv[55] = 107'h1908f04750ccd128ba0e1fcfb31;
      expv[56] = 107'h461e3f472c72544e02078047ff8;
      expv[57] = 107'h3850006638878f801697288d7a0;
      expv[58] = 107'h55efcea1fb2ee098a9bf70754c0;
      expv[59] = 107'h3c12786100986d2603f64cde3cd;
      expv[60] = 107'h269f1c0040dd7aeedaad29e9e1a;
      expv[61] = 107'h27b2eac8f6c694d360efddc8dec;
      expv[62] = 107'h4d6fbcd0e30263d5f508a643171;
      expv[63] = 107'h2f4cc6d41478b30f93f6603af37;
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
