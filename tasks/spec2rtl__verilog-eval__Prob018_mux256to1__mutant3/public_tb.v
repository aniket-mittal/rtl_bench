// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'he0363400f1e351fae34fc131ef87faeb5c2d935f3a2e8b60c0f590aa2721a1dd22;
    stim[1] = 264'h989b474f1660e6ef542f298e3a18cc77fcf5c0218b04e68d6d1bd15bc8c19bb4ef;
    stim[2] = 264'hfb44d43209f7cdc071251022c05c55e99b25fd8772bcd941228ac48e974f589682;
    stim[3] = 264'hae77fee02ff5cd0b7ca8f5b0f1b84bdfa1cf6a0a8031f248c06b304c2272aa2ca7;
    stim[4] = 264'h315394845932ad277272e5bf23c02e8a0f0e63cbd64c6d75fa838da3fb88432ec7;
    stim[5] = 264'h470ec314a2a655cee0224ccb25cb5c7a1223aaca5c59b357f8927d12350376ac1e;
    stim[6] = 264'h2473f48ba9b852843a4c258f27d9ae954b69c497c4abbbbb3b048b3342e956ff1f;
    stim[7] = 264'h59869aacf36ec12b16deccbd950e8cb2814d48cc7f8f9a452e6153a06f62079be0;
    stim[8] = 264'h12b86a2d162e83e8346a5e22e8a6dd64275b1f7efd6523968b7a85eee73a85cced;
    stim[9] = 264'hd0d355e9cfb003305fba8486bd6335ae7b5cc0799898c58700977be7054a3ba733;
    stim[10] = 264'h6932c0ff08c5b46e6b930c0b89943a1e924330e1394ade45acfe127d30b48e7e46;
    stim[11] = 264'h61ed86495eef5a44f2b8ae16b64e7a646d6472eb4eb493f44fcd62f66c858a6c07;
    stim[12] = 264'hb5dd1c74a639d9f027748d9c2b94184794d273639a723027cc453229125a54a770;
    stim[13] = 264'hafd3abe6b01086fcca6ab26c90eb60aadbe4e6fcd2b5bbdacc3ff62c2333854f4e;
    stim[14] = 264'h19d2369d85eda6dabd2956f79e84b79663cea03db2b9e7899636cf5dade40ef2a3;
    stim[15] = 264'h211897322c8a15ec22b1716d09e802507b7a24001ff840d74bfb4abd0f4eaa5d9c;
    stim[16] = 264'hc6daa9f44ab41cf4968c55ec24fa0df2760e15be36e7def663ed8b54e8fdc70f0d;
    stim[17] = 264'hc645fbece93c01f7970af4b81d1a26187fa6a7fa20c1fb3dc7e750cd4c213b59e2;
    stim[18] = 264'h8dfbac3b6244782c4f723cf0861f1e755a00a016492dca49e3b0ca30031dcaad30;
    stim[19] = 264'h1058cf250ca15560f826fe9067db1da0f85dc922149c4fe23e779cfc2fe83b03c5;
    stim[20] = 264'h67d6787a52eed6758479536a80065f6711db1628862b684aa9ea337b655e5b3f18;
    stim[21] = 264'h5f824013cb7045e642feab52d226dd85f097b4219e6874970ccfd5bd8290d7238a;
    stim[22] = 264'h8680bfdf4ca1fa18e842c473a3c00503b359dc10beeb31e94d1684590c7f8764ba;
    stim[23] = 264'h8db15c890f7606532728cb216a52e7732928308cf4aed69362a51a055fbc598db3;
    stim[24] = 264'h677e96ea5d0a4beb59d88e87a2c93f08c100cb39663dc7ca1a554371b8a5494418;
    stim[25] = 264'hee4028f8e9967d031fe48cfd7f931745fbb48739bd33a5beb5faf533aac371059a;
    stim[26] = 264'h54baf65f649539f4843a7829b96fb77051a096e9e07bffb8c68e1a1c6c9634bb16;
    stim[27] = 264'h5482dc7de1b7cfbe5ed27b679da14966705251cb2ff4c156cc2a08f2d556943d67;
    stim[28] = 264'h2a4835fdc0cc8851cefc33a2e513bbfc5f8ebb0f6fa7c7c858714313d5dbcd8721;
    stim[29] = 264'h5abfca37b12de96cf790c9f85c11921cc87d5c0533dc52b799e22fd86534173476;
    stim[30] = 264'h10734951ae3ca3c424e6fa94097e6f7791a3d591b58382f75a12fc3884b1694e1b;
    stim[31] = 264'h4fb2051e0039db7ba6adbe4c9573a08adc82cbfb3f5631e82281d3f48b2859a0d5;
    stim[32] = 264'hd5000116414b07c9cfef84b8d17488514d7863b41ab63fb822622b97afd6b358c5;
    stim[33] = 264'h68395bb1768a01ee477c646db15e11001ec1669545bef554941cbfb3cc5e0b39a3;
    stim[34] = 264'ha633d0212a12ba52fb512fc628e81d13ed275a5679116631bfe49ae2384f354d70;
    stim[35] = 264'h41f1d77b8f59c58ff1796d7e592707ff4873dc4d10b8c13af264d55c4c6ec7185d;
    stim[36] = 264'h352c88a441eb21de821a7920852b4e231e217d2bd0501c6d94cdf9a675ab12cad8;
    stim[37] = 264'h3bd1c2b1e58155f9b4b17db9aab8b973725aeb9dcf82f5d0ea030e0cb6239c243e;
    stim[38] = 264'hcd3ee89d832122ff45f9b1e0dddffcf93ea171d521c642f99522c28fbf4fc7933d;
    stim[39] = 264'he591cec50b440a3c03a3d0e62124ae987d3ed54a5703ccc75a722375a51686717f;
    stim[40] = 264'hf9433aac0d8c2131fa70c4bb0f1872e30a753d943f9cf1bdc9077ecdc41240e845;
    stim[41] = 264'hde68f2386d540c3cd06b2d285c6bdba57854c61cb56246499ab868e981742ee277;
    stim[42] = 264'h79dbfadfce0290a0dbd0d7719e0ff017f4c337111db0227f1ff3ff8c495f5d9573;
    stim[43] = 264'h6ce627c495edc9377355aad5b28775fe7670262a3252dee29cdc423d610bb23e8c;
    stim[44] = 264'h17903b01cdbd1063c95e25c259ae323f2443d06bd3dfb81cfcbb3df6f0f4cf00e5;
    stim[45] = 264'h03c7be179966b6ff292c3c3cd5c8fffebfe15675598e190f82481051b131ff563e;
    stim[46] = 264'hb61db43eb7b3f32f51b49e9a8d853d00780aac90852d34dd8df3dbd5bcdc04c010;
    stim[47] = 264'h2d072c13e83d44d087dbdff3c1c2965763ce465b63ab86fa7154e8ee69a1c982c1;
    stim[48] = 264'he666c803886185ae2d9cb6cee67ca74a31d84c364399395570dbe8d42cc5377c51;
    stim[49] = 264'h2e0274a474bb75c8ba1c4e8fcf1aa758e61a4339b34f588ebfd38c2bdd12892042;
    stim[50] = 264'h351d65ff351e16a8798cf94df5fe8c49a5d87a2577b681c9f66cd11eb24fcb36dc;
    stim[51] = 264'h00cc2785664682863745cafb613ad2760f9128bb71063beceb047bed2a959bc699;
    stim[52] = 264'h3a9291ad6ca7e61c2df1665ccf8df3249b4dde5135900cbc1fcb9d5f5b39369196;
    stim[53] = 264'h45d00e6c3df63e92a77d48e02ad567921c1464d349e1ff9c7fb9d7eb2963d322e8;
    stim[54] = 264'h91aaf0de31a1ed193d1bccc2d4e83c797b7291615c9aaeedaec477d3a6dee85fe5;
    stim[55] = 264'he46f7fccca3b96ab2ccd19bbb870de80e385b7f2e12826fd6c704ef56f71bd6e73;
    stim[56] = 264'h1b288be3db0c370d1a78f2f1df88bd643fecc756a15a272db8f90e646c37086ba6;
    stim[57] = 264'h71d126300318a16f94133d303795c2b28353e50465ea2c7ed1a0a0faeaa34d3152;
    stim[58] = 264'h3ece7f8772f57beb4281053313a9a10a879b0c1c40f7a2717cf76a54bfc1935f87;
    stim[59] = 264'hd74656cd3cdeb62400e39e025a19550392b46d2c4cb3b1cab232d011319fa0de15;
    stim[60] = 264'he7a604a20dc8dc026173c28177da596d8d848e59f77f019962f864e0fe03c19347;
    stim[61] = 264'ha2b9fc62b599883cc4e86064b34b73e21b66d0052f3c8717c44125c894c60e492c;
    stim[62] = 264'h75574c4104d02686c93717f6e471764fb05d464dbd4366c40f4317514d74a2f60b;
    stim[63] = 264'h66f9f06aa954237f34e4dde9a70901f46e430a3725fa0b947a40e2ea05317f5ded;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
