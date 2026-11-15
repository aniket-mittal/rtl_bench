// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_008007 dut (
    .a(in_vec[32:17]),
    .b(in_vec[16:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[16:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h09a079ce5;
    stim[1] = 33'h0c9ace20d;
    stim[2] = 33'h1b55832c2;
    stim[3] = 33'h04ed4408c;
    stim[4] = 33'h1d805ac75;
    stim[5] = 33'h0c0d68375;
    stim[6] = 33'h0939516cc;
    stim[7] = 33'h0bcc52fe8;
    stim[8] = 33'h1929ad640;
    stim[9] = 33'h13b05f28c;
    stim[10] = 33'h14ea75e49;
    stim[11] = 33'h074c886c1;
    stim[12] = 33'h1d4036a19;
    stim[13] = 33'h09685c23a;
    stim[14] = 33'h0786632ad;
    stim[15] = 33'h0e8ada1d5;
    stim[16] = 33'h0c04965b2;
    stim[17] = 33'h037de3541;
    stim[18] = 33'h1e639a2ba;
    stim[19] = 33'h043a1454f;
    stim[20] = 33'h1f0f50b30;
    stim[21] = 33'h015041d10;
    stim[22] = 33'h1ea1ee548;
    stim[23] = 33'h05356c514;
    stim[24] = 33'h08ee30af1;
    stim[25] = 33'h14e8b4180;
    stim[26] = 33'h168a7248c;
    stim[27] = 33'h000fe6e46;
    stim[28] = 33'h146b45376;
    stim[29] = 33'h0ed8bbf5b;
    stim[30] = 33'h1f9b981b0;
    stim[31] = 33'h0b587a9d4;
    stim[32] = 33'h0dfbe028c;
    stim[33] = 33'h1fea862ce;
    stim[34] = 33'h09471a886;
    stim[35] = 33'h1ccae0430;
    stim[36] = 33'h0c62bbcf8;
    stim[37] = 33'h09b3dfbd9;
    stim[38] = 33'h0889d6c20;
    stim[39] = 33'h08912e64e;
    stim[40] = 33'h1d128b4a5;
    stim[41] = 33'h1888feaa0;
    stim[42] = 33'h1f6ef9f75;
    stim[43] = 33'h1807105c1;
    stim[44] = 33'h16a3a1557;
    stim[45] = 33'h1bb9e803a;
    stim[46] = 33'h14ed041cc;
    stim[47] = 33'h122171751;
    stim[48] = 33'h087baf5b6;
    stim[49] = 33'h1135bbb87;
    stim[50] = 33'h05dd20b6e;
    stim[51] = 33'h126b9b3f6;
    stim[52] = 33'h19e72f53f;
    stim[53] = 33'h1937bc7c5;
    stim[54] = 33'h15b8eec07;
    stim[55] = 33'h14d040814;
    stim[56] = 33'h1991cede4;
    stim[57] = 33'h176d248e0;
    stim[58] = 33'h02c817f05;
    stim[59] = 33'h08025300c;
    stim[60] = 33'h1a463672b;
    stim[61] = 33'h1a3303e83;
    stim[62] = 33'h1bb39f29c;
    stim[63] = 33'h1334ee9ae;
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
      expv[0] = 17'h036ed;
      expv[1] = 17'h1abba;
      expv[2] = 17'h1e81a;
      expv[3] = 17'h08f60;
      expv[4] = 17'h1847b;
      expv[5] = 17'h1444c;
      expv[6] = 17'h1aa60;
      expv[7] = 17'h1ecac;
      expv[8] = 17'h068db;
      expv[9] = 17'h12d91;
      expv[10] = 17'h0acf1;
      expv[11] = 17'h0fb8a;
      expv[12] = 17'h13e1d;
      expv[13] = 17'h058bf;
      expv[14] = 17'h0ab14;
      expv[15] = 17'h08a83;
      expv[16] = 17'h025fb;
      expv[17] = 17'h06d20;
      expv[18] = 17'h188f3;
      expv[19] = 17'h188f0;
      expv[20] = 17'h0fc25;
      expv[21] = 17'h03214;
      expv[22] = 17'h0cf67;
      expv[23] = 17'h1186a;
      expv[24] = 17'h199d4;
      expv[25] = 17'h0900b;
      expv[26] = 17'h08d33;
      expv[27] = 17'h06f44;
      expv[28] = 17'h19a2a;
      expv[29] = 17'h0ace7;
      expv[30] = 17'h17b69;
      expv[31] = 17'h05f5b;
      expv[32] = 17'h0e24a;
      expv[33] = 17'h06177;
      expv[34] = 17'h03cf7;
      expv[35] = 17'h1d0de;
      expv[36] = 17'h08323;
      expv[37] = 17'h09717;
      expv[38] = 17'h1f4bc;
      expv[39] = 17'h16f60;
      expv[40] = 17'h085cf;
      expv[41] = 17'h1732f;
      expv[42] = 17'h19665;
      expv[43] = 17'h08633;
      expv[44] = 17'h17f92;
      expv[45] = 17'h03bd9;
      expv[46] = 17'h1909c;
      expv[47] = 17'h03969;
      expv[48] = 17'h17d70;
      expv[49] = 17'h0cee3;
      expv[50] = 17'h06940;
      expv[51] = 17'h0daaf;
      expv[52] = 17'h093b3;
      expv[53] = 17'h15b41;
      expv[54] = 17'h04797;
      expv[55] = 17'h15518;
      expv[56] = 17'h08701;
      expv[57] = 17'h1bfb2;
      expv[58] = 17'h1ab86;
      expv[59] = 17'h1b030;
      expv[60] = 17'h10b8f;
      expv[61] = 17'h1e1b4;
      expv[62] = 17'h1add5;
      expv[63] = 17'h01cfd;
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
