// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_211422 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .signed_div(in_vec[66:66]),
    .div_opdata1(in_vec[65:34]),
    .div_opdata2(in_vec[33:2]),
    .div_start(in_vec[1:1]),
    .div_cancel(in_vec[0:0]),
    .div_res(out_vec[64:1]),
    .div_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hd764a617c80e25b80;
    stim[1] = 68'h8f432c74a751866ac;
    stim[2] = 68'h4cc8df1abd4d870a8;
    stim[3] = 68'h160c6383a084c14b4;
    stim[4] = 68'h052179865de7c3b42;
    stim[5] = 68'h68b2c26bf5af8e4cc;
    stim[6] = 68'h4cbc636f2173569ad;
    stim[7] = 68'h1d188a022eae900f6;
    stim[8] = 68'h654004b6aad454721;
    stim[9] = 68'h38680846c0a9f0512;
    stim[10] = 68'h6b04b42774ff310a0;
    stim[11] = 68'h531e31302aab59bac;
    stim[12] = 68'h27e71cb02f3ed3a90;
    stim[13] = 68'h7e0bb31180ec4e3ec;
    stim[14] = 68'h1836bfffe1f116931;
    stim[15] = 68'h2b90a10626d10ab06;
    stim[16] = 68'h06a3e386f3277267e;
    stim[17] = 68'h6ab2f3e4cbaf96a46;
    stim[18] = 68'h49f4ee79527b7b1f4;
    stim[19] = 68'h1033ddf4a844d4b60;
    stim[20] = 68'h4717977039ec70674;
    stim[21] = 68'h0ba4bbb763476148a;
    stim[22] = 68'h765df4210b9323e9a;
    stim[23] = 68'h1eeddb142afac1d3e;
    stim[24] = 68'h2503cfd23c64bdbef;
    stim[25] = 68'h7beca23d375b3426a;
    stim[26] = 68'h091d5c1996934f9e0;
    stim[27] = 68'h533cf1ca507da1152;
    stim[28] = 68'h3ca62045a339b1209;
    stim[29] = 68'h216808184af1d29a8;
    stim[30] = 68'h4d8e3911212365d10;
    stim[31] = 68'h577aaa63210c86585;
    stim[32] = 68'h51100aa553482e9bb;
    stim[33] = 68'h4cebc71df4a4e07ef;
    stim[34] = 68'h58db71c0d9ccbbe25;
    stim[35] = 68'h275fd51047a9052b6;
    stim[36] = 68'h54c093934934f33ea;
    stim[37] = 68'h036a7d47239b86cbf;
    stim[38] = 68'h6760cee557805671b;
    stim[39] = 68'h21069b1817aab4c78;
    stim[40] = 68'h160d5bbd905298568;
    stim[41] = 68'h67195e20a8ccae138;
    stim[42] = 68'h6377447ff43b37e3e;
    stim[43] = 68'h323685ae2ad9e5596;
    stim[44] = 68'h3bb4a1b1913830921;
    stim[45] = 68'h12c6b9e3cfc5c206f;
    stim[46] = 68'h6f915f3a2988938c2;
    stim[47] = 68'h0c551bb040d46e850;
    stim[48] = 68'h33e964807836bac25;
    stim[49] = 68'h113c5d2a5ad3ad53a;
    stim[50] = 68'h0e367fe0ae185fba7;
    stim[51] = 68'h0b52026ba9de0b216;
    stim[52] = 68'h1b5aa39832641a029;
    stim[53] = 68'h379e7f4ca26730f84;
    stim[54] = 68'h2b45fc9344b435a78;
    stim[55] = 68'h397cc789a9a2eca80;
    stim[56] = 68'h10823efcd122d842b;
    stim[57] = 68'h0894b5a7272446978;
    stim[58] = 68'h4c479fcbf88bd9cf9;
    stim[59] = 68'h4f7f43479874b853f;
    stim[60] = 68'h3bc4aff63fb766951;
    stim[61] = 68'h68816069c5e25555e;
    stim[62] = 68'h7034cf16a63f95d10;
    stim[63] = 68'h727e43dddff537f19;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000001;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
