// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h03ed5552;
    stim[1] = 30'h21dd6dcd;
    stim[2] = 30'h21b632fb;
    stim[3] = 30'h03ec59a4;
    stim[4] = 30'h1f9e2b3c;
    stim[5] = 30'h3fc01ba3;
    stim[6] = 30'h1978df49;
    stim[7] = 30'h00057d52;
    stim[8] = 30'h03766351;
    stim[9] = 30'h18f3d80a;
    stim[10] = 30'h138d536f;
    stim[11] = 30'h347e4b75;
    stim[12] = 30'h20596e98;
    stim[13] = 30'h24c84172;
    stim[14] = 30'h1c58f953;
    stim[15] = 30'h3f997184;
    stim[16] = 30'h0310f351;
    stim[17] = 30'h3a03a0b3;
    stim[18] = 30'h05f6f4ee;
    stim[19] = 30'h0315b851;
    stim[20] = 30'h1960fc99;
    stim[21] = 30'h1367368c;
    stim[22] = 30'h0e40753f;
    stim[23] = 30'h02f6725b;
    stim[24] = 30'h26a93b22;
    stim[25] = 30'h2402d858;
    stim[26] = 30'h2b36420f;
    stim[27] = 30'h0d53eacd;
    stim[28] = 30'h273e6e34;
    stim[29] = 30'h1e818d01;
    stim[30] = 30'h06da3391;
    stim[31] = 30'h3c6141c3;
    stim[32] = 30'h3cc53d25;
    stim[33] = 30'h31c9af51;
    stim[34] = 30'h11623d71;
    stim[35] = 30'h0bc99971;
    stim[36] = 30'h07395174;
    stim[37] = 30'h1eb6eb17;
    stim[38] = 30'h0f0c9cc9;
    stim[39] = 30'h131efd24;
    stim[40] = 30'h3b9163bd;
    stim[41] = 30'h20c54eb4;
    stim[42] = 30'h2a45a1c3;
    stim[43] = 30'h33e23410;
    stim[44] = 30'h3f7cac74;
    stim[45] = 30'h12238f87;
    stim[46] = 30'h1005233b;
    stim[47] = 30'h18039311;
    stim[48] = 30'h198ba90a;
    stim[49] = 30'h2f129b11;
    stim[50] = 30'h12c64b8f;
    stim[51] = 30'h2d897ed9;
    stim[52] = 30'h1580f950;
    stim[53] = 30'h382a17d8;
    stim[54] = 30'h3f00d9d8;
    stim[55] = 30'h16d5a7d6;
    stim[56] = 30'h0d038ed2;
    stim[57] = 30'h0b17d5ca;
    stim[58] = 30'h0425b69e;
    stim[59] = 30'h1663d809;
    stim[60] = 30'h298a0c0d;
    stim[61] = 30'h331ebb49;
    stim[62] = 30'h3263bfa0;
    stim[63] = 30'h078d3e9b;
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
      expv[0] = 32'h87b5554b;
      expv[1] = 32'h0f75b737;
      expv[2] = 32'h0ed8cbef;
      expv[3] = 32'h87b16693;
      expv[4] = 32'hf678acf3;
      expv[5] = 32'hff006e8f;
      expv[6] = 32'h35e37d27;
      expv[7] = 32'h0015f54b;
      expv[8] = 32'h85d98d47;
      expv[9] = 32'h33cf602b;
      expv[10] = 32'h96354dbf;
      expv[11] = 32'h59f92dd7;
      expv[12] = 32'h0965ba63;
      expv[13] = 32'h4b2105cb;
      expv[14] = 32'h7163e54f;
      expv[15] = 32'hfe65c613;
      expv[16] = 32'h8443cd47;
      expv[17] = 32'hb80e82cf;
      expv[18] = 32'h47dbd3bb;
      expv[19] = 32'h8456e147;
      expv[20] = 32'h3583f267;
      expv[21] = 32'h959cda33;
      expv[22] = 32'he101d4ff;
      expv[23] = 32'h83d9c96f;
      expv[24] = 32'hcaa4ec8b;
      expv[25] = 32'h480b6163;
      expv[26] = 32'hacd9083f;
      expv[27] = 32'h654fab37;
      expv[28] = 32'hccf9b8d3;
      expv[29] = 32'hf2063407;
      expv[30] = 32'hc368ce47;
      expv[31] = 32'h7985070f;
      expv[32] = 32'h7b14f497;
      expv[33] = 32'h1f26bd47;
      expv[34] = 32'h1588f5c7;
      expv[35] = 32'ha72665c7;
      expv[36] = 32'hc4e545d3;
      expv[37] = 32'hf2dbac5f;
      expv[38] = 32'he4327327;
      expv[39] = 32'h947bf493;
      expv[40] = 32'hbe458ef7;
      expv[41] = 32'h0b153ad3;
      expv[42] = 32'ha916870f;
      expv[43] = 32'h9f88d043;
      expv[44] = 32'hfdf2b1d3;
      expv[45] = 32'h908e3e1f;
      expv[46] = 32'h10148cef;
      expv[47] = 32'h300e4c47;
      expv[48] = 32'h362ea42b;
      expv[49] = 32'hec4a6c47;
      expv[50] = 32'h93192e3f;
      expv[51] = 32'h6e25fb67;
      expv[52] = 32'h5603e543;
      expv[53] = 32'h38a85f63;
      expv[54] = 32'hfc036763;
      expv[55] = 32'hd3569f5b;
      expv[56] = 32'h640e3b4b;
      expv[57] = 32'ha45f572b;
      expv[58] = 32'h4096da7b;
      expv[59] = 32'hd18f6027;
      expv[60] = 32'h2e283037;
      expv[61] = 32'h9c7aed27;
      expv[62] = 32'h998efe83;
      expv[63] = 32'hc634fa6f;
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
