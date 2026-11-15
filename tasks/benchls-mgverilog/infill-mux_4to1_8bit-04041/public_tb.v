// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04041 dut (
    .ch0(in_vec[33:26]),
    .ch1(in_vec[25:18]),
    .ch2(in_vec[17:10]),
    .ch3(in_vec[9:2]),
    .channel(in_vec[1:0]),
    .dataout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h31998557a;
    stim[1] = 34'h2ec48b32f;
    stim[2] = 34'h071ebf0ba;
    stim[3] = 34'h01e248609;
    stim[4] = 34'h13e07f3a6;
    stim[5] = 34'h01ce7b011;
    stim[6] = 34'h3aef818e6;
    stim[7] = 34'h293868658;
    stim[8] = 34'h18a9cedbf;
    stim[9] = 34'h13c9a3a7d;
    stim[10] = 34'h0f0cc1e06;
    stim[11] = 34'h1ae650076;
    stim[12] = 34'h10b509a89;
    stim[13] = 34'h3fb33594e;
    stim[14] = 34'h00740c520;
    stim[15] = 34'h3d329aa27;
    stim[16] = 34'h036295e96;
    stim[17] = 34'h2e36b17c4;
    stim[18] = 34'h32c59e4f3;
    stim[19] = 34'h21486f8b0;
    stim[20] = 34'h3e5ede39e;
    stim[21] = 34'h279d6a230;
    stim[22] = 34'h0ae8419f1;
    stim[23] = 34'h369d760e8;
    stim[24] = 34'h392bdc04b;
    stim[25] = 34'h0fee36153;
    stim[26] = 34'h2358ab2cf;
    stim[27] = 34'h176168d06;
    stim[28] = 34'h3cf9024ee;
    stim[29] = 34'h0ed966e27;
    stim[30] = 34'h167f72fc6;
    stim[31] = 34'h1934dc08c;
    stim[32] = 34'h264043fcc;
    stim[33] = 34'h379a09809;
    stim[34] = 34'h39fd70796;
    stim[35] = 34'h365d3fdcd;
    stim[36] = 34'h0ba9d54cf;
    stim[37] = 34'h0285e6192;
    stim[38] = 34'h29aa3b338;
    stim[39] = 34'h0354b231f;
    stim[40] = 34'h302f61a28;
    stim[41] = 34'h0d4091054;
    stim[42] = 34'h2e9062813;
    stim[43] = 34'h1f224e282;
    stim[44] = 34'h1f49f8de5;
    stim[45] = 34'h22cdb98d6;
    stim[46] = 34'h16411a495;
    stim[47] = 34'h35cdadf4b;
    stim[48] = 34'h3222bfe2b;
    stim[49] = 34'h1adce0c67;
    stim[50] = 34'h03344b30f;
    stim[51] = 34'h17d7b5e9a;
    stim[52] = 34'h159e6e743;
    stim[53] = 34'h25a621f95;
    stim[54] = 34'h361a4df51;
    stim[55] = 34'h29d943494;
    stim[56] = 34'h38bdc8214;
    stim[57] = 34'h353dcca6c;
    stim[58] = 34'h3a550d929;
    stim[59] = 34'h0e5420a53;
    stim[60] = 34'h38df4085a;
    stim[61] = 34'h12f710d95;
    stim[62] = 34'h227b16034;
    stim[63] = 34'h3a922f891;
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
      expv[0] = 8'h15;
      expv[1] = 8'hcb;
      expv[2] = 8'hfc;
      expv[3] = 8'h89;
      expv[4] = 8'hfc;
      expv[5] = 8'h39;
      expv[6] = 8'h06;
      expv[7] = 8'ha4;
      expv[8] = 8'h6f;
      expv[9] = 8'h26;
      expv[10] = 8'h07;
      expv[11] = 8'h40;
      expv[12] = 8'hd4;
      expv[13] = 8'hd6;
      expv[14] = 8'h01;
      expv[15] = 8'h89;
      expv[16] = 8'h57;
      expv[17] = 8'hb8;
      expv[18] = 8'h3c;
      expv[19] = 8'h85;
      expv[20] = 8'h78;
      expv[21] = 8'h9e;
      expv[22] = 8'ha1;
      expv[23] = 8'hda;
      expv[24] = 8'h12;
      expv[25] = 8'h54;
      expv[26] = 8'hb3;
      expv[27] = 8'ha3;
      expv[28] = 8'h09;
      expv[29] = 8'h89;
      expv[30] = 8'hcb;
      expv[31] = 8'h64;
      expv[32] = 8'h99;
      expv[33] = 8'h68;
      expv[34] = 8'hc1;
      expv[35] = 8'h74;
      expv[36] = 8'h33;
      expv[37] = 8'h98;
      expv[38] = 8'ha6;
      expv[39] = 8'hc7;
      expv[40] = 8'hc0;
      expv[41] = 8'h35;
      expv[42] = 8'h04;
      expv[43] = 8'h38;
      expv[44] = 8'h27;
      expv[45] = 8'he6;
      expv[46] = 8'h04;
      expv[47] = 8'hd2;
      expv[48] = 8'h8a;
      expv[49] = 8'h19;
      expv[50] = 8'hc3;
      expv[51] = 8'hd7;
      expv[52] = 8'hd0;
      expv[53] = 8'h98;
      expv[54] = 8'h69;
      expv[55] = 8'ha7;
      expv[56] = 8'he2;
      expv[57] = 8'hd4;
      expv[58] = 8'h54;
      expv[59] = 8'h94;
      expv[60] = 8'h02;
      expv[61] = 8'hdc;
      expv[62] = 8'h89;
      expv[63] = 8'h48;
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
