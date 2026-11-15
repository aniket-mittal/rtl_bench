// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 273;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128006 dut (
    .clk(clk),
    .mux_in(in_vec[272:17]),
    .mux_sel(in_vec[16:9]),
    .shift_in(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .final_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 273'h0f7e282f99f8d3bb0fe78729007fb3cfe8448e4aa61a1f403a2b3b3dc17f4014d2d77;
    stim[1] = 273'h1380e4386ad73434f9ea650f523272ee2b18ed091d52e377ba7c396d91eec0722f1b7;
    stim[2] = 273'h1241c4bc0c8d1a5534adc73698d91bb4dc136446599d1a6b7f05706f0f30b29dec108;
    stim[3] = 273'h04aa35697f85021d5c64c7fc3521dfd21b4a0f3e0e98dec846086da7a3da9dd12aa64;
    stim[4] = 273'h01fefe1c61370684dcee02107cbdb55fe1212dd0ec34b65b4f5c0f0dde4f5583f0658;
    stim[5] = 273'h191778051319098ff21a8013c6fc5c875e6b3dbeef2a556e276eb5bdd5901c51d4dd4;
    stim[6] = 273'h1e21a0bc68158e1ade9ef577f19e71dedc3b39b3004a229f16155e88b5cf9cd4db6f8;
    stim[7] = 273'h0fb128f0af2b4ebabfb213e0abf0cad9604c49765f9ea75298c994ce1a4ab5a339f04;
    stim[8] = 273'h0e8a340f7f037ed8dc65ee1ef5cb335f65a900fbe4070de091975e9ad5b8fb4cd8b70;
    stim[9] = 273'h1bc841b320418cf8c1aac69977c5cc62e067585017e76b26886a766062cc3b124a132;
    stim[10] = 273'h00a0cc417a13ecd2baa5ddc3c6b027c1a5618726459ef62f41ef60a28242a2103f1a8;
    stim[11] = 273'h02c738b95299a3cc81ea05845accc2174a28047daaa842dc2075770022226bb928502;
    stim[12] = 273'h11b4e546917a4cbe8a836c2cdbe1d955c8afa63457ee5b66ea7e9fa247dca61c13d42;
    stim[13] = 273'h04e18412f270c99ff826f3c096248c292a40552f5fbb77040daefe919ca8f46d5173a;
    stim[14] = 273'h05b53c4b39b8a61d1d5166dafea02475aa91e151db785d07f6a44a54341849348a20a;
    stim[15] = 273'h040fcc87a67808c3ece635658027dfa6fdef0e0d801adb23f48a3c1a47e8f7cfb09fc;
    stim[16] = 273'h17df1a528cce0d4b05a04f5d375e3c6fec7a5bf202db5e9494f7aa21ef5630e1f501e;
    stim[17] = 273'h0aaa671d345c646e6e16ad1e91fb533bb4803e10552b214e8369941f15471b9db6f0a;
    stim[18] = 273'h19bb42f77cc31b4aaf1af0217ce5d55901763484af1d670e2f724cc127013def8fc10;
    stim[19] = 273'h09648ba21a8b2839e6f6a2b8434cb0675f2db5402187de3e5302977bb26d2f41acea6;
    stim[20] = 273'h0d3dce26c685c1e5253c09dc82483b7d69e0d1054f8f073f5292cf159dfc132d2eec6;
    stim[21] = 273'h069b91c2883c0bf2eca1787b6abba09801108e1efe1702adeafa99313424de220652c;
    stim[22] = 273'h0a4ffb2d453213d287debbd0b36e20d47f266f417bf1fd1d632f4a611b6e6d3718790;
    stim[23] = 273'h11a7f21b21a93074aa93b76714fe7054a8781889d7884bd00ec519a89e26ea734c2dc;
    stim[24] = 273'h07644b3a3d845647b81b636a60cfe66eadd0cfa69cd0931f1c6b9753c8b5ddd220f2e;
    stim[25] = 273'h03a9ba289c0b200f7896b4cf400b77d289b5bc5fab4fbcc93c8a99bb830e7646742fa;
    stim[26] = 273'h11c7f32c69a0b03500f6cc4093124cf63618c55a45dbf82594bedc4b10ec0d3e25f78;
    stim[27] = 273'h0e287d134574f482a292f96ccff124f8b314bda7bbe54bb31746ffa336749069b8442;
    stim[28] = 273'h06a48cef18fa1453754a3a2358874470d19656b3ce012431e52aad2a64c8734d011f4;
    stim[29] = 273'h0850743de1fe87c02a755458e2c6bc437816564de2f34047422526821c675dc1f92e2;
    stim[30] = 273'h091cdd4efe648fbe7030ff2b8178af9cfb974053cec4ba52ee82dc3873b28c3eb2622;
    stim[31] = 273'h119cce5ac6a5b7a4ed0f3f0399cf8a9ff7977d5f9b5527fd82c095a1684a7775cc124;
    stim[32] = 273'h0f4ec96d1feb7eea8acc4d1b020140c6b3fea09469de410972b7ce7548b49527f9afc;
    stim[33] = 273'h0cfac1c445b1a866b8f5c66770b0273e7991c86b07d75453345a10287cfc6d82df234;
    stim[34] = 273'h11ba3b850d5beb09c0f92c790a4dcf58354f635fe5b75633f6a79858e26129fefe242;
    stim[35] = 273'h0bab78145273f771259ec0695bfae8fb7e1089c39f26b8140857064397bd60c06bcc4;
    stim[36] = 273'h1edd2d1cdd4d94e3548f20799f5e3e0c67b1fa0f28dc2e7bf7fc8183ac7b8de565c9c;
    stim[37] = 273'h0ab24c6a2628ff4aafa28fa7b8d42771dcd5b21e440bca58aa78a83ef62bb19e5a40a;
    stim[38] = 273'h0446e4d6cfba04e60c4ac4474e566fb83a80ab93fbab93848ad9e8d490b1ce4b51854;
    stim[39] = 273'h1b6c04bd47c87a73c408a80ceba9fb6f44c813e758bd7f4d2b42fb6ba33ddcfc0fb48;
    stim[40] = 273'h0b749748c58ecde43c8293485c8d5f0ee6f11c0b17c6e19ec7ae023c041b83d9d071e;
    stim[41] = 273'h1d548078039ae30f68f7eed0e04bd30ac4e727a7f3367f720f14cb8707a5d7c774b46;
    stim[42] = 273'h1fb2ba7c9b6802af75afb9626072ff6f1a8477cddbe00a193125708ebe503e8f2a522;
    stim[43] = 273'h0efec2e5cb63b24bdd6cd9f69c4527de4ba12af59ca52ee9433aa2c7b1dc8970ad03c;
    stim[44] = 273'h14a95adf9eec25693c45776fc6b3f9367de5c97cd40daeb811e769692f70a1959e336;
    stim[45] = 273'h0bc0bd978f32a1f50735333412a96513130740fab9548c3cc3b7d68f8d45ce4e2893c;
    stim[46] = 273'h1c2bd4cb73d530cd410b571fbc9d880de329a8b602e341edf07d7e12bbb9500b4e59c;
    stim[47] = 273'h16064801431f06efc29d498b23cc8e3775ed2109f2afe123ff8562f93fbf44da3abc0;
    stim[48] = 273'h185e9922dac67ad53ba83a19ae443bab9d7068603c7744bbfa5911629aca46e4fcf3a;
    stim[49] = 273'h1ad3992a90128dd2020ac48118b149de401048de457deffa0d49603c349cdf589eabf;
    stim[50] = 273'h041aeeb01cfbe8adb0508f4c5f65218752e4461eff9ca52baa25b8eb9bfaa948afcae;
    stim[51] = 273'h1a1722e4b6cb1e5e5804525321e58b9f3ac9816b4b68b4733d4ea1f33509120a9140a;
    stim[52] = 273'h1f63f027706424b392dfcafc0340daaedaf98f67549762d81b0b8b68aaae21de95cda;
    stim[53] = 273'h0a0b13f7ec17b03b7e448a2fa7408bb4b110a4bf0fe02f32864fac5c53eb90fb92fec;
    stim[54] = 273'h1c96b19ef8626941125eb25959c6ffe0863081e8a7bb2401136d3208fc3b89b6b4f5a;
    stim[55] = 273'h14add2ec47e795cb8c285d442eec4f93d4b45323d77791e8ec5e74dd71099b043070e;
    stim[56] = 273'h127e45c5c80161ee3e137820d84c9cd8eaa8d6f6a3f0bb9a76cbaf72bf9b0d9b75e12;
    stim[57] = 273'h1d1a2d4ba3d27a2389a51f4423d97e583c42f11809713f7583a993fe56403859ca89b;
    stim[58] = 273'h1009df5b1bbb9a12b3841ac703bcd499d82e71eb2c3ca1b4946bb4b7639433e0e07f4;
    stim[59] = 273'h12681c386290992e95e5275ee44e62dc5faf32c4c20d7096b31f435311713f44c2cfc;
    stim[60] = 273'h17c2cfe123cd0999b56b1c3f03e5039eacc86414eef6c5c34e5ef6489dbd177bc2ba2;
    stim[61] = 273'h10b13385a656210412fb123ec8e471f96325ffd30148ff2a177cc3689e9b194d769b4;
    stim[62] = 273'h0cb5dc9c1834ab73e1853ae07febda4a1c6ce163dfb46747cbe7cc0cbab312d97f1ae;
    stim[63] = 273'h053ba8c63e8ce672b6b8e0d8574c624bdcaf90fb4ac69ccef21ffc26a4576e3aa4526;
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
      expv[0] = 8'h44;
      expv[1] = 8'hbb;
      expv[2] = 8'hdb;
      expv[3] = 8'hb7;
      expv[4] = 8'h90;
      expv[5] = 8'hde;
      expv[6] = 8'hbd;
      expv[7] = 8'h7b;
      expv[8] = 8'hf6;
      expv[9] = 8'h12;
      expv[10] = 8'h24;
      expv[11] = 8'hb7;
      expv[12] = 8'h90;
      expv[13] = 8'hde;
      expv[14] = 8'h42;
      expv[15] = 8'h84;
      expv[16] = 8'hf6;
      expv[17] = 8'h12;
      expv[18] = 8'hdb;
      expv[19] = 8'hb7;
      expv[20] = 8'h6f;
      expv[21] = 8'h21;
      expv[22] = 8'hbd;
      expv[23] = 8'h84;
      expv[24] = 8'h09;
      expv[25] = 8'h12;
      expv[26] = 8'h24;
      expv[27] = 8'h48;
      expv[28] = 8'h6f;
      expv[29] = 8'h21;
      expv[30] = 8'hbd;
      expv[31] = 8'h7b;
      expv[32] = 8'h09;
      expv[33] = 8'h12;
      expv[34] = 8'hdb;
      expv[35] = 8'h48;
      expv[36] = 8'h6f;
      expv[37] = 8'h21;
      expv[38] = 8'h42;
      expv[39] = 8'h84;
      expv[40] = 8'hf6;
      expv[41] = 8'hed;
      expv[42] = 8'hdb;
      expv[43] = 8'h48;
      expv[44] = 8'h90;
      expv[45] = 8'hde;
      expv[46] = 8'h42;
      expv[47] = 8'h84;
      expv[48] = 8'hf6;
      expv[49] = 8'h5f;
      expv[50] = 8'h5f;
      expv[51] = 8'h41;
      expv[52] = 8'h82;
      expv[53] = 8'hfa;
      expv[54] = 8'h0a;
      expv[55] = 8'h14;
      expv[56] = 8'h28;
      expv[57] = 8'h4d;
      expv[58] = 8'h4d;
      expv[59] = 8'h9a;
      expv[60] = 8'hca;
      expv[61] = 8'h95;
      expv[62] = 8'h2b;
      expv[63] = 8'h56;
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
