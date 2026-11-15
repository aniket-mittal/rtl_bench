// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032306 dut (
    .a(in_vec[23:10]),
    .b(in_vec[9:1]),
    .tc(in_vec[0:0]),
    .quotient(out_vec[23:10]),
    .divide_by_0(out_vec[9:9]),
    .remainder(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h975d16;
    stim[1] = 24'h786789;
    stim[2] = 24'haf35bc;
    stim[3] = 24'h3df068;
    stim[4] = 24'h190aaf;
    stim[5] = 24'h5bbc34;
    stim[6] = 24'heac5c0;
    stim[7] = 24'h35addf;
    stim[8] = 24'h06faeb;
    stim[9] = 24'h91c833;
    stim[10] = 24'hbec355;
    stim[11] = 24'hbc71f4;
    stim[12] = 24'h9f81a9;
    stim[13] = 24'h74b402;
    stim[14] = 24'hcff0a3;
    stim[15] = 24'h73e744;
    stim[16] = 24'h4e5b81;
    stim[17] = 24'hbdcd42;
    stim[18] = 24'hf58fe9;
    stim[19] = 24'ha41196;
    stim[20] = 24'h4227a8;
    stim[21] = 24'hecb505;
    stim[22] = 24'h98a414;
    stim[23] = 24'h604827;
    stim[24] = 24'hfe1ffb;
    stim[25] = 24'hd17820;
    stim[26] = 24'h3a07b9;
    stim[27] = 24'hc477a7;
    stim[28] = 24'h6eceae;
    stim[29] = 24'h0d0034;
    stim[30] = 24'h11a1d7;
    stim[31] = 24'he22f5f;
    stim[32] = 24'h32d8e7;
    stim[33] = 24'h1cf003;
    stim[34] = 24'hcce12c;
    stim[35] = 24'h20ba37;
    stim[36] = 24'h1ea69b;
    stim[37] = 24'ha4d7f4;
    stim[38] = 24'h946ff2;
    stim[39] = 24'h8aa634;
    stim[40] = 24'hd645d9;
    stim[41] = 24'h0ba90b;
    stim[42] = 24'hdbd0ff;
    stim[43] = 24'h2d7212;
    stim[44] = 24'h3edbef;
    stim[45] = 24'ha3ffb6;
    stim[46] = 24'h93fcfa;
    stim[47] = 24'h5e92b3;
    stim[48] = 24'h5f335a;
    stim[49] = 24'hc4535c;
    stim[50] = 24'h0f2f9f;
    stim[51] = 24'hc91deb;
    stim[52] = 24'h33bc51;
    stim[53] = 24'hf0288c;
    stim[54] = 24'h6656cb;
    stim[55] = 24'h936b8d;
    stim[56] = 24'h893493;
    stim[57] = 24'he0a768;
    stim[58] = 24'h9a9032;
    stim[59] = 24'h0ea68e;
    stim[60] = 24'h26e7dd;
    stim[61] = 24'h43adfe;
    stim[62] = 24'hd3a855;
    stim[63] = 24'h99d7fc;
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
      expv[0] = 24'h011460;
      expv[1] = 24'hfe0019;
      expv[2] = 24'h00c871;
      expv[3] = 24'h01300c;
      expv[4] = 24'hffdc51;
      expv[5] = 24'h038415;
      expv[6] = 24'h010c11;
      expv[7] = 24'h003859;
      expv[8] = 24'hfff41d;
      expv[9] = 24'hfb99fc;
      expv[10] = 24'h00c1d0;
      expv[11] = 24'h00c03c;
      expv[12] = 24'hff8de4;
      expv[13] = 24'h74b400;
      expv[14] = 24'hff6db1;
      expv[15] = 24'h004537;
      expv[16] = 24'hfec816;
      expv[17] = 24'h012c48;
      expv[18] = 24'h00ddf7;
      expv[19] = 24'h00cc93;
      expv[20] = 24'h002415;
      expv[21] = 24'hffddbf;
      expv[22] = 24'h0f4009;
      expv[23] = 24'h051006;
      expv[24] = 24'h00a1ff;
      expv[25] = 24'h0d140e;
      expv[26] = 24'hfe6405;
      expv[27] = 24'h0151e1;
      expv[28] = 24'h0050e7;
      expv[29] = 24'h008000;
      expv[30] = 24'h0010bc;
      expv[31] = 24'h005dd2;
      expv[32] = 24'h007022;
      expv[33] = 24'h1cf000;
      expv[34] = 24'h015c3e;
      expv[35] = 24'hffdc21;
      expv[36] = 24'hffd8ab;
      expv[37] = 24'h0051ad;
      expv[38] = 24'h004999;
      expv[39] = 24'h007c83;
      expv[40] = 24'hffd5b5;
      expv[41] = 24'h001451;
      expv[42] = 24'hffb9e2;
      expv[43] = 24'h002902;
      expv[44] = 24'hf90808;
      expv[45] = 24'h00582d;
      expv[46] = 24'h012c60;
      expv[47] = 24'hff7028;
      expv[48] = 24'h003856;
      expv[49] = 24'h00745e;
      expv[50] = 24'hffb428;
      expv[51] = 24'hffc9ad;
      expv[52] = 24'h01481f;
      expv[53] = 24'h036c28;
      expv[54] = 24'hff5827;
      expv[55] = 24'h01ddd0;
      expv[56] = 24'hfe61f5;
      expv[57] = 24'h0081a9;
      expv[58] = 24'h062c11;
      expv[59] = 24'h00091b;
      expv[60] = 24'hfdd805;
      expv[61] = 24'h0040fb;
      expv[62] = 24'hfef5e8;
      expv[63] = 24'h004c9b;
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
