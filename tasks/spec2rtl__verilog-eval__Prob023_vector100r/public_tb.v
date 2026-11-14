// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[99:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h2ab1a6290444e5e15412f0845;
    stim[1] = 100'hfc0c9f8b3d2109ef483812087;
    stim[2] = 100'h62d431beeb2e3833a35c327d5;
    stim[3] = 100'h352694f7ff1b1c04f381920f7;
    stim[4] = 100'h1e6ff9dea4d76309de284b276;
    stim[5] = 100'ha6efebf9d4aa34c7b4884663a;
    stim[6] = 100'h603ebbf90f284081c3119b72a;
    stim[7] = 100'h669b2e11e3da3eb7524fc9b3b;
    stim[8] = 100'h9cf50effdc80b2ab3962d6375;
    stim[9] = 100'h40fa8e1bf608b627ae6352305;
    stim[10] = 100'h5d36564b2d6b2b1f9a0f76f1e;
    stim[11] = 100'h14cf006784c564f5dec592698;
    stim[12] = 100'hcb6163ed6c2d9b26bea46bdec;
    stim[13] = 100'hb1b04e25fad51d4e078adab02;
    stim[14] = 100'h0466ccbee03a44b57fba88708;
    stim[15] = 100'h8ef8fd158bebc0db3608c3011;
    stim[16] = 100'hd7e596a2497485a729aa6dd2e;
    stim[17] = 100'h928b0d2db6011da6b510852ff;
    stim[18] = 100'h9f5cfcb13b64c880fd704006f;
    stim[19] = 100'h4c5fe679c180abf9ddc133166;
    stim[20] = 100'h6a8c264424038482aea39b308;
    stim[21] = 100'h4441243cd3d1ab8e55d5f558c;
    stim[22] = 100'h8a876cd4679a721b59c30acbd;
    stim[23] = 100'h6d2ef874970ea0fb3f22d893e;
    stim[24] = 100'h87c8acd2c1035d50e50c4bcb2;
    stim[25] = 100'h859013880aabe545449eecf1e;
    stim[26] = 100'h3c5d36b450e5161d0a31b0854;
    stim[27] = 100'hb62a74bcc752efadc83a72802;
    stim[28] = 100'h6b1cc44ea73fd2aeab1d44fd0;
    stim[29] = 100'hcbbc99d7e709370c5f1eac61f;
    stim[30] = 100'hd40a9add5bbc72cd77558bad2;
    stim[31] = 100'h60ffb059cdd15c831d1d343d3;
    stim[32] = 100'hb1ddf08abf72467a254a1e0b8;
    stim[33] = 100'h4baa77ed2456156d4754c1328;
    stim[34] = 100'h3e6a5f040cf5c670e3abf4ff3;
    stim[35] = 100'h7de5e4b23c904ddb58a1e33bd;
    stim[36] = 100'hdff6aec3c9601b817b6bb88e8;
    stim[37] = 100'h2146537086441045d9c0d2ef7;
    stim[38] = 100'h1541911b12825056990bf34b9;
    stim[39] = 100'h2522f55904cc61adb08145be4;
    stim[40] = 100'h5c72e864d1b5e7666338b8592;
    stim[41] = 100'hb8f0a54375487e48277df98da;
    stim[42] = 100'h3313d61dca87ebb3afc0f66a3;
    stim[43] = 100'h572eb6b7d1a30b817dc2c2c75;
    stim[44] = 100'hcbcb5ffd95971566caea61f03;
    stim[45] = 100'he252d390fa407057ab9e97864;
    stim[46] = 100'h1b8f3727e23b5d0cdfd5614be;
    stim[47] = 100'hf824908292488f15ce060ab57;
    stim[48] = 100'h929a7704f198817f81979b1de;
    stim[49] = 100'h2530dbcaebb13941352a14502;
    stim[50] = 100'heb6c8aa237e772c02fb09517b;
    stim[51] = 100'he9d6b2da2f481ecd66bb630e1;
    stim[52] = 100'h41864553610fe146f85106103;
    stim[53] = 100'h81e9cf75b686026c4db0b97bc;
    stim[54] = 100'hd6658b5f2d72f9def2635467c;
    stim[55] = 100'h88dee5b6fa469076eac7729af;
    stim[56] = 100'h049e1c5da931749e94c25e8d2;
    stim[57] = 100'h924cedffda6342d543cde4983;
    stim[58] = 100'h2ef0dfb5998864709970600a0;
    stim[59] = 100'h97e3902cec962f32b9713966d;
    stim[60] = 100'h2186215551a2283b3b5ff67bf;
    stim[61] = 100'h3e0562775f04d8b59eb84e646;
    stim[62] = 100'h9a76aa233f8a55579db1a00c5;
    stim[63] = 100'hdaeb8f781914177ce46eb7951;
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
      expv[0] = 100'ha210f482a87a7222094658d54;
      expv[1] = 100'he10481c12f79084bcd1f9303f;
      expv[2] = 100'habe4c3ac5cc1c74d77d8c2b46;
      expv[3] = 100'hef04981cf2038d8ffef2964ac;
      expv[4] = 100'h6e4d2147b90c6eb257b9ff678;
      expv[5] = 100'h5c662112de32c552b9fd7f765;
      expv[6] = 100'h54ed988c3810214f09fdd7c06;
      expv[7] = 100'hdcd93f24aed7c5bc78874d966;
      expv[8] = 100'haec6b469cd54d013bff70af39;
      expv[9] = 100'ha0c4ac675e46d106fd8715f02;
      expv[10] = 100'h78f6ef059f8d4d6b4d26a6cba;
      expv[11] = 100'h19649a37baf26a321e600f328;
      expv[12] = 100'h37bd6257d64d9b436b7c686d3;
      expv[13] = 100'h40d5b51e072b8ab5fa4720d8d;
      expv[14] = 100'h10e115dfead225c077d336620;
      expv[15] = 100'h880c3106cdb03d7d1a8bf1f71;
      expv[16] = 100'h74bb65594e5a12e924569a7eb;
      expv[17] = 100'hff4a108ad65b8806db4b0d149;
      expv[18] = 100'hf60020ebf011326dc8d3f3af9;
      expv[19] = 100'h668cc83bb9fd501839e67fa32;
      expv[20] = 100'h10cd9c5754121c02422643156;
      expv[21] = 100'h31aafabaa71d58bcb3c248222;
      expv[22] = 100'hbd350c39ad84e59e62b36e151;
      expv[23] = 100'h7c91b44fcdf0570e92e1f74b6;
      expv[24] = 100'h4d3d230a70abac0834b3513e1;
      expv[25] = 100'h78f377922a2a7d55011c809a1;
      expv[26] = 100'h2a10d8c50b868a70a2d6cba3c;
      expv[27] = 100'h4014e5c13b5f74ae33d2e546d;
      expv[28] = 100'h0bf22b8d5754bfce5722338d6;
      expv[29] = 100'hf863578fa30ec90e7eb993dd3;
      expv[30] = 100'h4b5d1aaeeb34e3ddabb59502b;
      expv[31] = 100'hcbc2cb8b8c13a8bb39a0dff06;
      expv[32] = 100'h1d07852a45e624efd510fbb8d;
      expv[33] = 100'h14c832ae2b6a86a24b7ee55d2;
      expv[34] = 100'hcff2fd5c70e63af3020fa567c;
      expv[35] = 100'hbdcc7851adbb2093c4d27a7be;
      expv[36] = 100'h1711dd6de81d80693c3756ffb;
      expv[37] = 100'hef74b039ba20822610eca6284;
      expv[38] = 100'h9d2cfd0996a0a4148d88982a8;
      expv[39] = 100'h27da2810db58633209aaf44a4;
      expv[40] = 100'h49a1d1cc666e7ad8b26174e3a;
      expv[41] = 100'h5b19fbee4127e12aec2a50f1d;
      expv[42] = 100'hc566f03f5cdd7e153b86bc8cc;
      expv[43] = 100'hae34343be81d0c58bed6d74ea;
      expv[44] = 100'hc0f86575366a8e9a9bffad3d3;
      expv[45] = 100'h261e979d5ea0e025f09cb4a47;
      expv[46] = 100'h7d286abfb30badc47e4ecf1d8;
      expv[47] = 100'head506073a8f112494109241f;
      expv[48] = 100'h7b8d9e981fe81198f20ee5949;
      expv[49] = 100'h40a2854ac829c8dd753db0ca4;
      expv[50] = 100'hde8a90df4034ee7ec455136d7;
      expv[51] = 100'h870c6dd66b37812f45b4d6b97;
      expv[52] = 100'hc08608a1f6287f086caa26182;
      expv[53] = 100'h3de9d0db23640616daef39781;
      expv[54] = 100'h3e62ac64f7b9f4eb4fad1a66b;
      expv[55] = 100'hf594ee3576e09625f6da77b11;
      expv[56] = 100'h4b17a4329792e8c95ba387920;
      expv[57] = 100'hc1927b3c2ab42c65bffb73249;
      expv[58] = 100'h050060e990e261199adfb0f74;
      expv[59] = 100'hb669c8e9d4cf469373409c7e9;
      expv[60] = 100'hfde6ffadcdc14458aaa846184;
      expv[61] = 100'h626721d79ad1b20faee46a07c;
      expv[62] = 100'ha30058db9eaaa51fcc4556e59;
      expv[63] = 100'h8a9ed76273ee828981ef1d75b;
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
