// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 300;
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
    .out_both(out_vec[299:200]),
    .out_any(out_vec[199:100]),
    .out_different(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'hb72a29c91a34c47adecd97342;
    stim[1] = 100'h0cc6970038f4179eec39e1c6f;
    stim[2] = 100'h56cb32b780924d0246e1fdacd;
    stim[3] = 100'h54c09d176142149cb0b0c4ee7;
    stim[4] = 100'h923368fbee0f1fa4897ba64d4;
    stim[5] = 100'h2a36103d5f1e7af398ed3129d;
    stim[6] = 100'heaffb867fa1ee9b8b58e4f09b;
    stim[7] = 100'h6097d33fa47d7b5c67582f759;
    stim[8] = 100'hc6d39fc2d51f77613b56f7e0e;
    stim[9] = 100'hced1eaced8f4cbf850ea2cb69;
    stim[10] = 100'h097859e883bc05adec617554f;
    stim[11] = 100'h5c1534881f770bb31dd8cd396;
    stim[12] = 100'ha5b043502a3180fdd9e7b1440;
    stim[13] = 100'h82d0c00be186617b086f8ce60;
    stim[14] = 100'h6fa7969fe23773c9117671e8f;
    stim[15] = 100'ha1015556cb2f770acb53fb149;
    stim[16] = 100'heddb2984cb8d123b2a5559ccb;
    stim[17] = 100'h017bccb1cea1ac47a02a44d52;
    stim[18] = 100'h54080d1f97327f00a7bf9e7a1;
    stim[19] = 100'h016e64c7f7c89a1f8ff9f4589;
    stim[20] = 100'he40fdb61341d3312b06547b8b;
    stim[21] = 100'h1d20492ff01f2998437142b1a;
    stim[22] = 100'h66bc165c52bcc103090908d45;
    stim[23] = 100'h9101d17cd4235740cf9f2dd94;
    stim[24] = 100'he3df6b71eb87fdb974801f00b;
    stim[25] = 100'h0cc9c6fd4c6e4a4056cc2dc53;
    stim[26] = 100'h1ac31723e0a57913eca47dfd8;
    stim[27] = 100'hdb0e52a3a58bec3d6e6464bca;
    stim[28] = 100'he4ca2204fe9ed2fe11b153d71;
    stim[29] = 100'h144e1b69b8e80cbef12fd8370;
    stim[30] = 100'h3d80e29bc4783bb5885068558;
    stim[31] = 100'h1e3dda94bbc9de91252b87fa9;
    stim[32] = 100'h5e923988e2371498856651ca4;
    stim[33] = 100'h0b9662ab23484a1949f7f9366;
    stim[34] = 100'h61f12d90646e9a4a31f44301a;
    stim[35] = 100'hac2ec8e0aca9d125a8d1af95d;
    stim[36] = 100'h0ff4fb37ef6981e211b71e4a7;
    stim[37] = 100'h2a568aa7807cb63ee6404127a;
    stim[38] = 100'h3d2938a8c69f46f2fc5990ee6;
    stim[39] = 100'h579b02b5ed7b9ac4354168948;
    stim[40] = 100'he563457d67f61d01446f97281;
    stim[41] = 100'h5694c83d32d1e7646b7580025;
    stim[42] = 100'hff8e7f4660c38c3dac884dd78;
    stim[43] = 100'h5742536cae1691c63fabc4874;
    stim[44] = 100'h88b2d919405b5b714bb2c9fbc;
    stim[45] = 100'h5b5c210c25b85409f982b9d08;
    stim[46] = 100'hfbab4adc46bdf089ef9d9c228;
    stim[47] = 100'hf29674a40b110b6cfc2a16cb1;
    stim[48] = 100'h306f0ae7c1a88b2cdfc6f2add;
    stim[49] = 100'h748ec342b109621bffb00d96b;
    stim[50] = 100'h1ff3eede980a70aeb29467a6d;
    stim[51] = 100'he5b1694d4b31e6a97bcc17587;
    stim[52] = 100'hd66a72a17cb70c0d1ca59be46;
    stim[53] = 100'h0b1830e20fa627644384674a6;
    stim[54] = 100'h765864633b2480c469530a2fe;
    stim[55] = 100'h45a94603f9a3c20ffd2fdc524;
    stim[56] = 100'h4e416e454d4719981edd0a97b;
    stim[57] = 100'hac670e8827bb12822cc54cb5a;
    stim[58] = 100'hb5678858acb760a87981d1454;
    stim[59] = 100'h126a0588262debe8f498925d4;
    stim[60] = 100'he63285b4aea1846771afc9132;
    stim[61] = 100'h7490ff0de1bc3c75a1aaa7184;
    stim[62] = 100'h1fd5f8167c2ecd617f1bca90d;
    stim[63] = 100'hab4611b9d1aa9b842cdc2add2;
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
      expv[0] = 300'h130000c0081040384e4483100ff7e7bdb3e7dccffffdfbf7c6ecbf3d2d972ea647b1ab5cae3;
      expv[1] = 300'h044203001870038e6418e0c271dcfbf0079fc3fbffc7be3cfe8aa5dc80248e1c519a2511258;
      expv[2] = 300'h02411013800004000260fc844ffdf77ff81b6df06cfe3fffdefdaeabec40db6b836591037ab;
      expv[3] = 300'h00400c032000000c101040663fdc1bf3fe3c63dbdf1f1cdfeefea0d39cd1e31ed2e8e8a6994;
      expv[4] = 300'h00112079e6070f80003982040b677f9fffe1f3fed9bffeedfcdb2adc8619089076cdc6756be;
      expv[5] = 300'h0012001c0f0e387188641000c7e7e307fff3efff7b9ff737bebf2d1823f091478a549ba9bd3;
      expv[6] = 300'h607f9823f80e6098108607009fffff8effe3ffbf9ff9edf1be1f80645407119d64ef49688d6;
      expv[7] = 300'h2003c11f803c390c230807308e1bff77fecfffffceff87fffad0dc3aa07643c6f254f438cf5;
      expv[8] = 300'h42418fc0400f3320190273e06cff7bfc7ff3fffe37fffffe1ea5ba5023bf90ccd1a6fd8c109;
      expv[9] = 300'h4640e046487041f8006004120dff3ffdff9fddff8f1fe7dffa29b91fa9b48eae04789f3aedd;
      expv[10] = 300'h003808e0019c0084e420300071bf8fbf987fc0ffffce3fffde8dc4751cc262077b1a51cffe8;
      expv[11] = 300'h0c0010000f3301910cc844182fc3f7d983fff1ff73ff9df7be721faecc10cc8e6a9334aba5d;
      expv[12] = 300'h009001000010807cc8e390000eff0c7f07e7381fffbeff3cc0f76862f83f294083351469e60;
      expv[13] = 300'h00404001e082203900278462087f1c01fe38ee3ff18ff9dee0c3b8a00e114551c68c584a950;
      expv[14] = 300'h2783820fe01331c0003230e07ffefbfbfe67ff7db33fef3f9ed8745dd0132cca2d99cd491c8;
      expv[15] = 300'h00000002410733004101f9000e303ffffdf7fff1fdff7ff3da7181fffdaeb8cc8faefa069ed;
      expv[16] = 300'h64c9008041840019000008c41ffff7b8ddf9f367f7efffbdde1b36bd46ae4b9b26bf7ff52ae;
      expv[17] = 300'h0039c410c600840380000040003ffddf3dfe3fccfe07ecdff601c62ae929f17a64703f66bfb;
      expv[18] = 300'h0000040f83103f00039f8e380fc181f3fbf76ff01efffbefe2fe0c0b905cab4080f46051471;
      expv[19] = 300'h00262043f3c0080f87f8f008003feedcfffd9be3f9ffbfcf9a81d956a40c2cd71048050e74d;
      expv[20] = 300'h6007c920100c1100102003981ec1fffe37c3f7737f0efcff9e160836d1ae13aa9be857e464e;
      expv[21] = 300'h0c000007f00f00880130001083f60db7ff03f7bb8c7f3c7f3e13b06db80810bd5462c9e3e97;
      expv[22] = 300'h221c020c001c4001000000400effc3efcf7fdc3071b1b19fced5e21d727be2a1828d8d8cbe7;
      expv[23] = 300'h0000c03c40010300478f04c80b303f3fdfc67ffc1dfbf7ffbcd98139c2be32fce0a850bb35e;
      expv[24] = 300'h61cf2130e183fc9830000f001e7fffff3ff8ffffbfd803f01e1230dec91e440365cec01080e;
      expv[25] = 300'h0440c27c04260000024404c011ddbcfffdcfedec0ffdc7fcf68aad2583ea596f607daa3b27a;
      expv[26] = 300'h08410301e0003801e4003cfc83fc73f67e1effb37fdecffff817a29cb210f7c59a1af643034;
      expv[27] = 300'h490600018081e41c2620201c0ff1ef7e7ef9ffc7ffeecedfdeb6897bf2774e1a23d95656e2f;
      expv[28] = 300'h604000007e0e407e009001c30edde660dffbff7fe33f3f7ff216af330681d1bb811969fa3c9;
      expv[29] = 300'h000609209860041e7007c81303cde3ffbf9f81dfff37ff87f01e6916dd649c0ae189b8342c8;
      expv[30] = 300'h1c806009c03819908000200087f81e7bfccf87fff98f0f8ff8234093d62644266f4c785c7f4;
      expv[31] = 300'h0e1cc80019c0ce00000183f803e7fffbdffdbffb36f7f8fffa912337dee62d31d9b7be4407d;
      expv[32] = 300'h0e00188060130008002200c00ffb67b99e67f3db98feef3dec71db254c932c9ed4c7d5792f6;
      expv[33] = 300'h018220010100000800f3f81221fbee7ff67d8de3bdbfffb7ee0e5d53feb2ec6f15ed0c05ad5;
      expv[34] = 300'h20f004802026080010f001008e3f37fb0ecffbede73fcc703e5109bb585659d76f290e62817;
      expv[35] = 300'h040640600400c00080408780cfc7fd9e1fdfbf36ff9f3ffbfe7a39ac90fafd39b77cb9785f3;
      expv[36] = 300'h07f07913e72080e000930e0031ffdff7ffffb83e633ff3edee880e86ac18dd4113196c916f4;
      expv[37] = 300'h00020003803c121e6200000387eff9fef80fdfe7feec0c36fe3f7dcff44042ed21956061b47;
      expv[38] = 300'h1c001800420f02707c08806627f7b79f9cfbfcff7fcfbb1fee23bda4fca5d0e58b827558995;
      expv[39] = 300'h03890010e4398840100020000ffbf07ffffffbfcc7fc3f9bd87c5683ef1bc657a62fe1dcdec;
      expv[40] = 300'h6021003c23f20c00002783000efe7cfffeffe3f03ccffbf78217d2e7c3d40d1381e6585cbc1;
      expv[41] = 300'h0200401c1040e320213080000ffbdd87f77f3efecffff8006efddeac23abb914d65ecf40037;
      expv[42] = 300'h7f863f022041841c840004c38ff9effcee1c79c7ffd98dfff8804940e550a24a237acc6b3c4;
      expv[43] = 300'h03000124060200c21f81c0030ffc6f7fdfe3fb3ce7fffcd8fc7ce37adaf91dd925207e26c4e;
      expv[44] = 300'h0010480800090930019040f9c99f7fb3bc0fffff3dff7dbffcccebb595e076f6c9ee6bad062;
      expv[45] = 300'h090c000400980000f88018c00fffc631c6ff8fc1bfb87fbf1876f2318a37647e0d0543e538c;
      expv[46] = 300'h7981004c021cf000e78c8c000ffffdffccffff19bffbfbc678867eefb265e308cd18535233c;
      expv[47] = 300'h70023000010001247c0002410f7befdec1f331ffdfc7e3fdf20bdd4ef60e998eda823f1dae9;
      expv[48] = 300'h10270063c08001044fc27004c70ff1fefc3f99f7dffcff7ffea8588f94217ccebab0258bfb3;
      expv[49] = 300'h3006410010002009ff9004821fd9fc7c7f31be63ffff01fbfecec9a2e3e98dd31600680b5de;
      expv[50] = 300'h0ff1e64e080030061000238243ff7ffffb81ef1fff7bcefefe900a19b1d40f48f9ebde5475b;
      expv[51] = 300'h609020040110e20039c403083eff3fbdfdf73effbffdc3ff8e1769ddebeea915fdc62a1cf44;
      expv[52] = 300'h422030003c1304040c0089e02fefef7e3fdff1c1f3defbfecebd5f4bf1c2ec8a0b92f756165;
      expv[53] = 300'h01081060078203200180230021f3871e61fee6fecc78cefdee0e942893087534d6624654ef5;
      expv[54] = 300'h320820211900004020010007efef8ece77f6d81ccfbf71e7fe4d745652a6b6c0a65dfa8f381;
      expv[55] = 300'h00800201f881c007fc07cc000cffbce07fbe7c61fff7ffcf6c677de5020572230803b8327b6;
      expv[56] = 300'h06002600040308880e4c00039dec3fecfdfcf3bb83fff1fbfee961d967ebe4955411b38fdc6;
      expv[57] = 300'h0423060003990000044004108fcef1f986fff37867dcfddffefa5489cc34669bc33aa7eaef7;
      expv[58] = 300'h10238008041320003880c0000ffef98f9fdffe1f8fb83f3cfcefd44c74faecd0fc454139e7e;
      expv[59] = 300'h002000800204e1e07008000c036fe0f986e7ffff9fdb9b6ffc1b5f074c353b1e1c8ed4db73e;
      expv[60] = 300'h62100090060080233087c0010ee778ffdffe38ceff3ffdb376952bc76ef9f14654c9782d9ab;
      expv[61] = 300'h30007f04e09c1c30808003080fdb1ff1fe3fc7cffe3ffef38c4ed8808b1162224f717ff4946;
      expv[62] = 300'h0fc0f8023c0644203f09c00043ffff83efc7fdfe3ff3fdfb1e903f041d4239abd1c0962fd8b;
      expv[63] = 300'h01020098c0800980044c004c0ffce33fbf3ffbf8c7dfc7fff6fee51965397fd6463ab23fb3b;
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
