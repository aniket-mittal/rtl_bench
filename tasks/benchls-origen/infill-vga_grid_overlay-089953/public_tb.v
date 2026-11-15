// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089953 dut (
    .VGA_HORZ_COORD(in_vec[71:60]),
    .VGA_VERT_COORD(in_vec[59:48]),
    .background(in_vec[47:36]),
    .axes(in_vec[35:24]),
    .grid(in_vec[23:12]),
    .ticks(in_vec[11:0]),
    .VGA_Red_Grid(out_vec[11:8]),
    .VGA_Green_Grid(out_vec[7:4]),
    .VGA_Blue_Grid(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'he709d3939a08d5d302;
    stim[1] = 72'h089da47e837bada0b8;
    stim[2] = 72'h13e24407e79085f295;
    stim[3] = 72'hedbb36b268b9c69fac;
    stim[4] = 72'h2fd5ac820786093def;
    stim[5] = 72'h3d0a14339950d8c30c;
    stim[6] = 72'he8f9a60030f634a66c;
    stim[7] = 72'h79be19f5db950edf49;
    stim[8] = 72'h788a3f38feb918cd67;
    stim[9] = 72'hfc635f31373098d337;
    stim[10] = 72'h23bc784452810a8bcb;
    stim[11] = 72'hee2d58006223a17569;
    stim[12] = 72'h544f0518022ded3469;
    stim[13] = 72'habbcb5d699aab4ff29;
    stim[14] = 72'h4135886e710d0688a4;
    stim[15] = 72'h1d286e1e59fb5c6252;
    stim[16] = 72'h1d031e52f1c48f51d4;
    stim[17] = 72'hb4b111f99f2bb4c74e;
    stim[18] = 72'h0fc185418349002fed;
    stim[19] = 72'he53d798e05d87972ac;
    stim[20] = 72'h710332fa7b475498f7;
    stim[21] = 72'h654f468bfce1d95207;
    stim[22] = 72'hfec2b745aa6df8ebdf;
    stim[23] = 72'h5a2cfbd0faeb98c072;
    stim[24] = 72'had3d3661babb4ed9d5;
    stim[25] = 72'hd4d9682e8d4a70be6b;
    stim[26] = 72'h687c513ef9f242b277;
    stim[27] = 72'h738a4335ff861f0ec4;
    stim[28] = 72'h2a2ab8ccdfeec88b80;
    stim[29] = 72'h5e7fce32e47ac87056;
    stim[30] = 72'h1111b5b2d6ae144f1c;
    stim[31] = 72'h32ccfb371b2be3bb83;
    stim[32] = 72'h4b943407c5682205b1;
    stim[33] = 72'h8434b59cdbe183b765;
    stim[34] = 72'h032f05ac5eabcfdbd5;
    stim[35] = 72'h45a22c7d8abe30a58e;
    stim[36] = 72'h529077a6a891d4c6df;
    stim[37] = 72'heff428215af83d2b38;
    stim[38] = 72'h7525844bc04d5a02de;
    stim[39] = 72'h779cfa6a618665b5da;
    stim[40] = 72'ha2b11902d4a123b9a1;
    stim[41] = 72'h3c340a4227dfc48ba2;
    stim[42] = 72'h5ab793f54533f87cc6;
    stim[43] = 72'hf8a5214a778760b30d;
    stim[44] = 72'hb1a2121bda62e8b745;
    stim[45] = 72'h56f4ae6481adf3b803;
    stim[46] = 72'h927621427a96a4248f;
    stim[47] = 72'hb8b8384465d5f1a131;
    stim[48] = 72'hf19d905d5f05ce4b27;
    stim[49] = 72'hb471ae8772e50db247;
    stim[50] = 72'hcd6fbfe52a07c67075;
    stim[51] = 72'h2979eee9f600e8e99e;
    stim[52] = 72'haa21a25b7042a12050;
    stim[53] = 72'h7862e93c020edc6fd0;
    stim[54] = 72'h9d6cb8d3b8c050b90f;
    stim[55] = 72'h051095edcfb279c970;
    stim[56] = 72'h4dede0438f1e595ce7;
    stim[57] = 72'h12b0e4f1b0976014cb;
    stim[58] = 72'h1ed2d868c5b3ecf1e7;
    stim[59] = 72'h76291382ed1089fa41;
    stim[60] = 72'hbfb48d9dcdd405a887;
    stim[61] = 72'h6a8f0aed0bcbef1085;
    stim[62] = 72'h44128a74f58040fa61;
    stim[63] = 72'h3e8b8a4660fde324de;
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
      expv[0] = 12'h939;
      expv[1] = 12'h7e8;
      expv[2] = 12'h07e;
      expv[3] = 12'hb26;
      expv[4] = 12'h820;
      expv[5] = 12'h339;
      expv[6] = 12'h003;
      expv[7] = 12'hf5d;
      expv[8] = 12'h38f;
      expv[9] = 12'h313;
      expv[10] = 12'h445;
      expv[11] = 12'h006;
      expv[12] = 12'h180;
      expv[13] = 12'hd69;
      expv[14] = 12'h6e7;
      expv[15] = 12'h1e5;
      expv[16] = 12'h52f;
      expv[17] = 12'hf99;
      expv[18] = 12'h418;
      expv[19] = 12'h8e0;
      expv[20] = 12'hfa7;
      expv[21] = 12'h8bf;
      expv[22] = 12'h45a;
      expv[23] = 12'hd0f;
      expv[24] = 12'h61b;
      expv[25] = 12'h2e8;
      expv[26] = 12'h3ef;
      expv[27] = 12'h35f;
      expv[28] = 12'hccd;
      expv[29] = 12'h32e;
      expv[30] = 12'hb2d;
      expv[31] = 12'h371;
      expv[32] = 12'h07c;
      expv[33] = 12'h9cd;
      expv[34] = 12'hac5;
      expv[35] = 12'h7d8;
      expv[36] = 12'ha6a;
      expv[37] = 12'h215;
      expv[38] = 12'h4bc;
      expv[39] = 12'h6a6;
      expv[40] = 12'h02d;
      expv[41] = 12'h422;
      expv[42] = 12'hf54;
      expv[43] = 12'h4a7;
      expv[44] = 12'h1bd;
      expv[45] = 12'h648;
      expv[46] = 12'h427;
      expv[47] = 12'h446;
      expv[48] = 12'h5d5;
      expv[49] = 12'h877;
      expv[50] = 12'he52;
      expv[51] = 12'he9f;
      expv[52] = 12'h5b7;
      expv[53] = 12'h3c0;
      expv[54] = 12'hd3b;
      expv[55] = 12'hedc;
      expv[56] = 12'h595;
      expv[57] = 12'hf1b;
      expv[58] = 12'h68c;
      expv[59] = 12'h82e;
      expv[60] = 12'h9dc;
      expv[61] = 12'hed0;
      expv[62] = 12'h74f;
      expv[63] = 12'h466;
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
