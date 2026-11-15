// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02619 dut (
    .inword(in_vec[66:3]),
    .sel(in_vec[2:0]),
    .outbyte(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h127cfefe714f54cec;
    stim[1] = 67'h74f2a0247a9df5c92;
    stim[2] = 67'h7068da3aba7658095;
    stim[3] = 67'h00925f243d23998d3;
    stim[4] = 67'h590f2edbd9cb3bd67;
    stim[5] = 67'h7810ced093a9f1658;
    stim[6] = 67'h6c0148adedfde414d;
    stim[7] = 67'h32e9c3c7aeb4a3558;
    stim[8] = 67'h25472ce50e2adac83;
    stim[9] = 67'h5aa2346493557f608;
    stim[10] = 67'h3597979d0d0cdcc77;
    stim[11] = 67'h7a8f0b76ea58fe69e;
    stim[12] = 67'h03aedafea30e831e0;
    stim[13] = 67'h78fbe49ded1b92858;
    stim[14] = 67'h11d5956905e61cda5;
    stim[15] = 67'h6d97c75b904b9edd9;
    stim[16] = 67'h09116d85cddcd24e5;
    stim[17] = 67'h09e26f947ac3b4c06;
    stim[18] = 67'h6c701d2d13926ecc4;
    stim[19] = 67'h1a5e842fca40c6f19;
    stim[20] = 67'h7488eefcef0f43d93;
    stim[21] = 67'h48a8a314903fc056c;
    stim[22] = 67'h326e28c05a9f95e27;
    stim[23] = 67'h32350d93597eea94e;
    stim[24] = 67'h14f06e0f3cdadf2f7;
    stim[25] = 67'h531bed4306ca9656d;
    stim[26] = 67'h188a34b30cd4dcee1;
    stim[27] = 67'h0ade27242e0573be9;
    stim[28] = 67'h1d73b1b115f240c21;
    stim[29] = 67'h4111467ab1073c60f;
    stim[30] = 67'h38b37c16dec38c7f3;
    stim[31] = 67'h7e91b13eda198bd2c;
    stim[32] = 67'h0dc38a2038d8b0240;
    stim[33] = 67'h66707a9a4d83e1569;
    stim[34] = 67'h253592061fc3330a4;
    stim[35] = 67'h4ae48ebf28ca1cf02;
    stim[36] = 67'h44d9d67e169c47157;
    stim[37] = 67'h67ba4469b26f99a09;
    stim[38] = 67'h4b0fd6d6f0c84e185;
    stim[39] = 67'h11596447f52238873;
    stim[40] = 67'h046e149f3abddbeac;
    stim[41] = 67'h16a824a74993b57c3;
    stim[42] = 67'h227b645fd5b69677c;
    stim[43] = 67'h1180605bafde0294c;
    stim[44] = 67'h7031bc1ec42e8a7e8;
    stim[45] = 67'h550b84248c49122c1;
    stim[46] = 67'h58fc34070cd9273e2;
    stim[47] = 67'h3590c8ce64402f265;
    stim[48] = 67'h63094f7bdc4e90171;
    stim[49] = 67'h6c0a2d85460598782;
    stim[50] = 67'h7ace553cb0d6c94c8;
    stim[51] = 67'h4848f048804457e79;
    stim[52] = 67'h3d7a857be2ea1c0de;
    stim[53] = 67'h0bdc94e9fcbc40289;
    stim[54] = 67'h4b9a993fc37463f5c;
    stim[55] = 67'h52ec21fc17d24609d;
    stim[56] = 67'h7871aea287c3e032c;
    stim[57] = 67'h7b42f35e492950132;
    stim[58] = 67'h469965c59e832edf7;
    stim[59] = 67'h2c350b3cad0d87fe3;
    stim[60] = 67'h38c02f20361dba53a;
    stim[61] = 67'h57a5354fc86c2a1f5;
    stim[62] = 67'h7029808c8d4c2c8fe;
    stim[63] = 67'h71008acf706d21696;
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
      expv[0] = 8'hfc;
      expv[1] = 8'h3b;
      expv[2] = 8'hb4;
      expv[3] = 8'h7a;
      expv[4] = 8'hb2;
      expv[5] = 8'hcb;
      expv[6] = 8'h91;
      expv[7] = 8'hab;
      expv[8] = 8'h1c;
      expv[9] = 8'hc1;
      expv[10] = 8'h6b;
      expv[11] = 8'h1e;
      expv[12] = 8'h3c;
      expv[13] = 8'h0b;
      expv[14] = 8'h2a;
      expv[15] = 8'h3d;
      expv[16] = 8'hdb;
      expv[17] = 8'hc4;
      expv[18] = 8'h5a;
      expv[19] = 8'h8d;
      expv[20] = 8'hde;
      expv[21] = 8'h29;
      expv[22] = 8'h64;
      expv[23] = 8'h6a;
      expv[24] = 8'h29;
      expv[25] = 8'hda;
      expv[26] = 8'hb9;
      expv[27] = 8'he7;
      expv[28] = 8'h81;
      expv[29] = 8'h82;
      expv[30] = 8'hbd;
      expv[31] = 8'h7d;
      expv[32] = 8'h48;
      expv[33] = 8'hc2;
      expv[34] = 8'h0c;
      expv[35] = 8'h94;
      expv[36] = 8'h89;
      expv[37] = 8'h33;
      expv[38] = 8'had;
      expv[39] = 8'hea;
      expv[40] = 8'h3e;
      expv[41] = 8'h93;
      expv[42] = 8'hbf;
      expv[43] = 8'hb7;
      expv[44] = 8'hfd;
      expv[45] = 8'h24;
      expv[46] = 8'hb2;
      expv[47] = 8'h91;
      expv[48] = 8'h20;
      expv[49] = 8'h0b;
      expv[50] = 8'h99;
      expv[51] = 8'haf;
      expv[52] = 8'hf5;
      expv[53] = 8'h80;
      expv[54] = 8'h7f;
      expv[55] = 8'h43;
      expv[56] = 8'h45;
      expv[57] = 8'h52;
      expv[58] = 8'h8d;
      expv[59] = 8'h5a;
      expv[60] = 8'h3b;
      expv[61] = 8'h6a;
      expv[62] = 8'h53;
      expv[63] = 8'h01;
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
