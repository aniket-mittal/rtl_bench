// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03010 dut (
    .clk_sys(clk),
    .rst(in_vec[35:35]),
    .address(in_vec[34:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .ao486_rst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hffb818cf1;
    stim[1] = 36'ha06eda600;
    stim[2] = 36'h1a1eb271b;
    stim[3] = 36'h7e51a5c77;
    stim[4] = 36'h0a37bb728;
    stim[5] = 36'h52a6f732b;
    stim[6] = 36'h17161ffcb;
    stim[7] = 36'h054b6733f;
    stim[8] = 36'h4c6d4bac5;
    stim[9] = 36'h5ffd118fd;
    stim[10] = 36'h247e17d9f;
    stim[11] = 36'h3202674c7;
    stim[12] = 36'h59292bb65;
    stim[13] = 36'h444111605;
    stim[14] = 36'h43c327229;
    stim[15] = 36'h184769e25;
    stim[16] = 36'h1c6d536bb;
    stim[17] = 36'h5dcd5c516;
    stim[18] = 36'h391e10c04;
    stim[19] = 36'h19d4bfc11;
    stim[20] = 36'h5099963a0;
    stim[21] = 36'h3b193f801;
    stim[22] = 36'h4a0749724;
    stim[23] = 36'h709a0ceaa;
    stim[24] = 36'h72b498b7f;
    stim[25] = 36'h4d92b76e2;
    stim[26] = 36'h3fc27c6a2;
    stim[27] = 36'h1d593fde8;
    stim[28] = 36'h093f7271e;
    stim[29] = 36'h65cde4be0;
    stim[30] = 36'h0bc6d82c0;
    stim[31] = 36'h2df11e006;
    stim[32] = 36'h9d43dd205;
    stim[33] = 36'h02e73a5d6;
    stim[34] = 36'h4b71eab07;
    stim[35] = 36'h69dab9917;
    stim[36] = 36'h6851332cf;
    stim[37] = 36'h2581c6ef7;
    stim[38] = 36'h3ac4c6c24;
    stim[39] = 36'h6f49ec6bb;
    stim[40] = 36'h5f4134bd6;
    stim[41] = 36'h4eed6cfeb;
    stim[42] = 36'h7f8113dd7;
    stim[43] = 36'h2d42ae7df;
    stim[44] = 36'h305ec8bad;
    stim[45] = 36'h4956b545f;
    stim[46] = 36'h5bb273b35;
    stim[47] = 36'h5e76850d0;
    stim[48] = 36'h66ba1577f;
    stim[49] = 36'hafe177104;
    stim[50] = 36'h7cd519eb5;
    stim[51] = 36'h590111645;
    stim[52] = 36'h02039e8a1;
    stim[53] = 36'h3314ae4bb;
    stim[54] = 36'h113228013;
    stim[55] = 36'h7188b2988;
    stim[56] = 36'h56bdc4019;
    stim[57] = 36'h5bfe63468;
    stim[58] = 36'h536f3284c;
    stim[59] = 36'h782a65867;
    stim[60] = 36'h011ef271a;
    stim[61] = 36'h6ef61b4cd;
    stim[62] = 36'h6bf10a5f3;
    stim[63] = 36'h046b10b96;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
