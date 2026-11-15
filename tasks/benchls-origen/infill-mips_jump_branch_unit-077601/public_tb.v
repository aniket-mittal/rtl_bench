// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 168;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077601 dut (
    .rst(in_vec[167:167]),
    .i_op(in_vec[166:161]),
    .i_sign_ext(in_vec[160:129]),
    .i_jump_address(in_vec[128:97]),
    .i_pc(in_vec[96:65]),
    .i_rs_reg(in_vec[64:33]),
    .i_rt_reg(in_vec[32:1]),
    .is_stall(in_vec[0:0]),
    .os_taken(out_vec[66:66]),
    .os_write_pc(out_vec[65:65]),
    .os_select_addr_reg(out_vec[64:64]),
    .o_jump_address(out_vec[63:32]),
    .o_pc_to_reg(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 168'he757728962526392ccfa15351a60abc9642ef1b1a6;
    stim[1] = 168'hacaf3064a823ac98ec6b7466d68df28bddb7852ce2;
    stim[2] = 168'h4fb62bb099efb9596db131563b415bc66827fae36e;
    stim[3] = 168'h0435b062b10503d71bc6ccab770f99bcbc6325234c;
    stim[4] = 168'h714379eece9e6a8745e60c134c430ad4baa5968e68;
    stim[5] = 168'h4a6bb939bacdf368e7a5e4446ace31ef116c69661f;
    stim[6] = 168'h6b208c42fd4d975efce16dc22794a594efb37822ea;
    stim[7] = 168'h1b0c744e493c6864fb0aedc48158a5c37d9b74e480;
    stim[8] = 168'h6a04457855910531b3276e2999353c6bb502902956;
    stim[9] = 168'h71531ffb5734bcd698782eba7c28b9ec5ef5f801a1;
    stim[10] = 168'h258f997058d0ba3d187ecdba98123cc87a56d23902;
    stim[11] = 168'h61d8cc828305a4ec53912bcd28bd2814788360be0f;
    stim[12] = 168'h7569655cd1d9f2ec9e8863112b65118f55590538b9;
    stim[13] = 168'h4eca0f5b5517736a365427c375cf1eb382a5517bf3;
    stim[14] = 168'h634cf3bec114dbdd188e228b51225b2e4fd9f37064;
    stim[15] = 168'h51a0d90e6ae36bddfe46295ac75f87ed3af22d7548;
    stim[16] = 168'h19b6c9e5c798edd7be5558754e55229556f96e9e50;
    stim[17] = 168'h6743fbe24fcba9dfdba5ff69859a4d6e24d38bca52;
    stim[18] = 168'hded889179c99c5e7b91832156f6cbeaf3daa71e92d;
    stim[19] = 168'h64cc01a53de165de6f1cff0edf37b0d1077b7f2a1d;
    stim[20] = 168'h4e6f93392b8257a9ba8277e680e3ad793b105dd81b;
    stim[21] = 168'h4bf9baeb8dd36cdb28c1b9d9db71a1c28969b0c688;
    stim[22] = 168'h5adf99d2e3cd52d129af9d466aa9259a25062df96a;
    stim[23] = 168'h4faf4708bb5721436319a6f6098194da4e258dfd59;
    stim[24] = 168'h3fcf9ed84334bc97ab29f55fa7c51cf637860e7fec;
    stim[25] = 168'h1f3e72944a5c4c6856287847a876d7be7545d63c73;
    stim[26] = 168'h2e96dbb85a2c3e2d74b46ac5e756b9b63ebd2690f7;
    stim[27] = 168'h0757d3eeffb29103992e60a6214ce66efa8494f95f;
    stim[28] = 168'h145b57b5372c8de7bae507014ae4bfc0e63fdbd6b4;
    stim[29] = 168'h229307b615e93313d340789e1abd178478415cb3df;
    stim[30] = 168'h12f423d6a804aa8d95f21386015d1e47a51575791a;
    stim[31] = 168'h6bcac8f821d3a0d8089104fb5638406edb5e6c5780;
    stim[32] = 168'h47832eccaf4c3f9bc89f92b8c2176a44d9c9e28528;
    stim[33] = 168'h6a635bb97db488d1c94fedc5c7a8283f81403875cd;
    stim[34] = 168'h127093b78f0afb905d482be70f236cf53f2cd130a4;
    stim[35] = 168'h2b9ca7db5452e4e55b3d82d033f6de0e765573771f;
    stim[36] = 168'h416f0ca2fbc32ead9c646ac6b68ce89fd2c83848fc;
    stim[37] = 168'h0f291cc3fcebe15b65572480cdc21b90c8c9a0d8d6;
    stim[38] = 168'ha5f1c2829dd4c99d4ac27ab42973ffec8630413263;
    stim[39] = 168'h2a70318b6e38666844e44eec63353a678491457e88;
    stim[40] = 168'h42441a476e2358f808b94bbd0d027b002c715bb7ea;
    stim[41] = 168'h451f710427180d43cf1435c851cbc3d62176622919;
    stim[42] = 168'h487a7b88b4eb44bcad36d6f71a67c9882d490f7ed2;
    stim[43] = 168'h0acf918a41ce12dd15f219daa6e88e53bcfa7dfbc1;
    stim[44] = 168'h4ed3db76efda7e3e8aa1494c8eb2637ac10efe0406;
    stim[45] = 168'h05f2e8e8e0d0cec15a6d53bd887bcef677d619559e;
    stim[46] = 168'h2113c9151998c4101181ea7342d17459455ffd93a7;
    stim[47] = 168'h41c963660a52950a6d00823c253f6d0939fbc75b6f;
    stim[48] = 168'h4b00b5238787c6b5e9841d0e469cf1fb1e2fc8fd6e;
    stim[49] = 168'h537867cc55a5f7ff7aef1c1b3f4adfb33478a5255e;
    stim[50] = 168'h6f4dfa0bf3bab52d92a2941ee71dfa6de768d2c352;
    stim[51] = 168'h24c50343cfc1c4c0ec200e6cc851bc0d8d6401cde7;
    stim[52] = 168'h1e98aebc6bf8865dd93705187a355be0766987a5a4;
    stim[53] = 168'h424488247b94ab8233fad990a2ba55a2fe9e2ca154;
    stim[54] = 168'h70897dcde5b8e5bae06592eac5c01f2cd2e5ef371a;
    stim[55] = 168'h098d7967450013966c78307f2f4ad9834dc5bfb32b;
    stim[56] = 168'h286639edfdaedd16fb6044759b17fd7ea5a395186c;
    stim[57] = 168'h55d48838b91545bc1374111514ac2e9342eb44df89;
    stim[58] = 168'h435fd825280d9617a46bef0c3b2df5ac95eacc1278;
    stim[59] = 168'h6d178083941e08714e72a8d1feb27ea3d091de3736;
    stim[60] = 168'h1e8be92357c11752b4c0d7b0fbddf700a4d8029548;
    stim[61] = 168'h2b4d0f4d4b5187d2c602a24b05c138518435527ef6;
    stim[62] = 168'h6c716445be3dc5852b6d37e614c613bf36fa6a5e86;
    stim[63] = 168'h974ed8a0836dc1b4274b5743d25b1c01144de0cb13;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h6e281eb8d00000000;
      expv[4] = 67'h00000000000000000;
      expv[5] = 67'h00000000000000000;
      expv[6] = 67'h00000000000000000;
      expv[7] = 67'h00000000000000000;
      expv[8] = 67'h00000000000000000;
      expv[9] = 67'h00000000000000000;
      expv[10] = 67'h00000000000000000;
      expv[11] = 67'h00000000000000000;
      expv[12] = 67'h00000000000000000;
      expv[13] = 67'h00000000000000000;
      expv[14] = 67'h00000000000000000;
      expv[15] = 67'h00000000000000000;
      expv[16] = 67'h00000000000000000;
      expv[17] = 67'h00000000000000000;
      expv[18] = 67'h00000000000000000;
      expv[19] = 67'h00000000000000000;
      expv[20] = 67'h00000000000000000;
      expv[21] = 67'h00000000000000000;
      expv[22] = 67'h00000000000000000;
      expv[23] = 67'h00000000000000000;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h00000000000000000;
      expv[26] = 67'h00000000000000000;
      expv[27] = 67'h00000000000000000;
      expv[28] = 67'h00000000000000000;
      expv[29] = 67'h00000000000000000;
      expv[30] = 67'h00000000000000000;
      expv[31] = 67'h00000000000000000;
      expv[32] = 67'h00000000000000000;
      expv[33] = 67'h00000000000000000;
      expv[34] = 67'h00000000000000000;
      expv[35] = 67'h00000000000000000;
      expv[36] = 67'h00000000000000000;
      expv[37] = 67'h00000000000000000;
      expv[38] = 67'h00000000000000000;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h00000000000000000;
      expv[41] = 67'h00000000000000000;
      expv[42] = 67'h00000000000000000;
      expv[43] = 67'h00000000000000000;
      expv[44] = 67'h00000000000000000;
      expv[45] = 67'h6386760ad00000000;
      expv[46] = 67'h00000000000000000;
      expv[47] = 67'h00000000000000000;
      expv[48] = 67'h00000000000000000;
      expv[49] = 67'h00000000000000000;
      expv[50] = 67'h00000000000000000;
      expv[51] = 67'h00000000000000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h00000000000000000;
      expv[54] = 67'h00000000000000000;
      expv[55] = 67'h00000000000000000;
      expv[56] = 67'h00000000000000000;
      expv[57] = 67'h00000000000000000;
      expv[58] = 67'h00000000000000000;
      expv[59] = 67'h00000000000000000;
      expv[60] = 67'h00000000000000000;
      expv[61] = 67'h00000000000000000;
      expv[62] = 67'h00000000000000000;
      expv[63] = 67'h00000000000000000;
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
