// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10538 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'haffb4e608b637;
    stim[1] = 52'hc3de5edc3200e;
    stim[2] = 52'h569c1b8cd6e4b;
    stim[3] = 52'hb109a32788059;
    stim[4] = 52'h00d78f5b34cdb;
    stim[5] = 52'h6eb828efe0d80;
    stim[6] = 52'h52f91f223bc1a;
    stim[7] = 52'h3f9c69481a0f2;
    stim[8] = 52'h722ebef3854b2;
    stim[9] = 52'h90bea99b56cf1;
    stim[10] = 52'hd922283eea0f1;
    stim[11] = 52'h51d253a33cf50;
    stim[12] = 52'h9902d35bf0219;
    stim[13] = 52'h421612cfcf48a;
    stim[14] = 52'h10af0b4311bb8;
    stim[15] = 52'h22d81d7cec0d8;
    stim[16] = 52'h9b688485f9a09;
    stim[17] = 52'hdad0358b40c6b;
    stim[18] = 52'h9822b2a6730e2;
    stim[19] = 52'h755aba08a978a;
    stim[20] = 52'h63a3b61cdf530;
    stim[21] = 52'h3bce3bd544adb;
    stim[22] = 52'h16b35106c9843;
    stim[23] = 52'h25c9535e5add3;
    stim[24] = 52'h8d32eb0017b12;
    stim[25] = 52'h79d4dfa5d7309;
    stim[26] = 52'h854e30410e7d3;
    stim[27] = 52'hfddf4e308baf0;
    stim[28] = 52'h77d891736c1f8;
    stim[29] = 52'h5b6d8919712a3;
    stim[30] = 52'ha955846181af2;
    stim[31] = 52'h838f3c3fcae00;
    stim[32] = 52'h8486bf42f1760;
    stim[33] = 52'h5a89dd324673b;
    stim[34] = 52'h86059662472fa;
    stim[35] = 52'h952c541d01519;
    stim[36] = 52'hba5705cd34cd2;
    stim[37] = 52'h40493426e65ca;
    stim[38] = 52'h8166a5455b1ab;
    stim[39] = 52'hec67fbacc48ab;
    stim[40] = 52'h069e2dcee7718;
    stim[41] = 52'hd850ab5cee2ba;
    stim[42] = 52'hbce02921cb3a8;
    stim[43] = 52'h7318de3c703d3;
    stim[44] = 52'h678cb577b4aca;
    stim[45] = 52'h57112786e32c8;
    stim[46] = 52'hd0ed13500a1e0;
    stim[47] = 52'h118f0653d4c42;
    stim[48] = 52'h07fa5567e7358;
    stim[49] = 52'hb24b159d1ec53;
    stim[50] = 52'hecf25c65d7a43;
    stim[51] = 52'h566a674836668;
    stim[52] = 52'h39755f23ef573;
    stim[53] = 52'h10ac3024081ab;
    stim[54] = 52'h34430be8505b2;
    stim[55] = 52'ha46f96e7c8b5b;
    stim[56] = 52'hb647cc76c8cc9;
    stim[57] = 52'h16f1df4744f7a;
    stim[58] = 52'h1deb7d53c2418;
    stim[59] = 52'h53778a295044b;
    stim[60] = 52'hc5841655dbb33;
    stim[61] = 52'habdd8e10ef813;
    stim[62] = 52'h235008651e099;
    stim[63] = 52'hcb00684da6f33;
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
      expv[0] = 4'h6;
      expv[1] = 4'h6;
      expv[2] = 4'h6;
      expv[3] = 4'hx;
      expv[4] = 4'h6;
      expv[5] = 4'h8;
      expv[6] = 4'h6;
      expv[7] = 4'hb;
      expv[8] = 4'h2;
      expv[9] = 4'h9;
      expv[10] = 4'h4;
      expv[11] = 4'h4;
      expv[12] = 4'h4;
      expv[13] = 4'h6;
      expv[14] = 4'h9;
      expv[15] = 4'h4;
      expv[16] = 4'h4;
      expv[17] = 4'h6;
      expv[18] = 4'hb;
      expv[19] = 4'h2;
      expv[20] = 4'h9;
      expv[21] = 4'h6;
      expv[22] = 4'hb;
      expv[23] = 4'h3;
      expv[24] = 4'hb;
      expv[25] = 4'h1;
      expv[26] = 4'h6;
      expv[27] = 4'h8;
      expv[28] = 4'h4;
      expv[29] = 4'h6;
      expv[30] = 4'hb;
      expv[31] = 4'h0;
      expv[32] = 4'h4;
      expv[33] = 4'h6;
      expv[34] = 4'ha;
      expv[35] = 4'h0;
      expv[36] = 4'h6;
      expv[37] = 4'ha;
      expv[38] = 4'h3;
      expv[39] = 4'ha;
      expv[40] = 4'h0;
      expv[41] = 4'h6;
      expv[42] = 4'h8;
      expv[43] = 4'h6;
      expv[44] = 4'hb;
      expv[45] = 4'h0;
      expv[46] = 4'h4;
      expv[47] = 4'h6;
      expv[48] = 4'h9;
      expv[49] = 4'h6;
      expv[50] = 4'ha;
      expv[51] = 4'h0;
      expv[52] = 4'h6;
      expv[53] = 4'ha;
      expv[54] = 4'h2;
      expv[55] = 4'hb;
      expv[56] = 4'h0;
      expv[57] = 4'h6;
      expv[58] = 4'h8;
      expv[59] = 4'h6;
      expv[60] = 4'ha;
      expv[61] = 4'h2;
      expv[62] = 4'h8;
      expv[63] = 4'h6;
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
