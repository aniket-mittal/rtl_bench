// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01375 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
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
    stim[0] = 37'h111b97ab14;
    stim[1] = 37'h110d0c0bd0;
    stim[2] = 37'h06a5caf9e0;
    stim[3] = 37'h1bb31e36c6;
    stim[4] = 37'h0efe995fdb;
    stim[5] = 37'h12bf1e566d;
    stim[6] = 37'h12a83992d0;
    stim[7] = 37'h0a44264d83;
    stim[8] = 37'h0fd40ade7b;
    stim[9] = 37'h0651985be2;
    stim[10] = 37'h1261da2472;
    stim[11] = 37'h0f522744b7;
    stim[12] = 37'h0a555e2923;
    stim[13] = 37'h0202935b7d;
    stim[14] = 37'h175bbf4dae;
    stim[15] = 37'h0bcb04d418;
    stim[16] = 37'h1f49e7d334;
    stim[17] = 37'h0b6c7c92e5;
    stim[18] = 37'h0f9750f4dc;
    stim[19] = 37'h1e6ab7746d;
    stim[20] = 37'h0b8dc59912;
    stim[21] = 37'h1f1f434f8f;
    stim[22] = 37'h1a1683b430;
    stim[23] = 37'h02681470c4;
    stim[24] = 37'h1aa1278832;
    stim[25] = 37'h0a27b285ae;
    stim[26] = 37'h0ad13c9dda;
    stim[27] = 37'h06bea787ba;
    stim[28] = 37'h0e7e4b67c9;
    stim[29] = 37'h0679272115;
    stim[30] = 37'h02915db514;
    stim[31] = 37'h1aed9d2cb9;
    stim[32] = 37'h072f3a4dda;
    stim[33] = 37'h1e34d12451;
    stim[34] = 37'h0edd770692;
    stim[35] = 37'h1bb2023b7d;
    stim[36] = 37'h026c777781;
    stim[37] = 37'h020254169b;
    stim[38] = 37'h0ae0be995c;
    stim[39] = 37'h1b2a7cc503;
    stim[40] = 37'h16861a1648;
    stim[41] = 37'h175a72cad8;
    stim[42] = 37'h1f45cc668a;
    stim[43] = 37'h0ffef03cd7;
    stim[44] = 37'h1f9f699c81;
    stim[45] = 37'h067fab6d11;
    stim[46] = 37'h1fb732f917;
    stim[47] = 37'h035f22b714;
    stim[48] = 37'h02e8325c99;
    stim[49] = 37'h1301feed4a;
    stim[50] = 37'h0f252fe92d;
    stim[51] = 37'h03cb98f51c;
    stim[52] = 37'h0f614130b6;
    stim[53] = 37'h09f589eb97;
    stim[54] = 37'h03f8b1eb00;
    stim[55] = 37'h0fa0ca562f;
    stim[56] = 37'h038bb8fca7;
    stim[57] = 37'h0a79476b65;
    stim[58] = 37'h0bdae433ab;
    stim[59] = 37'h0f3f988aff;
    stim[60] = 37'h16d6166453;
    stim[61] = 37'h0ffad81350;
    stim[62] = 37'h02b781cf59;
    stim[63] = 37'h031bd2da38;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000001;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000001;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000001;
      expv[48] = 33'h100000001;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000001;
      expv[52] = 33'h100000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
