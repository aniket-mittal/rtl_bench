// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109092 dut (
    .clk(clk),
    .resetN(in_vec[8:8]),
    .startOfFrame(in_vec[7:7]),
    .playerDR(in_vec[6:6]),
    .missileDR(in_vec[5:5]),
    .aliensDR(in_vec[4:4]),
    .bombDR(in_vec[3:3]),
    .shipDR(in_vec[2:2]),
    .shieldsDR(in_vec[1:1]),
    .kavDR(in_vec[0:0]),
    .collision_aliens_missile(out_vec[6:6]),
    .SingleHitPulse(out_vec[5:5]),
    .collision_bomb_player(out_vec[4:4]),
    .collision_ship_missile(out_vec[3:3]),
    .collision_shields_missile(out_vec[2:2]),
    .collision_shields_bomb(out_vec[1:1]),
    .gameover(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h007;
    stim[1] = 9'h09f;
    stim[2] = 9'h0af;
    stim[3] = 9'h188;
    stim[4] = 9'h0fe;
    stim[5] = 9'h118;
    stim[6] = 9'h137;
    stim[7] = 9'h1e0;
    stim[8] = 9'h175;
    stim[9] = 9'h16f;
    stim[10] = 9'h16e;
    stim[11] = 9'h1a9;
    stim[12] = 9'h180;
    stim[13] = 9'h149;
    stim[14] = 9'h11c;
    stim[15] = 9'h15a;
    stim[16] = 9'h11f;
    stim[17] = 9'h1d6;
    stim[18] = 9'h149;
    stim[19] = 9'h118;
    stim[20] = 9'h177;
    stim[21] = 9'h166;
    stim[22] = 9'h1f4;
    stim[23] = 9'h1c9;
    stim[24] = 9'h1b6;
    stim[25] = 9'h1fd;
    stim[26] = 9'h1dc;
    stim[27] = 9'h173;
    stim[28] = 9'h1f8;
    stim[29] = 9'h1fd;
    stim[30] = 9'h12e;
    stim[31] = 9'h104;
    stim[32] = 9'h1b9;
    stim[33] = 9'h09f;
    stim[34] = 9'h1ad;
    stim[35] = 9'h155;
    stim[36] = 9'h1ec;
    stim[37] = 9'h1f3;
    stim[38] = 9'h1e7;
    stim[39] = 9'h117;
    stim[40] = 9'h1d7;
    stim[41] = 9'h1d4;
    stim[42] = 9'h13d;
    stim[43] = 9'h162;
    stim[44] = 9'h172;
    stim[45] = 9'h14c;
    stim[46] = 9'h16f;
    stim[47] = 9'h179;
    stim[48] = 9'h1ed;
    stim[49] = 9'h1de;
    stim[50] = 9'h12d;
    stim[51] = 9'h1ae;
    stim[52] = 9'h18e;
    stim[53] = 9'h1ea;
    stim[54] = 9'h15f;
    stim[55] = 9'h14e;
    stim[56] = 9'h0b3;
    stim[57] = 9'h162;
    stim[58] = 9'h1eb;
    stim[59] = 9'h1f9;
    stim[60] = 9'h18b;
    stim[61] = 9'h1d1;
    stim[62] = 9'h199;
    stim[63] = 9'h1ed;
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
      expv[0] = 7'h00;
      expv[1] = 7'h03;
      expv[2] = 7'h0e;
      expv[3] = 7'h00;
      expv[4] = 7'h5e;
      expv[5] = 7'h00;
      expv[6] = 7'h4d;
      expv[7] = 7'h20;
      expv[8] = 7'h49;
      expv[9] = 7'h3e;
      expv[10] = 7'h1e;
      expv[11] = 7'h00;
      expv[12] = 7'h00;
      expv[13] = 7'h10;
      expv[14] = 7'h20;
      expv[15] = 7'h12;
      expv[16] = 7'h03;
      expv[17] = 7'h00;
      expv[18] = 7'h10;
      expv[19] = 7'h20;
      expv[20] = 7'h4d;
      expv[21] = 7'h0c;
      expv[22] = 7'h48;
      expv[23] = 7'h10;
      expv[24] = 7'h6c;
      expv[25] = 7'h59;
      expv[26] = 7'h30;
      expv[27] = 7'h45;
      expv[28] = 7'h70;
      expv[29] = 7'h59;
      expv[30] = 7'h2e;
      expv[31] = 7'h00;
      expv[32] = 7'h41;
      expv[33] = 7'h03;
      expv[34] = 7'h08;
      expv[35] = 7'h21;
      expv[36] = 7'h18;
      expv[37] = 7'h45;
      expv[38] = 7'h2c;
      expv[39] = 7'h01;
      expv[40] = 7'h01;
      expv[41] = 7'h00;
      expv[42] = 7'h49;
      expv[43] = 7'h24;
      expv[44] = 7'h44;
      expv[45] = 7'h10;
      expv[46] = 7'h1e;
      expv[47] = 7'h51;
      expv[48] = 7'h18;
      expv[49] = 7'h12;
      expv[50] = 7'h28;
      expv[51] = 7'h0e;
      expv[52] = 7'h02;
      expv[53] = 7'h36;
      expv[54] = 7'h13;
      expv[55] = 7'h32;
      expv[56] = 7'h45;
      expv[57] = 7'h04;
      expv[58] = 7'h36;
      expv[59] = 7'h51;
      expv[60] = 7'h22;
      expv[61] = 7'h01;
      expv[62] = 7'h01;
      expv[63] = 7'h18;
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
