// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_177651 dut (
    .pclk(clk),
    .clk1Hz(in_vec[41:41]),
    .reset(in_vec[40:40]),
    .keycode(in_vec[39:24]),
    .xpos(in_vec[23:16]),
    .ypos(in_vec[15:8]),
    .rotation(in_vec[7:0]),
    .test_x(out_vec[23:16]),
    .test_y(out_vec[15:8]),
    .test_rot(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3ab810c51fb;
    stim[1] = 42'h1d9caf5d63b;
    stim[2] = 42'h2f1a9c1c582;
    stim[3] = 42'h2f5d9d10ec3;
    stim[4] = 42'h0fdceb14997;
    stim[5] = 42'h23fce9ce2ba;
    stim[6] = 42'h2ed5df6cf5c;
    stim[7] = 42'h20bb74f62ab;
    stim[8] = 42'h0fbf492b129;
    stim[9] = 42'h09601290d71;
    stim[10] = 42'h0acc1c0023b;
    stim[11] = 42'h2257d8f78f9;
    stim[12] = 42'h2bde7fb95f8;
    stim[13] = 42'h2f4de7c7dd2;
    stim[14] = 42'h0bd5114a316;
    stim[15] = 42'h2cf4751ff07;
    stim[16] = 42'h08417710514;
    stim[17] = 42'h28e64b27713;
    stim[18] = 42'h03df99c312f;
    stim[19] = 42'h213ba59172c;
    stim[20] = 42'h2deee1d9890;
    stim[21] = 42'h2a4df34199a;
    stim[22] = 42'h0d0fa88454f;
    stim[23] = 42'h26c1c7a211c;
    stim[24] = 42'h0b76fcc8655;
    stim[25] = 42'h299d4201e82;
    stim[26] = 42'h0f9e069eb74;
    stim[27] = 42'h032f6e975b8;
    stim[28] = 42'h0bdb97dee04;
    stim[29] = 42'h25252863b77;
    stim[30] = 42'h206edd92973;
    stim[31] = 42'h271f2601b37;
    stim[32] = 42'h202f076e421;
    stim[33] = 42'h2b19a1ae7e2;
    stim[34] = 42'h198854375d4;
    stim[35] = 42'h08ddacfa931;
    stim[36] = 42'h2b8c49c120f;
    stim[37] = 42'h04e35f1d2d2;
    stim[38] = 42'h084863521d8;
    stim[39] = 42'h2404a5ab402;
    stim[40] = 42'h26bd1787d7a;
    stim[41] = 42'h09d1e676be3;
    stim[42] = 42'h0f7b48aa2f6;
    stim[43] = 42'h0d4188fdb9b;
    stim[44] = 42'h26f249b937e;
    stim[45] = 42'h054e57e1da9;
    stim[46] = 42'h04f6b013e70;
    stim[47] = 42'h2af7538f274;
    stim[48] = 42'h0588fc8e40f;
    stim[49] = 42'h0cb2eee2069;
    stim[50] = 42'h25c3c2808f7;
    stim[51] = 42'h034a485827d;
    stim[52] = 42'h000e667161e;
    stim[53] = 42'h043253ab416;
    stim[54] = 42'h00f9c661fb6;
    stim[55] = 42'h2f4f2cefcbe;
    stim[56] = 42'h02620f01de7;
    stim[57] = 42'h2f52b4bbcf9;
    stim[58] = 42'h2b93d491110;
    stim[59] = 42'h2fc7f498407;
    stim[60] = 42'h2d69091f89f;
    stim[61] = 42'h2efc9e236ec;
    stim[62] = 42'h2d46a3edb83;
    stim[63] = 42'h07036e2976d;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h020200;
      expv[2] = 24'h020200;
      expv[3] = 24'hc1c682;
      expv[4] = 24'hd10fc3;
      expv[5] = 24'hb14997;
      expv[6] = 24'h9ce3ba;
      expv[7] = 24'hf6d05c;
      expv[8] = 24'h4f63ab;
      expv[9] = 24'h92b129;
      expv[10] = 24'h290d71;
      expv[11] = 24'hc0023b;
      expv[12] = 24'h8f79f9;
      expv[13] = 24'hfb96f8;
      expv[14] = 24'h7c7ed2;
      expv[15] = 24'h14a316;
      expv[16] = 24'h510007;
      expv[17] = 24'h710514;
      expv[18] = 24'hb27813;
      expv[19] = 24'h9c312f;
      expv[20] = 24'h59182c;
      expv[21] = 24'h1d9990;
      expv[22] = 24'h341a9a;
      expv[23] = 24'h88454f;
      expv[24] = 24'h7a221c;
      expv[25] = 24'hcc8655;
      expv[26] = 24'h201f82;
      expv[27] = 24'h69eb74;
      expv[28] = 24'he975b8;
      expv[29] = 24'h7dee04;
      expv[30] = 24'h863c77;
      expv[31] = 24'hd92a73;
      expv[32] = 24'h601c37;
      expv[33] = 24'h76e521;
      expv[34] = 24'h1ae8e2;
      expv[35] = 24'h020200;
      expv[36] = 24'hcfa931;
      expv[37] = 24'h9c130f;
      expv[38] = 24'hf1d2d2;
      expv[39] = 24'h3521d8;
      expv[40] = 24'h5ab502;
      expv[41] = 24'h787e7a;
      expv[42] = 24'h676be3;
      expv[43] = 24'h8aa2f6;
      expv[44] = 24'h8fdb9b;
      expv[45] = 24'h9b947e;
      expv[46] = 24'h7e1da9;
      expv[47] = 24'h013e70;
      expv[48] = 24'h38f374;
      expv[49] = 24'hc8e40f;
      expv[50] = 24'hee2069;
      expv[51] = 24'h2809f7;
      expv[52] = 24'h85827d;
      expv[53] = 24'h67161e;
      expv[54] = 24'h3ab416;
      expv[55] = 24'h661fb6;
      expv[56] = 24'hcefdbe;
      expv[57] = 24'hf01de7;
      expv[58] = 24'h4bbdf9;
      expv[59] = 24'h491210;
      expv[60] = 24'h498507;
      expv[61] = 24'h91f99f;
      expv[62] = 24'he237ec;
      expv[63] = 24'h3edc83;
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
