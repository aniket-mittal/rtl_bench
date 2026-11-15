// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01124 dut (
    .clk(clk),
    .rst(in_vec[131:131]),
    .opa_i(in_vec[130:99]),
    .opb_i(in_vec[98:67]),
    .qutnt_i(in_vec[66:40]),
    .rmndr_i(in_vec[39:13]),
    .exp_10_i(in_vec[12:3]),
    .sign_i(in_vec[2:2]),
    .rmode_i(in_vec[1:0]),
    .output_o(out_vec[32:1]),
    .ine_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'hca7cbce6b9e59c66426f6719895439d04;
    stim[1] = 132'h9d0502ac3ece340ba80f9febfe399fa8d;
    stim[2] = 132'h7cf052f422e1d5acc262446c2b0a96453;
    stim[3] = 132'h03326a575d5a00e214270ece98a881be5;
    stim[4] = 132'h3b39431b64866bf7e985d9cb5e663f499;
    stim[5] = 132'h9512a10117c95ee177de5c6612a75e353;
    stim[6] = 132'h6b1001b4ee56c910b6e5c41d38f62c10d;
    stim[7] = 132'h709a37bdc5c2e2b4b37b50e74a1e302f0;
    stim[8] = 132'h2e76635352df154eb56ce33d61b9bbf92;
    stim[9] = 132'h1a47b9f80ec9736f7bab4c083032f8e38;
    stim[10] = 132'h2fce1baf2c972ec6086e09c84866e1d29;
    stim[11] = 132'h751234e81800285774629d36455d83601;
    stim[12] = 132'h6ae9af0cda286ef1faa380c31e00e4277;
    stim[13] = 132'h6da30a58b0afd5f0824e0b0bc38afd868;
    stim[14] = 132'h3734403c1a18e6a23091f4c904d86523f;
    stim[15] = 132'h0801c44991cf5abdba1ed1d9252a92f26;
    stim[16] = 132'h00d3b4956bf8eea122ec11925630ad870;
    stim[17] = 132'h11230ddf810d5263480d69fb0d73adf2a;
    stim[18] = 132'h25016cefd4342629924572acba542f334;
    stim[19] = 132'h04eb64f1806833211a98a41a089439d22;
    stim[20] = 132'h05f62f4e146e83320cb97f1d55ef15f0c;
    stim[21] = 132'h6c4f4dd00ce5a996b6dfe00c5c19f4539;
    stim[22] = 132'h5d9a4d04b1039f5740ab312a6d8811da5;
    stim[23] = 132'h0ccde139a7bc475487b19442a80c70c34;
    stim[24] = 132'h011eefe9eb082de7c70e4df0e688d5b97;
    stim[25] = 132'h49abcf6136e99db2d7ce90946b3165b8e;
    stim[26] = 132'h206d256547790d8f1f99c5aaf28c52f3b;
    stim[27] = 132'h7f0d461915e1a659a55cb18633156a27a;
    stim[28] = 132'h68ec5f568084780452203a3b88652e656;
    stim[29] = 132'h34299cc14a78ac49415516f49590478fa;
    stim[30] = 132'h470d61357bca9f763556351f1cd9ee376;
    stim[31] = 132'h0cffe6044f022ef318d65b094c370c6f7;
    stim[32] = 132'h1c1d4850912681223597a4d26c81386b1;
    stim[33] = 132'h26352b9b2215c178221d5c0c7866e7912;
    stim[34] = 132'h2f302954156c2994c4c79cfecc4279c3e;
    stim[35] = 132'h02725d466e7d6657c53145bc04a81c13a;
    stim[36] = 132'h6007991443b298d6cc0671fcadbce960e;
    stim[37] = 132'h7ea10337d7dc814c980f7f989afadd423;
    stim[38] = 132'h19b3f2422c2e04e6b4ebe4e340e8317b3;
    stim[39] = 132'h763278c4426e3408af13a0b64fe2ac106;
    stim[40] = 132'h47aae44a1e016d0658c59292d0df00deb;
    stim[41] = 132'h7dd7ecce4be1967cb251e7427e76a1931;
    stim[42] = 132'h764b9588ce22c59278b91ab15f9a81b4a;
    stim[43] = 132'h16ee1d13c9126c5f5c846761e37091c5c;
    stim[44] = 132'h073345a959989a59eaab833e75f4cf607;
    stim[45] = 132'h1fea26e234029179d7fc6548280dc096b;
    stim[46] = 132'h7f077e3f311e414b5cc45f88c0ffb1fe8;
    stim[47] = 132'h2781b8d4a60bb17242d1d99904aac810a;
    stim[48] = 132'h265b4e8b673078846b29c4a4e2615aeae;
    stim[49] = 132'h286de037ac15281880aa8e7be32fe6549;
    stim[50] = 132'h67bd4177071a687621ce2e1a253e7befb;
    stim[51] = 132'h24119895bc044b1c8680413f3563c2379;
    stim[52] = 132'h0347504872b94dfc802aade25ac32fd70;
    stim[53] = 132'h1c92af0df6e8ce89b7a7d13b9b5266527;
    stim[54] = 132'h0e873ffd737a9a3598f8c74ecb01d7f3b;
    stim[55] = 132'h2b0d4c1571be05a3931fb014ddbb09fcb;
    stim[56] = 132'h725a63cba1eb28da7da6906d01d405ae1;
    stim[57] = 132'h526814abfc3cdb2f4842b11f1a1c192fa;
    stim[58] = 132'h245572540f33b5a4170044d83977e992c;
    stim[59] = 132'h4185b0aae57f4c53c46cd6c865744eb2a;
    stim[60] = 132'h261417238a542247253dc7e6723fa0297;
    stim[61] = 132'h51de31fed287c53f90236b711d9f84ec8;
    stim[62] = 132'h31aaaf16805b94d568a4e57b14c3e26eb;
    stim[63] = 132'h41afb0e1cf2c2bf6268c1c4d0d89c3a52;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h0ff800000;
      expv[4] = 33'h0ff000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h0ff800000;
      expv[8] = 33'h1ff000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h01f6dcb89;
      expv[11] = 33'h05d9bda89;
      expv[12] = 33'h001ab671b;
      expv[13] = 33'h0ff000001;
      expv[14] = 33'h10021b827;
      expv[15] = 33'h000000003;
      expv[16] = 33'h14d000001;
      expv[17] = 33'h10009382f;
      expv[18] = 33'h000000001;
      expv[19] = 33'h0ff000001;
      expv[20] = 33'h1008bb049;
      expv[21] = 33'h000000001;
      expv[22] = 33'h100000003;
      expv[23] = 33'h000000001;
      expv[24] = 33'h100000001;
      expv[25] = 33'h1a5000001;
      expv[26] = 33'h10005598b;
      expv[27] = 33'h1ff000001;
      expv[28] = 33'h0011c3937;
      expv[29] = 33'h0000002bf;
      expv[30] = 33'h1ff000001;
      expv[31] = 33'h04d9572c7;
      expv[32] = 33'h1c99101d3;
      expv[33] = 33'h10105545b;
      expv[34] = 33'h06c000003;
      expv[35] = 33'h0dcc6b2d9;
      expv[36] = 33'h1d5acbd29;
      expv[37] = 33'h00110eae1;
      expv[38] = 33'h100000003;
      expv[39] = 33'h026000001;
      expv[40] = 33'h0013019c7;
      expv[41] = 33'h100000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h01e001789;
      expv[44] = 33'h0ff000001;
      expv[45] = 33'h100c9479f;
      expv[46] = 33'h100000001;
      expv[47] = 33'h000000003;
      expv[48] = 33'h000000001;
      expv[49] = 33'h0ff000001;
      expv[50] = 33'h101731181;
      expv[51] = 33'h02010b477;
      expv[52] = 33'h0ff000001;
      expv[53] = 33'h0a702aa39;
      expv[54] = 33'h0010e7171;
      expv[55] = 33'h16d000001;
      expv[56] = 33'h000015571;
      expv[57] = 33'h0a2000001;
      expv[58] = 33'h000c7c63b;
      expv[59] = 33'h000000001;
      expv[60] = 33'h10001f69d;
      expv[61] = 33'h000000001;
      expv[62] = 33'h100000003;
      expv[63] = 33'h0ff000001;
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
