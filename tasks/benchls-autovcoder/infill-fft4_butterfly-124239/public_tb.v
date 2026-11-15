// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_124239 dut (
    .clk(clk),
    .rst(in_vec[129:129]),
    .x0_real(in_vec[128:113]),
    .x0_imag(in_vec[112:97]),
    .x1_real(in_vec[96:81]),
    .x1_imag(in_vec[80:65]),
    .x2_real(in_vec[64:49]),
    .x2_imag(in_vec[48:33]),
    .x3_real(in_vec[32:17]),
    .x3_imag(in_vec[16:1]),
    .start(in_vec[0:0]),
    .y0_real(out_vec[128:113]),
    .y0_imag(out_vec[112:97]),
    .y1_real(out_vec[96:81]),
    .y1_imag(out_vec[80:65]),
    .y2_real(out_vec[64:49]),
    .y2_imag(out_vec[48:33]),
    .y3_real(out_vec[32:17]),
    .y3_imag(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h210e9d2af2f0ed2a1c243120dc493c2bb;
    stim[1] = 130'h35a29ab5c13d19b19850dd094b2fac51b;
    stim[2] = 130'h08151e7959335e6e44372c00ef42844c9;
    stim[3] = 130'h17df337f1b6329700097dd8461c8cbde0;
    stim[4] = 130'h1cd8cc0aec44281727acf6cefdd8e5d0a;
    stim[5] = 130'h01312314c51a82519816ba1af92b5aa28;
    stim[6] = 130'h0b1d9f2100d2c24b012007b173f19bf7e;
    stim[7] = 130'h2b44abce34409573322fd4e42a9f243d8;
    stim[8] = 130'h15c2f7c55c6610faffbcfbe971e4406fc;
    stim[9] = 130'h1b743bb4c71a34b08da9c28eb51866ddd;
    stim[10] = 130'h1c57e6006ffeaa6e5953024b0d612b09e;
    stim[11] = 130'h1853531c7a5fec9fcf87afd34ae89ab85;
    stim[12] = 130'h1312b4b059d1a18493849b8eaf06440a2;
    stim[13] = 130'h118b07c7cce7b29647a0005f4c0de006a;
    stim[14] = 130'h13daeaf98386e1f8fe23de61b47acf560;
    stim[15] = 130'h1797a79bcda856a8add95a29c88be6542;
    stim[16] = 130'h1d84e0950b54d501b40f77ceb3422d7da;
    stim[17] = 130'h1218e7e041369b0a5c60ac10d7220e2cd;
    stim[18] = 130'h0e3e77d7b8f53a91f64744dff26f7bb77;
    stim[19] = 130'h0822a1ba8fbb0827214e1c86de2584c3d;
    stim[20] = 130'h07728342d55ecde83e1628fa061305f05;
    stim[21] = 130'h1317bf937a4a291f32eb05a06bee4b381;
    stim[22] = 130'h10b23762ee9670f977d43ddb50b03af5a;
    stim[23] = 130'h182e73e59d0fc2324db858c1eb4b1c829;
    stim[24] = 130'h19641a3918772fd36d7e55cb4ff2f4c90;
    stim[25] = 130'h0d5ba3eee45c4267b5eab485e0b8f30c7;
    stim[26] = 130'h1565c422fea7d0fae598af6602b70c807;
    stim[27] = 130'h0f8226cb8a7162cf48636bd001bf18475;
    stim[28] = 130'h0dc0290cb05ea61386feac4e516ee4957;
    stim[29] = 130'h01ebda99a1fe390322f4fd49a50e9d625;
    stim[30] = 130'h12a891b36a99e1067d9a01637937ccd79;
    stim[31] = 130'h04d068f43013ebecf29bd914e34980a4c;
    stim[32] = 130'h0f557d84c7cf4dadc38b5a239351db67a;
    stim[33] = 130'h05ef78eb308f31912eae1f6f3fb4b9f3c;
    stim[34] = 130'h1f46ce3e467f5eed0bdd0734b09631060;
    stim[35] = 130'h139fa11e4fb0c8dad74cfdb6ba3c52669;
    stim[36] = 130'h0fad78204d78eeafe99ff26a27fbdeb7d;
    stim[37] = 130'h1dfc0a1e78cc97525b2c61765b0541fd3;
    stim[38] = 130'h143718a1630a23916c52d2f603d2b3850;
    stim[39] = 130'h1e0aeb5ee36ecbc32b0f00d008b44d232;
    stim[40] = 130'h100ed34bbc1de6f50cc5982c086eb5cc4;
    stim[41] = 130'h132df5ae7588ea359458e92c6ccb4c46b;
    stim[42] = 130'h1c3a51e1637c2c04c4fa1912812c54553;
    stim[43] = 130'h0548ad9d3529807eeebdd0f6264336735;
    stim[44] = 130'h1090413b2003a393eff855b3c49f5b5dd;
    stim[45] = 130'h04e9ceaf95c3eaca580daa89f57528642;
    stim[46] = 130'h0dbc51cabff926c7a913450a5f803fb29;
    stim[47] = 130'h02adf9fde8abc5e605727a443f2fc7bc3;
    stim[48] = 130'h118d9fd056e265f2caf63ffcb89860c9e;
    stim[49] = 130'h021d3986806cc2b80368ece5a4edfc8c9;
    stim[50] = 130'h196004827636acd03be4c133273de4193;
    stim[51] = 130'h0b4382f02b405d10f69cb82075fbce5d5;
    stim[52] = 130'h03830b113fa23efe6608c3241705f0471;
    stim[53] = 130'h1db903cbd1d7e767de8e3c4a2a7b8a091;
    stim[54] = 130'h06ad30a17189758336d3d09ec171c9b9e;
    stim[55] = 130'h115bb2390e9bf4ec8ae605f4620f7d790;
    stim[56] = 130'h1d967e1e61d5a123925a19d53721ad9d8;
    stim[57] = 130'h08ab71e03dad364d8d5046cf4a1cdceb8;
    stim[58] = 130'h09f30ba3215aa297c139eaf5c2bcd07ff;
    stim[59] = 130'h1e73189052fd699878855f2601a5dc782;
    stim[60] = 130'h16a806629084c916624eafcf73b8dddfc;
    stim[61] = 130'h0baf1699b8202ed08bb497d34bfe941ff;
    stim[62] = 130'h1128a44273a433242392cb80d2f84560f;
    stim[63] = 130'h186b65516cafecf34d2973f0a48b399cd;
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
      expv[0] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 129'h13425cef1c7c0a0f026089627ecf11a66;
      expv[5] = 129'h13425cef1c7c0a0f026089627ecf11a67;
      expv[6] = 129'h13425cef1c7c0a0f026089627ecf11a67;
      expv[7] = 129'h13425cef1c7c0a0f026089627ecf11a66;
      expv[8] = 129'h13425cef1c7c0a0f026089627ecf11a66;
      expv[9] = 129'h13425cef1c7c0a0f026089627ecf11a66;
      expv[10] = 129'h13425cef1c7c0a0f026089627ecf11a66;
      expv[11] = 129'h0c56906eac595b9226b42d54ebf1f7412;
      expv[12] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[13] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[14] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[15] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[16] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[17] = 129'h0c56906eac595b9226b42d54ebf1f7413;
      expv[18] = 129'h0c56906eac595b9226b42d54ebf1f7412;
      expv[19] = 129'h0733926995495d45c8b6a09743d7e9288;
      expv[20] = 129'h0733926995495d45c8b6a09743d7e9289;
      expv[21] = 129'h0733926995495d45c8b6a09743d7e9288;
      expv[22] = 129'h0d61c8b298cd96745ed950d866fcda686;
      expv[23] = 129'h0d61c8b298cd96745ed950d866fcda687;
      expv[24] = 129'h0d61c8b298cd96745ed950d866fcda686;
      expv[25] = 129'h11db2a0c60ecea65bd712a945d8b61024;
      expv[26] = 129'h11db2a0c60ecea65bd712a945d8b61025;
      expv[27] = 129'h11db2a0c60ecea65bd712a945d8b61024;
      expv[28] = 129'h19f3899ac510c3fc4a22641746a47388c;
      expv[29] = 129'h19f3899ac510c3fc4a22641746a47388d;
      expv[30] = 129'h19f3899ac510c3fc4a22641746a47388c;
      expv[31] = 129'h1d4272b9c80eb0ad16d1ce3ae462548be;
      expv[32] = 129'h1d4272b9c80eb0ad16d1ce3ae462548bf;
      expv[33] = 129'h1d4272b9c80eb0ad16d1ce3ae462548bf;
      expv[34] = 129'h1d4272b9c80eb0ad16d1ce3ae462548bf;
      expv[35] = 129'h1d4272b9c80eb0ad16d1ce3ae462548bf;
      expv[36] = 129'h1d4272b9c80eb0ad16d1ce3ae462548be;
      expv[37] = 129'h1d2646d022348970719bb121e1a433b26;
      expv[38] = 129'h1d2646d022348970719bb121e1a433b27;
      expv[39] = 129'h1d2646d022348970719bb121e1a433b27;
      expv[40] = 129'h1d2646d022348970719bb121e1a433b27;
      expv[41] = 129'h1d2646d022348970719bb121e1a433b27;
      expv[42] = 129'h1d2646d022348970719bb121e1a433b26;
      expv[43] = 129'h1fb67de638be25dca6264d67a3cdc4bd6;
      expv[44] = 129'h1fb67de638be25dca6264d67a3cdc4bd7;
      expv[45] = 129'h1fb67de638be25dca6264d67a3cdc4bd6;
      expv[46] = 129'h1aadb979cf25e3e54d82d2ee02988225c;
      expv[47] = 129'h1aadb979cf25e3e54d82d2ee02988225d;
      expv[48] = 129'h1aadb979cf25e3e54d82d2ee02988225c;
      expv[49] = 129'h086fe5c31aab39dd838e80c6925ddf32c;
      expv[50] = 129'h086fe5c31aab39dd838e80c6925ddf32d;
      expv[51] = 129'h086fe5c31aab39dd838e80c6925ddf32c;
      expv[52] = 129'h1683c001000345df4c98667da0a0e9c32;
      expv[53] = 129'h1683c001000345df4c98667da0a0e9c33;
      expv[54] = 129'h1683c001000345df4c98667da0a0e9c32;
      expv[55] = 129'h183686249523db1e58459a58b56206e4e;
      expv[56] = 129'h183686249523db1e58459a58b56206e4f;
      expv[57] = 129'h183686249523db1e58459a58b56206e4f;
      expv[58] = 129'h183686249523db1e58459a58b56206e4f;
      expv[59] = 129'h183686249523db1e58459a58b56206e4e;
      expv[60] = 129'h11706228ab75aef7fa2b1b9e36df82ade;
      expv[61] = 129'h11706228ab75aef7fa2b1b9e36df82adf;
      expv[62] = 129'h11706228ab75aef7fa2b1b9e36df82ade;
      expv[63] = 129'h04ccd7669d84911e568b10e1b09a861fe;
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
