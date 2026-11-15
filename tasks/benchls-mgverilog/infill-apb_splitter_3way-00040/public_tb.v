// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 160;
  localparam OW = 199;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00040 dut (
    .io_mainClk(clk),
    .io_input_PADDR(in_vec[159:140]),
    .io_input_PSEL(in_vec[139:137]),
    .io_input_PENABLE(in_vec[136:136]),
    .io_input_PWRITE(in_vec[135:135]),
    .io_input_PWDATA(in_vec[134:103]),
    .io_outputs_0_PREADY(in_vec[102:102]),
    .io_outputs_0_PRDATA(in_vec[101:70]),
    .io_outputs_0_PSLVERROR(in_vec[69:69]),
    .io_outputs_1_PREADY(in_vec[68:68]),
    .io_outputs_1_PRDATA(in_vec[67:36]),
    .io_outputs_1_PSLVERROR(in_vec[35:35]),
    .io_outputs_2_PREADY(in_vec[34:34]),
    .io_outputs_2_PRDATA(in_vec[33:2]),
    .io_outputs_2_PSLVERROR(in_vec[1:1]),
    .resetCtrl_systemReset(in_vec[0:0]),
    .io_input_PREADY(out_vec[198:198]),
    .io_input_PRDATA(out_vec[197:166]),
    .io_input_PSLVERROR(out_vec[165:165]),
    .io_outputs_0_PADDR(out_vec[164:145]),
    .io_outputs_0_PSEL(out_vec[144:144]),
    .io_outputs_0_PENABLE(out_vec[143:143]),
    .io_outputs_0_PWRITE(out_vec[142:142]),
    .io_outputs_0_PWDATA(out_vec[141:110]),
    .io_outputs_1_PADDR(out_vec[109:90]),
    .io_outputs_1_PSEL(out_vec[89:89]),
    .io_outputs_1_PENABLE(out_vec[88:88]),
    .io_outputs_1_PWRITE(out_vec[87:87]),
    .io_outputs_1_PWDATA(out_vec[86:55]),
    .io_outputs_2_PADDR(out_vec[54:35]),
    .io_outputs_2_PSEL(out_vec[34:34]),
    .io_outputs_2_PENABLE(out_vec[33:33]),
    .io_outputs_2_PWRITE(out_vec[32:32]),
    .io_outputs_2_PWDATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 160'h72beb068bfe4d70da00e06cb1829412b364d6bcd;
    stim[1] = 160'hc557eb6d6d7d2e2a73e21e0b9dfe2aeb366b95cf;
    stim[2] = 160'hf4245a428cd5a45506efa9fbdbf0bea6c65d85be;
    stim[3] = 160'h786288d37c8ed5d62c9928bb212c18a625cf16b6;
    stim[4] = 160'h6e0de4aa56c0b1518f25e2f88551a4ec5e9957e0;
    stim[5] = 160'h5fcb591e02ab42e3d90f2c97c58fddc222f993fa;
    stim[6] = 160'hcb9daabb968db6c67c5eb59d2158f57483e3df46;
    stim[7] = 160'h97b73ca81056b3fb636a3b3f3307aec0837cc054;
    stim[8] = 160'h1121b4246a72be9afde013e67d74d02ad781b2e6;
    stim[9] = 160'h335128869b9743e98c9439a9490e4411bc33dada;
    stim[10] = 160'hdeb6292808082de4189d17e4487d6967d1a3276c;
    stim[11] = 160'hd92437cc43f4f9a8321279230a5694fc27e59c6a;
    stim[12] = 160'ha20ea2f3d03bf950c158a28dd6573c0aa8d4437e;
    stim[13] = 160'hf0cd9cb637d4f52fa4c4262c83d781a204baffd2;
    stim[14] = 160'hc732a4fc74f7d94d16ce019d24bc99a548b5e0c6;
    stim[15] = 160'hdb08cfcfbd941a500080d1d5f139d088bc0d380a;
    stim[16] = 160'h5e6ad3ba5b50d85a927de5193cae2d2b8894e046;
    stim[17] = 160'h5b7f711c88d61d281b09b9c284a330db9dcc38cc;
    stim[18] = 160'ha889bedcd81e3b9589034fbea1485a76336dc074;
    stim[19] = 160'h9c1073026c4dc9cdc57219995f4c272208128136;
    stim[20] = 160'h66ce1852f562c8fdd74bebe75cd139925adc4286;
    stim[21] = 160'hcee3c4bfe58e7a79965a23f985b751027c4b983c;
    stim[22] = 160'h8d4dd44a4b6744c4e2c640f1c5d31d6838d08126;
    stim[23] = 160'h1ed79823b26faae1157ce852bfaf25e9e5cc0a02;
    stim[24] = 160'h38745ebcac66cc48bd2427a96263220b1978cc6c;
    stim[25] = 160'h7befe11738d3183e04285ed24ca83e9849df21fa;
    stim[26] = 160'hedcd5ba76c5c54db525bdb172e79e5cf31848c6a;
    stim[27] = 160'h7e49e3f144b77d3ab792dc4c55e19f2ae1d32f20;
    stim[28] = 160'ha655fddc7c7c45a797a0dfaea849b0f0249b3fc6;
    stim[29] = 160'h9912420e0a7436dcca18312bc4da4a13e321cabc;
    stim[30] = 160'hde11130a9e0b417c8d7eca13809200f390c09400;
    stim[31] = 160'hbd8cc250396f61d2cdb986dc93fa2dd00fae5d26;
    stim[32] = 160'hae45965939761aac7df6cfc57bbd41914da56b76;
    stim[33] = 160'h56947834eb63d8ae63f8e7a43f4617c3a53e24a8;
    stim[34] = 160'h4229de89ee562510a2c2142eb5694e0fe26f558f;
    stim[35] = 160'hb523ffbf4edc37e00139e54e7c5f0543c615b294;
    stim[36] = 160'h0824b5f3facd87d05b9367fab2705af456cd44c0;
    stim[37] = 160'h38063b3f578a3e4cc700b04903b4bef7b8e9515c;
    stim[38] = 160'hd3be1520e242835719cf599e2300981ca7090720;
    stim[39] = 160'h6d34f798a9495f7f1ba7825a855bffd06257b58c;
    stim[40] = 160'h076147badbf4a0abac8e55bb0a7a8005eec839f8;
    stim[41] = 160'h2b860b2f4a544e5c43cc3d531fa17b2d6ba9a38d;
    stim[42] = 160'h3af7754fd130580998411b352ecbecadcaa17e92;
    stim[43] = 160'h6184f3f9baed73e6339310ea31fce9edfcec2b4a;
    stim[44] = 160'h9f20345c37614f9af55ab0fa27a8f4ac45f7951a;
    stim[45] = 160'hec1d2ca0694ec63d644ecac3230ef1ddfcf3ff68;
    stim[46] = 160'h0e79a144c5bd47c5438e290205c6d2c7019ead58;
    stim[47] = 160'h76db252d12cff77950a0123f8d7683cf7fa5c234;
    stim[48] = 160'hc81291142bb415efb1e574c0cb48cc37ed6b5be6;
    stim[49] = 160'h77841036af85a5f3ee85af8439f3d713e88946fc;
    stim[50] = 160'hb8eb215212a00fb9b833c917aa037d0abc83b9a0;
    stim[51] = 160'h626f3a8abe8c6d59e65d661a75ddad6895faeef0;
    stim[52] = 160'h71349c86a1865e8b8faa9ee4249064cc537d8886;
    stim[53] = 160'h364ccd0b3d0cbf8f73a1cb062f615dfc2ee80f10;
    stim[54] = 160'h9873ed240bf700bad2e100d695f7d77e1eacff2c;
    stim[55] = 160'h52162259bc1b9b1a032334d0914ee60d6d332a72;
    stim[56] = 160'h86b153909327f2a56e052616fa4dd619ee277b8a;
    stim[57] = 160'h509265a95926ed03a90ec14e5dfa3f86ae721f84;
    stim[58] = 160'h1fc24a39ca58679ec4a1e162fa280e81bf215ab4;
    stim[59] = 160'h8f9bc8c4830883aa7cf69828f4f2e72276a3df0e;
    stim[60] = 160'h55574266fc67a9260ec21b455951350a5bc2add8;
    stim[61] = 160'h2790d8373b78e478711a8b777acc6b120dcb84f4;
    stim[62] = 160'h6dfdbe9138fddb3a7c4897a334af0cf177052628;
    stim[63] = 160'hc28d4cfbf8ccbfb65f4655608530891e60ae44c0;
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
      expv[0] = 199'h3364d6bcce57d6345ff26b9cafac68bfe4d7395f58d17fc9ae;
      expv[1] = 199'h2a73e21e18aafdb6b6be973155f96d6d7d2e62abf6dadafa5c;
      expv[2] = 199'h6c65d85bfe848b21466ad23d0914428cd5a47a122c8519ab48;
      expv[3] = 199'h625cf16b6f0c5069be476ade18a0d37c8ed5bc3145a6f91dab;
      expv[4] = 199'h45e9957e0dc1bc552b60589b837aaa56c0b13706f154ad8162;
      expv[5] = 199'h5f163f770bf96a8f0155a157f2d51e02ab42afe5ae3c055685;
      expv[6] = 199'h483e3df47973b55dcb46db72e768bb968db6e5ced5772d1b6d;
      expv[7] = 199'h0837cc0552f6e654082b59e5edcea81056b3cbdb9d5020ad67;
      expv[8] = 199'h2d781b2e6224361235395f44486e246a72be8890d848d4e57d;
      expv[9] = 199'h25243910466a24434dcba1ccd448869b974399a8950d372e87;
      expv[10] = 199'h7d1a3276dbd6c494040416f7ad892808082def5b165010105b;
      expv[11] = 199'h427e59c6bb2487e621fa7cf6490fcc43f4f9ec921b9887e9f3;
      expv[12] = 199'h37595cf03441d579e81dfca883a8f3d03bf9510751e7a077f2;
      expv[13] = 199'h2fa4c4263e19b25b1bea7abc3366b637d4f57866cd6c6fa9ea;
      expv[14] = 199'h548b5e0c78e6547e3a7becb1ccaafc74f7d9639951f8e9efb2;
      expv[15] = 199'h57c4e7423b6119e7deca0d36c233cfbd941a6d84679f7b2834;
      expv[16] = 199'h38894e046bcd5bdd2da86c179ab5ba5b50d82f356b74b6a1b0;
      expv[17] = 199'h281b09b9cb6fee8e446b0e96dfdd1c88d61d2dbfba3911ac3a;
      expv[18] = 199'h1589034fb511376e6c0f1dea226edcd81e3bd444ddb9b03c77;
      expv[19] = 199'h2081281373820f813626e4e7041d026c4dc9ce083a04d89b93;
      expv[20] = 199'h7dd74bebecd9c2297ab16459b38452f562c8b3670ca5eac591;
      expv[21] = 199'h27c4b983d9dc785ff2c73d33b8f2bfe58e7a6771e17fcb1cf4;
      expv[22] = 199'h47174c75b1a9ba2525b3a26353764a4b6744c6a6e89496ce89;
      expv[23] = 199'h4afebc97a3daf211d937d547b5e423b26faa8f6bcc4764df55;
      expv[24] = 199'h31978cc6c70e8b5e5633660e1d16bcac66cc1c3a2d7958cd98;
      expv[25] = 199'h049df21faf7dfc8b9c698c1efbf91738d3183df7f22e71a630;
      expv[26] = 199'h5b525bdb1db9abd3b62e2a7b7355a76c5c54f6e6af4ed8b8a9;
      expv[27] = 199'h2e1d32f20fc93df8a25bbe9f9279f144b77d3f24f3e2896efa;
      expv[28] = 199'h2797a0dfb4cabeee3e3e22e9957fdc7c7c45d32affb8f8f88b;
      expv[29] = 199'h3e321cabd3224907053a1b6644900e0a7436cc89201c14e86d;
      expv[30] = 199'h7c8d7eca1bc223854f05a0b784450a9e0b416f088a153c1682;
      expv[31] = 199'h52cdb986d7b199281cb7b0ef633050396f61dec660a072dec3;
      expv[32] = 199'h2c7df6cfd5c8b32c9cbb0d6b91665939761ad722c8b272ec35;
      expv[33] = 199'h10fd185f0ad28e1a75b1ec55a51c34eb63d8ab4a3c69d6c7b1;
      expv[34] = 199'h7e26f558e8453b44f72b12908a7689ee56252114ed13dcac4a;
      expv[35] = 199'h3c615b2956a47fdfa76e1bed48ffbf4edc37da91ff7e9db86f;
      expv[36] = 199'h456cd44c010496f9fd66c3c2092ff3facd8784125be7f59b0f;
      expv[37] = 199'h240ed2fbc700c79fabc51f0e018d3f578a3e1c031e7eaf147c;
      expv[38] = 199'h4a7090721a77c290712141b4ef8720e2428369df0a41c48506;
      expv[39] = 199'h6a156fff4da69fcc54a4af9b4d3f98a9495f369a7b315292be;
      expv[40] = 199'h6c29ea0000ec29dd6dfa5041d853badbf4a083b0a375b7e941;
      expv[41] = 199'h4c7e85eca570c197a52a270ae1812f4a544e15c3065e94a89c;
      expv[42] = 199'h5caa17e9275eeea7e8982c0ebddf4fd130581d7bba9fa260b0;
      expv[43] = 199'h28c7f3a7ac309ffcdd76b9d8613df9baed73b0c27bf375dae7;
      expv[44] = 199'h1af55ab0f3e4062e1bb0a7e7c80e5c37614fcf9018b86ec29f;
      expv[45] = 199'h0c8c3bc77d83a45034a7633b074aa0694ec6760e9540d29d8c;
      expv[46] = 199'h7019ead581cf34a262dea3c39e6944c5bd47873cd2898b7a8f;
      expv[47] = 199'h7950a0122edb64968967fb9db6cb2d12cff73b6d925a259fee;
      expv[48] = 199'h032d2330d902528a15da0af204a5142bb415e4094a2857682b;
      expv[49] = 199'h73ee85af8ef0821b57c2d2dde10436af85a5bbc2086d5f0b4b;
      expv[50] = 199'h39b833c9171d64a9095007ee3ac95212a00fdc7592a425401f;
      expv[51] = 199'h59e65d660c4de7455f4636989bcc8abe8c6d31379d157d18da;
      expv[52] = 199'h4537d8886e26924350c32f5c4d2686a1865eb89a4d0d430cbd;
      expv[53] = 199'h42ee80f106c998859e865fcd93330b3d0cbf9b2666167a197f;
      expv[54] = 199'h61eacff2d30e7c9205fb80661cfb240bf700cc39f64817ee01;
      expv[55] = 199'h56d332a72a42c52cde0dcd94858859bc1b9b290b10b3783736;
      expv[56] = 199'h256e052610d62bc84993f961ac55909327f2c358ab21264fe5;
      expv[57] = 199'h03a90ec14a124cd4ac937694249ba95926ed28493352b24dda;
      expv[58] = 199'h0be8a03a03f8491ce52c33c7f09039ca58678fe1247394b0cf;
      expv[59] = 199'h276a3df0f1f37862418441e3e6f0c4830883c7cde589061107;
      expv[60] = 199'h25bc2add8aaae9337e33d49555d066fc67a92aaba0cdf8cf52;
      expv[61] = 199'h78711a8b64f21a1b9dbc7209e434373b78e413c86c6e76f1c8;
      expv[62] = 199'h177052628dbfb7489c7eed9b7f6e9138fddb36fedd2271fbb6;
      expv[63] = 199'h660ae44c1851a87dfc665ff0a352fbf8ccbfe146a5f7f1997f;
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
