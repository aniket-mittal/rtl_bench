// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09348 dut (
    .clk(clk),
    .reset(in_vec[27:27]),
    .LD_KBSR(in_vec[26:26]),
    .RD_KBDR(in_vec[25:25]),
    .DATA(in_vec[24:9]),
    .I_char(in_vec[8:1]),
    .LD_char(in_vec[0:0]),
    .KBDR(out_vec[32:17]),
    .KBSR(out_vec[16:1]),
    .KB_INT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hb5bf0f6;
    stim[1] = 28'h9a6f960;
    stim[2] = 28'h1cc6b82;
    stim[3] = 28'h146d071;
    stim[4] = 28'h3246b29;
    stim[5] = 28'h50af6e3;
    stim[6] = 28'h4cee595;
    stim[7] = 28'h52426eb;
    stim[8] = 28'h5efddaf;
    stim[9] = 28'h0b074c5;
    stim[10] = 28'h34b71f5;
    stim[11] = 28'h75d5584;
    stim[12] = 28'h7d7d55a;
    stim[13] = 28'h48532a6;
    stim[14] = 28'h794e9c0;
    stim[15] = 28'h1556ea3;
    stim[16] = 28'h374a008;
    stim[17] = 28'h201e5b0;
    stim[18] = 28'h7457d18;
    stim[19] = 28'h7785ec6;
    stim[20] = 28'h123e7e5;
    stim[21] = 28'h5f200c9;
    stim[22] = 28'h7d08096;
    stim[23] = 28'h4180fdf;
    stim[24] = 28'h7d10778;
    stim[25] = 28'h3099a73;
    stim[26] = 28'h11b215b;
    stim[27] = 28'h3e8e68b;
    stim[28] = 28'h514a367;
    stim[29] = 28'h1afbee2;
    stim[30] = 28'h754ac0b;
    stim[31] = 28'h3d38b50;
    stim[32] = 28'h7b1fc85;
    stim[33] = 28'h0e3a867;
    stim[34] = 28'h037065e;
    stim[35] = 28'h1b71f80;
    stim[36] = 28'h0a7964e;
    stim[37] = 28'h6ca8b07;
    stim[38] = 28'h15e1b58;
    stim[39] = 28'h054d13e;
    stim[40] = 28'h468b545;
    stim[41] = 28'h3107c80;
    stim[42] = 28'h6ec7633;
    stim[43] = 28'h30443f0;
    stim[44] = 28'h4fc0361;
    stim[45] = 28'h6cc610b;
    stim[46] = 28'h5ec07a9;
    stim[47] = 28'h168075c;
    stim[48] = 28'h0092a97;
    stim[49] = 28'h0d8ac02;
    stim[50] = 28'h5bcc04d;
    stim[51] = 28'h2cac25e;
    stim[52] = 28'h7f4c9f9;
    stim[53] = 28'h77a0ab4;
    stim[54] = 28'h5c1438a;
    stim[55] = 28'h7eac115;
    stim[56] = 28'h0abb073;
    stim[57] = 28'h3774e5f;
    stim[58] = 28'h2f5e215;
    stim[59] = 28'h0b36db2;
    stim[60] = 28'h362c0db;
    stim[61] = 28'h7611b22;
    stim[62] = 28'h0cb67cc;
    stim[63] = 28'h5ef962e;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000710000;
      expv[5] = 33'h001290000;
      expv[6] = 33'h000e30af6;
      expv[7] = 33'h00195cee5;
      expv[8] = 33'h000eb2426;
      expv[9] = 33'h001afefdd;
      expv[10] = 33'h000c5efdd;
      expv[11] = 33'h001f5efdd;
      expv[12] = 33'h001f45d54;
      expv[13] = 33'h001f4d7d4;
      expv[14] = 33'h001f48532;
      expv[15] = 33'h001f494e8;
      expv[16] = 33'h000a394e9;
      expv[17] = 33'h000a294e8;
      expv[18] = 33'h000a294e8;
      expv[19] = 33'h000a2457c;
      expv[20] = 33'h000a2785e;
      expv[21] = 33'h001e5785e;
      expv[22] = 33'h000c9f201;
      expv[23] = 33'h000c8d080;
      expv[24] = 33'h001df180e;
      expv[25] = 33'h001ded106;
      expv[26] = 33'h00073d107;
      expv[27] = 33'h0015bd107;
      expv[28] = 33'h0008bd107;
      expv[29] = 33'h0016714a2;
      expv[30] = 33'h0016714a2;
      expv[31] = 33'h0000b54ac;
      expv[32] = 33'h0000a54ac;
      expv[33] = 33'h00085b1fd;
      expv[34] = 33'h00067b1fd;
      expv[35] = 33'h00067b1fd;
      expv[36] = 33'h00067b1fd;
      expv[37] = 33'h00067b1fd;
      expv[38] = 33'h00107ca8b;
      expv[39] = 33'h00107ca8b;
      expv[40] = 33'h00107ca8b;
      expv[41] = 33'h0014568b4;
      expv[42] = 33'h0014468b4;
      expv[43] = 33'h00033ec77;
      expv[44] = 33'h00032ec76;
      expv[45] = 33'h00161fc03;
      expv[46] = 33'h0010bcc61;
      expv[47] = 33'h001a9ec07;
      expv[48] = 33'h001a9ec07;
      expv[49] = 33'h00097ec07;
      expv[50] = 33'h00097ec07;
      expv[51] = 33'h0004dbcc1;
      expv[52] = 33'h0004cbcc0;
      expv[53] = 33'h001f9f4c9;
      expv[54] = 33'h001f87a0a;
      expv[55] = 33'h001f8c142;
      expv[56] = 33'h00115eac1;
      expv[57] = 33'h00073eac1;
      expv[58] = 33'h0005feac1;
      expv[59] = 33'h00015eac1;
      expv[60] = 33'h00015eac1;
      expv[61] = 33'h000dbeac1;
      expv[62] = 33'h000da611a;
      expv[63] = 33'h000da611a;
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
