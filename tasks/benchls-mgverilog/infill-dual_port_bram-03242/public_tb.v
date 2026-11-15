// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03242 dut (
    .CLK(clk),
    .SSR(in_vec[47:47]),
    .ADDR(in_vec[46:38]),
    .DI(in_vec[37:6]),
    .DIP(in_vec[5:2]),
    .EN(in_vec[1:1]),
    .WE(in_vec[0:0]),
    .DO(out_vec[35:4]),
    .DOP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hc70a2b6a749d;
    stim[1] = 48'hb17a05298e0a;
    stim[2] = 48'h3adfde4abd3a;
    stim[3] = 48'h043d74b90686;
    stim[4] = 48'h4aa2b9cd1dca;
    stim[5] = 48'h31a699ab9be6;
    stim[6] = 48'h6b543152c877;
    stim[7] = 48'h16d9f7441c9a;
    stim[8] = 48'h78a7a9fd7660;
    stim[9] = 48'h05f5fb7555ea;
    stim[10] = 48'h3b24670586a3;
    stim[11] = 48'h436dd9cd9216;
    stim[12] = 48'h331f8054c105;
    stim[13] = 48'h4646da5ab40e;
    stim[14] = 48'h5de39beb7289;
    stim[15] = 48'h66b1143d21b1;
    stim[16] = 48'h43a9b57d5794;
    stim[17] = 48'h0ce117fe06b7;
    stim[18] = 48'h15d06dd21d3b;
    stim[19] = 48'h24a878596a54;
    stim[20] = 48'h120f1b0b4d86;
    stim[21] = 48'h189d922498b0;
    stim[22] = 48'h08b2987c3838;
    stim[23] = 48'h6535b6be9d84;
    stim[24] = 48'h1001946a0295;
    stim[25] = 48'h4af3db6367fc;
    stim[26] = 48'h4d7bac4996c5;
    stim[27] = 48'h55b2ebb67954;
    stim[28] = 48'h530ad6cde46d;
    stim[29] = 48'h2a99fcd56be0;
    stim[30] = 48'h11fa02e3d2be;
    stim[31] = 48'h3f81892629c1;
    stim[32] = 48'h1e827ada9c21;
    stim[33] = 48'h5cb0b3b6ad31;
    stim[34] = 48'h3890133cae5d;
    stim[35] = 48'h3afb1496f2f1;
    stim[36] = 48'h169577eb3d9a;
    stim[37] = 48'h270e0524dfb4;
    stim[38] = 48'h1f94d7e2f9f1;
    stim[39] = 48'h624e883202f8;
    stim[40] = 48'h67b96c8807f5;
    stim[41] = 48'h2c763491d613;
    stim[42] = 48'h22a0b89c6ccb;
    stim[43] = 48'h560ed7b772d0;
    stim[44] = 48'h6674c8d99609;
    stim[45] = 48'h72d86f531e72;
    stim[46] = 48'h04f47fb5c4b6;
    stim[47] = 48'h5ea778010b4b;
    stim[48] = 48'h4f049e5dfc7b;
    stim[49] = 48'h61cff18ff92e;
    stim[50] = 48'h65b42a5ca8eb;
    stim[51] = 48'h0f29f48e2622;
    stim[52] = 48'h66cef14b7c2a;
    stim[53] = 48'h4e8af68f3f2a;
    stim[54] = 48'h0e818955299d;
    stim[55] = 48'h7fb9c0436dde;
    stim[56] = 48'h48dc74d80c92;
    stim[57] = 48'hccadfd651c07;
    stim[58] = 48'h7afdfaca10d2;
    stim[59] = 48'h1e3d0fd40124;
    stim[60] = 48'h632c80b75bda;
    stim[61] = 48'h4bcdf5942989;
    stim[62] = 48'h49148d83ec7f;
    stim[63] = 48'h1bc9ea9d824b;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxx;
      expv[2] = 36'hxxxxxxxxx;
      expv[3] = 36'hxxxxxxxxx;
      expv[4] = 36'hxxxxxxxxx;
      expv[5] = 36'hxxxxxxxxx;
      expv[6] = 36'hxxxxxxxxx;
      expv[7] = 36'h50c54b21d;
      expv[8] = 36'hxxxxxxxxx;
      expv[9] = 36'hxxxxxxxxx;
      expv[10] = 36'hxxxxxxxxx;
      expv[11] = 36'h919c161a8;
      expv[12] = 36'hxxxxxxxxx;
      expv[13] = 36'hxxxxxxxxx;
      expv[14] = 36'hxxxxxxxxx;
      expv[15] = 36'hxxxxxxxxx;
      expv[16] = 36'hxxxxxxxxx;
      expv[17] = 36'hxxxxxxxxx;
      expv[18] = 36'h845ff81ad;
      expv[19] = 36'h41b74874e;
      expv[20] = 36'h41b74874e;
      expv[21] = 36'hxxxxxxxxx;
      expv[22] = 36'hxxxxxxxxx;
      expv[23] = 36'hxxxxxxxxx;
      expv[24] = 36'hxxxxxxxxx;
      expv[25] = 36'hxxxxxxxxx;
      expv[26] = 36'hxxxxxxxxx;
      expv[27] = 36'hxxxxxxxxx;
      expv[28] = 36'hxxxxxxxxx;
      expv[29] = 36'hxxxxxxxxx;
      expv[30] = 36'hxxxxxxxxx;
      expv[31] = 36'hxxxxxxxxx;
      expv[32] = 36'hxxxxxxxxx;
      expv[33] = 36'hxxxxxxxxx;
      expv[34] = 36'hxxxxxxxxx;
      expv[35] = 36'hxxxxxxxxx;
      expv[36] = 36'hxxxxxxxxx;
      expv[37] = 36'hxxxxxxxxx;
      expv[38] = 36'hxxxxxxxxx;
      expv[39] = 36'hxxxxxxxxx;
      expv[40] = 36'hxxxxxxxxx;
      expv[41] = 36'hxxxxxxxxx;
      expv[42] = 36'hd8d247584;
      expv[43] = 36'h82e271b32;
      expv[44] = 36'h82e271b32;
      expv[45] = 36'h82e271b32;
      expv[46] = 36'hxxxxxxxxx;
      expv[47] = 36'hxxxxxxxxx;
      expv[48] = 36'h9de0042d2;
      expv[49] = 36'h127977f1e;
      expv[50] = 36'hxxxxxxxxx;
      expv[51] = 36'hd0a972a3a;
      expv[52] = 36'hxxxxxxxxx;
      expv[53] = 36'hxxxxxxxxx;
      expv[54] = 36'hxxxxxxxxx;
      expv[55] = 36'hxxxxxxxxx;
      expv[56] = 36'hxxxxxxxxx;
      expv[57] = 36'hxxxxxxxxx;
      expv[58] = 36'hxxxxxxxxx;
      expv[59] = 36'hxxxxxxxxx;
      expv[60] = 36'hxxxxxxxxx;
      expv[61] = 36'hxxxxxxxxx;
      expv[62] = 36'hxxxxxxxxx;
      expv[63] = 36'h52360fb1f;
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
