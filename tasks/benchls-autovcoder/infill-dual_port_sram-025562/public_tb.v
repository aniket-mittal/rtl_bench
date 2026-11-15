// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 279;
  localparam OW = 256;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025562 dut (
    .clka(clk),
    .cena_i(in_vec[278:278]),
    .rena_i(in_vec[277:277]),
    .wena_i(in_vec[276:276]),
    .addra_i(in_vec[275:268]),
    .dataa_i(in_vec[267:140]),
    .clkb(in_vec[139:139]),
    .cenb_i(in_vec[138:138]),
    .renb_i(in_vec[137:137]),
    .wenb_i(in_vec[136:136]),
    .addrb_i(in_vec[135:128]),
    .datab_i(in_vec[127:0]),
    .dataa_o(out_vec[255:128]),
    .datab_o(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 279'h48b24d61243dabae364dc4005c5f177744760f4b71f6c9fd3c95330d873deace077528;
    stim[1] = 279'h48cc3a5b76b04db0ace13ecdfbc6133f03ad92e0bcb22749c394b44e54e7597839447f;
    stim[2] = 279'h77cd050ab19a772a814bc3246df2848ec8112bf781bef432a7a7f873a43ffe7da45643;
    stim[3] = 279'h6ffd337a7d1c2409c28e7602564a493e0f6e57f270b9a05ce4593082b075ff6abae7e8;
    stim[4] = 279'h1556589533ed75116fb35b944c25e2a06a6f69dbc963cb32d49d665c01650282d94312;
    stim[5] = 279'h3e53a5e1f484e50d560044aaedf60859b9b191da994eaf4e2a5717486ed6e0e57049b8;
    stim[6] = 279'h5d6dbbbad76f16d48096794c35354ec7f609ca8ee28ad86c714e02e94dfa5ea7719e6a;
    stim[7] = 279'h7060cbf36fd7472faefa4a719bd32c39525726c3096ede1bda04a460831b36fa94d017;
    stim[8] = 279'h34632fc364be794040caa4da8971789a61296db9196049a0c359b0285c7b663d27cca5;
    stim[9] = 279'h0528fc1d09912c16b8b5bc70351cc8e940bae521aa84778d8e1a97b66f5bcda544b434;
    stim[10] = 279'h2b66241b5fdae106873b016db6d780c7d4f57b0cd55381bf03b1951669e9cf9f6b5368;
    stim[11] = 279'h79dd058a24891d6deae7501b1cefa31c4419c934bc1a35504ddefdf8646f75ea8ae25c;
    stim[12] = 279'h2214affa914009bf16670b4a633011dd7392bdb8b786c4aa142a80eac8d7902ec5a547;
    stim[13] = 279'h64c793b12320519f86fa324aed9f7c73ac04df7f062b8a310aeb9ee5010bb7b2cad546;
    stim[14] = 279'h2f508c76e785d03b80f50bba15729e47e90a69e7b52db66f361343e42194be20b35f55;
    stim[15] = 279'h752dae24adbac1abdbca6e7f2a12eec63904fc7c901be927e343e567f747eedace756f;
    stim[16] = 279'h0b68f465bf36d457ec3b8182a5584191d940621a0e870ab455fedc72bef0832ce73072;
    stim[17] = 279'h1024a25a8c360974ca81f7bb23911b66c7f07de01795a2e6ce6b60efbf2149e4e533c6;
    stim[18] = 279'h2b8ae9e246b5dcfc4998114c4f11d34847aa4e5ba68c0653fb1a7960e2bfd049264314;
    stim[19] = 279'h663f2941402fe8a0dc5cc985a5e42c37d2c55cdd38f1d50c7d15504cfc6ec9d8157e97;
    stim[20] = 279'h619645ecda49c7f6b7da4c9c92709216743bbd05b78d9292167a9a8a5a5656a5552f6e;
    stim[21] = 279'h0552a282e1e60a32d9ee0498cb5690f010d200b2e359c25e17b302e03a9582e22326c8;
    stim[22] = 279'h5852dc315e0359e1edd5681cb43b99e745c7b93e5ebade80d730de8b6f685f1c1c515b;
    stim[23] = 279'h657dc3fbb05b91a47514b132722d53f51401f4a7f2d5e94b176972137810b22111e7ac;
    stim[24] = 279'h600560a2aa187f13d70736c6e0abaa8453db7ad483c32534f5a5343af598cd1e91de2c;
    stim[25] = 279'h07d1f3b8024b5fcba60777279e412076146f849ff7c4ebca5fbae1891fa57f44902a96;
    stim[26] = 279'h00cbf0d6e6b809bd00925783702984433ccf099c68941d8c9f0b54ed8d2a17bf68ec44;
    stim[27] = 279'h6b7ec19bf9f730ad3c9e4c7973d257c82a55ed2b3b2247239e3ff5e7ed800c50557f03;
    stim[28] = 279'h43c67e0c4b922d49667d372e332f0b476a8b0c32c7c3059119466db3a8f77d4c891d21;
    stim[29] = 279'h47d3b16edcba1fcdf8971ea16a160ed65e61e008c9b06b62452d03aba8d6cb5bdd53d6;
    stim[30] = 279'h54a85f9669276495a3316b44a4fdd09852bbcb3d91d3703cc2f95e09e2b8625c49be9a;
    stim[31] = 279'h7f26fcf8e5b3497bb901d10213ea0fba3235db64649b998954c0ddc40c3b124a5f90f3;
    stim[32] = 279'h7a6cd2cc8df8013dc7e3f5617b97e905f0d2807d68c322943d74960d8feb948d492753;
    stim[33] = 279'h565dcf023b3d66e12dd3850c947b8e9dbcf432272a3621b1937f218be8a45a517ff04a;
    stim[34] = 279'h6a2adfbd1c5a7854ac644b3a480618ea96d9e3fa050d7333a4ab355880866f5f9c883a;
    stim[35] = 279'h1bf04f6b456168b450b9f32832dbd367974a56bc1557520f3e97912363183de0190ed0;
    stim[36] = 279'h02ab195daa4e8cf2c6c9f0e2e49311fb01983b44c6d372954b2900beb43a7dcd807c6d;
    stim[37] = 279'h6eb4b513277bd6f6780e370530e7bab8ee89cc021c23b4ed96bc12400772887ac39b3f;
    stim[38] = 279'h7eb7c5b1d75472e20e2cc4e417163ea33b6e0384b57cdfce1466b133004e75e69de49a;
    stim[39] = 279'h593fcdb598aea0b5dbbe3b45faec29e6eb0a4ff1a0bbc855ac55700fc2f67f2b30d976;
    stim[40] = 279'h2d24b5185034a27c10b8ac207041b6e6bded268688038e701511391432a37de114c2e6;
    stim[41] = 279'h675312e78d9adb78c10f52b7a7bad8ac96d270492903318121d745923d945143d22273;
    stim[42] = 279'h036ee77dd16456d996a1c7722d76bde3567a3c47dba46eeb923fd31dd9aced4bd278fd;
    stim[43] = 279'h698d241b1fff1183c3997817027f2922a017906acdb468df4924f638fe4c57cf27b387;
    stim[44] = 279'h1bcf8e05e82b273f7ea64f6f945db6c55fca8dfd7e6a36a98d6a3f38418037c2457cd3;
    stim[45] = 279'h1e53a55f488924d21beb1aa5a99fbfebad89e842ccc2417ec92bb1a6080c97e19330bb;
    stim[46] = 279'h577a7981d736294368506ecf008a14f88991b82c96401a3bcd0c98500511b8842eced9;
    stim[47] = 279'h05222e27596ced7be032dc2187a0e0a541663c34d6e208c7a9774aebe72e63c68429a2;
    stim[48] = 279'h0ff97a3a2a37073e20c2a82cfe8812004b1d8bc102b9f10f7ab0a3e88522e6b751c6d4;
    stim[49] = 279'h55851e49778c7db01517043f02b4725c4b7507346f72fbaa4e35db7ca643c974cbf857;
    stim[50] = 279'h051ce7e080b51fd1306cae0110db4049daec68a64be6fa3de57fa1bef10b4a5331d334;
    stim[51] = 279'h131414e7d3c8d07f212e5f8ba489ff37324a8ce921664ef1c02648074896fb99ae77b8;
    stim[52] = 279'h5edb56e890d2c43b417876c97aeea587cdfe55ef66492eeefaa2316c1032fc4ff7d128;
    stim[53] = 279'h5e69b675854aa1434d213b1574f81b56f478c8841d26508e2597b61c95751b945b5d77;
    stim[54] = 279'h13442c30006f00e58a460371ad21bd33e06f2c0f4c059923b458a5e8472262e17fa5f4;
    stim[55] = 279'h532a38f3db31d73897fa9c10286652413d40033b6e52b7fa52ea3c3a3f81043c9e7842;
    stim[56] = 279'h3c391e307a670fef6d4f1bb82419ff0cb7dde233936777a4680aae42d0fd0d0fbee089;
    stim[57] = 279'h5c0c2fd9a909b8ab200b6e264cb31df7ea67b32d05f9c1feba8ccb8e37324a72f96ed8;
    stim[58] = 279'h2cc3ce09a2f28358366fb1e7f496cdaf07263be8dadea0c1668502903b06d051a770be;
    stim[59] = 279'h417324e6ce7b958add9be33cf643e1cadec9e6c76c915a5d7a97c856c3574bdadc6ec4;
    stim[60] = 279'h4eef935aa893c86e1cb8027f38f03ed470025ea0d4e4003a52e379820fa7c44c58cfb4;
    stim[61] = 279'h33a87d0b2bd8f4cd26956376f92708c0bcfb0b4996e004dcc1134135cba49355f3aa8d;
    stim[62] = 279'h76245d840eb714c58c4199ca2496845acecc4604eaae371a61c76ec04f951ef4bfa882;
    stim[63] = 279'h0905d315010f3dec3555370857cfd63550bc71d7a78c416ffa49f403f12339c1158e00;
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
      expv[0] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxbf0d6e6b809bd00925783702984433cc;
      expv[30] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 256'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
