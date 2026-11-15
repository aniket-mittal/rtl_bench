// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 160;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  prio_sel dut (
    .data_in(in_vec[159:32]),
    .sel_in(in_vec[31:0]),
    .data_out(out_vec[8:5]),
    .pos_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 160'ha97f0e3c75bcb79b46036fdec6ae72020df94559;
    stim[1] = 160'h281e3fdf8aac28cb47b3f04c9c861babccf9ec58;
    stim[2] = 160'h247b6e34faf9f440665b14a8e52a92461d323cfa;
    stim[3] = 160'hf47871d25466a7c0ed724f05678972a9109611f5;
    stim[4] = 160'hd5b575816a2c7bdee4e944d2bbe03dbb28bcd796;
    stim[5] = 160'headd4e9df62249613869ba065b78b14353c69956;
    stim[6] = 160'h03ee6d78740ba47ce962559256ca191a48960b4d;
    stim[7] = 160'he9c8f18a9db4f2e164d76866a930ac55ae88f6c3;
    stim[8] = 160'h121f6a633fa6826e0b3718809f982042bd01c6df;
    stim[9] = 160'h09091c844f03a773242d8aec21c086ac9496ba06;
    stim[10] = 160'hf1ff1a6644d680e4b8797dca82c15c37e51021f5;
    stim[11] = 160'hc712eb78c17e354f8ea2c83503e701ea209ae127;
    stim[12] = 160'hd8d70a0f70d11b452b9a3280888a68c091a440bb;
    stim[13] = 160'h8b70cb5e734dfb495ac08b42efa12fcc105f98d7;
    stim[14] = 160'h8f3c50e8d5d2f4254efe20f407ad8de4f57545e3;
    stim[15] = 160'h981e659c9f7bc424fc9ff8204faf1eb41cdc5238;
    stim[16] = 160'hdc4f6a6f79f3ab50d3186e925e21ba5b42e67975;
    stim[17] = 160'hb27b47e930ad75b6ab5b01198aef1497a174c450;
    stim[18] = 160'hd6030c6e3251b016c68ca3ffcc4696f97e1beef4;
    stim[19] = 160'hae1a24b9614a4dda490cf3cedd4738653a8fe9ca;
    stim[20] = 160'hea8ae8d9962ffa694fd3869eac6cbea6f5c38a99;
    stim[21] = 160'h16b5eaf99664f331fe8fdf22413bad1c13b87591;
    stim[22] = 160'hbabb309ba713a39df68cce80d17e35d6bd9d0104;
    stim[23] = 160'h20965b93e036f75cdfe582ac9fe0b4c30c95b43f;
    stim[24] = 160'hf7e47443dca2339dd3c91e3a8aeb61e7c1bdd12b;
    stim[25] = 160'h08db30709e042230ae7fe6cd9773b3ed40dd58ba;
    stim[26] = 160'h9e82349f584eb8db92336f40221753b6ad86ad07;
    stim[27] = 160'h7b21c41c2fa4c01fc48e6b19c1383ca296b97a0b;
    stim[28] = 160'hc082f942fe1e45228542afc1516cef50d713e1cc;
    stim[29] = 160'h7cdf431d3592e5d2c073c87f523fce589acecd5c;
    stim[30] = 160'h1e7795335c98ef8ed119ba56de3560f62a18bf04;
    stim[31] = 160'h089b4ec078db603f98bf6b52ea06000cdacf7298;
    stim[32] = 160'h8b13b28fe4f594d0065d9399aced9942c49cc206;
    stim[33] = 160'hc21a55b3209596ba04b914b36e1e58d02804ca01;
    stim[34] = 160'h90fbc05fe8204ccd7e56b2d04b20cb2c54b8ef04;
    stim[35] = 160'h8b85e1666b2527035348a14270cc8356ba615004;
    stim[36] = 160'h2053a84e30674a30c2993570ec125ff055745a98;
    stim[37] = 160'h003d0e40caa3e55171f21d824b4725106d20d700;
    stim[38] = 160'hf33eace8455ce2d55405d69786c7a26ef4dc5f0d;
    stim[39] = 160'hdef5c246501db9e96936e3c3e707c209a713b4e6;
    stim[40] = 160'h73364abab7696657417f0289be1b9798c04ab1f7;
    stim[41] = 160'h45b7ce18f65017fdc1ab2485bb4949ac819fd0fb;
    stim[42] = 160'hd1374ab987a7f83cc2add7fdc3c281d852ece865;
    stim[43] = 160'h22bea6aa6974980ab808205f7f49076011cdc6ac;
    stim[44] = 160'h32abc6bd0255761d93e8b08036080f291fec1d91;
    stim[45] = 160'h7dab05c237a127ebe3d0b4aee912cd29cbf0961b;
    stim[46] = 160'h11c80890eb5c9f5e547b96e3037749ce384d9f97;
    stim[47] = 160'h0d5c58448636e5a4614844295db5c50477f7121c;
    stim[48] = 160'h292a2e113da7a08132bda80fac5082eea766678b;
    stim[49] = 160'h8fabedb7c358699e13b005af9067309d7e4b8693;
    stim[50] = 160'he7ddbd3eb238bc93f0ba2a828c99cbd0244f9623;
    stim[51] = 160'h93b69c154ad647a08e5e4aa76c2cf883c683d703;
    stim[52] = 160'hc92a206809ff054417eb1adc6d9295d7b3667a59;
    stim[53] = 160'h3d42b2d9a048dea6ffb2edbcfd9895bf91723ec6;
    stim[54] = 160'h7653a2f28b6ccf6a4e8a23e8fd1f7db138b5b124;
    stim[55] = 160'hd1a34e2ec5798fe3b00b47e276fbc025bc3a6c87;
    stim[56] = 160'h41be6065df93b003f1d55425d354dd4076d3f3fc;
    stim[57] = 160'he6b5b9505348d03e031ea764540b67be7e71bb74;
    stim[58] = 160'h72a84c8b9240538b7527a065b5b87a0a5d2b0a7c;
    stim[59] = 160'h67753972cb2f8150f80b142be5892fdfaa204f16;
    stim[60] = 160'hd1b5e3c6a08cf59ef5cd257c4988686272f380ef;
    stim[61] = 160'h7b88a87111be3b08ad778c0172fe84ad9f55a7dc;
    stim[62] = 160'h4d6c180ed2c52b6898c308d9fae745e1aea50882;
    stim[63] = 160'hc1994c4495b61c7dd7e26b5c140887a1379d2a69;
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
      expv[0] = 9'h01b;
      expv[1] = 9'h05f;
      expv[2] = 9'h17c;
      expv[3] = 9'h11c;
      expv[4] = 9'h17d;
      expv[5] = 9'h15e;
      expv[6] = 9'h07e;
      expv[7] = 9'h1df;
      expv[8] = 9'h03f;
      expv[9] = 9'h01f;
      expv[10] = 9'h1ff;
      expv[11] = 9'h03d;
      expv[12] = 9'h1bf;
      expv[13] = 9'h01c;
      expv[14] = 9'h11f;
      expv[15] = 9'h1dc;
      expv[16] = 9'h19e;
      expv[17] = 9'h17f;
      expv[18] = 9'h0de;
      expv[19] = 9'h03d;
      expv[20] = 9'h1df;
      expv[21] = 9'h0bc;
      expv[22] = 9'h17f;
      expv[23] = 9'h0bb;
      expv[24] = 9'h1ff;
      expv[25] = 9'h11e;
      expv[26] = 9'h13f;
      expv[27] = 9'h0ff;
      expv[28] = 9'h19f;
      expv[29] = 9'h0ff;
      expv[30] = 9'h0fd;
      expv[31] = 9'h01f;
      expv[32] = 9'h11f;
      expv[33] = 9'h03d;
      expv[34] = 9'h01e;
      expv[35] = 9'h11f;
      expv[36] = 9'h01e;
      expv[37] = 9'h01e;
      expv[38] = 9'h1ff;
      expv[39] = 9'h1bf;
      expv[40] = 9'h0ff;
      expv[41] = 9'h09f;
      expv[42] = 9'h03e;
      expv[43] = 9'h1dc;
      expv[44] = 9'h17c;
      expv[45] = 9'h0ff;
      expv[46] = 9'h19d;
      expv[47] = 9'h1be;
      expv[48] = 9'h05f;
      expv[49] = 9'h1fe;
      expv[50] = 9'h1bd;
      expv[51] = 9'h13f;
      expv[52] = 9'h19f;
      expv[53] = 9'h07f;
      expv[54] = 9'h0bd;
      expv[55] = 9'h1bf;
      expv[56] = 9'h03e;
      expv[57] = 9'h0de;
      expv[58] = 9'h05e;
      expv[59] = 9'h0df;
      expv[60] = 9'h03e;
      expv[61] = 9'h0ff;
      expv[62] = 9'h09f;
      expv[63] = 9'h13d;
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
