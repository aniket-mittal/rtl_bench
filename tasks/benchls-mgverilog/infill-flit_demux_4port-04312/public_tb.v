// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 76;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04312 dut (
    .flit(in_vec[20:5]),
    .ctrl(in_vec[4:3]),
    .en_dest_fifo(in_vec[2:2]),
    .dest_fifo(in_vec[1:0]),
    .flit2pass_req(out_vec[75:60]),
    .ctrl2pass_req(out_vec[59:58]),
    .flit2pass_rep(out_vec[57:42]),
    .ctrl2pass_rep(out_vec[41:40]),
    .flit2local_in_req(out_vec[39:24]),
    .ctrl2local_in_req(out_vec[23:22]),
    .flit2local_in_rep(out_vec[21:6]),
    .ctrl2local_in_rep(out_vec[5:4]),
    .en_pass_req(out_vec[3:3]),
    .en_pass_rep(out_vec[2:2]),
    .en_local_in_req(out_vec[1:1]),
    .en_local_in_rep(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h189bac;
    stim[1] = 21'h032438;
    stim[2] = 21'h1830b0;
    stim[3] = 21'h194075;
    stim[4] = 21'h19a7da;
    stim[5] = 21'h0d9a4b;
    stim[6] = 21'h05dce8;
    stim[7] = 21'h1845dd;
    stim[8] = 21'h182175;
    stim[9] = 21'h07257a;
    stim[10] = 21'h0f90c4;
    stim[11] = 21'h0c6cb8;
    stim[12] = 21'h1a8e01;
    stim[13] = 21'h0c788c;
    stim[14] = 21'h001c51;
    stim[15] = 21'h1dd92b;
    stim[16] = 21'h0b987c;
    stim[17] = 21'h00ac7a;
    stim[18] = 21'h01ccfa;
    stim[19] = 21'h16dcfc;
    stim[20] = 21'h0914ed;
    stim[21] = 21'h1e292a;
    stim[22] = 21'h044953;
    stim[23] = 21'h02c941;
    stim[24] = 21'h05f820;
    stim[25] = 21'h0612ca;
    stim[26] = 21'h13d9e9;
    stim[27] = 21'h081877;
    stim[28] = 21'h1b038b;
    stim[29] = 21'h19ce8f;
    stim[30] = 21'h0efd67;
    stim[31] = 21'h175dfe;
    stim[32] = 21'h05b292;
    stim[33] = 21'h178b01;
    stim[34] = 21'h123c9b;
    stim[35] = 21'h18c442;
    stim[36] = 21'h1073b7;
    stim[37] = 21'h122f76;
    stim[38] = 21'h1460b9;
    stim[39] = 21'h08304d;
    stim[40] = 21'h18e186;
    stim[41] = 21'h14e4ff;
    stim[42] = 21'h00675c;
    stim[43] = 21'h1010db;
    stim[44] = 21'h1704d8;
    stim[45] = 21'h14949b;
    stim[46] = 21'h0280c0;
    stim[47] = 21'h14f513;
    stim[48] = 21'h0a22b9;
    stim[49] = 21'h13e221;
    stim[50] = 21'h13fb5b;
    stim[51] = 21'h198b98;
    stim[52] = 21'h04de15;
    stim[53] = 21'h0ddf4a;
    stim[54] = 21'h14a9c0;
    stim[55] = 21'h1d5501;
    stim[56] = 21'h1f75a1;
    stim[57] = 21'h095bdb;
    stim[58] = 21'h063b59;
    stim[59] = 21'h0f55a6;
    stim[60] = 21'h1831a5;
    stim[61] = 21'h1f205f;
    stim[62] = 21'h166e40;
    stim[63] = 21'h1a6f10;
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
      expv[0] = 76'hc4dd71375c4dd713758;
      expv[1] = 76'h1921c64871921c64870;
      expv[2] = 76'hc185b0616c185b06160;
      expv[3] = 76'hca03b280eca03b280e4;
      expv[4] = 76'hcd3ef34fbcd3ef34fb0;
      expv[5] = 76'h6cd25b3496cd25b3490;
      expv[6] = 76'h2ee74bb9d2ee74bb9d0;
      expv[7] = 76'hc22ef08bbc22ef08bb4;
      expv[8] = 76'hc10bb042ec10bb042e4;
      expv[9] = 76'h392bce4af392bce4af0;
      expv[10] = 76'h7c861f2187c861f2188;
      expv[11] = 76'h6365d8d976365d8d970;
      expv[12] = 76'hd470351c0d470351c00;
      expv[13] = 76'h63c458f1163c458f118;
      expv[14] = 76'h00e28038a00e28038a0;
      expv[15] = 76'heec97bb25eec97bb250;
      expv[16] = 76'h5cc3d730f5cc3d730f8;
      expv[17] = 76'h0563c158f0563c158f0;
      expv[18] = 76'h0e67c399f0e67c399f0;
      expv[19] = 76'hb6e7edb9fb6e7edb9f8;
      expv[20] = 76'h48a75229d48a75229d4;
      expv[21] = 76'hf1497c525f1497c5250;
      expv[22] = 76'h224a8892a224a8892a0;
      expv[23] = 76'h164a05928164a059280;
      expv[24] = 76'h2fc10bf042fc10bf040;
      expv[25] = 76'h30964c25930964c2590;
      expv[26] = 76'h9ecf67b3d9ecf67b3d0;
      expv[27] = 76'h40c39030e40c39030e1;
      expv[28] = 76'hd81c76071d81c760710;
      expv[29] = 76'hce74739d1ce74739d11;
      expv[30] = 76'h77eb1dfac77eb1dfac1;
      expv[31] = 76'hbaefeebbfbaefeebbf2;
      expv[32] = 76'h2d948b6522d948b6520;
      expv[33] = 76'hbc582f160bc582f1600;
      expv[34] = 76'h91e4e479391e4e47930;
      expv[35] = 76'hc62231888c622318880;
      expv[36] = 76'h839da0e76839da0e761;
      expv[37] = 76'h917ba45ee917ba45ee2;
      expv[38] = 76'ha305e8c17a305e8c170;
      expv[39] = 76'h4182506094182506094;
      expv[40] = 76'hc70c31c30c70c31c302;
      expv[41] = 76'ha727e9c9fa727e9c9f1;
      expv[42] = 76'h033ac0ceb033ac0ceb8;
      expv[43] = 76'h8086e021b8086e021b0;
      expv[44] = 76'hb826ee09bb826ee09b0;
      expv[45] = 76'ha4a4e9293a4a4e92930;
      expv[46] = 76'h1406050181406050180;
      expv[47] = 76'ha7a8a9ea2a7a8a9ea20;
      expv[48] = 76'h5115d44575115d44570;
      expv[49] = 76'h9f1127c449f1127c440;
      expv[50] = 76'h9fdae7f6b9fdae7f6b0;
      expv[51] = 76'hcc5cf3173cc5cf31730;
      expv[52] = 76'h26f089bc226f089bc24;
      expv[53] = 76'h6efa5bbe96efa5bbe90;
      expv[54] = 76'ha54e29538a54e295380;
      expv[55] = 76'heaa83aaa0eaa83aaa00;
      expv[56] = 76'hfbad3eeb4fbad3eeb40;
      expv[57] = 76'h4aded2b7b4aded2b7b0;
      expv[58] = 76'h31dacc76b31dacc76b0;
      expv[59] = 76'h7aad1eab47aad1eab42;
      expv[60] = 76'hc18d30634c18d306344;
      expv[61] = 76'hf902fe40bf902fe40b1;
      expv[62] = 76'hb3722cdc8b3722cdc80;
      expv[63] = 76'hd378b4de2d378b4de20;
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
