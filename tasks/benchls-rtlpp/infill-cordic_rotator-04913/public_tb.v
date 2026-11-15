// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04913 dut (
    .clock(clk),
    .angle(in_vec[63:32]),
    .Xin(in_vec[31:16]),
    .Yin(in_vec[15:0]),
    .Xout(out_vec[33:17]),
    .Yout(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hf158677c6307a8bf;
    stim[1] = 64'hb0219f5ee626c804;
    stim[2] = 64'h3790021a667c109e;
    stim[3] = 64'h9602a96e0fa79d3e;
    stim[4] = 64'hb7b335e67a3145bb;
    stim[5] = 64'h0f69d89bc9ecf253;
    stim[6] = 64'h5f50a35a2ba94cb0;
    stim[7] = 64'he02ab844e269d242;
    stim[8] = 64'h9b541f5af5764e02;
    stim[9] = 64'h9b2e3980f5e8cdd6;
    stim[10] = 64'hff9b76a750edd684;
    stim[11] = 64'h6a9624f734c991ca;
    stim[12] = 64'h45c881ea13ad36e3;
    stim[13] = 64'h51b767014c81fb26;
    stim[14] = 64'h3b6a5895f2d4fd54;
    stim[15] = 64'h1e37b2b190a5fcdf;
    stim[16] = 64'h4c52ebf2e61fc151;
    stim[17] = 64'h444d42daadfbabc5;
    stim[18] = 64'h878bf6544708ded8;
    stim[19] = 64'h27ff163da8421d3d;
    stim[20] = 64'hfdf907946a74b4a8;
    stim[21] = 64'h120eccb05a596471;
    stim[22] = 64'h0634a2ed419ca2bf;
    stim[23] = 64'he22c2fdf83ea8610;
    stim[24] = 64'h93b4c9e802126461;
    stim[25] = 64'h41345b2be0ba38c2;
    stim[26] = 64'h9339c12949ecda4e;
    stim[27] = 64'hb3cead89240853e0;
    stim[28] = 64'h6894e7ede3901572;
    stim[29] = 64'he72ba0991ac8b457;
    stim[30] = 64'h28348ef95b09a997;
    stim[31] = 64'h2456a896a485d9df;
    stim[32] = 64'hfc6aff3fca841f36;
    stim[33] = 64'ha6408aae3f83ea4f;
    stim[34] = 64'hc15448f4b8b81363;
    stim[35] = 64'hddd208bddadb12ea;
    stim[36] = 64'hd7d3e7fb77b6cbd9;
    stim[37] = 64'heb5f4e90698615b9;
    stim[38] = 64'hf04f1b4230e48389;
    stim[39] = 64'h8e480089226ccd38;
    stim[40] = 64'hfe7616390513423f;
    stim[41] = 64'h451147c5394eeed3;
    stim[42] = 64'h84d54d4d080aabf5;
    stim[43] = 64'hfb2c038be2f5386c;
    stim[44] = 64'h71f3b6ecbfaeb266;
    stim[45] = 64'hb8997c322c1a0369;
    stim[46] = 64'h8e009ab27762dc78;
    stim[47] = 64'hd24b8f1b90a424e2;
    stim[48] = 64'h0cdb75f691cfdc00;
    stim[49] = 64'hd4032a5f9785ac80;
    stim[50] = 64'h593af933b0fddaf1;
    stim[51] = 64'h45e6433a3ed831f1;
    stim[52] = 64'h3f35334d9615f075;
    stim[53] = 64'h6cfd697c6eb4ddd0;
    stim[54] = 64'h7fc0b0df03bd0fc3;
    stim[55] = 64'h191d47a3fd0a2720;
    stim[56] = 64'h442a06f5f9240938;
    stim[57] = 64'ha2474ffa73952f51;
    stim[58] = 64'hb2c494df1fa78de0;
    stim[59] = 64'h9d98b1b6fae86c78;
    stim[60] = 64'h8ebaa89b1102cec9;
    stim[61] = 64'ha5889c71fdf70f62;
    stim[62] = 64'h1db37021f27d3b63;
    stim[63] = 64'he2d588fb0402e9d6;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'hxxxxxxxxx;
      expv[12] = 34'hxxxxxxxxx;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'hxxxxxxxxx;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'h0cc27401e;
      expv[17] = 34'h375c44a65;
      expv[18] = 34'h00fdaaaca;
      expv[19] = 34'h32c787e38;
      expv[20] = 34'h08f8523b4;
      expv[21] = 34'h36b21ca2f;
      expv[22] = 34'h2e67fdbe3;
      expv[23] = 34'h350b5ecd7;
      expv[24] = 34'h0bae7a629;
      expv[25] = 34'h3b3e84b2d;
      expv[26] = 34'h10931ba67;
      expv[27] = 34'h01fbec89c;
      expv[28] = 34'h343e0134d;
      expv[29] = 34'h3a45a75a1;
      expv[30] = 34'h003e3e9f2;
      expv[31] = 34'h2f8898054;
      expv[32] = 34'h0de7df60c;
      expv[33] = 34'h13053884f;
      expv[34] = 34'h305f2201c;
      expv[35] = 34'h30f5da2a2;
      expv[36] = 34'h151d37b5b;
      expv[37] = 34'h07ef0d53a;
      expv[38] = 34'h10433789b;
      expv[39] = 34'h1c0279e14;
      expv[40] = 34'h093af6c13;
      expv[41] = 34'h3482fc9c1;
      expv[42] = 34'h2eeb5fff3;
      expv[43] = 34'h0e4fd9e95;
      expv[44] = 34'h02839c8e5;
      expv[45] = 34'h3b9af8097;
      expv[46] = 34'h192c42e96;
      expv[47] = 34'h3a4896356;
      expv[48] = 34'h359883aef;
      expv[49] = 34'h34acdc0b3;
      expv[50] = 34'h038267660;
      expv[51] = 34'h3dc984250;
      expv[52] = 34'h04a672c39;
      expv[53] = 34'h152a5cb01;
      expv[54] = 34'h3fb4123cc;
      expv[55] = 34'h35c143b15;
      expv[56] = 34'h018ec6cb3;
      expv[57] = 34'h020b46125;
      expv[58] = 34'h3c4f487db;
      expv[59] = 34'h3b70061ea;
      expv[60] = 34'h11dc0547b;
      expv[61] = 34'h3f0c9b790;
      expv[62] = 34'h2665df4dc;
      expv[63] = 34'h3ce3abf92;
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
