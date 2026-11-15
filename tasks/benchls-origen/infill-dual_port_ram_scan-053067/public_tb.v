// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053067 dut (
    .clock(clk),
    .reset(in_vec[51:51]),
    .readEnable(in_vec[50:50]),
    .readAddress(in_vec[49:42]),
    .writeEnable(in_vec[41:41]),
    .writeAddress(in_vec[40:33]),
    .writeData(in_vec[32:1]),
    .scan(in_vec[0:0]),
    .readData(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h8eb0e4bef1ef7;
    stim[1] = 52'h856499409d72e;
    stim[2] = 52'h1664a4d10b6d8;
    stim[3] = 52'h3e426377988a9;
    stim[4] = 52'h0fb71c3d06309;
    stim[5] = 52'h1764928e48f01;
    stim[6] = 52'h0bfe2dfa50f7e;
    stim[7] = 52'h74e860348c862;
    stim[8] = 52'h28daac59b4b29;
    stim[9] = 52'h113b9b3f0f41b;
    stim[10] = 52'h3293804c5c522;
    stim[11] = 52'h21dc503a1be1c;
    stim[12] = 52'h5ab2d4179ae0c;
    stim[13] = 52'h715e6d5ea8d37;
    stim[14] = 52'h51e4d835787fd;
    stim[15] = 52'h5b40d1d517742;
    stim[16] = 52'h4423683b5f87d;
    stim[17] = 52'h00758ec91dd8b;
    stim[18] = 52'h288609c83c610;
    stim[19] = 52'h76e740f10cb98;
    stim[20] = 52'h4727f0fa75caf;
    stim[21] = 52'h1a0bd9dcef91e;
    stim[22] = 52'h5fc37ab105906;
    stim[23] = 52'h5a6891a3bc3d7;
    stim[24] = 52'h57fd4d9512067;
    stim[25] = 52'h0c8f7d809864d;
    stim[26] = 52'h605c233e20092;
    stim[27] = 52'h0600ed4d8ec2a;
    stim[28] = 52'h5a64055d57192;
    stim[29] = 52'h65515790d009f;
    stim[30] = 52'h1964015f88833;
    stim[31] = 52'h598d926f06220;
    stim[32] = 52'hce33b27ec2f39;
    stim[33] = 52'h6a8e0735b81b8;
    stim[34] = 52'h6763756bf36c8;
    stim[35] = 52'h6a8411cec225e;
    stim[36] = 52'h55f92758b6735;
    stim[37] = 52'h850186301400b;
    stim[38] = 52'h3c6c90f3c8605;
    stim[39] = 52'h365aedf269bda;
    stim[40] = 52'h6b707ff69a4ea;
    stim[41] = 52'h32bfc5765076d;
    stim[42] = 52'h5f0b6087541d7;
    stim[43] = 52'h016e27337d9fa;
    stim[44] = 52'h67a26db1bc59b;
    stim[45] = 52'h7081545264eef;
    stim[46] = 52'h2e9f2be99b5a5;
    stim[47] = 52'h1f26c72ca9045;
    stim[48] = 52'h000edc8ac6124;
    stim[49] = 52'h70564749bc78e;
    stim[50] = 52'h046fa366116e1;
    stim[51] = 52'h5b753cb087ea2;
    stim[52] = 52'h76872986d83a8;
    stim[53] = 52'h7d0df5788b747;
    stim[54] = 52'h11ba52035c9d4;
    stim[55] = 52'h43b1b492d92b3;
    stim[56] = 52'h7de565607686a;
    stim[57] = 52'h5f69673cbb8ec;
    stim[58] = 52'h44433d37d0993;
    stim[59] = 52'h7447f80f8dedb;
    stim[60] = 52'h5e1b002e1be3d;
    stim[61] = 52'h63267815b8865;
    stim[62] = 52'h5e65da8658849;
    stim[63] = 52'h5ffd8d97ab37f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'h00000000;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'h00000000;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'h00000000;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'h00000000;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'h93f6179c;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'h00000000;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'h00000000;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'h00000000;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'h00000000;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'h1b308b70;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
