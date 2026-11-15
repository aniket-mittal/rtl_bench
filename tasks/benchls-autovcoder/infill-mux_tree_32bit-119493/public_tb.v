// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 144;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119493 dut (
    .din0(in_vec[143:112]),
    .din1(in_vec[111:80]),
    .din2(in_vec[79:48]),
    .din3(in_vec[47:16]),
    .din4(in_vec[15:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 144'hd126922dfaeea0859591fc45a14146cd58d2;
    stim[1] = 144'h2af2033a5a2271ac35d8ca9b064153c17e23;
    stim[2] = 144'h2c1ee4949a129b89c8d68fd16d7da55de240;
    stim[3] = 144'h2d765827e634c26e45438fb9c953e5bf77f3;
    stim[4] = 144'h9e359b5bdc635d337a371855dd936ef1b644;
    stim[5] = 144'h507f78d026b54ab7be06c35ddf259f6f7d32;
    stim[6] = 144'ha8e354b164f3568b21763fd4f0b37f19e81c;
    stim[7] = 144'h7bd09c1f7c38509fb2f539e628a8de2938c5;
    stim[8] = 144'h427f4f02d9aeeef280ee3fcbff28a877a19f;
    stim[9] = 144'hd3ef4a09731e71e6431876205db776610b6c;
    stim[10] = 144'hab1f850031a2ab7940733c657ff16b82e637;
    stim[11] = 144'he2cde3abedc7b7ee5d940eb95db96d4f66e8;
    stim[12] = 144'hf6b2ba7de2deb78e00fac22314c3a10e68b6;
    stim[13] = 144'h0707b5402a287715da6cd6fd37607569156a;
    stim[14] = 144'hbaa930d7a9befb9ef3c60aa3adae688b3171;
    stim[15] = 144'h85158b7e5d36e482631efd5a3c167f720ef4;
    stim[16] = 144'h74fd722a6c5371d0215ad78ca80d9b2bff5d;
    stim[17] = 144'hf931e64fc210c6ebb7e836d62fb2d23983a3;
    stim[18] = 144'hc40fdbfa72728e1cfaf48ad61a4b3598e55b;
    stim[19] = 144'h59887ad9f5a4bee1498ff30a1f2c8421f923;
    stim[20] = 144'h9d5caa5a93daee56c5ca064d4d48931cc3fe;
    stim[21] = 144'h65e8a7b2428344c1cb2d0327507c095d51fd;
    stim[22] = 144'h538fe7f54d16d1ee4f06ded1d520a9856cb4;
    stim[23] = 144'h9a8dedf1cd71e7353143e9fd8592479ab8ec;
    stim[24] = 144'he74f409ab3c803f2ff379b5bdb2eb1c7bd61;
    stim[25] = 144'hc2e161b13605107cfd8f600be420b0e29391;
    stim[26] = 144'h60452588fee2252d9dd094ef1792d61e575a;
    stim[27] = 144'h24f925951560b05ea6a10359aaad01dffa66;
    stim[28] = 144'h45d844d7eaec87a8342338b3c104e4e5f141;
    stim[29] = 144'h592fe48ae252b8354d501bec430b01702919;
    stim[30] = 144'h47dce872c94786251fa33f8b4fabc05b01fb;
    stim[31] = 144'h191799e69d4f6bc219474973db8be19040e7;
    stim[32] = 144'ha0a3923abffad1cac660d3578125a087d604;
    stim[33] = 144'h87ef0de84189337ff71e59736c04fdf6f90f;
    stim[34] = 144'he20304f03d7a61f45c96d7fe54a505a4cfb3;
    stim[35] = 144'h513fbdbdc07648c29259c73358e6269f00d7;
    stim[36] = 144'hf264643684877fd388818cb1bb216e322575;
    stim[37] = 144'ha02dc7731c74949f1167f1a7b84cc9e85e03;
    stim[38] = 144'h3079096eff90d9db03a9094d2934a460f1fb;
    stim[39] = 144'h9fd4d32de90c1df8b63dff8e6a640d289c5a;
    stim[40] = 144'h175b5a4ea9bf7fe65de35bdd690e23807376;
    stim[41] = 144'h518a0b6085ab37dfddf009de33a9c96fb412;
    stim[42] = 144'he5734282b7f1dbd42e7095147ed006daafd1;
    stim[43] = 144'hc0784453a1e1c4b5236fcc080b997a164dde;
    stim[44] = 144'h12a9abb4fb113eade53548c6c4ace137386c;
    stim[45] = 144'hee8d198c037883474d543b461ed3e094c13a;
    stim[46] = 144'h7b091e8cb2508e88a2c43ac30fd33b501484;
    stim[47] = 144'h92d6b3c0245a38143db580231058adc1478d;
    stim[48] = 144'hd94268fc13f4aa919f4ecd0d9fe0442cf906;
    stim[49] = 144'h69a91c359ca7d76d8fa71737f6c5f48c6423;
    stim[50] = 144'h2232bf56e73adc0aa7057f71502c615ee38d;
    stim[51] = 144'h61479a362e9fb4784ff8c510741754be7e31;
    stim[52] = 144'h74e7688d7c17bf1944dd37e1c07caf4d25cb;
    stim[53] = 144'h084eba33a1422b280697af934b528e08925f;
    stim[54] = 144'hc57681c0e9e4fc1ac720bdfa6b4cdcb2b491;
    stim[55] = 144'h3770563dca334723af1b9e33ee5ccd3b2fa5;
    stim[56] = 144'h8c1abf51e1105495389c40ee36d66d0a04be;
    stim[57] = 144'hf773bed918b5e6f9f21586fe0fe839c67433;
    stim[58] = 144'h17e2eb774e9b79fb95b669dbb976a70af3be;
    stim[59] = 144'ha80d7c1d431dc9ce7beb7d97d5b9c147a8b1;
    stim[60] = 144'hf58413ebc94b9e431a4cf8070f877731c45e;
    stim[61] = 144'h0f0af02efc4357efc5977b895348d7019d81;
    stim[62] = 144'h91b0d183682eb7e1e87d14f0a5ccd421c600;
    stim[63] = 144'h54fa5ed0990201ebf4426dcebd886a829394;
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
      expv[0] = 32'h9591fc45;
      expv[1] = 32'h064153c1;
      expv[2] = 32'h2c1ee494;
      expv[3] = 32'hc953e5bf;
      expv[4] = 32'h9e359b5b;
      expv[5] = 32'hbe06c35d;
      expv[6] = 32'ha8e354b1;
      expv[7] = 32'h7c38509f;
      expv[8] = 32'hff28a877;
      expv[9] = 32'hd3ef4a09;
      expv[10] = 32'h7ff16b82;
      expv[11] = 32'he2cde3ab;
      expv[12] = 32'h00fac223;
      expv[13] = 32'hda6cd6fd;
      expv[14] = 32'ha9befb9e;
      expv[15] = 32'h85158b7e;
      expv[16] = 32'h6c5371d0;
      expv[17] = 32'h2fb2d239;
      expv[18] = 32'h1a4b3598;
      expv[19] = 32'h1f2c8421;
      expv[20] = 32'hc5ca064d;
      expv[21] = 32'h428344c1;
      expv[22] = 32'h538fe7f5;
      expv[23] = 32'h9a8dedf1;
      expv[24] = 32'hb3c803f2;
      expv[25] = 32'h3605107c;
      expv[26] = 32'h9dd094ef;
      expv[27] = 32'ha6a10359;
      expv[28] = 32'heaec87a8;
      expv[29] = 32'he252b835;
      expv[30] = 32'h4fabc05b;
      expv[31] = 32'hdb8be190;
      expv[32] = 32'ha0a3923a;
      expv[33] = 32'h6c04fdf6;
      expv[34] = 32'h54a505a4;
      expv[35] = 32'h58e6269f;
      expv[36] = 32'h84877fd3;
      expv[37] = 32'hb84cc9e8;
      expv[38] = 32'h2934a460;
      expv[39] = 32'hb63dff8e;
      expv[40] = 32'h5de35bdd;
      expv[41] = 32'hddf009de;
      expv[42] = 32'hb7f1dbd4;
      expv[43] = 32'h236fcc08;
      expv[44] = 32'h12a9abb4;
      expv[45] = 32'h4d543b46;
      expv[46] = 32'h7b091e8c;
      expv[47] = 32'h245a3814;
      expv[48] = 32'h9f4ecd0d;
      expv[49] = 32'hf6c5f48c;
      expv[50] = 32'he73adc0a;
      expv[51] = 32'h2e9fb478;
      expv[52] = 32'hc07caf4d;
      expv[53] = 32'h4b528e08;
      expv[54] = 32'he9e4fc1a;
      expv[55] = 32'hca334723;
      expv[56] = 32'h389c40ee;
      expv[57] = 32'h0fe839c6;
      expv[58] = 32'h95b669db;
      expv[59] = 32'h431dc9ce;
      expv[60] = 32'h1a4cf807;
      expv[61] = 32'hfc4357ef;
      expv[62] = 32'h91b0d183;
      expv[63] = 32'h54fa5ed0;
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
