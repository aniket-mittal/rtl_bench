// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 200;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113074 dut (
    .i_data(in_vec[17:0]),
    .o_data_9(out_vec[199:175]),
    .o_data_25(out_vec[174:150]),
    .o_data_43(out_vec[149:125]),
    .o_data_57(out_vec[124:100]),
    .o_data_70(out_vec[99:75]),
    .o_data_80(out_vec[74:50]),
    .o_data_87(out_vec[49:25]),
    .o_data_90(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h019e9;
    stim[1] = 18'h3c031;
    stim[2] = 18'h28bdd;
    stim[3] = 18'h3f535;
    stim[4] = 18'h213a6;
    stim[5] = 18'h39f7f;
    stim[6] = 18'h199d1;
    stim[7] = 18'h3bcc1;
    stim[8] = 18'h0accb;
    stim[9] = 18'h305ce;
    stim[10] = 18'h183e1;
    stim[11] = 18'h0c741;
    stim[12] = 18'h2abda;
    stim[13] = 18'h36abd;
    stim[14] = 18'h15298;
    stim[15] = 18'h32b70;
    stim[16] = 18'h356fc;
    stim[17] = 18'h1bf6a;
    stim[18] = 18'h3f6f4;
    stim[19] = 18'h3c633;
    stim[20] = 18'h1e4d2;
    stim[21] = 18'h03b1b;
    stim[22] = 18'h1a2fd;
    stim[23] = 18'h396f6;
    stim[24] = 18'h31bdd;
    stim[25] = 18'h1d474;
    stim[26] = 18'h3b030;
    stim[27] = 18'h1b69e;
    stim[28] = 18'h09e58;
    stim[29] = 18'h07177;
    stim[30] = 18'h10be0;
    stim[31] = 18'h2e8b6;
    stim[32] = 18'h22e94;
    stim[33] = 18'h11475;
    stim[34] = 18'h3c199;
    stim[35] = 18'h3269a;
    stim[36] = 18'h26b79;
    stim[37] = 18'h390dc;
    stim[38] = 18'h3b29b;
    stim[39] = 18'h01253;
    stim[40] = 18'h1e5c5;
    stim[41] = 18'h0985f;
    stim[42] = 18'h04712;
    stim[43] = 18'h2cef4;
    stim[44] = 18'h38e04;
    stim[45] = 18'h1f896;
    stim[46] = 18'h2574d;
    stim[47] = 18'h23b2b;
    stim[48] = 18'h3e15e;
    stim[49] = 18'h078ec;
    stim[50] = 18'h1f4d3;
    stim[51] = 18'h097a3;
    stim[52] = 18'h3ae60;
    stim[53] = 18'h0f97e;
    stim[54] = 18'h21dbc;
    stim[55] = 18'h2df13;
    stim[56] = 18'h14662;
    stim[57] = 18'h2a4eb;
    stim[58] = 18'h2452a;
    stim[59] = 18'h1f9a9;
    stim[60] = 18'h36192;
    stim[61] = 18'h3ee2a;
    stim[62] = 18'h3d8b4;
    stim[63] = 18'h220c5;
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
      expv[0] = 200'h00749880a1f0408b44605c4e1038adb0206340119c5e091bea;
      expv[1] = 200'hfee0dcfe71327ea9077f1cae9f746b37b03d43d4a14fe9913a;
      expv[2] = 200'hf97562f6ea25782fc3fad2435cd1f3762ed4430310377d2bb2;
      expv[3] = 200'hffcf6effbc8b7fc5fcffd98cdfe863f7f28243f8aa07fc34a2;
      expv[4] = 200'hf7586b73facdb5a99c5925ff6bcafb25988f82b15ad552e85c;
      expv[5] = 200'hfe4dbbfda4d9fdf94abea8347f2ce5d7875ec3be6853de12a6;
      expv[6] = 200'h07342c8a015a489ac365b3f893807932004541168c0e90137a;
      expv[7] = 200'hfed164fe5bb67e968d7f106f9f6ce637abf143d24b2fe85bda;
      expv[8] = 200'h0309918437f4c3a0c32267933179fc10d7fdc07571fa3cbf5e;
      expv[9] = 200'hfb9a1f79e447babf335c84adeddcb2a6c7418355f205a80a6c;
      expv[10] = 200'h06d17489783e4824d96565d193507c31e4d94107a2ee885d1a;
      expv[11] = 200'h0380a484dd56442efd62c5d791b3de30f91140876e2e460cda;
      expv[12] = 200'hfa055577b212b8dbb3db4438ad17ece656d08318ce2d886aa4;
      expv[13] = 200'hfd6052fc5b1d7cddb7fdec415eb97d77456c439a8c77cb8672;
      expv[14] = 200'h05f3ac084436071bf104b63d82e4ac81a73e00e62350770970;
      expv[15] = 200'hfc43787acf7c3b897a1d0abf0e2f0506f64c036f8621b54560;
      expv[16] = 200'hfd076e7bdfa73c738a9da5e1ce8e47472cbb038d1f49c49498;
      expv[17] = 200'h07dd5d0aec568964d9c639e9a3d2b7e22f4481301a0c9d4b44;
      expv[18] = 200'hffd74a7fc7753fcf5f9fdfc54fec35c7f4b103f9d9d9fcd1c8;
      expv[19] = 200'hfefbe5fe96befec9523f3215bf818f97b7bfc3d8b6abebadee;
      expv[20] = 200'h0885b10bd6208a2de8c6bf2c24248b625e06814986bcaa71d4;
      expv[21] = 200'h0109f9817168c13db120d29030814b1049e1c0282c5a14c77e;
      expv[22] = 200'h075d728a3aad48cc0fe5d4a5539489720bbc411cc7f6934cf2;
      expv[23] = 200'hfe27537d6f81bdcb6a5e89cc6f1a3a277cb383b89b35db127c;
      expv[24] = 200'hfbfd62fa6e257b35c3fcd3435e0cf376e2d44364f037afcbb2;
      expv[25] = 200'h083c0a0b6fd509d5ef8684dd4400bdc24991013e66d8a4b0c8;
      expv[26] = 200'hfe98d87e0d2c3e53021ee3ab0f5169079c3c03c9c0a1e3f0e0;
      expv[27] = 200'h07b5c70ab55b893591461a92e3bf79a22445812a1f649a338c;
      expv[28] = 200'h02c88c03dda6035319023419815a6080c5ee006b9fd037aaf0;
      expv[29] = 200'h01fe9782c527c261dfa19437f0f834508dd4c04d1ee227e3d6;
      expv[30] = 200'h04b570068a38059fd403ba4e0249fa014ed800b612405e2cc0;
      expv[31] = 200'hfb1733792e71ba22d25c1d086d9d0e26a2e383422bb59dcffc;
      expv[32] = 200'hf7d19a74a31d363a5b9985ef4c05e3c5ba3902c3a8995c6008;
      expv[33] = 200'h04dc0e86bfdb45cdf4e3d8e0d25cbff1599240bbe786613122;
      expv[34] = 200'hfee730fe79fc7eb0967f21b11f777eb7b1ff43d595ffea0fca;
      expv[35] = 200'hfc2db57ab142bb6f7bdcf984ae2470e6f040836c3cadb39224;
      expv[36] = 200'hf8e3a0f61fb47781aa7a5edf1c8b18b6065742ed0c3f71c88a;
      expv[37] = 200'hfe0bde7d495f3daa9e9e740fcf0ce147751303b47589d8ed58;
      expv[38] = 200'hfea3b9fe1c48fe60013eec483f56b3179f41c3cb655be4ca7e;
      expv[39] = 200'h005275807286c0627e204147b028159016e7c00c746a06712e;
      expv[40] = 200'h0889f68bdc0f4a3302e6c28dd4269ef25f36414a2be6aac742;
      expv[41] = 200'h02adab83b851c332fea21ed2714d4fd0be76c0679092359166;
      expv[42] = 200'h013fd101bc30817e00c0fd30209b776058d680304e3c18fc54;
      expv[43] = 200'hfaa34a788d7539985f9bc1454d64b5c682b10330a9d994c1c8;
      expv[44] = 200'hfdff127d37993d9b559e69ee4f06a8c7718503b286b9d7ed68;
      expv[45] = 200'h08dea30c51a98a9826470596644fc82276bb8156f5f4b164bc;
      expv[46] = 200'hf888daf5a1a177153dfa17025c5ef875ed2042df56576ab112;
      expv[47] = 200'hf80a41f4f1ccf67e0739b2c93c216e15c9f5c2cc373b60cd1e;
      expv[48] = 200'hff76277f408bbf5b595f92deefbcfda7d9b583eb2de5f53b0c;
      expv[49] = 200'h02202602f3c30289f481aec8c10884409727005230682a82f8;
      expv[50] = 200'h08cdb58c3a26ca83ee26f82fb4478d927207c154676ab0122e;
      expv[51] = 200'h02aa5d83b3bac32f0c221c34b14bb490bd8bc06710ca354f4e;
      expv[52] = 200'hfe90b07e01d83e49441edd360f4d720799f803c88541e34dc0;
      expv[53] = 200'h0462b7061753853d054378d0e221c3a137dd80a993a457b64c;
      expv[54] = 200'hf785ce7439d735dfd29949edcbe10b45a52b02b835c9567418;
      expv[55] = 200'hfaebd5f8f236f9ef063bfab3bd87f99696d7c33b9eeb9a6cae;
      expv[56] = 200'h05bcb907f7e486da4ec48abd22c9f66197fa80ddd69c72be74;
      expv[57] = 200'hf9e621f786bcf8b66f3b2b853d08c2164e25c31417bb85fa9e;
      expv[58] = 200'hf8373d753046b6b3c1d9d665ac374be5d67482d3028d6450c4;
      expv[59] = 200'h08e3788c58604a9dec67096a145221b278134157b0deb1c56a;
      expv[60] = 200'hfd37117c21d0bcac70ddcb982ea56f6739f68394513dc84d54;
      expv[61] = 200'hffafbd7f9086bfa021dfc075afd8fbe7e9b483f3e08df9bac4;
      expv[62] = 200'hff4f2a7f0a653f2cc79f74014faa09c7cee103e54a59f22f48;
      expv[63] = 200'hf79376f44ccf75f022f954bddbe7aef5a8f642ba45e7578542;
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
