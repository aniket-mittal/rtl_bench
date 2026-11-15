// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02623 dut (
    .Data_A(in_vec[127:64]),
    .Data_B(in_vec[63:0]),
    .Result(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h252b4bc8ea8478794c3d03d639e6cc5a;
    stim[1] = 128'hf12afe0b2a9a567a8e442da0e24a8fb7;
    stim[2] = 128'he5ae3eb5878ae77549e42f10572a0315;
    stim[3] = 128'hcbf0362f6607f3c4ef8ffc98ce41f7f6;
    stim[4] = 128'h4026066ba36ed3568cc231a8467372e3;
    stim[5] = 128'h2ffeb1a7e7ba84971f2ae20f8fbd5207;
    stim[6] = 128'ha8a0f8cf290996b3d3dbf99676cb2f49;
    stim[7] = 128'h7d47dc517b14c2d2386b55753809ffa6;
    stim[8] = 128'hf01ba7c64cb9abe07d2aaf4550e5f9a8;
    stim[9] = 128'h40675be40c9778a94efb25bee26889a2;
    stim[10] = 128'hb56a0a65ed48fd2ce20840ec1da4329e;
    stim[11] = 128'hf1e1b9be65980139a9aef7d04a691c47;
    stim[12] = 128'had7f98254743a612f5a78ac408ddbc6c;
    stim[13] = 128'h2825554ef2f2af9a4f19ca15d752558f;
    stim[14] = 128'h57c506fbdede43b2b471bc4b11d211be;
    stim[15] = 128'ha4694cd09365fd2c845e850aa535a140;
    stim[16] = 128'h87bed4c8921fa15e86b13110ec9454f6;
    stim[17] = 128'hae9ff9ee0e20aee9acd8037c793234a2;
    stim[18] = 128'h23600fcec8ffbeafb708bfd20cd1a644;
    stim[19] = 128'h960a4d383e2e42a9453ff6659c88780a;
    stim[20] = 128'he12b13ffce5ef105c7592f6e17698b16;
    stim[21] = 128'h05278ed5bb8e6c0bbc6510d45c8105e6;
    stim[22] = 128'he7f5a3be0f72a273de3341defeec2921;
    stim[23] = 128'hd3bf0bb65255d83022c715927e5d3b79;
    stim[24] = 128'he29b00d887225c07d8bc4c9752f00247;
    stim[25] = 128'h8bb3febebd55ecf2cdf82c9563cbbce1;
    stim[26] = 128'h8e633f4d3946dcfecc2cfc4d36299b10;
    stim[27] = 128'hf82d208229331b5cc45af427e68dd7da;
    stim[28] = 128'haaf2c8c3d06b37f033d75017b2f662be;
    stim[29] = 128'h5e6de37bff296bc8ba80a122b7a8b023;
    stim[30] = 128'h23ba24d5497ced3e9069e49fddbd1805;
    stim[31] = 128'h6bc04e2de7a6b517268bd7140e57fab5;
    stim[32] = 128'h37ba15795aed44daeab12ad3c09d9380;
    stim[33] = 128'h5f10dc374da773fd899e760b49f1ed3b;
    stim[34] = 128'h75ecbd414d1fe778c42dd27c0a021554;
    stim[35] = 128'hea1d1c693883e8a7ca04a0b4f87e8636;
    stim[36] = 128'h58376d4030cd5c9b3291e9a1f0420cb2;
    stim[37] = 128'he76c2e6a01605863f4d87c332ae82131;
    stim[38] = 128'heb1b681124abf141e4193f50f794409a;
    stim[39] = 128'h6f2dc7e4b96fd97b6442801bb7fec1c2;
    stim[40] = 128'he1adc0864ad6574472f8d67c3e999e69;
    stim[41] = 128'h4f953a61ca0576d31161b0ea39b5832e;
    stim[42] = 128'h912f1e21436d7e9cd826486cbbb905b3;
    stim[43] = 128'h7788d3e8b033c8102a4ebe9be0194bf1;
    stim[44] = 128'h5da41a62cc82ad5bf981121c3872b9cb;
    stim[45] = 128'h211cf3a372b12486496da28851976c1e;
    stim[46] = 128'h25ad6192d19dd81be2a324813499cc62;
    stim[47] = 128'he3bf1a9a20039f76dce5e084b891aeb1;
    stim[48] = 128'habeb0922101462d3fa95a6c6bdecb0cd;
    stim[49] = 128'h61b423a1d94ef97e342e6bc1a8fbf110;
    stim[50] = 128'he65264daf3d462a650952b742f65e7d9;
    stim[51] = 128'hd3e323fa84fa20f2a8c3825c5f5c8a02;
    stim[52] = 128'hcf1fa65c046ce23f4cba568479c606b4;
    stim[53] = 128'h889aaeb5ed5fa10d0c22b6f19ff0466e;
    stim[54] = 128'h5bfd7018ade154482aaf971a7ecf0393;
    stim[55] = 128'h99a7b838211757b3d7f03797d81b5de0;
    stim[56] = 128'h35c8d6671b89795ac921e1331ecda299;
    stim[57] = 128'ha2ff0b0682329f5333e4bfa2b3d6af88;
    stim[58] = 128'hb9629e895ae03b374240fb6949de491e;
    stim[59] = 128'h7b2f438346691dda0e44dde1964923c6;
    stim[60] = 128'h61f9d3a67554d69f4ff7dc1ea60fef97;
    stim[61] = 128'hb260b036344ab6c6f6660d2caba084a8;
    stim[62] = 128'h08c08c66c76fe84504abb01e55ce0ab3;
    stim[63] = 128'h80289915d86b7b5dccd5faead8d712f8;
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
      expv[0] = 64'h71684f9f246b44d3;
      expv[1] = 64'h7f6f2bac0ce4e631;
      expv[2] = 64'h2f926dc5deb4ea8a;
      expv[3] = 64'hbb8032c83449ebba;
      expv[4] = 64'hcce83813e9e24639;
      expv[5] = 64'h4f2993b77777d69e;
      expv[6] = 64'h7c7cf2659fd4c5fc;
      expv[7] = 64'hb5b331c6b31ec278;
      expv[8] = 64'h6d46570b9d9fa588;
      expv[9] = 64'h8f6281a2ef00024b;
      expv[10] = 64'h97724b520aed2fca;
      expv[11] = 64'h9b90b18eb0011d80;
      expv[12] = 64'ha32722e95021627e;
      expv[13] = 64'h773f1f64ca450529;
      expv[14] = 64'h0c36c346f0b05570;
      expv[15] = 64'h28c7d1db389b9e6c;
      expv[16] = 64'h0e7005d97eb3f654;
      expv[17] = 64'h5b77fd6a8752e38b;
      expv[18] = 64'hda68cfa0d5d164f3;
      expv[19] = 64'hdb4a439ddab6bab3;
      expv[20] = 64'ha884436de5c87c1b;
      expv[21] = 64'hc18c9faa180f71f1;
      expv[22] = 64'hc628e59d0e5ecb94;
      expv[23] = 64'hf6862148d0b313a9;
      expv[24] = 64'hbb574d6fda125e4e;
      expv[25] = 64'h59ac2b542121a9d3;
      expv[26] = 64'h5a903b9a6f70780e;
      expv[27] = 64'hbc8814aa0fc0f336;
      expv[28] = 64'hdeca18db83619aae;
      expv[29] = 64'h18ee849eb6d21beb;
      expv[30] = 64'hb4240975273a0543;
      expv[31] = 64'h924c2541f5feafcc;
      expv[32] = 64'h226b404d1b8ad85a;
      expv[33] = 64'he8af524297996138;
      expv[34] = 64'h3a1a8fbd5721fccc;
      expv[35] = 64'hb421bd1e31026edd;
      expv[36] = 64'h8ac956e2210f694d;
      expv[37] = 64'hdc44aa9d2c487994;
      expv[38] = 64'hcf34a7621c4031db;
      expv[39] = 64'hd3704800716e9b3d;
      expv[40] = 64'h54a69702896ff5ad;
      expv[41] = 64'h60f6eb4c03bafa01;
      expv[42] = 64'h6955668dff26844f;
      expv[43] = 64'ha1d79284904d1401;
      expv[44] = 64'h57252c7f04f56726;
      expv[45] = 64'h6a8a962bc44890a4;
      expv[46] = 64'h085086140637a47d;
      expv[47] = 64'hc0a4fb1ed8954e27;
      expv[48] = 64'ha680afe8ce0113a0;
      expv[49] = 64'h95e28f63824aea8e;
      expv[50] = 64'h36e7904f233a4a7f;
      expv[51] = 64'h7ca6a656e456aaf4;
      expv[52] = 64'h1bd9fce07e32e8f3;
      expv[53] = 64'h94bd65a78d4fe77b;
      expv[54] = 64'h86ad07332cb057db;
      expv[55] = 64'h7197efcff932b593;
      expv[56] = 64'hfeeab79a3a571bf3;
      expv[57] = 64'hd6e3caa936094edb;
      expv[58] = 64'hfba399f2a4be8455;
      expv[59] = 64'h89742164dcb241a0;
      expv[60] = 64'hb1f1afc51b64c636;
      expv[61] = 64'ha8c6bd62dfeb3b6e;
      expv[62] = 64'h0d6c3c851d3df2f8;
      expv[63] = 64'h4cfe9400b1428e55;
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
