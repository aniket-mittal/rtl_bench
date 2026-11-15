// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024490 dut (
    .hi(in_vec[67:36]),
    .lo(in_vec[35:5]),
    .lsa(in_vec[4:0]),
    .lsf_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h76b09265a40e8e909;
    stim[1] = 68'hb1b76e41ed599cd8b;
    stim[2] = 68'h02d20a14e6c493b8a;
    stim[3] = 68'he27173a901804d01b;
    stim[4] = 68'h15ed07cea27d07ce4;
    stim[5] = 68'hb9485ba4235aff76d;
    stim[6] = 68'hd4c0724244e24c137;
    stim[7] = 68'h4673d8c180c6d5364;
    stim[8] = 68'hadb5cba0e7f49b18b;
    stim[9] = 68'h81ed7232f440a0bbb;
    stim[10] = 68'h881dfa97834dcb6f9;
    stim[11] = 68'he120eab1f858d8ce6;
    stim[12] = 68'h92d4b10f34e8b6df2;
    stim[13] = 68'h63b4c83b300e34c63;
    stim[14] = 68'h62b7cdfefc787dd20;
    stim[15] = 68'h3931db043ab7f2e81;
    stim[16] = 68'h7ebd2755bbbdaefb1;
    stim[17] = 68'hc98a7b8f8e37bb1d8;
    stim[18] = 68'h3ab719ab3555cf3d2;
    stim[19] = 68'h0a016d8dfff3c64ed;
    stim[20] = 68'h69f7b493f5308c517;
    stim[21] = 68'h393d4563661e338ac;
    stim[22] = 68'h680b2ae53003e49c5;
    stim[23] = 68'h15c2685a4cccd8855;
    stim[24] = 68'h99e269e2aba15a8e5;
    stim[25] = 68'h6ca73e30db21ef448;
    stim[26] = 68'h9dbb95a33d4218b7b;
    stim[27] = 68'h97f42874b3bf02a4e;
    stim[28] = 68'h9cea5705c58f6e742;
    stim[29] = 68'h79bf2d78167d6d9ba;
    stim[30] = 68'h3782ffd84fd3b0e52;
    stim[31] = 68'hadece2afdcbc00bc2;
    stim[32] = 68'h6d4eafdefb577f073;
    stim[33] = 68'he01f1856ad80d42c3;
    stim[34] = 68'h448da1f5da4468cb3;
    stim[35] = 68'h48a760864e351c115;
    stim[36] = 68'h4b0003fd7879d73aa;
    stim[37] = 68'h0a46c33035abb8fce;
    stim[38] = 68'haeaed19c69c2affc1;
    stim[39] = 68'hdd001401a381d2360;
    stim[40] = 68'h7ea5468cd0bf952ff;
    stim[41] = 68'hd14388e18c1a6b63a;
    stim[42] = 68'hd16e0310d8e491ddc;
    stim[43] = 68'h1445b2a893912f751;
    stim[44] = 68'h29db41e5392e95a64;
    stim[45] = 68'hc86d41f7304e4a257;
    stim[46] = 68'h1dd89c1b73f029019;
    stim[47] = 68'h0b6988060794c8c18;
    stim[48] = 68'h6bf4fa7964ee82694;
    stim[49] = 68'h29e21f01cff701541;
    stim[50] = 68'h420711f3dbb2eeeed;
    stim[51] = 68'hed0502349630c298a;
    stim[52] = 68'h374fc3c14c34c49ba;
    stim[53] = 68'h80fdab8c981bfdebd;
    stim[54] = 68'hc369070d7585c4de4;
    stim[55] = 68'h17cc117f92f1f5fa6;
    stim[56] = 68'h259e6531679473bc2;
    stim[57] = 68'h3cac019de1c337ee3;
    stim[58] = 68'h20eba402508dbcb6a;
    stim[59] = 68'h12adb3c71f9bd50dc;
    stim[60] = 68'h3346ca053c74b73e8;
    stim[61] = 68'he3cc4f5f66aefa8d2;
    stim[62] = 68'haceedc75d9f5eee9a;
    stim[63] = 68'h1de7cbf36570cdeab;
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
      expv[0] = 32'h6124cb48;
      expv[1] = 32'hbb720f6a;
      expv[2] = 32'h4828539b;
      expv[3] = 32'h480c0268;
      expv[4] = 32'h5ed07cea;
      expv[5] = 32'h0b74846b;
      expv[6] = 32'h21227126;
      expv[7] = 32'h673d8c18;
      expv[8] = 32'hae5d073f;
      expv[9] = 32'h97a20505;
      expv[10] = 32'h2f069b96;
      expv[11] = 32'h483aac7e;
      expv[12] = 32'hc43cd3a2;
      expv[13] = 32'h1da641d9;
      expv[14] = 32'h62b7cdfe;
      expv[15] = 32'h7263b608;
      expv[16] = 32'h4eab777b;
      expv[17] = 32'h8f8e37bb;
      expv[18] = 32'h66acd557;
      expv[19] = 32'h2db1bffe;
      expv[20] = 32'h49fa9846;
      expv[21] = 32'hd4563661;
      expv[22] = 32'h01655ca6;
      expv[23] = 32'h0b49999b;
      expv[24] = 32'h3c4d3c55;
      expv[25] = 32'ha73e30db;
      expv[26] = 32'h19ea10c5;
      expv[27] = 32'h0a1d2cef;
      expv[28] = 32'h73a95c17;
      expv[29] = 32'he059f5b6;
      expv[30] = 32'hff613f4e;
      expv[31] = 32'hb7b38abf;
      expv[32] = 32'h7ef7dabb;
      expv[33] = 32'h00f8c2b5;
      expv[34] = 32'h0faed223;
      expv[35] = 32'h10c9c6a3;
      expv[36] = 32'h000ff5e1;
      expv[37] = 32'hb0cc0d6a;
      expv[38] = 32'h5d5da338;
      expv[39] = 32'hdd001401;
      expv[40] = 32'h685fca97;
      expv[41] = 32'h863069ad;
      expv[42] = 32'h0d8e491d;
      expv[43] = 32'h65512722;
      expv[44] = 32'h9db41e53;
      expv[45] = 32'hfb982725;
      expv[46] = 32'h36e7e052;
      expv[47] = 32'h060794c8;
      expv[48] = 32'ha7964ee8;
      expv[49] = 32'h53c43e03;
      expv[50] = 32'he23e7b76;
      expv[51] = 32'h1408d258;
      expv[52] = 32'h0530d312;
      expv[53] = 32'h93037fbd;
      expv[54] = 32'h369070d7;
      expv[55] = 32'hf3045fe4;
      expv[56] = 32'h967994c5;
      expv[57] = 32'he5600cef;
      expv[58] = 32'hae900942;
      expv[59] = 32'h71f9bd50;
      expv[60] = 32'h46ca053c;
      expv[61] = 32'h3d7d9abb;
      expv[62] = 32'hd767d7bb;
      expv[63] = 32'h3e5f9b2b;
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
