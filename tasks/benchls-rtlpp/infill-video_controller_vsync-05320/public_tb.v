// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05320 dut (
    .clk(clk),
    .addr(in_vec[90:69]),
    .datain(in_vec[68:37]),
    .req(in_vec[36:36]),
    .write(in_vec[35:35]),
    .vram_data_in(in_vec[34:3]),
    .vram_done(in_vec[2:2]),
    .vram_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .dataout(out_vec[83:52]),
    .ack(out_vec[51:51]),
    .decode(out_vec[50:50]),
    .interrupt(out_vec[49:49]),
    .vram_addr(out_vec[48:34]),
    .vram_data_out(out_vec[33:2]),
    .vram_req(out_vec[1:1]),
    .vram_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h3514369d9392b0c0bc155f3;
    stim[1] = 91'h0eabfd90c68a59983b7d65f;
    stim[2] = 91'h47398e8e7dcd527339c5892;
    stim[3] = 91'h508da24b1bd2f7ac5a461b4;
    stim[4] = 91'h78a1196cfcd70e2b1889efe;
    stim[5] = 91'h301d2bc3a33cb7e923df5c8;
    stim[6] = 91'h1adcb81b8b3feba6a207a78;
    stim[7] = 91'h27a683275895ed50d416be4;
    stim[8] = 91'h29dc61115780e87863937a0;
    stim[9] = 91'h6bbd9642138e140f92e134a;
    stim[10] = 91'h5d4466ac6feb0b9aeed7f42;
    stim[11] = 91'h4d4576d6db482aa75a0b432;
    stim[12] = 91'h26c9e9aabf9925d38481bb6;
    stim[13] = 91'h25eb268627a8c6706db3b12;
    stim[14] = 91'h489fec88e463c5643bf2c36;
    stim[15] = 91'h70d173004dff6f775d50d7a;
    stim[16] = 91'h6085b3b06d77e1756cf3730;
    stim[17] = 91'h14795e1c39e40aaf262cda6;
    stim[18] = 91'h7d2b16bd91e0319e1b9ac2e;
    stim[19] = 91'h2a8c22f91758dc3ca85226a;
    stim[20] = 91'h1defaabe98d97b2e3934a9e;
    stim[21] = 91'h0d90f9af88683a5c40640d8;
    stim[22] = 91'h346cfeb9eaddabf4f254396;
    stim[23] = 91'h681971f4388554af6bb52ae;
    stim[24] = 91'h5d3bfef177fafe8f8031cac;
    stim[25] = 91'h43e8d96c9fbb1e5952d633a;
    stim[26] = 91'h79039f7f78b12d8a49617d8;
    stim[27] = 91'h175cb2fa08b27576457d6fe;
    stim[28] = 91'h3b59e965190c144983cbd4a;
    stim[29] = 91'h282a2800727bef437aaffa0;
    stim[30] = 91'h7d96d99582f6353bc4d135e;
    stim[31] = 91'h6fa140554d09ea931d2d408;
    stim[32] = 91'h0f802c9857705fb1cf13334;
    stim[33] = 91'h624460ae539eca711ca8542;
    stim[34] = 91'h7172f8e10f38f59ad0d9bb4;
    stim[35] = 91'h3533f481ecea03ff1d01060;
    stim[36] = 91'h55fc9944dcf6aed5b7b1d5e;
    stim[37] = 91'h2498cef6213c4e3ccc0195a;
    stim[38] = 91'h5536670440bf887e6359791;
    stim[39] = 91'h244668bdcddb40214fae5f2;
    stim[40] = 91'h64f80a1a9c7826b54daf324;
    stim[41] = 91'h73c3c2fbbca0b70cc0693a6;
    stim[42] = 91'h194b134a8c7ddeee3be25c4;
    stim[43] = 91'h4942098b21593893a8abce6;
    stim[44] = 91'h48270528b27efbe8d19e1c2;
    stim[45] = 91'h20298f2465967e8f80553a4;
    stim[46] = 91'h24385df83877e008b8d7e38;
    stim[47] = 91'h7b0a026169e8b89fc7ac378;
    stim[48] = 91'h77c2287a41c8a8a9bc53766;
    stim[49] = 91'h735a984c12e7dc4f1036264;
    stim[50] = 91'h2d7d73148ebd65665f72e04;
    stim[51] = 91'h657412e7b97ae5ec6278640;
    stim[52] = 91'h2eedcd1601a207a0f3c5de2;
    stim[53] = 91'h561e7fe4e18c821754eaa96;
    stim[54] = 91'h3201073a99f805db7b97e7c;
    stim[55] = 91'h09124d8d224faa64b0684b8;
    stim[56] = 91'h5a149bd4986393ad304746a;
    stim[57] = 91'h081c3a5e3d4f8bb7e88f6e2;
    stim[58] = 91'h443038f3cc63dbc2cc57dac;
    stim[59] = 91'h51f452345a63ed139380dd2;
    stim[60] = 91'h696de03913c47cc06d1d6d2;
    stim[61] = 91'h0261c717e81f779db611a92;
    stim[62] = 91'h35cafa5b8323924fcb5f21e;
    stim[63] = 91'h0d0cb25001b24ceaa178fe4;
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
      expv[0] = 84'hxxxxxxxxx286d3b27256x;
      expv[1] = 84'h00000000157fb218d14b0;
      expv[2] = 84'h000000000731d1cfb9aa4;
      expv[3] = 84'he6738b1211b449637a5ec;
      expv[4] = 84'he6738b1254232d9f9ae1c;
      expv[5] = 84'h563113df03a578746796c;
      expv[6] = 84'h563113df1b97037167fd4;
      expv[7] = 84'h563113df14d064eb12bd8;
      expv[8] = 84'h563113df1b8c222af01d0;
      expv[9] = 84'h563113df17b2c84271c28;
      expv[10] = 84'h1f25c269088cd58dfd614;
      expv[11] = 84'h35ddafe808aedadb69054;
      expv[12] = 84'h4eb41686193d3557f3248;
      expv[13] = 84'ha70903761d64d0c4f518c;
      expv[14] = 84'he0db676213fd911c8c788;
      expv[15] = 84'hc877e5861a2e6009bfedc;
      expv[16] = 84'heebaa1af10b6760daefc0;
      expv[17] = 84'heebaa1af0f2bc3873c814;
      expv[18] = 84'h5e4c59b40562d7b23c060;
      expv[19] = 84'h3c37358511845f22eb1b8;
      expv[20] = 84'h7950a44d1df557d31b2f4;
      expv[21] = 84'h5c726953121f35f10d074;
      expv[22] = 84'h5c7269530d9fd73d5bb54;
      expv[23] = 84'he9e4a872032e3e8710aa8;
      expv[24] = 84'h5ed76a55077fde2eff5fc;
      expv[25] = 84'h5ed76a551d1b2d93f763c;
      expv[26] = 84'hb2a5ac670073efef16258;
      expv[27] = 84'hb2a5ac670b965f41164e8;
      expv[28] = 84'hec8afadf0b3d2ca321828;
      expv[29] = 84'h930797a90545000e4f7dc;
      expv[30] = 84'h930797a912db32b05ec68;
      expv[31] = 84'h7789a26b14280aa9a13d4;
      expv[32] = 84'h7789a26b1005930aee0bc;
      expv[33] = 84'h7789a26b088c15ca73d94;
      expv[34] = 84'he23950a80e5f1c21e71e8;
      expv[35] = 84'he23950a8067e903d9d404;
      expv[36] = 84'he23950a81f93289b9ed5c;
      expv[37] = 84'hab6f63ab1319dec42789c;
      expv[38] = 84'h7998032b06cce08817f10;
      expv[39] = 84'h0000000008cd17b9bb680;
      expv[40] = 84'h429f5cbe1f0143538f04c;
      expv[41] = 84'h429f5cbe18785f779416c;
      expv[42] = 84'h1980d274096269518fbbc;
      expv[43] = 84'h1980d274084131642b270;
      expv[44] = 84'h2751579c04e0a5164fdf4;
      expv[45] = 84'hd1a33c380531e48cb2cfc;
      expv[46] = 84'hd1a33c38070bbf070efc0;
      expv[47] = 84'hd1a33c3801404c2d3d170;
      expv[48] = 84'hd1a33c3818450f4839150;
      expv[49] = 84'h5378a6ec0b5309825cfb8;
      expv[50] = 84'h5378a6ec0fae6291d7ac8;
      expv[51] = 84'h5378a6ec0e825cf72f5c8;
      expv[52] = 84'h5378a6ec1db9a2c03440c;
      expv[53] = 84'h41e78bbc03cffc9c31904;
      expv[54] = 84'h2ea9d5520020e7533f008;
      expv[55] = 84'h2ea9d5520249b1a449f54;
      expv[56] = 84'h2ea9d55202937a930c724;
      expv[57] = 84'h5a608e8d03874bc7a9f14;
      expv[58] = 84'h6fd11edc06071e798c7b4;
      expv[59] = 84'h6fd11edc1e8a468b4c7d8;
      expv[60] = 84'h272701ba0dbc0722788f8;
      expv[61] = 84'h80da3ada0c38e2fd03eec;
      expv[62] = 84'h3b6c2352195f4b7064724;
      expv[63] = 84'h9f96be4301964a0036498;
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
