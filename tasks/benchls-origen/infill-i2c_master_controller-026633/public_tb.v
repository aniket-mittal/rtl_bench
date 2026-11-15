// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026633 dut (
    .clk(clk),
    .reset(in_vec[26:26]),
    .start(in_vec[25:25]),
    .reg_data(in_vec[24:9]),
    .dev_address(in_vec[8:1]),
    .sda_input(in_vec[0:0]),
    .i2c_sda(out_vec[13:13]),
    .i2c_scl(out_vec[12:12]),
    .finish(out_vec[11:11]),
    .state(out_vec[10:7]),
    .count(out_vec[6:3]),
    .command_index(out_vec[2:1]),
    .ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7c75815;
    stim[1] = 27'h7308a2c;
    stim[2] = 27'h25eca99;
    stim[3] = 27'h3d74404;
    stim[4] = 27'h31f7c0b;
    stim[5] = 27'h2b07165;
    stim[6] = 27'h239cece;
    stim[7] = 27'h1a52950;
    stim[8] = 27'h034c163;
    stim[9] = 27'h0298e52;
    stim[10] = 27'h3c0c8c5;
    stim[11] = 27'h1510643;
    stim[12] = 27'h0b322a0;
    stim[13] = 27'h011283f;
    stim[14] = 27'h0f39e42;
    stim[15] = 27'h031bc26;
    stim[16] = 27'h0e054e3;
    stim[17] = 27'h48d7cd5;
    stim[18] = 27'h01506db;
    stim[19] = 27'h1d1f415;
    stim[20] = 27'h2271453;
    stim[21] = 27'h22e2f73;
    stim[22] = 27'h1f917c4;
    stim[23] = 27'h10bd5df;
    stim[24] = 27'h04565e1;
    stim[25] = 27'h1767186;
    stim[26] = 27'h0179f5f;
    stim[27] = 27'h2f8bfbf;
    stim[28] = 27'h0b64827;
    stim[29] = 27'h326173b;
    stim[30] = 27'h3e0ed66;
    stim[31] = 27'h33262b9;
    stim[32] = 27'h1ed9a9f;
    stim[33] = 27'h07fd6c9;
    stim[34] = 27'h0337df9;
    stim[35] = 27'h0a7bfa6;
    stim[36] = 27'h085778d;
    stim[37] = 27'h3b053d6;
    stim[38] = 27'h34a3b0d;
    stim[39] = 27'h1a0841a;
    stim[40] = 27'h026c84a;
    stim[41] = 27'h352bdcd;
    stim[42] = 27'h23f3726;
    stim[43] = 27'h0806159;
    stim[44] = 27'h2bb2232;
    stim[45] = 27'h22f66f5;
    stim[46] = 27'h1e8bb06;
    stim[47] = 27'h3dfb869;
    stim[48] = 27'h01e905c;
    stim[49] = 27'h3a9a3e2;
    stim[50] = 27'h3bbd4fb;
    stim[51] = 27'h26831cc;
    stim[52] = 27'h32351bc;
    stim[53] = 27'h1d851bf;
    stim[54] = 27'h3b952ef;
    stim[55] = 27'h3e6d1da;
    stim[56] = 27'h0fd880a;
    stim[57] = 27'h3101f9a;
    stim[58] = 27'h0deb77b;
    stim[59] = 27'h06ab822;
    stim[60] = 27'h287ad7a;
    stim[61] = 27'h3bc9d97;
    stim[62] = 27'h3c7b65c;
    stim[63] = 27'h2a4f5fb;
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
      expv[0] = 14'h3000;
      expv[1] = 14'h3000;
      expv[2] = 14'h3000;
      expv[3] = 14'h3080;
      expv[4] = 14'h1100;
      expv[5] = 14'h01b8;
      expv[6] = 14'h0238;
      expv[7] = 14'h12b8;
      expv[8] = 14'h01b0;
      expv[9] = 14'h0230;
      expv[10] = 14'h12b0;
      expv[11] = 14'h01a8;
      expv[12] = 14'h0228;
      expv[13] = 14'h12a8;
      expv[14] = 14'h01a0;
      expv[15] = 14'h0220;
      expv[16] = 14'h12a0;
      expv[17] = 14'h3000;
      expv[18] = 14'h3000;
      expv[19] = 14'h3000;
      expv[20] = 14'h3000;
      expv[21] = 14'h3080;
      expv[22] = 14'h1100;
      expv[23] = 14'h01b8;
      expv[24] = 14'h2238;
      expv[25] = 14'h32b8;
      expv[26] = 14'h21b0;
      expv[27] = 14'h2230;
      expv[28] = 14'h32b0;
      expv[29] = 14'h21a8;
      expv[30] = 14'h2228;
      expv[31] = 14'h32a8;
      expv[32] = 14'h21a0;
      expv[33] = 14'h0220;
      expv[34] = 14'h12a0;
      expv[35] = 14'h0198;
      expv[36] = 14'h0218;
      expv[37] = 14'h1298;
      expv[38] = 14'h0190;
      expv[39] = 14'h0210;
      expv[40] = 14'h1290;
      expv[41] = 14'h0188;
      expv[42] = 14'h2208;
      expv[43] = 14'h3288;
      expv[44] = 14'h2180;
      expv[45] = 14'h0200;
      expv[46] = 14'h1280;
      expv[47] = 14'h2180;
      expv[48] = 14'h0200;
      expv[49] = 14'h1280;
      expv[50] = 14'h2180;
      expv[51] = 14'h0200;
      expv[52] = 14'h1280;
      expv[53] = 14'h2300;
      expv[54] = 14'h3380;
      expv[55] = 14'h1400;
      expv[56] = 14'h3480;
      expv[57] = 14'h3800;
      expv[58] = 14'h3880;
      expv[59] = 14'h1900;
      expv[60] = 14'h09b8;
      expv[61] = 14'h2a38;
      expv[62] = 14'h3ab8;
      expv[63] = 14'h29b0;
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
