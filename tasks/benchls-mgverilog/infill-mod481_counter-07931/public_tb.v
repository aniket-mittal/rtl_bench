// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07931 dut (
    .CLK(clk),
    .CE(in_vec[17:17]),
    .process_input(in_vec[16:0]),
    .process_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1b755;
    stim[1] = 18'h3e36c;
    stim[2] = 18'h1b173;
    stim[3] = 18'h380aa;
    stim[4] = 18'h35732;
    stim[5] = 18'h2fedd;
    stim[6] = 18'h00806;
    stim[7] = 18'h2fab2;
    stim[8] = 18'h1ce13;
    stim[9] = 18'h19203;
    stim[10] = 18'h0f034;
    stim[11] = 18'h0d913;
    stim[12] = 18'h0af6e;
    stim[13] = 18'h395cc;
    stim[14] = 18'h2b184;
    stim[15] = 18'h027b3;
    stim[16] = 18'h13a19;
    stim[17] = 18'h206ef;
    stim[18] = 18'h3dcb1;
    stim[19] = 18'h3d6f9;
    stim[20] = 18'h1b446;
    stim[21] = 18'h1dd97;
    stim[22] = 18'h2226e;
    stim[23] = 18'h1b2ad;
    stim[24] = 18'h25340;
    stim[25] = 18'h0a017;
    stim[26] = 18'h21186;
    stim[27] = 18'h1cd67;
    stim[28] = 18'h3bd0b;
    stim[29] = 18'h22757;
    stim[30] = 18'h3aa48;
    stim[31] = 18'h119d1;
    stim[32] = 18'h3544e;
    stim[33] = 18'h073f6;
    stim[34] = 18'h0134b;
    stim[35] = 18'h03218;
    stim[36] = 18'h20097;
    stim[37] = 18'h22099;
    stim[38] = 18'h30c5f;
    stim[39] = 18'h3f297;
    stim[40] = 18'h16d3c;
    stim[41] = 18'h27841;
    stim[42] = 18'h14331;
    stim[43] = 18'h14a32;
    stim[44] = 18'h10ee0;
    stim[45] = 18'h207e8;
    stim[46] = 18'h2dc9d;
    stim[47] = 18'h08027;
    stim[48] = 18'h1b12e;
    stim[49] = 18'h071f4;
    stim[50] = 18'h2c165;
    stim[51] = 18'h2d698;
    stim[52] = 18'h1aa06;
    stim[53] = 18'h129bc;
    stim[54] = 18'h29714;
    stim[55] = 18'h1f529;
    stim[56] = 18'h127c1;
    stim[57] = 18'h27d5d;
    stim[58] = 18'h3d5cc;
    stim[59] = 18'h1847f;
    stim[60] = 18'h234e7;
    stim[61] = 18'h0602d;
    stim[62] = 18'h291aa;
    stim[63] = 18'h01510;
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
      expv[0] = 16'hb756;
      expv[1] = 16'he36d;
      expv[2] = 16'hb174;
      expv[3] = 16'h80ab;
      expv[4] = 16'h5733;
      expv[5] = 16'hfedd;
      expv[6] = 16'h0806;
      expv[7] = 16'hfab2;
      expv[8] = 16'hce14;
      expv[9] = 16'h9204;
      expv[10] = 16'hf034;
      expv[11] = 16'hd913;
      expv[12] = 16'haf6e;
      expv[13] = 16'h95cd;
      expv[14] = 16'hb184;
      expv[15] = 16'h27b3;
      expv[16] = 16'h3a1a;
      expv[17] = 16'h06ef;
      expv[18] = 16'hdcb2;
      expv[19] = 16'hd6fa;
      expv[20] = 16'hb447;
      expv[21] = 16'hdd98;
      expv[22] = 16'h226e;
      expv[23] = 16'hb2ae;
      expv[24] = 16'h5340;
      expv[25] = 16'ha017;
      expv[26] = 16'h1186;
      expv[27] = 16'hcd68;
      expv[28] = 16'hbd0c;
      expv[29] = 16'h2757;
      expv[30] = 16'haa49;
      expv[31] = 16'h19d2;
      expv[32] = 16'h544f;
      expv[33] = 16'h73f6;
      expv[34] = 16'h134b;
      expv[35] = 16'h3218;
      expv[36] = 16'h0097;
      expv[37] = 16'h2099;
      expv[38] = 16'h0c60;
      expv[39] = 16'hf298;
      expv[40] = 16'h6d3d;
      expv[41] = 16'h7841;
      expv[42] = 16'h4332;
      expv[43] = 16'h4a33;
      expv[44] = 16'h0ee1;
      expv[45] = 16'h07e8;
      expv[46] = 16'hdc9d;
      expv[47] = 16'h8027;
      expv[48] = 16'hb12f;
      expv[49] = 16'h71f4;
      expv[50] = 16'hc165;
      expv[51] = 16'hd698;
      expv[52] = 16'haa07;
      expv[53] = 16'h29bd;
      expv[54] = 16'h9714;
      expv[55] = 16'hf52a;
      expv[56] = 16'h27c2;
      expv[57] = 16'h7d5d;
      expv[58] = 16'hd5cd;
      expv[59] = 16'h8480;
      expv[60] = 16'h34e7;
      expv[61] = 16'h602d;
      expv[62] = 16'h91aa;
      expv[63] = 16'h1510;
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
