// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_163553 dut (
    .src1(in_vec[69:38]),
    .src2(in_vec[37:6]),
    .less(in_vec[5:5]),
    .A_invert(in_vec[4:4]),
    .B_invert(in_vec[3:3]),
    .cin(in_vec[2:2]),
    .operation(in_vec[1:0]),
    .result(out_vec[32:1]),
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
    stim[0] = 70'h31f207da3e16a2cd87;
    stim[1] = 70'h0ff0925bedfb7db437;
    stim[2] = 70'h084f51832626fd10f9;
    stim[3] = 70'h01f0e4d77682309886;
    stim[4] = 70'h1b091fba37a63709a5;
    stim[5] = 70'h048d655984d1541f43;
    stim[6] = 70'h1489b5cf7d89ea2e9f;
    stim[7] = 70'h0b5a7e15694826c8fd;
    stim[8] = 70'h31e69cc089be83cc0c;
    stim[9] = 70'h0fb02b3c73369731f4;
    stim[10] = 70'h134dc0e09082ad5933;
    stim[11] = 70'h1ac4b46ac9c79b4bf6;
    stim[12] = 70'h3a6c8bc3e3241bd569;
    stim[13] = 70'h3719581f92d316ef35;
    stim[14] = 70'h2c99f4de0f0711fd51;
    stim[15] = 70'h3fa48758fe006a3058;
    stim[16] = 70'h3f8624cec7c6db7b2d;
    stim[17] = 70'h29eb5194dfb0cdeb21;
    stim[18] = 70'h2652fcc85afaa0699a;
    stim[19] = 70'h344bc9e56a4445278c;
    stim[20] = 70'h22c42a37f10c41e445;
    stim[21] = 70'h0f9ca00afc89225d3c;
    stim[22] = 70'h2a7d6e67e373db72d5;
    stim[23] = 70'h3d937bc721dfdc8f46;
    stim[24] = 70'h32cf8210962f56d8be;
    stim[25] = 70'h13ce887dec9a9ab368;
    stim[26] = 70'h1f979ad92d820b1ea3;
    stim[27] = 70'h17d8abb8e2c0b10ae1;
    stim[28] = 70'h15e13556da862c6f7f;
    stim[29] = 70'h044ac1b1577dee3bfd;
    stim[30] = 70'h08acb65575308ebd62;
    stim[31] = 70'h05386988c86243fa37;
    stim[32] = 70'h33ed19e7ead34dd925;
    stim[33] = 70'h18bc5d528c398064cf;
    stim[34] = 70'h162ccc3c9e512d8f7d;
    stim[35] = 70'h00d5c8fceefbaaabe8;
    stim[36] = 70'h3bbfb53b269859444a;
    stim[37] = 70'h1f19713540afb96fc2;
    stim[38] = 70'h0f7540a73470d7e908;
    stim[39] = 70'h24de580664737f9e3f;
    stim[40] = 70'h05162a2f87243c616d;
    stim[41] = 70'h0763259bacd5cf5cc2;
    stim[42] = 70'h000c6a07fe70533e2d;
    stim[43] = 70'h3881bd1f8f980b65be;
    stim[44] = 70'h179f9bebf579b344dd;
    stim[45] = 70'h39540f9fe59d55f936;
    stim[46] = 70'h38d24255f9baf05b2e;
    stim[47] = 70'h1821c114d33d95b1f3;
    stim[48] = 70'h03f751532f9f9da4ae;
    stim[49] = 70'h0c1918a1e28f87e18c;
    stim[50] = 70'h288d29fce1e9f365eb;
    stim[51] = 70'h362eff6d96f5f4ade0;
    stim[52] = 70'h19e93b9b5eb8ab4345;
    stim[53] = 70'h2d920447042fde897e;
    stim[54] = 70'h2037e3ef770592226b;
    stim[55] = 70'h01c3e42ac42faba422;
    stim[56] = 70'h337aa6614c2eca7487;
    stim[57] = 70'h3171467ff70bd5bafe;
    stim[58] = 70'h2b7010766da574bd3a;
    stim[59] = 70'h2a3223e72017cc8651;
    stim[60] = 70'h2a202c9799f90f1ebb;
    stim[61] = 70'h036369855a967e77b7;
    stim[62] = 70'h285492fca9d4ea483d;
    stim[63] = 70'h02062a68f1542a860f;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000003;
      expv[2] = 33'h1ffcd77fe;
      expv[3] = 33'h1bb96a280;
      expv[4] = 33'h1fd79fddc;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h1b5becffc;
      expv[8] = 33'h18200e004;
      expv[9] = 33'h18034a00c;
      expv[10] = 33'h000000003;
      expv[11] = 33'h167e686f8;
      expv[12] = 33'h1f7ff7f5e;
      expv[13] = 33'h0d7bdbf7a;
      expv[14] = 33'h0fb38dfee;
      expv[15] = 33'h002d88438;
      expv[16] = 33'h1fdf92676;
      expv[17] = 33'h1ffdeeffe;
      expv[18] = 33'h1e542e50e;
      expv[19] = 33'h0a05c4602;
      expv[20] = 33'h19e635fbe;
      expv[21] = 33'h00312ed00;
      expv[22] = 33'h1bf9edfd6;
      expv[23] = 33'h0e2653a44;
      expv[24] = 33'h12706a642;
      expv[25] = 33'h09a200264;
      expv[26] = 33'h000000003;
      expv[27] = 33'h1bec5ddd6;
      expv[28] = 33'h000000003;
      expv[29] = 33'h1ddb9fe74;
      expv[30] = 33'h1ece1c740;
      expv[31] = 33'h000000003;
      expv[32] = 33'h1dffaeffe;
      expv[33] = 33'h000000000;
      expv[34] = 33'h14fff9f9e;
      expv[35] = 33'h0002202a0;
      expv[36] = 33'h116c09c04;
      expv[37] = 33'h0fdb642d4;
      expv[38] = 33'h058280030;
      expv[39] = 33'h000000003;
      expv[40] = 33'h1eeff5dfc;
      expv[41] = 33'h15db7563a;
      expv[42] = 33'h00c7f763e;
      expv[43] = 33'h1b8cdb3d2;
      expv[44] = 33'h1573365f8;
      expv[45] = 33'h119b52cca;
      expv[46] = 33'h1f4ba6f8a;
      expv[47] = 33'h000000003;
      expv[48] = 33'h09cb99844;
      expv[49] = 33'h06080c002;
      expv[50] = 33'h000000003;
      expv[51] = 33'h0b127a16c;
      expv[52] = 33'h0ffcddeda;
      expv[53] = 33'h14deed674;
      expv[54] = 33'h000000003;
      expv[55] = 33'h02f627c76;
      expv[56] = 33'h000000000;
      expv[57] = 33'h033d49e2a;
      expv[58] = 33'h036ab265a;
      expv[59] = 33'h1aefee4f6;
      expv[60] = 33'h000000003;
      expv[61] = 33'h000000003;
      expv[62] = 33'h0bd5bedbe;
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
