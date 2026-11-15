// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06308 dut (
    .clk(clk),
    .reset(in_vec[86:86]),
    .sw_reset(in_vec[85:85]),
    .sw_stop(in_vec[84:84]),
    .length(in_vec[83:52]),
    .eop_enabled(in_vec[51:51]),
    .eop(in_vec[50:50]),
    .ready(in_vec[49:49]),
    .valid(in_vec[48:48]),
    .early_termination(in_vec[47:47]),
    .address_in(in_vec[46:15]),
    .write_in(in_vec[14:14]),
    .max_burst_count(in_vec[13:11]),
    .write_fifo_used(in_vec[10:5]),
    .waitrequest(in_vec[4:4]),
    .short_first_access_enable(in_vec[3:3]),
    .short_last_access_enable(in_vec[2:2]),
    .short_first_and_last_access_enable(in_vec[1:1]),
    .last_access(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h6396f46ca854f6a2776d2c;
    stim[1] = 87'h57875845612ccf9483475f;
    stim[2] = 87'h2fc4b0bf892c868c441c18;
    stim[3] = 87'h394e60276c78477655cbcb;
    stim[4] = 87'h30be502f87e0521214fb97;
    stim[5] = 87'h059d05628a07a246afcd6f;
    stim[6] = 87'h29482d8ec6b73f554d13dc;
    stim[7] = 87'h16fb2273480adffdea00ac;
    stim[8] = 87'h0b971ba54f5cb764250819;
    stim[9] = 87'h2f1f2faddd9580c8585700;
    stim[10] = 87'h03d0848b98c02dc4a979f9;
    stim[11] = 87'h05d50c74cb3946142d7bb1;
    stim[12] = 87'h324a9c3be51bb616fa1725;
    stim[13] = 87'h14e5489f439f8dab91ff98;
    stim[14] = 87'h2416512956077ccc62d7fa;
    stim[15] = 87'h189c54b7aafc5d6d4512ff;
    stim[16] = 87'h13e8a1254f19de6c546b2e;
    stim[17] = 87'h3a75355f739b5270f4f308;
    stim[18] = 87'h38ef19781f6c78ec55a734;
    stim[19] = 87'h20fb6835c571d6e5e8a6a9;
    stim[20] = 87'h0aecf3bdb7542ac0a697dd;
    stim[21] = 87'h276f16575921891bc9a3a2;
    stim[22] = 87'h219ef0204503220be9177c;
    stim[23] = 87'h0dcb6eec7774a0e9efe815;
    stim[24] = 87'h1d2fe346db3c72d5b158be;
    stim[25] = 87'h0c296b9fa50ffc5b3c9cc6;
    stim[26] = 87'h2edcd9b3b8666698e5ecc6;
    stim[27] = 87'h02cf58aad354d4866c4eb7;
    stim[28] = 87'h09844b9e4f922f90ceff91;
    stim[29] = 87'h3ffa8a3c220d4f894ede60;
    stim[30] = 87'h39d63e95a485b8bc9ec750;
    stim[31] = 87'h06b49e2c820bf6a3628fd5;
    stim[32] = 87'h0ebea4fb4ff5127144be60;
    stim[33] = 87'h3f711a3494f8bb1c08b0d7;
    stim[34] = 87'h0958d2ead818494a0edafc;
    stim[35] = 87'h1c3e4e29cd72a615c918e9;
    stim[36] = 87'h09ef1ceedc0b1315822fe3;
    stim[37] = 87'h0cded7c636ecd5c428f069;
    stim[38] = 87'h181156d62a9fa00c9960ce;
    stim[39] = 87'h3aac06b833b1e3f7f2bb68;
    stim[40] = 87'h0a2eabc4618f1f83f7c766;
    stim[41] = 87'h0e2b5f3b959e3ce447b6b6;
    stim[42] = 87'h3d0ff628522623975cbf5a;
    stim[43] = 87'h0ffd82e31faee82b30d582;
    stim[44] = 87'h28d4bf1c9e2fceccc6c9f6;
    stim[45] = 87'h28f0bfe5dbdb12136e392f;
    stim[46] = 87'h0b2daa138181ccf8cd0090;
    stim[47] = 87'h3c82e0b771ffb4d7d0c2d7;
    stim[48] = 87'h272009ff8268e7d973ef83;
    stim[49] = 87'h26dceec4af4759fe1d473d;
    stim[50] = 87'h2694e972a95d2a7216c57d;
    stim[51] = 87'h2df56a076e0dca149208ae;
    stim[52] = 87'h155d307914dca091f763f7;
    stim[53] = 87'h3cf52926786c332f3b42eb;
    stim[54] = 87'h2547271268d4ffc5fd1264;
    stim[55] = 87'h3bca1bd6962633afe1f337;
    stim[56] = 87'h153cb52a7b39b6b139b3c1;
    stim[57] = 87'h0a845a7c825210b6df4d53;
    stim[58] = 87'h276d3204746ca8d219146b;
    stim[59] = 87'h2cdf20b209f21fef291c6b;
    stim[60] = 87'h0d2e39e88e9aa950fd257b;
    stim[61] = 87'h33c5e33c1d72c947927212;
    stim[62] = 87'h2b06118fb6525f76a8a51f;
    stim[63] = 87'h1824e68dbb17ed87887eb7;
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
      expv[0] = 39'h0000000006;
      expv[1] = 39'h0000000005;
      expv[2] = 39'h0000000006;
      expv[3] = 39'h0000000007;
      expv[4] = 39'h784776558f;
      expv[5] = 39'h605212148c;
      expv[6] = 39'h07a246afc8;
      expv[7] = 39'h07a246afc8;
      expv[8] = 39'h07a246af8c;
      expv[9] = 39'h07a246af8e;
      expv[10] = 39'h1580c8580c;
      expv[11] = 39'h402dc4a948;
      expv[12] = 39'h402dc4a948;
      expv[13] = 39'h402dc4a90d;
      expv[14] = 39'h1f8dab918e;
      expv[15] = 39'h077ccc628d;
      expv[16] = 39'h077ccc628d;
      expv[17] = 39'h19de6c540f;
      expv[18] = 39'h1b5270f48f;
      expv[19] = 39'h1b5270f48e;
      expv[20] = 39'h1b5270f48c;
      expv[21] = 39'h1b5270f48e;
      expv[22] = 39'h1b5270f48e;
      expv[23] = 39'h1b5270f48c;
      expv[24] = 39'h74a0e9efc8;
      expv[25] = 39'h74a0e9efc8;
      expv[26] = 39'h74a0e9ef8e;
      expv[27] = 39'h666698e58c;
      expv[28] = 39'h54d4866c48;
      expv[29] = 39'h54d4866c48;
      expv[30] = 39'h54d4866c0f;
      expv[31] = 39'h05b8bc9e8c;
      expv[32] = 39'h05b8bc9e8c;
      expv[33] = 39'h05b8bc9e8f;
      expv[34] = 39'h05b8bc9e8c;
      expv[35] = 39'h18494a0ec8;
      expv[36] = 39'h18494a0e8c;
      expv[37] = 39'h18494a0e8c;
      expv[38] = 39'h6cd5c428c8;
      expv[39] = 39'h6cd5c4288f;
      expv[40] = 39'h6cd5c4288c;
      expv[41] = 39'h0f1f83f7c8;
      expv[42] = 39'h0f1f83f7c8;
      expv[43] = 39'h0f1f83f7c8;
      expv[44] = 39'h0f1f83f78e;
      expv[45] = 39'h2fceccc68e;
      expv[46] = 39'h2fceccc68c;
      expv[47] = 39'h2fceccc68f;
      expv[48] = 39'h7fb4d7d08e;
      expv[49] = 39'h68e7d9738e;
      expv[50] = 39'h4759fe1d0e;
      expv[51] = 39'h5d2a72168e;
      expv[52] = 39'h5d2a72168d;
      expv[53] = 39'h5ca091f70f;
      expv[54] = 39'h6c332f3b0e;
      expv[55] = 39'h6c332f3b0f;
      expv[56] = 39'h2633afe18d;
      expv[57] = 39'h2633afe18c;
      expv[58] = 39'h5210b6df48;
      expv[59] = 39'h5210b6df0e;
      expv[60] = 39'h5210b6df0c;
      expv[61] = 39'h5210b6df0f;
      expv[62] = 39'h72c947920e;
      expv[63] = 39'h72c947920d;
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
