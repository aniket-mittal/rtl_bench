// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09779 dut (
    .clk(clk),
    .rstn(in_vec[48:48]),
    .tic_divide(in_vec[47:24]),
    .accum_divide(in_vec[23:0]),
    .pre_tic_enable(out_vec[51:51]),
    .tic_enable(out_vec[50:50]),
    .accum_enable(out_vec[49:49]),
    .accum_sample_enable(out_vec[48:48]),
    .tic_count(out_vec[47:24]),
    .accum_count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0350c322acb29;
    stim[1] = 49'h0aa148d4b13e2;
    stim[2] = 49'h14322a9ccad3e;
    stim[3] = 49'h141815de8b302;
    stim[4] = 49'h1f954e0d73884;
    stim[5] = 49'h1ba7d1ccb81c8;
    stim[6] = 49'h1f177f79e7c75;
    stim[7] = 49'h1c0c9c229392e;
    stim[8] = 49'h1bbc8418392cf;
    stim[9] = 49'h09ab4e8b1b0ab;
    stim[10] = 49'h188da5a43dff7;
    stim[11] = 49'h1a98f743a1881;
    stim[12] = 49'h02f0d2e70d8c1;
    stim[13] = 49'h1bdc1bf9468f7;
    stim[14] = 49'h19976210a2cee;
    stim[15] = 49'h1195abd2964e5;
    stim[16] = 49'h1c298563ed0b3;
    stim[17] = 49'h165e91d81e08a;
    stim[18] = 49'h139f28969fd74;
    stim[19] = 49'h1c815caa6ed67;
    stim[20] = 49'h1734e77d3852b;
    stim[21] = 49'h11a2caa95397f;
    stim[22] = 49'h151eb0314653e;
    stim[23] = 49'h1637e187b0a35;
    stim[24] = 49'h1a60d3eb3f641;
    stim[25] = 49'h10f1a1b3e5d69;
    stim[26] = 49'h1fc72e63c60ce;
    stim[27] = 49'h1d97ffe776677;
    stim[28] = 49'h1402dc8759bc3;
    stim[29] = 49'h0bd70337790aa;
    stim[30] = 49'h1ea4ede0281b6;
    stim[31] = 49'h1e15d49ab4caa;
    stim[32] = 49'h128d8c4f2429c;
    stim[33] = 49'h1ab084637ffee;
    stim[34] = 49'h1839a478df547;
    stim[35] = 49'h0b0a28b99f49f;
    stim[36] = 49'h15aeb88ad554d;
    stim[37] = 49'h140a693d82dca;
    stim[38] = 49'h1ec19af2a69a3;
    stim[39] = 49'h10896e84b9ed9;
    stim[40] = 49'h1d6578632e031;
    stim[41] = 49'h13ad2e1dcfb6d;
    stim[42] = 49'h1b789fe425aba;
    stim[43] = 49'h1227ca2a6ff1c;
    stim[44] = 49'h131eacdbdddc9;
    stim[45] = 49'h133b1151e0f85;
    stim[46] = 49'h1921833ab00fc;
    stim[47] = 49'h148fcd292843f;
    stim[48] = 49'h16144c26c91dd;
    stim[49] = 49'h1194e29711dfd;
    stim[50] = 49'h17085148cdaa5;
    stim[51] = 49'h1100f8e218af5;
    stim[52] = 49'h17618662df152;
    stim[53] = 49'h171a8a3b22aaf;
    stim[54] = 49'h1edd99faac4ff;
    stim[55] = 49'h1722342916af0;
    stim[56] = 49'h129f0b072bb21;
    stim[57] = 49'h177dc72f6574a;
    stim[58] = 49'h1b7a6a8bb82f9;
    stim[59] = 49'h11d16423403d9;
    stim[60] = 49'h125c9dcdc0df9;
    stim[61] = 49'h117600fc8a7e8;
    stim[62] = 49'h10fa56e115577;
    stim[63] = 49'h190262cb27902;
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
      expv[0] = 52'ha000000000000;
      expv[1] = 52'ha000000000000;
      expv[2] = 52'ha000000000000;
      expv[3] = 52'h54322a9ccad3e;
      expv[4] = 52'h04322a8ccad3d;
      expv[5] = 52'h04322a7ccad3c;
      expv[6] = 52'h04322a6ccad3b;
      expv[7] = 52'h04322a5ccad3a;
      expv[8] = 52'h14322a4ccad39;
      expv[9] = 52'ha000000000000;
      expv[10] = 52'ha000000000000;
      expv[11] = 52'h588da5a43dff7;
      expv[12] = 52'ha000000000000;
      expv[13] = 52'ha000000000000;
      expv[14] = 52'h5bdc1bf9468f7;
      expv[15] = 52'h0bdc1be9468f6;
      expv[16] = 52'h0bdc1bd9468f5;
      expv[17] = 52'h0bdc1bc9468f4;
      expv[18] = 52'h0bdc1bb9468f3;
      expv[19] = 52'h1bdc1ba9468f2;
      expv[20] = 52'h0bdc1b99468f1;
      expv[21] = 52'h0bdc1b89468f0;
      expv[22] = 52'h0bdc1b79468ef;
      expv[23] = 52'h0bdc1b69468ee;
      expv[24] = 52'h1bdc1b59468ed;
      expv[25] = 52'h0bdc1b49468ec;
      expv[26] = 52'h0bdc1b39468eb;
      expv[27] = 52'h0bdc1b29468ea;
      expv[28] = 52'h0bdc1b19468e9;
      expv[29] = 52'ha000000000000;
      expv[30] = 52'ha000000000000;
      expv[31] = 52'h5ea4ede0281b6;
      expv[32] = 52'h0ea4edd0281b5;
      expv[33] = 52'h0ea4edc0281b4;
      expv[34] = 52'h0ea4edb0281b3;
      expv[35] = 52'ha000000000000;
      expv[36] = 52'ha000000000000;
      expv[37] = 52'h55aeb88ad554d;
      expv[38] = 52'h05aeb87ad554c;
      expv[39] = 52'h05aeb86ad554b;
      expv[40] = 52'h05aeb85ad554a;
      expv[41] = 52'h05aeb84ad5549;
      expv[42] = 52'h15aeb83ad5548;
      expv[43] = 52'h05aeb82ad5547;
      expv[44] = 52'h05aeb81ad5546;
      expv[45] = 52'h05aeb80ad5545;
      expv[46] = 52'h05aeb7fad5544;
      expv[47] = 52'h15aeb7ead5543;
      expv[48] = 52'h05aeb7dad5542;
      expv[49] = 52'h05aeb7cad5541;
      expv[50] = 52'h05aeb7bad5540;
      expv[51] = 52'h05aeb7aad553f;
      expv[52] = 52'h15aeb79ad553e;
      expv[53] = 52'h05aeb78ad553d;
      expv[54] = 52'h05aeb77ad553c;
      expv[55] = 52'h05aeb76ad553b;
      expv[56] = 52'h05aeb75ad553a;
      expv[57] = 52'h15aeb74ad5539;
      expv[58] = 52'h05aeb73ad5538;
      expv[59] = 52'h05aeb72ad5537;
      expv[60] = 52'h05aeb71ad5536;
      expv[61] = 52'h05aeb70ad5535;
      expv[62] = 52'h15aeb6fad5534;
      expv[63] = 52'h05aeb6ead5533;
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
