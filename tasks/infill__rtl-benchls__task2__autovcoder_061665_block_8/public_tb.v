// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061665 dut (
    .in1(in_vec[63:63]),
    .in2(in_vec[62:55]),
    .in3(in_vec[54:32]),
    .in4(in_vec[31:24]),
    .in5(in_vec[23:1]),
    .in6(in_vec[0:0]),
    .out1(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h7569bd4e83f244b2;
    stim[1] = 64'h043df57d5aadee90;
    stim[2] = 64'haf7e40a6a03a8794;
    stim[3] = 64'hc107f95fca9d8670;
    stim[4] = 64'h0600cb56ce9d1cf7;
    stim[5] = 64'hbfc0039ea24ce006;
    stim[6] = 64'h43b3a52ad7720d7d;
    stim[7] = 64'h54b2d5114bb38cdb;
    stim[8] = 64'h32a7d61ba5ed6a5e;
    stim[9] = 64'ha4753c0bdb8b8808;
    stim[10] = 64'h1fc2bb322f1e2581;
    stim[11] = 64'hdb8e11d0ea19c91d;
    stim[12] = 64'hf385b154f123a34e;
    stim[13] = 64'h84b459dd7b23e400;
    stim[14] = 64'hed54f1d2ad59b044;
    stim[15] = 64'h8321d20b66652747;
    stim[16] = 64'h53afd4315a5bfd90;
    stim[17] = 64'h3e779c447ffc5432;
    stim[18] = 64'heb3a102be5724262;
    stim[19] = 64'h92d0fc970726e4c3;
    stim[20] = 64'h4b070e5557db7919;
    stim[21] = 64'h5291f0dff82cd2c1;
    stim[22] = 64'hf0e6a8b056cb6548;
    stim[23] = 64'h2431cd4e7f9b638f;
    stim[24] = 64'h30cc8244d55ce580;
    stim[25] = 64'h0c03bc62082ad84f;
    stim[26] = 64'ha4d045ac88ceafd0;
    stim[27] = 64'h478e0f0e820aac7f;
    stim[28] = 64'hc9f7c15ff1ea5b62;
    stim[29] = 64'h4eee61ff062e66ca;
    stim[30] = 64'h3a2e61170293884d;
    stim[31] = 64'h6db29c19429160e1;
    stim[32] = 64'haac2bca6d11edcbe;
    stim[33] = 64'h8824f18278cb0d1a;
    stim[34] = 64'h0802d0f2d2c2ac5b;
    stim[35] = 64'h4bf062b320d7e756;
    stim[36] = 64'h56607ef5ab7ed669;
    stim[37] = 64'h8a298f0cf66036c8;
    stim[38] = 64'h198b0b396bb951f1;
    stim[39] = 64'h90687b83083679b2;
    stim[40] = 64'h912757f58f1366de;
    stim[41] = 64'hc7f3f0528d95ff5c;
    stim[42] = 64'hf6c92211b3314b3d;
    stim[43] = 64'h575deea3c5a7ffd0;
    stim[44] = 64'h607d9cf02bd15e58;
    stim[45] = 64'haf7632906c8faea7;
    stim[46] = 64'hfeecca9af2f940fe;
    stim[47] = 64'h447330a3cd3c4258;
    stim[48] = 64'h03c90353ce5720d2;
    stim[49] = 64'hc36f9842ab1e09fc;
    stim[50] = 64'hc2b0b1c16b8a6456;
    stim[51] = 64'hf2a4cb102f9263da;
    stim[52] = 64'h8452e50e908af621;
    stim[53] = 64'h6ef1468727b1c116;
    stim[54] = 64'h3dc0423137887dba;
    stim[55] = 64'h2db2c6faed8f3b75;
    stim[56] = 64'h0c10f4b260e1901f;
    stim[57] = 64'hdf4627cbdc3011d4;
    stim[58] = 64'h9b6142be2a2f5e1f;
    stim[59] = 64'h378942ddccdd587b;
    stim[60] = 64'hd07eb1d156a171d2;
    stim[61] = 64'h1b3fb3b6d46e2833;
    stim[62] = 64'h4a8e880598d5111a;
    stim[63] = 64'h775765b36816c2ed;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h0;
      expv[25] = 2'h1;
      expv[26] = 2'h0;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h0;
      expv[38] = 2'h1;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h1;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
      expv[62] = 2'h0;
      expv[63] = 2'h1;
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
