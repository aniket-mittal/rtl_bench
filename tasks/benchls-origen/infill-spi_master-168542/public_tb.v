// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168542 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .send(in_vec[18:18]),
    .receive(in_vec[17:17]),
    .din(in_vec[16:9]),
    .din_nonsend(in_vec[8:1]),
    .miso(in_vec[0:0]),
    .dout(out_vec[12:5]),
    .rvld(out_vec[4:4]),
    .idle(out_vec[3:3]),
    .sclk(out_vec[2:2]),
    .mosi(out_vec[1:1]),
    .cs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb2cd2;
    stim[1] = 20'h813b1;
    stim[2] = 20'h44d37;
    stim[3] = 20'h029d5;
    stim[4] = 20'h0a8ef;
    stim[5] = 20'h5c34d;
    stim[6] = 20'h0adc2;
    stim[7] = 20'h13d4d;
    stim[8] = 20'h6ed0c;
    stim[9] = 20'h0333c;
    stim[10] = 20'h618cd;
    stim[11] = 20'h525f8;
    stim[12] = 20'h310f6;
    stim[13] = 20'h69d6b;
    stim[14] = 20'h656d0;
    stim[15] = 20'h7c71b;
    stim[16] = 20'h2f66c;
    stim[17] = 20'h6053c;
    stim[18] = 20'h216fe;
    stim[19] = 20'h0add3;
    stim[20] = 20'h1d004;
    stim[21] = 20'h7eba5;
    stim[22] = 20'h74962;
    stim[23] = 20'h00588;
    stim[24] = 20'h23fe2;
    stim[25] = 20'h1b2f8;
    stim[26] = 20'h1bb4e;
    stim[27] = 20'h2e4d6;
    stim[28] = 20'h0562b;
    stim[29] = 20'h06384;
    stim[30] = 20'h44f0d;
    stim[31] = 20'h58d11;
    stim[32] = 20'h2e9c9;
    stim[33] = 20'h2bf2f;
    stim[34] = 20'h4c05e;
    stim[35] = 20'h14c54;
    stim[36] = 20'h6ad40;
    stim[37] = 20'h08fec;
    stim[38] = 20'h39cfc;
    stim[39] = 20'h159b0;
    stim[40] = 20'h0efa9;
    stim[41] = 20'h15746;
    stim[42] = 20'h0a1de;
    stim[43] = 20'h2a41d;
    stim[44] = 20'h1f3f8;
    stim[45] = 20'h3f6e6;
    stim[46] = 20'h33111;
    stim[47] = 20'h2de24;
    stim[48] = 20'h67fc7;
    stim[49] = 20'h6f266;
    stim[50] = 20'h6d90c;
    stim[51] = 20'h51c8b;
    stim[52] = 20'h5d17d;
    stim[53] = 20'h13e2c;
    stim[54] = 20'h5a1fa;
    stim[55] = 20'h0ac2d;
    stim[56] = 20'h60140;
    stim[57] = 20'h6ade6;
    stim[58] = 20'h22221;
    stim[59] = 20'h155bc;
    stim[60] = 20'h785c6;
    stim[61] = 20'h1f890;
    stim[62] = 20'h55a1f;
    stim[63] = 20'h259fa;
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
      expv[0] = 13'h0008;
      expv[1] = 13'h0008;
      expv[2] = 13'h0008;
      expv[3] = 13'h0009;
      expv[4] = 13'h0025;
      expv[5] = 13'h0061;
      expv[6] = 13'h00e7;
      expv[7] = 13'h01c1;
      expv[8] = 13'h03a5;
      expv[9] = 13'h0743;
      expv[10] = 13'h0e87;
      expv[11] = 13'h1d21;
      expv[12] = 13'h1d38;
      expv[13] = 13'h0009;
      expv[14] = 13'h0025;
      expv[15] = 13'h0041;
      expv[16] = 13'h00a7;
      expv[17] = 13'h0141;
      expv[18] = 13'h0285;
      expv[19] = 13'h0503;
      expv[20] = 13'h0a27;
      expv[21] = 13'h1441;
      expv[22] = 13'h1458;
      expv[23] = 13'h1449;
      expv[24] = 13'h0887;
      expv[25] = 13'h1101;
      expv[26] = 13'h0207;
      expv[27] = 13'h0401;
      expv[28] = 13'h0805;
      expv[29] = 13'h1023;
      expv[30] = 13'h0045;
      expv[31] = 13'h00a1;
      expv[32] = 13'h00b8;
      expv[33] = 13'h0009;
      expv[34] = 13'h0027;
      expv[35] = 13'h0041;
      expv[36] = 13'h0087;
      expv[37] = 13'h0101;
      expv[38] = 13'h0205;
      expv[39] = 13'h0403;
      expv[40] = 13'h0805;
      expv[41] = 13'h1021;
      expv[42] = 13'h1038;
      expv[43] = 13'h1028;
      expv[44] = 13'h0009;
      expv[45] = 13'h0007;
      expv[46] = 13'h0003;
      expv[47] = 13'h0027;
      expv[48] = 13'h0041;
      expv[49] = 13'h00a7;
      expv[50] = 13'h0143;
      expv[51] = 13'h0287;
      expv[52] = 13'h0523;
      expv[53] = 13'h053a;
      expv[54] = 13'h0528;
      expv[55] = 13'h0529;
      expv[56] = 13'h0a67;
      expv[57] = 13'h14c3;
      expv[58] = 13'h0985;
      expv[59] = 13'h1323;
      expv[60] = 13'h0645;
      expv[61] = 13'h0c81;
      expv[62] = 13'h1905;
      expv[63] = 13'h1221;
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
