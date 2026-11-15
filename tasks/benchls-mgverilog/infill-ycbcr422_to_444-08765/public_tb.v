// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08765 dut (
    .clk(clk),
    .s422_de(in_vec[32:32]),
    .s422_sync(in_vec[31:16]),
    .s422_data(in_vec[15:0]),
    .s444_sync(out_vec[39:24]),
    .s444_data(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h17ff9c2aa;
    stim[1] = 33'h0a91144f1;
    stim[2] = 33'h0d6a5080b;
    stim[3] = 33'h0775d67ec;
    stim[4] = 33'h08f3ddedf;
    stim[5] = 33'h002e857c0;
    stim[6] = 33'h1639131cf;
    stim[7] = 33'h1178201f8;
    stim[8] = 33'h147e61e78;
    stim[9] = 33'h023c79781;
    stim[10] = 33'h19cb052be;
    stim[11] = 33'h1b9cbd67c;
    stim[12] = 33'h1f269418b;
    stim[13] = 33'h07c246570;
    stim[14] = 33'h1777f37b6;
    stim[15] = 33'h0d4286f42;
    stim[16] = 33'h02f8a2ca8;
    stim[17] = 33'h0267f8342;
    stim[18] = 33'h16f0f33e4;
    stim[19] = 33'h195a999b1;
    stim[20] = 33'h1488a05eb;
    stim[21] = 33'h1bd602fcf;
    stim[22] = 33'h1f1b67fc7;
    stim[23] = 33'h0f0748ce9;
    stim[24] = 33'h1ef14c54c;
    stim[25] = 33'h15bc3450d;
    stim[26] = 33'h01940f456;
    stim[27] = 33'h19dcea742;
    stim[28] = 33'h1fba0018a;
    stim[29] = 33'h080acab2c;
    stim[30] = 33'h0a870b1c9;
    stim[31] = 33'h18fcddf70;
    stim[32] = 33'h03c37fd88;
    stim[33] = 33'h05a887983;
    stim[34] = 33'h13bd4b35b;
    stim[35] = 33'h03054a45e;
    stim[36] = 33'h14d96e37d;
    stim[37] = 33'h072c54444;
    stim[38] = 33'h06d943a2f;
    stim[39] = 33'h019aca5ba;
    stim[40] = 33'h195e25090;
    stim[41] = 33'h17dff3129;
    stim[42] = 33'h1597642d2;
    stim[43] = 33'h1b73af9dd;
    stim[44] = 33'h184b32638;
    stim[45] = 33'h1f80dec22;
    stim[46] = 33'h13aa96926;
    stim[47] = 33'h035a267f1;
    stim[48] = 33'h073363d96;
    stim[49] = 33'h0214690b2;
    stim[50] = 33'h110d71dd0;
    stim[51] = 33'h1a8db18f1;
    stim[52] = 33'h0c3f9152c;
    stim[53] = 33'h1bdc04062;
    stim[54] = 33'h0cf78264a;
    stim[55] = 33'h14c61ca66;
    stim[56] = 33'h05b1c77f4;
    stim[57] = 33'h0f538d88f;
    stim[58] = 33'h04b3bb7f0;
    stim[59] = 33'h1d8900c73;
    stim[60] = 33'h0f1be5be9;
    stim[61] = 33'h1695a5b64;
    stim[62] = 33'h1e89bfc41;
    stim[63] = 33'h19a0c9548;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000c2xxxx;
      expv[2] = 40'h7ff9xxaac2;
      expv[3] = 40'ha91144f1c2;
      expv[4] = 40'hd6a5440b08;
      expv[5] = 40'h775d08ec67;
      expv[6] = 40'h8f3d67dfde;
      expv[7] = 40'h02e831c057;
      expv[8] = 40'h639101cf31;
      expv[9] = 40'h178201f827;
      expv[10] = 40'h47e601781e;
      expv[11] = 40'h23c7978138;
      expv[12] = 40'h9cb0d6be52;
      expv[13] = 40'hb9cbd67c49;
      expv[14] = 40'hf269d68b41;
      expv[15] = 40'h7c2465703c;
      expv[16] = 40'h777f65b637;
      expv[17] = 40'hd4286f4237;
      expv[18] = 40'h2f8a6fa82c;
      expv[19] = 40'h267f334283;
      expv[20] = 40'h6f0f99e433;
      expv[21] = 40'h95a999b11c;
      expv[22] = 40'h488a64eb05;
      expv[23] = 40'hbd602fcf42;
      expv[24] = 40'hf1b62fc77f;
      expv[25] = 40'hf0748ce9a2;
      expv[26] = 40'hef14454cc5;
      expv[27] = 40'h5bc3450dc5;
      expv[28] = 40'h19407656f4;
      expv[29] = 40'h9dce0142a7;
      expv[30] = 40'hfba0018aa7;
      expv[31] = 40'h80ac012cab;
      expv[32] = 40'ha870dfc9b1;
      expv[33] = 40'h8fcdb170df;
      expv[34] = 40'h3c37fd88df;
      expv[35] = 40'h5a88b38379;
      expv[36] = 40'h3bd4795bb3;
      expv[37] = 40'h3054a45ecb;
      expv[38] = 40'h4d96a47de3;
      expv[39] = 40'h72c54444e3;
      expv[40] = 40'h6d94442f3a;
      expv[41] = 40'h19ac50baa5;
      expv[42] = 40'h95e2319050;
      expv[43] = 40'h7dff312949;
      expv[44] = 40'h597695d242;
      expv[45] = 40'hb73af9dd34;
      expv[46] = 40'h84b3f23826;
      expv[47] = 40'hf80dec2247;
      expv[48] = 40'h3aa9ec2669;
      expv[49] = 40'h35a267f169;
      expv[50] = 40'h733667963d;
      expv[51] = 40'h21461db290;
      expv[52] = 40'h10d718d01d;
      expv[53] = 40'ha8db18f11d;
      expv[54] = 40'hc3f92c2c15;
      expv[55] = 40'hbdc0156240;
      expv[56] = 40'hcf78264a85;
      expv[57] = 40'h4c612666ca;
      expv[58] = 40'h5b1c77f4ca;
      expv[59] = 40'hf538778fd8;
      expv[60] = 40'h4b3b0cf0b7;
      expv[61] = 40'hd890b7730c;
      expv[62] = 40'hf1be5be933;
      expv[63] = 40'h695afc645b;
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
