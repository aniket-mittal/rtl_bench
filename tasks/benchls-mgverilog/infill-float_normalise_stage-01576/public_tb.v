// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 168;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01576 dut (
    .clock(clk),
    .cout_Multiply(in_vec[167:132]),
    .zout_Multiply(in_vec[131:96]),
    .sout_Multiply(in_vec[95:64]),
    .productout_Multiply(in_vec[63:14]),
    .modeout_Multiply(in_vec[13:12]),
    .operationout_Multiply(in_vec[11:11]),
    .NatLogFlagout_Multiply(in_vec[10:10]),
    .InsTag_Multiply(in_vec[9:2]),
    .idle_Multiply(in_vec[1:0]),
    .idle_NormaliseProd(out_vec[167:166]),
    .cout_NormaliseProd(out_vec[165:130]),
    .zout_NormaliseProd(out_vec[129:94]),
    .sout_NormaliseProd(out_vec[93:62]),
    .modeout_NormaliseProd(out_vec[61:60]),
    .operationout_NormaliseProd(out_vec[59:59]),
    .NatLogFlagout_NormaliseProd(out_vec[58:58]),
    .productout_NormaliseProd(out_vec[57:8]),
    .InsTag_NormaliseProd(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 168'hb4806c2175f360e39e8b60df0b7f0accff906eff2f;
    stim[1] = 168'h57bb105d4a3fdf3aa5fa14c95b52e3ee930a6c6a19;
    stim[2] = 168'h77d53c6261895d574d69d6b49cb0f2bf1ce7d3c36a;
    stim[3] = 168'h1dd3be558e3f1a80c8089e7e1fbee6d153a447497b;
    stim[4] = 168'hbd884aa8321066231be59232584686007f617e39fb;
    stim[5] = 168'h5c34e1f47328a2c3b4c5c45077083e61e4499a6c41;
    stim[6] = 168'hdc8980d9e62c0a76ea9b6bfbdf3d8117404f27f309;
    stim[7] = 168'h4a4faac8e9a70efa62d93b1206382d1c229d11cefb;
    stim[8] = 168'hf349f4eae710bb243ac3bc07c848647ba1f3bbff05;
    stim[9] = 168'hbeff0c54e2392c25e3df6a472353207d447d7c2908;
    stim[10] = 168'h10e5a930601ed02d51500c00c2873c5149f45eac76;
    stim[11] = 168'h125e11aa6fd4f54d75f7334a6e4eb3f30602ef5ced;
    stim[12] = 168'h294aeb70c85bfe354a74ea9e0e29e3090e0a023ae4;
    stim[13] = 168'h00b8014c16b4b720b4b34dc4d83bc571b44b2e325b;
    stim[14] = 168'h2ee9410ffe15e2336ee9fd8102a2d54efd9d105007;
    stim[15] = 168'h44f5a0627bdf154404aca0d73f5f89cd456a1f4988;
    stim[16] = 168'h2d4583b5d4642c3fe11b3175394b5dbe5debd84f56;
    stim[17] = 168'h1038314cc31778b9822715a50e31ff93ec702092c8;
    stim[18] = 168'h136f675ba56ece0fd1c5de03280e6a820af9de876c;
    stim[19] = 168'h54c6d92687c664f29e4180916e286be9fb637f0cd3;
    stim[20] = 168'h4bf304645302e56c82de3dbb6fbca6ee7fd1202e48;
    stim[21] = 168'h83274f3d44582bf20c0bb83ae74ea6437b91a16756;
    stim[22] = 168'h5dfd1d7d7259289de6b905f51707d85b8f81edfd30;
    stim[23] = 168'h7603770466692c24c2e7cd519f434a4acc39cb0706;
    stim[24] = 168'h218aaab909292b5765f56728d78bcccd6175b56cae;
    stim[25] = 168'hb254a3cbc16245229749609fbca8761aa53a8f7123;
    stim[26] = 168'h12bb0ad726a520a0ba7c84e6455815ba25215f4ccd;
    stim[27] = 168'h3c6f258eb68bb33dc5323897d27c451ca96f8ec517;
    stim[28] = 168'h21f8c5900aa2693eb67ce31dac906956f161617c9c;
    stim[29] = 168'h192549e109bdac83a57ed61bc88a6feca12d4c1af6;
    stim[30] = 168'h423dd178793bbdc05e93a172147e4436e5bd706cb6;
    stim[31] = 168'h278f5d877da6d1f5ab420f28f1605dfcdc8d2459c0;
    stim[32] = 168'h27be1761e781898c2249e1be39734c7c878e35c4b5;
    stim[33] = 168'h10ad747562ce61a6466f03f255520e5c9c84259f20;
    stim[34] = 168'headc97cd50fe32bbfb28a5accfba537abe467ebadb;
    stim[35] = 168'hc85c759cc700b68e449fddc9fa3a59b536a74472c7;
    stim[36] = 168'hae669d14f752f4e647013390a1625951967bae0700;
    stim[37] = 168'h6151ea000b3922d4d9ff97a12bcc314e9c2b7cc852;
    stim[38] = 168'h7df86a69aa9d21f005be8297e4f4b8c0440c4512ce;
    stim[39] = 168'hfee36b4355cb440fb76a818a61f9325062194137c2;
    stim[40] = 168'h2c38d9eca9bc091106a9b607870b7470280ec8d7f7;
    stim[41] = 168'hdb7195c2ae12734e51b60861c054b5551533fbb991;
    stim[42] = 168'h310c13231ff35d84835d9c3e6cdc0d51868d78368a;
    stim[43] = 168'h16a4ef03d0ba42239d8fcea919ab002af435c4bf91;
    stim[44] = 168'hbbd4c3ca02194a0c65219dc34cc1401ae9358b15c6;
    stim[45] = 168'hef08f44c198617a3824d139f3b9f7782024dedb7c6;
    stim[46] = 168'h7ec27424c0dc7e77c19bddf191319a5c6c8ccbd6bf;
    stim[47] = 168'h60c62258399dff3b35de1436f748b5056694a029ce;
    stim[48] = 168'he0caf2907db200f5a53355823eb659057ae4eb597b;
    stim[49] = 168'h4298a7dc09c1b451e6a945ce9c8c9306fe7f04bf2a;
    stim[50] = 168'he96790a09046dd25e956ab95bc597dc42640535532;
    stim[51] = 168'h32e73f7b63fb44d899599a378bff571440dcd20a38;
    stim[52] = 168'h13a0c81c719d36a07f45166aed3680dc60a9a8f7f3;
    stim[53] = 168'he7ac989584063e03157800a31c558eb3af20594f54;
    stim[54] = 168'h568b752abeb24f12fe781f52c921f3b23d24d59a82;
    stim[55] = 168'h94164b866e635fbe23c0884be28b7ae5e391cba046;
    stim[56] = 168'hf3ff26f631c5eec837e758ccf37ee6f79c61e63c49;
    stim[57] = 168'ha0a73e373c706e1585b3f9df2888d17c799b77eec9;
    stim[58] = 168'hffcbd2c68b925ff37927f869fe037fe1feeae46cce;
    stim[59] = 168'h8d413184a85d35b036ed6e3d220b832a680e77dcf0;
    stim[60] = 168'h53edc30a9c7343205711ee75a76b5cb86b9ae356ab;
    stim[61] = 168'hd0943815195808b8d1fd9dd25b37729e6f919dcc65;
    stim[62] = 168'hb2ff1a713720d568cca638cdf874842116bca73c00;
    stim[63] = 168'h73bed65ca455e4879aef5132c541e85db8714f4d11;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'hed201b085d7cd838e7a2d837c2fxxxxxxxxxxxxxcb;
      expv[2] = 168'h55eec417528ff7cea97e853256exxxxxxxxxxxxx86;
      expv[3] = 168'h9df54f1898625755d35a75ad270xxxxxxxxxxxxxda;
      expv[4] = 168'hc774ef95638fc6a03202279f87cxxxxxxxxxxxxx5e;
      expv[5] = 168'hef6212aa0c841988c6f9648c963xxxxxxxxxxxxx7e;
      expv[6] = 168'h570d387d1cca28b0ed3171141dexxxxxxxxxxxxx10;
      expv[7] = 168'h77226036798b029dbaa6dafef7fxxxxxxxxxxxxxc2;
      expv[8] = 168'hd293eab23a69c3be98b64ec4818xxxxxxxxxxxxxbe;
      expv[9] = 168'h7cd27d3ab9c42ec90eb0ef01f23xxxxxxxxxxxxxc1;
      expv[10] = 168'h2fbfc315388d4c81f437da91c8ea9903ea23ebe042;
      expv[11] = 168'h84396a4c1807b40b5454030030ae9903ea23ebe01d;
      expv[12] = 168'h4497846a9bf53d535d7dccd29b9e9903ea23ebe03b;
      expv[13] = 168'h0a52badc3214a78c241d3aa783b94f1848705010b9;
      expv[14] = 168'hc02e005305ad2dc82d2cd37136314f184870501096;
      expv[15] = 168'hcbba5043ff85788cdbba7f6040914f184870501001;
      expv[16] = 168'h113d68189ef57e27342b2835cfcafc4e6a2b50fa62;
      expv[17] = 168'h8b5160ed75190b0ff846cc5d4e4efc4e6a2b50fad5;
      expv[18] = 168'h040e0c5330c2c7fe4e09c56943918ffc9f638104b2;
      expv[19] = 168'h04dbd9d6e95839aa08317780ca0473541057cef4db;
      expv[20] = 168'hd531b649a1f1993ca79060245b8c73541057cef434;
      expv[21] = 168'h12fcc11914c1794ddc378f6edbeef29bb9ff448092;
      expv[22] = 168'ha0c9d3cf51160afc8302ee0eb9e6f29bb9ff4480d5;
      expv[23] = 168'h177f475f5c941f616e2e417d45fc3ec2dc7c0f6e4c;
      expv[24] = 168'h9d80ddc1199a4b0930b9f35467c43ec2dc7c0f6ec1;
      expv[25] = 168'h8862aaae424a4ad5d97d59ca35ec3ec2dc7c0f6e2b;
      expv[26] = 168'hec9528f2f0589148a5d25827ef303ec2dc7c0f6e48;
      expv[27] = 168'h44aec2b5c9a948282e9f2139914c3ec2dc7c0f6e33;
      expv[28] = 168'hcf1bc963ada2eccf714c8e25f4843ec2dc7c0f6e45;
      expv[29] = 168'h087e316402a920d2ac1f38c76b3e41a55bc5858527;
      expv[30] = 168'h86495278426f6b20e95fb586f21a41a55bc58585bd;
      expv[31] = 168'h908f745e1e4eef7017a4e85c852e41a55bc585852d;
      expv[32] = 168'h09e3d761df678177f21083ca3c5b02efe6e4692270;
      expv[33] = 168'h49ef85d879e062630892786f8e4702efe6e469222d;
      expv[34] = 168'h042b5d1d58b14839721bc0fc955e9072e4e4212cc8;
      expv[35] = 168'hfab725f3543f8caefeca296b33fa9072e4e4212cb6;
      expv[36] = 168'hf2171d6731c02da39127f7727eb29072e4e4212cb1;
      expv[37] = 168'h2b99a7453dd3896546004ce4284712ca8cb3dd70c0;
      expv[38] = 168'h98547a8002ce48b5367fe5e84acb12ca8cb3dd7014;
      expv[39] = 168'h9f7e1a9a6aa7487c016fa0a5f91312ca8cb3dd70b3;
      expv[40] = 168'hbfb8dad0d572d103eddaa062987712ca8cb3dd70f0;
      expv[41] = 168'hcb0e367b2a6f024441aa6d81e1d712ca8cb3dd70fd;
      expv[42] = 168'h76dc6570ab849cd3946d8218703b12ca8cb3dd7064;
      expv[43] = 168'h8c4304c8c7fcd76120d7670f9b3712ca8cb3dd70a2;
      expv[44] = 168'h45a93bc0f42e9088e763f3aa467f12ca8cb3dd70e4;
      expv[45] = 168'haef530f28086528319486770d31712ca8cb3dd7071;
      expv[46] = 168'hbbc23d13066185e8e09344e7cef712ca8cb3dd70f1;
      expv[47] = 168'hdfb09d0930371f9df066f77c645712ca8cb3dd70af;
      expv[48] = 168'h983188960e677fcecd77850dbdeb12ca8cb3dd7073;
      expv[49] = 168'hf832bca41f6c803d694cd5608f9b12ca8cb3dd705e;
      expv[50] = 168'h90a629f702706d1479aa5173a73f12ca8cb3dd70ca;
      expv[51] = 168'hba59e4282411b7497a55aae56f1712ca8cb3dd704c;
      expv[52] = 168'h0cb9cfded8fffeae2816668de2cbfd5c510373488e;
      expv[53] = 168'hc4e832071c674da81fd1459abb77fd5c51037348fc;
      expv[54] = 168'h39eb262561038f80c55e0028c70cab1d675e40b2d5;
      expv[55] = 168'h95a2dd4aafac93c4bf9e07d4b258ab1d675e40b2a0;
      expv[56] = 168'ha50592e19b98d7ef88f02212f8a0ab1d675e40b211;
      expv[57] = 168'h7cffc9bd8c717bb20df9d6333cfcab1d675e40b212;
      expv[58] = 168'h6829cf8dcf1c1b85616cfe77ca2cab1d675e40b2b2;
      expv[59] = 168'hbff2f4b1a2e497fcde49fe1a7facab1d675e40b233;
      expv[60] = 168'h23504c612a142e0ca83b5b8f489c5c19534073be3c;
      expv[61] = 168'hd4fb70c2a71cd0c815c47b9d69d45c19534073beaa;
      expv[62] = 168'h74250e054656022e347f677496cc5c19534073be19;
      expv[63] = 168'h2cbfc69c4dc7d21084298e337e3fa42108b5e53800;
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
