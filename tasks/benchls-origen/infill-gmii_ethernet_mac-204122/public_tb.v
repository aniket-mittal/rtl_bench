// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204122 dut (
    .aclk(clk),
    .aresetn(in_vec[21:21]),
    .gmii_rxd(in_vec[20:13]),
    .gmii_rxdv(in_vec[12:12]),
    .gmii_rxer(in_vec[11:11]),
    .rx_tready(in_vec[10:10]),
    .tx_tdata(in_vec[9:2]),
    .tx_tvalid(in_vec[1:1]),
    .tx_tlast(in_vec[0:0]),
    .rx_tdata(out_vec[20:13]),
    .rx_tvalid(out_vec[12:12]),
    .rx_tlast(out_vec[11:11]),
    .tx_tready(out_vec[10:10]),
    .gmii_txd(out_vec[9:2]),
    .gmii_txen(out_vec[1:1]),
    .gmii_txer(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h1b8907;
    stim[1] = 22'h017b3c;
    stim[2] = 22'h2f9f0e;
    stim[3] = 22'h28a02c;
    stim[4] = 22'h3f95d5;
    stim[5] = 22'h2a543e;
    stim[6] = 22'h38daad;
    stim[7] = 22'h23cd78;
    stim[8] = 22'h293777;
    stim[9] = 22'h382e9d;
    stim[10] = 22'h3b4b7c;
    stim[11] = 22'h3b1e4d;
    stim[12] = 22'h3dc2fc;
    stim[13] = 22'h2458c2;
    stim[14] = 22'h2a73e6;
    stim[15] = 22'h35ac4e;
    stim[16] = 22'h35b9c2;
    stim[17] = 22'h3ecb3e;
    stim[18] = 22'h26a527;
    stim[19] = 22'h32c8cc;
    stim[20] = 22'h3133d7;
    stim[21] = 22'h3c8738;
    stim[22] = 22'h237d7f;
    stim[23] = 22'h266c3a;
    stim[24] = 22'h35209d;
    stim[25] = 22'h2d81b6;
    stim[26] = 22'h255341;
    stim[27] = 22'h38c781;
    stim[28] = 22'h259688;
    stim[29] = 22'h3dc772;
    stim[30] = 22'h38e14a;
    stim[31] = 22'h2ec20c;
    stim[32] = 22'h28283b;
    stim[33] = 22'h30c146;
    stim[34] = 22'h3dd0dc;
    stim[35] = 22'h31fd80;
    stim[36] = 22'h2884a9;
    stim[37] = 22'h2b37f9;
    stim[38] = 22'h315a65;
    stim[39] = 22'h3a0b55;
    stim[40] = 22'h2b2779;
    stim[41] = 22'h3daeeb;
    stim[42] = 22'h2cd34a;
    stim[43] = 22'h3850e6;
    stim[44] = 22'h28f240;
    stim[45] = 22'h27736e;
    stim[46] = 22'h36f26d;
    stim[47] = 22'h28f45a;
    stim[48] = 22'h382579;
    stim[49] = 22'h24c2d6;
    stim[50] = 22'h3b233b;
    stim[51] = 22'h3e2447;
    stim[52] = 22'h26729d;
    stim[53] = 22'h3598c8;
    stim[54] = 22'h22d84d;
    stim[55] = 22'h22158f;
    stim[56] = 22'h30f04e;
    stim[57] = 22'h3bbeec;
    stim[58] = 22'h2a24d4;
    stim[59] = 22'h30cd57;
    stim[60] = 22'h387064;
    stim[61] = 22'h3341b7;
    stim[62] = 22'h3df1a2;
    stim[63] = 22'h2dcede;
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
      expv[0] = 21'h000106;
      expv[1] = 21'h00033c;
      expv[2] = 21'h00030e;
      expv[3] = 21'h00042c;
      expv[4] = 21'h0001d4;
      expv[5] = 21'h0f903e;
      expv[6] = 21'h0f86ac;
      expv[7] = 21'h1f9178;
      expv[8] = 21'h1f9b76;
      expv[9] = 21'h1f869c;
      expv[10] = 21'h1f837c;
      expv[11] = 21'h09324c;
      expv[12] = 21'h0932fc;
      expv[13] = 21'h0930c2;
      expv[14] = 21'h1b13e6;
      expv[15] = 21'h1b104e;
      expv[16] = 21'h1b19c2;
      expv[17] = 21'h1b033e;
      expv[18] = 21'h1b0126;
      expv[19] = 21'h15b0cc;
      expv[20] = 21'h15a3d6;
      expv[21] = 21'h15a338;
      expv[22] = 21'h15a17e;
      expv[23] = 21'h11343a;
      expv[24] = 21'h11209c;
      expv[25] = 21'h0371b6;
      expv[26] = 21'h037340;
      expv[27] = 21'h037380;
      expv[28] = 21'h037288;
      expv[29] = 21'h037372;
      expv[30] = 21'h03714a;
      expv[31] = 21'h05920c;
      expv[32] = 21'h05903a;
      expv[33] = 21'h059146;
      expv[34] = 21'h0590dc;
      expv[35] = 21'h059180;
      expv[36] = 21'h0590a8;
      expv[37] = 21'h0593f8;
      expv[38] = 21'h059264;
      expv[39] = 21'h059354;
      expv[40] = 21'h0b3378;
      expv[41] = 21'h0b3aea;
      expv[42] = 21'h0b274a;
      expv[43] = 21'h0b20e6;
      expv[44] = 21'h0b2240;
      expv[45] = 21'h0cd36e;
      expv[46] = 21'h0cd26c;
      expv[47] = 21'h0cd05a;
      expv[48] = 21'h0cd978;
      expv[49] = 21'h0cc2d6;
      expv[50] = 21'h08f33a;
      expv[51] = 21'h08f046;
      expv[52] = 21'h08f29c;
      expv[53] = 21'h08f0c8;
      expv[54] = 21'h08e04c;
      expv[55] = 21'h06718e;
      expv[56] = 21'h067c4e;
      expv[57] = 21'h0662ec;
      expv[58] = 21'h0210d4;
      expv[59] = 21'h10f156;
      expv[60] = 21'h1bb064;
      expv[61] = 21'h1ba1b6;
      expv[62] = 21'h1ba1a2;
      expv[63] = 21'h1872de;
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
