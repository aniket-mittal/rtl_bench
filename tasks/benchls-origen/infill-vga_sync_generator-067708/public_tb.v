// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 109;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067708 dut (
    .clock(clk),
    .resetn(in_vec[108:108]),
    .rd_fifo_cnt(in_vec[107:96]),
    .H_PIXELS(in_vec[95:84]),
    .H_SYNCSTART(in_vec[83:72]),
    .H_SYNCEND(in_vec[71:60]),
    .H_PERIOD(in_vec[59:48]),
    .V_LINES(in_vec[47:36]),
    .V_SYNCSTART(in_vec[35:24]),
    .V_SYNCEND(in_vec[23:12]),
    .V_PERIOD(in_vec[11:0]),
    .hsync(out_vec[2:2]),
    .vsync(out_vec[1:1]),
    .enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 109'h0b8ab9464de89f56855682410496;
    stim[1] = 109'h0dfa24cf6df308b90bc1478317ca;
    stim[2] = 109'h138ce3d9d32d95f612fb3abb9fd4;
    stim[3] = 109'h12f4b794da51659d9d8066cd876a;
    stim[4] = 109'h176a4b8afaeaf693155b019aeaae;
    stim[5] = 109'h16fc0358c0ebd11c6d5bdd113226;
    stim[6] = 109'h1215ba1c3a70917b64fd5ce9f11e;
    stim[7] = 109'h1c6c4730d2b66ba656d54e57b7be;
    stim[8] = 109'h1268ebb67931f307eb3b0897a0bf;
    stim[9] = 109'h120f5731124b059a779c86e2cd9e;
    stim[10] = 109'h1bb88e8d784d9f57fcdfca45406c;
    stim[11] = 109'h18389cad73c72b0ca4ef1e2e7dfe;
    stim[12] = 109'h16117f5e2ae670138967a5e9b93f;
    stim[13] = 109'h12fc31dc87b4e615be764d149db9;
    stim[14] = 109'h10507cac028e8fb8387f827e2dc6;
    stim[15] = 109'h1a66235f305ea43d98a226577819;
    stim[16] = 109'h17716f25d8df186590b8aa29c03e;
    stim[17] = 109'h1ae85f4863e6d15cddcd1b613be9;
    stim[18] = 109'h1cc10479caed40c6a1cd4960b138;
    stim[19] = 109'h1031ec1f096a3163a13931a55b0b;
    stim[20] = 109'h1ff34e7dc5763ea06009de7b32ea;
    stim[21] = 109'h12d6d0bbdf103db4b9237ed515fe;
    stim[22] = 109'h1d6aa984fef9a3cce81c7e7607b5;
    stim[23] = 109'h19762b2eec42d599ddc5a95c4e57;
    stim[24] = 109'h1ce995388faedb104cfb6fbac9d0;
    stim[25] = 109'h118353aeb25ad41829d29746cefb;
    stim[26] = 109'h10b4c8396e982b816042ce740db2;
    stim[27] = 109'h1ab3ef0b61e33b39010c75771b04;
    stim[28] = 109'h168ab67083ddcd2e8b58e31fca5c;
    stim[29] = 109'h1d1577b9c98937628776fad2ee2b;
    stim[30] = 109'h19aeb6db781405f5e2402de805f1;
    stim[31] = 109'h1845491f17f4cb77d03af3b1a7d0;
    stim[32] = 109'h11e0e6a29c10eb6dc0020184fcfd;
    stim[33] = 109'h1938394d5de231c2b1963978a065;
    stim[34] = 109'h1997d298b97301840b1a34180b66;
    stim[35] = 109'h13dd06ff0f1d159f5fa8a380e5d6;
    stim[36] = 109'h13e2def8b6fd71859e3afaf7db26;
    stim[37] = 109'h1628830c6fc86e17323871283fc5;
    stim[38] = 109'h1f6b3efbdbefdc4e2463c9457151;
    stim[39] = 109'h121b7f8dadbfd8179513f21da4be;
    stim[40] = 109'h15443c4e9d4036d7fd6ce77b464d;
    stim[41] = 109'h14e391c48beaef09192e2a9ca662;
    stim[42] = 109'h060da3df40d66667ba8369822f7b;
    stim[43] = 109'h1392eb613ff49f20e7fc07064430;
    stim[44] = 109'h1078dce01ceda1fd1d3336202bd5;
    stim[45] = 109'h1898b095a8e3a9c585782f4a1dd7;
    stim[46] = 109'h1177292077bd72c42889922495f8;
    stim[47] = 109'h116fac74fae246e19e4f8c703609;
    stim[48] = 109'h133f0392cabb1b139a545f5ea903;
    stim[49] = 109'h1f200dd904c4f23bb1023769e801;
    stim[50] = 109'h1e88c3b31c4bd99189f2ee61e7b7;
    stim[51] = 109'h178ef8112daa0c12d242f46be86d;
    stim[52] = 109'h1b8a620a7e3ef8647c44a51034aa;
    stim[53] = 109'h13b799063add3be8e2897ee95567;
    stim[54] = 109'h19ebdcc35a713fed7c1300779b53;
    stim[55] = 109'h1a90b59a21fb04119a69aa9369ba;
    stim[56] = 109'h12b145585a5e442769e8fdd77924;
    stim[57] = 109'h11f11e352a39f20b726598f08759;
    stim[58] = 109'h1c6e69131afb88ebfb9313dc958f;
    stim[59] = 109'h15ae337914690248253cc18d5e9c;
    stim[60] = 109'h15009b74b1fd142604c68cf14ca6;
    stim[61] = 109'h16eb2da2836348d26868f4c14932;
    stim[62] = 109'h1cf5071b4d937a3ed11ad2b5f2c8;
    stim[63] = 109'h1b54acb91e1a7a6482875d831bf7;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
