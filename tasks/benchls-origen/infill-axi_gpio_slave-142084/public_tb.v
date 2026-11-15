// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 139;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142084 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[138:138]),
    .s_axi_awvalid(in_vec[137:137]),
    .s_axi_awaddr(in_vec[136:105]),
    .s_axi_wvalid(in_vec[104:104]),
    .s_axi_wdata(in_vec[103:72]),
    .s_axi_wstrb(in_vec[71:68]),
    .s_axi_bready(in_vec[67:67]),
    .s_axi_arvalid(in_vec[66:66]),
    .s_axi_araddr(in_vec[65:34]),
    .s_axi_rready(in_vec[33:33]),
    .gpio_io_t(in_vec[32:1]),
    .gpio_xferAck_Reg(in_vec[0:0]),
    .s_axi_awready(out_vec[71:71]),
    .s_axi_wready(out_vec[70:70]),
    .s_axi_bvalid(out_vec[69:69]),
    .s_axi_bresp(out_vec[68:67]),
    .s_axi_arready(out_vec[66:66]),
    .s_axi_rvalid(out_vec[65:65]),
    .s_axi_rdata(out_vec[64:33]),
    .gpio2_io_t(out_vec[32:1]),
    .gpio_xferAck_Reg_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 139'h3537efadf1829af53794f4d56320965d1e6;
    stim[1] = 139'h10ab91c4f48069e1bc075e4b4f654eb6f2d;
    stim[2] = 139'h56595eee412c68a2ccb0643d66496c50c9e;
    stim[3] = 139'h556e1b65dd799ce13a0756452eb1cea3c0d;
    stim[4] = 139'h7b70f6679a6f15c1bac37c1efbfbd45f423;
    stim[5] = 139'h48b9d9d6a76e5d7455cc51f7f6307b26c84;
    stim[6] = 139'h6144323b9cc3f47df1dfa8d0cf0b1281bfa;
    stim[7] = 139'h60b8d732894174d30b0df14a23ae328d02b;
    stim[8] = 139'h58887cc187db66f7c91a25f772fadac4655;
    stim[9] = 139'h7a4d04f5e5e30ba0fe14ed2c302d529aead;
    stim[10] = 139'h6d2bb7ee76a210daf86c2c7b607dc51e47f;
    stim[11] = 139'h72579b140cb918daf72687f3adb49ce8e55;
    stim[12] = 139'h715189d5bae9f752b8abaeb5a034c01d4de;
    stim[13] = 139'h4596dc14e5d405bb5adf9d5d8aeef024f6c;
    stim[14] = 139'h7390eb253a5afea5d8843a37dff771a443a;
    stim[15] = 139'h6212028a7f240ab1f917363cc54c8978b3e;
    stim[16] = 139'h40320028f515ae5ed2eebc70cfad8924794;
    stim[17] = 139'h56db3102bef7c293620bc944cfa444d689b;
    stim[18] = 139'h5d5bee3359bfcb60ce6946b282757080a20;
    stim[19] = 139'h5985f4a217b754d2ecd365b03bb3ae1af66;
    stim[20] = 139'h5fd2b740685f15e8c7761d8674764210900;
    stim[21] = 139'h59a6c7fdaf82797c8c5783326f502e46ecc;
    stim[22] = 139'h53d6dad9227f7014f31a6ebb9252d99eba7;
    stim[23] = 139'h7b1a31f47c5b577b530be3d4862c886eea5;
    stim[24] = 139'h41f1f6b73dbe8a3aa6f98e645489af7d082;
    stim[25] = 139'h7dc726525e73cb387fc84972c564ef9a456;
    stim[26] = 139'h511007ea0fb7d66ccee493e91bbb647faea;
    stim[27] = 139'h556147f226f3d48ed47180dee2a4894e845;
    stim[28] = 139'h43409778c1676fdcb76e9a0e3deaf27df71;
    stim[29] = 139'h6234d7573e7dea3523c6104aa44f253d1b4;
    stim[30] = 139'h531fbeb5850dd4d63622ee8fd573d8b9a1e;
    stim[31] = 139'h4873a36759009c6890d7439f9fe0b2c8c6e;
    stim[32] = 139'h6a964855c0bad7e74e6c851af06e8f3c9dc;
    stim[33] = 139'h4af8168f28496873d52016c0755bfdd6444;
    stim[34] = 139'h6346d0a07599579ca304dda53187b326781;
    stim[35] = 139'h442959bf5cebb1be3e870efae756b0f84e8;
    stim[36] = 139'h6cd127a4f38bb78ec50bf0443582fb06183;
    stim[37] = 139'h5c052af7988137af6dbfe4d243a5f46c5d5;
    stim[38] = 139'h6b1147e635b830beb386b12bdb26157cb9f;
    stim[39] = 139'h627a8760ca294daa2ec576d381cbe1cb527;
    stim[40] = 139'h53d2fe37bff4813f02618bf442d2f15b4a3;
    stim[41] = 139'h5fe0ecdacebf421c1f2068fec570f18d60a;
    stim[42] = 139'h72252288ce813f9d7eb5a9d40c78eb5f870;
    stim[43] = 139'h49d6d081e97b317659e25a2a11e08006c09;
    stim[44] = 139'h5cf71891adf7fdaa1d25d3647eb2c8f2f93;
    stim[45] = 139'h5b144a9f98e551a782d9397061d438aff57;
    stim[46] = 139'h4c778572ecb082ac0af856f10401d6e6c18;
    stim[47] = 139'h262569a30145c2318b43d1253e02f7f6080;
    stim[48] = 139'h6fff8bc834e37cb47a524e43001e5a90b45;
    stim[49] = 139'h6014117c76ee1909ec2d3747773ccead5d2;
    stim[50] = 139'h5ad2767bc38d459f3e3db8528e3c6c19e06;
    stim[51] = 139'h4f3364b0a1fb0f2bd38c87262d2b494c9ba;
    stim[52] = 139'h5b0ac00a8b6ecaef119bc5fd1dec91c8e1a;
    stim[53] = 139'h5785a79a241f8a12c3f1bd49d3158c97c89;
    stim[54] = 139'h4e0eb7eab6cdf45f3d3e2b6ecca21b7a07b;
    stim[55] = 139'h79c0fbc4a0438b13c48b7b57f01bdb9241f;
    stim[56] = 139'h4516c3d8cf1b24bca14311d9252690fad4e;
    stim[57] = 139'h42d320c755a9bdca08b9988534c91b8bb87;
    stim[58] = 139'h4b5e9f58d1b06e2e965d02a0b13c178ae6c;
    stim[59] = 139'h4a1d803639aa55bf594fc0ffbba2092a5eb;
    stim[60] = 139'h62c1de6d54ec8449fff11b900ecb6466519;
    stim[61] = 139'h5de8214ba0a98c2497fe10a92070aee5c9a;
    stim[62] = 139'h44ca8be97d617226b6a354754e9a3074282;
    stim[63] = 139'h4262dd9e131b1bd1fbe8d8a3a9347f62ce5;
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
      expv[0] = 72'h000000000000000000;
      expv[1] = 72'h000000000000000000;
      expv[2] = 72'h000000000000000000;
      expv[3] = 72'h000000000000000000;
      expv[4] = 72'h000000000000000001;
      expv[5] = 72'hc5bd45f4234c00b801;
      expv[6] = 72'h01bd45f4234c00b800;
      expv[7] = 72'hc4b1281bfb4c00b9be;
      expv[8] = 72'h20b1281bfb4c00b9bf;
      expv[9] = 72'h20b1281bfb4c00b9bf;
      expv[10] = 72'h20b1281bfb4c00b9bf;
      expv[11] = 72'h25dc51e47f4c00b9bf;
      expv[12] = 72'h21dc51e47f4c00b9bf;
      expv[13] = 72'h01dc51e47f4c00b9be;
      expv[14] = 72'h04ef024f6d4c00b9be;
      expv[15] = 72'hc0ef024f6d4a00b9be;
      expv[16] = 72'h20ef024f6d4a00b9be;
      expv[17] = 72'h04d89247954a00b9be;
      expv[18] = 72'h00d89247954a00b9bf;
      expv[19] = 72'h0557080a214a00b9be;
      expv[20] = 72'h0157080a214a00b9be;
      expv[21] = 72'h05642109014a00b9be;
      expv[22] = 72'h03642109014a00b9be;
      expv[23] = 72'h03642109014a00b9bf;
      expv[24] = 72'hc1642109014a00ef6b;
      expv[25] = 72'h049af7d0834a00ef6a;
      expv[26] = 72'hc09af7d083ce79670e;
      expv[27] = 72'h05b647faebce79670e;
      expv[28] = 72'h01b647faebce79670f;
      expv[29] = 72'h04af27df71ce79670f;
      expv[30] = 72'hc2af27df71ce7946a4;
      expv[31] = 72'h20af27df71ce7946a4;
      expv[32] = 72'h040b2c8c6fce7946a4;
      expv[33] = 72'h000b2c8c6fce7946a4;
      expv[34] = 72'h000b2c8c6fce7946a4;
      expv[35] = 72'hc00b2c8c6fce78f395;
      expv[36] = 72'h000b2c8c6fce78f394;
      expv[37] = 72'hc00b2c8c6fcf76f3d9;
      expv[38] = 72'h000b2c8c6fcf76f3d9;
      expv[39] = 72'hc00b2c8c6fcf7617d7;
      expv[40] = 72'h04be1cb527cf7617d7;
      expv[41] = 72'h02be1cb527cf7617d7;
      expv[42] = 72'h00be1cb527cf7617d6;
      expv[43] = 72'h00be1cb527cf7617d6;
      expv[44] = 72'h0408006c09cf7617d7;
      expv[45] = 72'h0008006c09cf7617d7;
      expv[46] = 72'h05438aff57cf7617d7;
      expv[47] = 72'h000000000000000000;
      expv[48] = 72'h000000000000000000;
      expv[49] = 72'hc5e5a90b449c019601;
      expv[50] = 72'h21e5a90b449c019600;
      expv[51] = 72'h21e5a90b449c019600;
      expv[52] = 72'h01e5a90b449c019600;
      expv[53] = 72'h01e5a90b449c019600;
      expv[54] = 72'h0558c97c889c019601;
      expv[55] = 72'h0158c97c889c019601;
      expv[56] = 72'h0158c97c889c019601;
      expv[57] = 72'h04690fad4e9c019600;
      expv[58] = 72'h02690fad4e9c019601;
      expv[59] = 72'h00690fad4e9c019600;
      expv[60] = 72'h042092a5ea9c019601;
      expv[61] = 72'hc22092a5ea9d90893f;
      expv[62] = 72'h002092a5ea9d90893e;
      expv[63] = 72'h002092a5ea9d90893e;
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
