// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140472 dut (
    .din0(in_vec[129:98]),
    .din1(in_vec[97:66]),
    .din2(in_vec[65:34]),
    .din3(in_vec[33:2]),
    .din4(in_vec[1:0]),
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
    stim[0] = 130'h264f3545d01bd25f6a16feab0f085fce2;
    stim[1] = 130'h37e23300423d018ec2637df9e49d85fb9;
    stim[2] = 130'h2b0610eb586cea62d0389ad2592177c8d;
    stim[3] = 130'h32049fab4994963616e207f41e97ced79;
    stim[4] = 130'h271fcd99fce82709b5a1bd7c764d4f409;
    stim[5] = 130'h2e4413ae755360452e14ec4985b1fbc39;
    stim[6] = 130'h22b0ff1fbe3d09dea793e4b92d34470f6;
    stim[7] = 130'h2141ced9db51435c1df37b4a02a36a3ed;
    stim[8] = 130'h1ba04423b27806cda2617e2faaf6c0b27;
    stim[9] = 130'h3d928a336a3395555b9c5fc162f1a9ca6;
    stim[10] = 130'h14eb24e545d3d49f97260e981444e11c2;
    stim[11] = 130'h230b55951e7aca377538cbbf0646b8bc7;
    stim[12] = 130'h13b56b47fb569f19c85b62d9e3a74fb83;
    stim[13] = 130'h2ec67dbdff673b4ca7d0493e2a84cb773;
    stim[14] = 130'h3c68007e1bc700f8432b5b37159739288;
    stim[15] = 130'h23d51f7a2faa316b4c302efaa3fbc1956;
    stim[16] = 130'h0e0840e5dc564e6e16843fe69324e74a5;
    stim[17] = 130'h189ca0e9eecc388ad329e0ddf7d01375f;
    stim[18] = 130'h273f72354d635d55bbfda3edc58f4bba2;
    stim[19] = 130'h1200236eef05b451d2ab20e519aed26f1;
    stim[20] = 130'h3917288b27752ca32fe467f0a4f77088e;
    stim[21] = 130'h3e62523e058372dca4cc45254af0fb8df;
    stim[22] = 130'h2b71dfdfe4dcc686efe6aace63dbb9af9;
    stim[23] = 130'h24b2a5b0c02330dfa5df3c0d65e1df68f;
    stim[24] = 130'h17272b345ea9c730d74dae83253a22041;
    stim[25] = 130'h0f8fb0e71c33e6a140b2c09f6526a002e;
    stim[26] = 130'h0e7e9393d317dff4eb78b8cb96f216e79;
    stim[27] = 130'h30d1e4213aa647b1065e72c16e6ff2815;
    stim[28] = 130'h10c7b5b4c3a987cfdc44151bee93daddf;
    stim[29] = 130'h30a6eb0bcb44e9ecb6463179dfe1dce87;
    stim[30] = 130'h133f324dce03f5d7c305f640523e30c9f;
    stim[31] = 130'h0d2c49383c5088c7d4448a70aa33bca2a;
    stim[32] = 130'h35e31732a7f33f7a2da5ad7b1543efe22;
    stim[33] = 130'h39ae7c41dcfd269a78317c2016c8a19cb;
    stim[34] = 130'h359aa0783d8de1b66cf829538ae25429b;
    stim[35] = 130'h1b650f30c2098e80e1bd6733366714e45;
    stim[36] = 130'h1e33dfc6d19663e8cabef16bcb73ce9ea;
    stim[37] = 130'h089c2f33f9632a285349025cdca8b6e50;
    stim[38] = 130'h037d7c732e818c0eeb0c54826422c6f88;
    stim[39] = 130'h397421d1bf653466f8e882ad6ea4c203b;
    stim[40] = 130'h0b103349da39d7a0412c3744dd323b37c;
    stim[41] = 130'h3c7d8575b8608b9cafe1ae7a4af0c0457;
    stim[42] = 130'h2f86837f2d6d16b12752822d3cb18bdec;
    stim[43] = 130'h37802681b9c771e1d3706f18cc4fd565a;
    stim[44] = 130'h0b4ee93b15e208046f422046d8a33921f;
    stim[45] = 130'h030b0a864aa96a459c42cce047d4dbfad;
    stim[46] = 130'h380f1d00979c1469ffa418188104e6ef9;
    stim[47] = 130'h21340650fc4a3ce02c010f160391dfefb;
    stim[48] = 130'h2a22419e9e16de9a32d9509b1ad3531b0;
    stim[49] = 130'h2d234ef1d6f79df332826d2dbde96408e;
    stim[50] = 130'h1d58f54416fd5d1de065ef0f89536399b;
    stim[51] = 130'h291f37ee7ef03594205f7fa958141ce1e;
    stim[52] = 130'h0e184ddaf560f570503ea798d32475a2e;
    stim[53] = 130'h136a63442b7660a670530dded4d7a1993;
    stim[54] = 130'h25210a52343a633707b4a9f6b477cad77;
    stim[55] = 130'h2d1235f109544eed77750d3ef079d8913;
    stim[56] = 130'h3594a5256745079ceb8c950a1c0f40082;
    stim[57] = 130'h182e453ab86fe68349f1004458f3e447d;
    stim[58] = 130'h2ad387f9375a163c07d296e6969bc894d;
    stim[59] = 130'h2521259ba88c533f062972059b399b1fc;
    stim[60] = 130'h18024375266ad79af764a40940459eecf;
    stim[61] = 130'h1d07350dc7006278b214e7b6bb07d3601;
    stim[62] = 130'h0c9b461763026ed41a3b28f2a6e533ee1;
    stim[63] = 130'h18d511ce20cca097cb4c90d24e66d6ece;
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
      expv[0] = 32'h406f497d;
      expv[1] = 32'h098df7e7;
      expv[2] = 32'h40e26b49;
      expv[3] = 32'h5b881fd0;
      expv[4] = 32'h00000000;
      expv[5] = 32'h16c7ef0e;
      expv[6] = 32'h00000000;
      expv[7] = 32'h0a8da8fb;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h174f527e;
      expv[11] = 32'h191ae2f1;
      expv[12] = 32'h216d8b67;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h4c939d29;
      expv[17] = 32'h4ca78377;
      expv[18] = 32'h358d7556;
      expv[19] = 32'h4aac8394;
      expv[20] = 32'h00000000;
      expv[21] = 32'h2bc3ee37;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h5d36ba0c;
      expv[25] = 32'h3e3ec39c;
      expv[26] = 32'h5bc85b9e;
      expv[27] = 32'h1979cb05;
      expv[28] = 32'h7110546f;
      expv[29] = 32'h7f8773a1;
      expv[30] = 32'h0c17d901;
      expv[31] = 32'h34b124e0;
      expv[32] = 32'h00000000;
      expv[33] = 32'h5b228672;
      expv[34] = 32'h2b8950a6;
      expv[35] = 32'h00000000;
      expv[36] = 32'h46598fa3;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h2bc30115;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h628ce487;
      expv[45] = 32'h1f536feb;
      expv[46] = 32'h04139bbe;
      expv[47] = 32'h0e477fbe;
      expv[48] = 32'h00000000;
      expv[49] = 32'h5bde77cc;
      expv[50] = 32'h254d8e66;
      expv[51] = 32'h00000000;
      expv[52] = 32'h3861376b;
      expv[53] = 32'h535e8664;
      expv[54] = 32'h1ed2a7da;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h27c40111;
      expv[58] = 32'h1f4a5b9a;
      expv[59] = 32'h00000000;
      expv[60] = 32'h01167bb3;
      expv[61] = 32'h00000000;
      expv[62] = 32'h68eca3ca;
      expv[63] = 32'h63544738;
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
