// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 193;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008320 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[192:192]),
    .s_axi_arid(in_vec[191:180]),
    .s_axi_araddr(in_vec[179:148]),
    .s_axi_arburst(in_vec[147:146]),
    .s_axi_arcache(in_vec[145:142]),
    .s_axi_arlock(in_vec[141:141]),
    .s_axi_arlen(in_vec[140:133]),
    .s_axi_arprot(in_vec[132:130]),
    .s_axi_arqos(in_vec[129:126]),
    .s_axi_arsize(in_vec[125:123]),
    .s_axi_arvalid(in_vec[122:122]),
    .s_axi_awid(in_vec[121:110]),
    .s_axi_awaddr(in_vec[109:78]),
    .s_axi_awburst(in_vec[77:76]),
    .s_axi_awcache(in_vec[75:72]),
    .s_axi_awlock(in_vec[71:71]),
    .s_axi_awlen(in_vec[70:63]),
    .s_axi_awprot(in_vec[62:60]),
    .s_axi_awqos(in_vec[59:56]),
    .s_axi_awsize(in_vec[55:53]),
    .s_axi_awvalid(in_vec[52:52]),
    .s_axi_bready(in_vec[51:51]),
    .s_axi_rready(in_vec[50:50]),
    .s_axi_wid(in_vec[49:38]),
    .s_axi_wdata(in_vec[37:6]),
    .s_axi_wlast(in_vec[5:5]),
    .s_axi_wstrb(in_vec[4:1]),
    .s_axi_wvalid(in_vec[0:0]),
    .s_axi_arready(out_vec[65:65]),
    .s_axi_awready(out_vec[64:64]),
    .s_axi_bid(out_vec[63:52]),
    .s_axi_bresp(out_vec[51:50]),
    .s_axi_bvalid(out_vec[49:49]),
    .s_axi_rid(out_vec[48:37]),
    .s_axi_rdata(out_vec[36:5]),
    .s_axi_rlast(out_vec[4:4]),
    .s_axi_rresp(out_vec[3:2]),
    .s_axi_rvalid(out_vec[1:1]),
    .s_axi_wready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 193'h00335a8d8ad7bc25fe705aa3d039c1b73e595707ef04a28ee;
    stim[1] = 193'h060057523f431b4f8fd716b32958199f7608e266066aeced8;
    stim[2] = 193'h19f47eef2996dd291b2e42f76e7e9e7b8d96b2df197287241;
    stim[3] = 193'h10458fe7126b98ea06dfefdeb01bd2e568335bf3cffee6e7a;
    stim[4] = 193'h192776c83e64bb0e50ff9323fd2dc29f0b9fbe391415ec489;
    stim[5] = 193'h1d019b98a137a620d17ce3c2089b5e38f4b2943dd3d855222;
    stim[6] = 193'h1318c4ad6c479e3306e1163b83a8f2fb3f88cf39740867d74;
    stim[7] = 193'h179887c811b3beb6a371b441b39f279c638e2bbd31f7f941f;
    stim[8] = 193'h197ef103aeab30bb4a21f4ec1aa1b0bd8a0e755d2c4f1f512;
    stim[9] = 193'h1d03a0908c55d941922defab7c5bea8ca17930c590b51dc23;
    stim[10] = 193'h1bfcc8568a18e0bb81a327929e35db8643e9fa3c32a335ed1;
    stim[11] = 193'h198f0533a964d24e7759ebf8692bc64320e9c3159813d46f7;
    stim[12] = 193'h1043b659025216fb968553b848ebe3ddacc319bcfc0c34775;
    stim[13] = 193'h108f767b9fe6574a3153dfa6e2675f0d156bd091197d32d33;
    stim[14] = 193'h1bfeafdd511f6c6782efdfc818c863ca825ff5cce9c219cc5;
    stim[15] = 193'h12b7f905b3385df25e1769ce05ed7d51f7470ecd30ff76f96;
    stim[16] = 193'h148058a6d197009b57852bf6d322f3bf57c7c37c3bea58ea6;
    stim[17] = 193'h1154372fde5b7a4b33ddad340eb49a6925345d052c94c1966;
    stim[18] = 193'h04324ceefbafe2e1792df80efcc68d3340696807dbc31ceb6;
    stim[19] = 193'h16c5fb24b98189f58a535e2224ae10b45a9d211d60886c643;
    stim[20] = 193'h16ad6dd72fb322ab2ad2918dff41593e64337e8795e421f76;
    stim[21] = 193'h11df20bf9eaf4c2eeac095ac4b967b105410a329eedd5e652;
    stim[22] = 193'h1b0d70497559e323488d59855d64dcb842290f25b22e83820;
    stim[23] = 193'h14aa0f8371bcd4f925a99521afd6eee96da43b661d588b78e;
    stim[24] = 193'h1edb5a2dafe444e6b58721408b407874c1c81a97d02ed0cad;
    stim[25] = 193'h1c38fb13b83d46beff79eafc00c5bad940208c6b25566f9b6;
    stim[26] = 193'h11c31b00765c04ea3c277d577dbcc9ba69d3cb8371896738d;
    stim[27] = 193'h1eb0968df441bd46a5dbd6a249616de4b9800c809c546f2b5;
    stim[28] = 193'h13f1d343a5bf93efe1e1d2b3f9d5e64f7629d6adfb46c9603;
    stim[29] = 193'h11f8ab4a41cafdbcc7b8222a0813b4aab4254da8bf63ee30e;
    stim[30] = 193'h18a8be04728344b4959b1c93327d8c38a6107b764cfbb40fa;
    stim[31] = 193'h1afbcf7ee7713785c53ade8351e99226af6387827f108cfaa;
    stim[32] = 193'h1577844a5cbb897eb6818f4340979530107f3e6c05fe1bcc9;
    stim[33] = 193'h12faabbbc87b640ec28ed6182b34353e361b938e7f3d1e239;
    stim[34] = 193'h1404ac400f06e71830fff9966ce2aaf176905dea1d7589592;
    stim[35] = 193'h1bfd5f93bf9601fe0b1cfed870cf09eb7caadc329181b3bd8;
    stim[36] = 193'h1b565bb865e442007d0bb72cd1507c4048bf072a043346706;
    stim[37] = 193'h11d61cb538ebde097de800a8717f06eb7869caf0bd9422cc4;
    stim[38] = 193'h1febd36d8cc19813c0460d5b2f3a6e6f1e359aa239c6f639a;
    stim[39] = 193'h1477718a30f1ebe49a8237373d615929fae90a378c97d02a4;
    stim[40] = 193'h19dc3a7c171fe85543ea3425e2a771a2b8a824de116a51383;
    stim[41] = 193'h145ec26f1589278395d3610843452662bb798811ab773b279;
    stim[42] = 193'h10ff4ee24f2d2fee16d970d4c27dbf8efcb5e53cdf6aa4fec;
    stim[43] = 193'h103dd9deea84c529c60c74d8cf5976d817fdac38ae36e59e6;
    stim[44] = 193'h1eb16955d5f3c5308767b86b5ad9e1a5d8a6662fecf2b2d57;
    stim[45] = 193'h17907a5cc8f0d5151232a2afdee0986e6961a2ffb4175284d;
    stim[46] = 193'h1aadce38590a47aca0674ba8940f20d91b26571d723e7fab6;
    stim[47] = 193'h14d2acec77d4038138ee22d6676dc13c661339497c5aea194;
    stim[48] = 193'h1dfed0a15e5433b0dfc6000825e08cca1d83804baf21e970f;
    stim[49] = 193'h131cab39721d4fb8674aac5ee8ac0770365702978a8231a53;
    stim[50] = 193'h1061650a07549a2ece805128b39ef7e7eafe4188a8dbfc66d;
    stim[51] = 193'h12dde141c2015a3a1ef3bb6280af155b26893dfeb1d8d5c8b;
    stim[52] = 193'h19e85c23969ee7040452285a910b58419dfd6e4af0516ede5;
    stim[53] = 193'h1a970971f9bbcffa8c0781853b089bdc3aee658c969670c07;
    stim[54] = 193'h12e7681a47a48998602d3f1c30211826f7052d0dbc3c9380b;
    stim[55] = 193'h192f13cb68ac130ba9ffa8e39d50e04619e468f3431dbc6c5;
    stim[56] = 193'h10f4c0bfdc078e4b76408bb8424db260279b426f303d5a18e;
    stim[57] = 193'h1f522d59968342ed2bef23624326107ce08ab313091fe0a17;
    stim[58] = 193'h1be00f49a071411b2d2449db5b237a089dd5aea8510c56cc9;
    stim[59] = 193'h1813e8858f078b4fdd6a5659b52442acf1dcd798ff016c17d;
    stim[60] = 193'h1e509c7a225d44b5315902ad586f61f4441ad901353659e36;
    stim[61] = 193'h19d488e24c33c91b1018ccbc83a52abb51cee2447b948e336;
    stim[62] = 193'h17ddbc1cdecfc9b7becb50aff268944a3412a432d73d3650b;
    stim[63] = 193'h1eb530daca613b0dd167f2f6be7489cadc636a3b22426c4ec;
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
      expv[0] = 66'h0000x000000000000;
      expv[1] = 66'h0000x000000000000;
      expv[2] = 66'h0000x000000000000;
      expv[3] = 66'h0000x000000000000;
      expv[4] = 66'h0000x000000000000;
      expv[5] = 66'h0000x000000000000;
      expv[6] = 66'h0000x000000000000;
      expv[7] = 66'h0000x000000000000;
      expv[8] = 66'h0000x000000000000;
      expv[9] = 66'h0000x000000000000;
      expv[10] = 66'h0000x000000000000;
      expv[11] = 66'h0000x000000000000;
      expv[12] = 66'h0000x000000000000;
      expv[13] = 66'h0000x000000000000;
      expv[14] = 66'h0000x000000000000;
      expv[15] = 66'h0000x000000000000;
      expv[16] = 66'h0000x000000000000;
      expv[17] = 66'h0000x000000000000;
      expv[18] = 66'h0000x000000000000;
      expv[19] = 66'h0000x000000000000;
      expv[20] = 66'h0000x000000000000;
      expv[21] = 66'h0000x000000000000;
      expv[22] = 66'h0000x000000000000;
      expv[23] = 66'h0000x000000000000;
      expv[24] = 66'h0000x000000000000;
      expv[25] = 66'h0000x000000000000;
      expv[26] = 66'h0000x000000000000;
      expv[27] = 66'h0000x000000000000;
      expv[28] = 66'h0000x000000000000;
      expv[29] = 66'h0000x000000000000;
      expv[30] = 66'h0000x000000000000;
      expv[31] = 66'h0000x000000000000;
      expv[32] = 66'h0000x000000000000;
      expv[33] = 66'h0000x000000000000;
      expv[34] = 66'h0000x000000000000;
      expv[35] = 66'h0000x000000000000;
      expv[36] = 66'h0000x000000000000;
      expv[37] = 66'h0000x000000000000;
      expv[38] = 66'h0000x000000000000;
      expv[39] = 66'h0000x000000000000;
      expv[40] = 66'h0000x000000000000;
      expv[41] = 66'h0000x000000000000;
      expv[42] = 66'h0000x000000000000;
      expv[43] = 66'h0000x000000000000;
      expv[44] = 66'h0000x000000000000;
      expv[45] = 66'h0000x000000000000;
      expv[46] = 66'h0000x000000000000;
      expv[47] = 66'h0000x000000000000;
      expv[48] = 66'h0000x000000000000;
      expv[49] = 66'h0000x000000000000;
      expv[50] = 66'h0000x000000000000;
      expv[51] = 66'h0000x000000000000;
      expv[52] = 66'h0000x000000000000;
      expv[53] = 66'h0000x000000000000;
      expv[54] = 66'h0000x000000000000;
      expv[55] = 66'h0000x000000000000;
      expv[56] = 66'h0000x000000000000;
      expv[57] = 66'h0000x000000000000;
      expv[58] = 66'h0000x000000000000;
      expv[59] = 66'h0000x000000000000;
      expv[60] = 66'h0000x000000000000;
      expv[61] = 66'h0000x000000000000;
      expv[62] = 66'h0000x000000000000;
      expv[63] = 66'h0000x000000000000;
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
