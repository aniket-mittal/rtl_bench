// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00041 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[38:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1d22946e51;
    stim[1] = 37'h0c2f154dbf;
    stim[2] = 37'h1b2ec1f3e2;
    stim[3] = 37'h12710f125c;
    stim[4] = 37'h13a06f232b;
    stim[5] = 37'h02a1f9a254;
    stim[6] = 37'h1a74030468;
    stim[7] = 37'h0e99c13fd8;
    stim[8] = 37'h0325f31b13;
    stim[9] = 37'h1fc3c6022a;
    stim[10] = 37'h0e146ad04e;
    stim[11] = 37'h0f6a543af1;
    stim[12] = 37'h026d4f5f1b;
    stim[13] = 37'h17a0d33d9f;
    stim[14] = 37'h1ed3e8999d;
    stim[15] = 37'h16c4bd57f8;
    stim[16] = 37'h1e5e16cabb;
    stim[17] = 37'h0e722b58ae;
    stim[18] = 37'h1f9a154db7;
    stim[19] = 37'h0a4e9d164d;
    stim[20] = 37'h125c8dbf0e;
    stim[21] = 37'h12f7b72701;
    stim[22] = 37'h17f7107caa;
    stim[23] = 37'h1e6c680e5e;
    stim[24] = 37'h1f56af1633;
    stim[25] = 37'h1f3eb9d962;
    stim[26] = 37'h17dd3a3452;
    stim[27] = 37'h171dfe2ac9;
    stim[28] = 37'h1613088e93;
    stim[29] = 37'h07ce4b7de8;
    stim[30] = 37'h1f7de504c1;
    stim[31] = 37'h02dcb80c99;
    stim[32] = 37'h0a71035604;
    stim[33] = 37'h1a78d93d26;
    stim[34] = 37'h0b98f6ecba;
    stim[35] = 37'h12dbf4d12e;
    stim[36] = 37'h1a00c5658b;
    stim[37] = 37'h16fece2115;
    stim[38] = 37'h173e11ad1e;
    stim[39] = 37'h035011e7f5;
    stim[40] = 37'h0bd6574197;
    stim[41] = 37'h0b363f8746;
    stim[42] = 37'h06f31312a7;
    stim[43] = 37'h1e55c8eaab;
    stim[44] = 37'h0afc0b85df;
    stim[45] = 37'h1b9546b85c;
    stim[46] = 37'h078cc0ed41;
    stim[47] = 37'h1a89f246b3;
    stim[48] = 37'h1c94588450;
    stim[49] = 37'h0ecfe27c19;
    stim[50] = 37'h1655f86e9c;
    stim[51] = 37'h062b9f433b;
    stim[52] = 37'h08006f810f;
    stim[53] = 37'h16bccc760d;
    stim[54] = 37'h0b92066833;
    stim[55] = 37'h0fedef3cf3;
    stim[56] = 37'h1b0a7dce1a;
    stim[57] = 37'h1f8a2bc2b9;
    stim[58] = 37'h1a1e1b9c08;
    stim[59] = 37'h161fcaea0f;
    stim[60] = 37'h0fece7e4fa;
    stim[61] = 37'h03127a1fd4;
    stim[62] = 37'h032c6ea082;
    stim[63] = 37'h073866a3ef;
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
      expv[0] = 39'h7f00000000;
      expv[1] = 39'h7f00000000;
      expv[2] = 39'h7f00000000;
      expv[3] = 39'h7f00000000;
      expv[4] = 39'h7f00000000;
      expv[5] = 39'h7f0000007f;
      expv[6] = 39'h7f00000000;
      expv[7] = 39'h7f00000000;
      expv[8] = 39'h7f0000007f;
      expv[9] = 39'h7f00000000;
      expv[10] = 39'h7f00000000;
      expv[11] = 39'h7f00000000;
      expv[12] = 39'h7f0000007f;
      expv[13] = 39'h7f00000000;
      expv[14] = 39'h7f00000000;
      expv[15] = 39'h7f00000000;
      expv[16] = 39'h7f00000000;
      expv[17] = 39'h7f00000000;
      expv[18] = 39'h7f00000000;
      expv[19] = 39'h7f00000000;
      expv[20] = 39'h7f00000000;
      expv[21] = 39'h7f00000000;
      expv[22] = 39'h7f00000000;
      expv[23] = 39'h7f00000000;
      expv[24] = 39'h7f00000000;
      expv[25] = 39'h7f00000000;
      expv[26] = 39'h7f00000000;
      expv[27] = 39'h7f00000000;
      expv[28] = 39'h7f00000000;
      expv[29] = 39'h7f0000007f;
      expv[30] = 39'h7f00000000;
      expv[31] = 39'h7f0000007f;
      expv[32] = 39'h7f00000000;
      expv[33] = 39'h7f00000000;
      expv[34] = 39'h7f00000000;
      expv[35] = 39'h7f00000000;
      expv[36] = 39'h7f00000000;
      expv[37] = 39'h7f00000000;
      expv[38] = 39'h7f00000000;
      expv[39] = 39'h7f0000007f;
      expv[40] = 39'h7f00000000;
      expv[41] = 39'h7f00000000;
      expv[42] = 39'h7f0000007f;
      expv[43] = 39'h2700000000;
      expv[44] = 39'h2700000000;
      expv[45] = 39'h2700000000;
      expv[46] = 39'h2700000027;
      expv[47] = 39'h2700000000;
      expv[48] = 39'h7f00000000;
      expv[49] = 39'h7f00000000;
      expv[50] = 39'h7f00000000;
      expv[51] = 39'h7f0000007f;
      expv[52] = 39'h7f00000000;
      expv[53] = 39'h7f00000000;
      expv[54] = 39'h7f00000000;
      expv[55] = 39'h7f00000000;
      expv[56] = 39'h7f00000000;
      expv[57] = 39'h7f00000000;
      expv[58] = 39'h7f00000000;
      expv[59] = 39'h7f00000000;
      expv[60] = 39'h7f00000000;
      expv[61] = 39'h7f0000007f;
      expv[62] = 39'h7f0000007f;
      expv[63] = 39'h7f0000007f;
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
