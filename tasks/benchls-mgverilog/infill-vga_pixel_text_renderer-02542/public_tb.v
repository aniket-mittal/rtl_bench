// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02542 dut (
    .clk(clk),
    .data_in(in_vec[40:25]),
    .vga_h(in_vec[24:14]),
    .vga_v(in_vec[13:3]),
    .bg(in_vec[2:0]),
    .pixel_out(out_vec[3:1]),
    .display_on(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h16da46090bd;
    stim[1] = 41'h0d6bdde3438;
    stim[2] = 41'h01ca3201a37;
    stim[3] = 41'h1086597be9d;
    stim[4] = 41'h022a7624448;
    stim[5] = 41'h01011c9e5b2;
    stim[6] = 41'h068d48cd296;
    stim[7] = 41'h120180f756e;
    stim[8] = 41'h074f2b273f4;
    stim[9] = 41'h0e78432774d;
    stim[10] = 41'h00e0a1b691b;
    stim[11] = 41'h1b3c7e0f7b2;
    stim[12] = 41'h0446b67ce25;
    stim[13] = 41'h087c9c8e2d6;
    stim[14] = 41'h170d2786e69;
    stim[15] = 41'h0b2da359dd6;
    stim[16] = 41'h1b5f9a52bee;
    stim[17] = 41'h043dc2b58d3;
    stim[18] = 41'h090817bb9a6;
    stim[19] = 41'h017c85ad722;
    stim[20] = 41'h161e91b6d6b;
    stim[21] = 41'h19ecd1d5929;
    stim[22] = 41'h0bc6e729f27;
    stim[23] = 41'h16d1918ad32;
    stim[24] = 41'h1b9eff7f343;
    stim[25] = 41'h1832494c362;
    stim[26] = 41'h01b718102e0;
    stim[27] = 41'h0f87dbb8948;
    stim[28] = 41'h01429800b50;
    stim[29] = 41'h08c0e2fed96;
    stim[30] = 41'h087755c9ecd;
    stim[31] = 41'h0e723fde1cd;
    stim[32] = 41'h15123b3a720;
    stim[33] = 41'h149bc710e71;
    stim[34] = 41'h193741d1833;
    stim[35] = 41'h17d234cc6c3;
    stim[36] = 41'h17b8b8aabba;
    stim[37] = 41'h1e87705da70;
    stim[38] = 41'h0d5777f0a7f;
    stim[39] = 41'h143dee5e237;
    stim[40] = 41'h036b5ed0920;
    stim[41] = 41'h1aefd09e0f4;
    stim[42] = 41'h031adba876a;
    stim[43] = 41'h15eed310ff8;
    stim[44] = 41'h0e5dd032600;
    stim[45] = 41'h0addfd4e33f;
    stim[46] = 41'h1b7a1d7643b;
    stim[47] = 41'h0154c740639;
    stim[48] = 41'h0a34b756448;
    stim[49] = 41'h162e007f4d2;
    stim[50] = 41'h07b324b80da;
    stim[51] = 41'h100394f8d0f;
    stim[52] = 41'h1fc5de9dc82;
    stim[53] = 41'h0b626931dd9;
    stim[54] = 41'h1dbb785fcf9;
    stim[55] = 41'h0bfbd2bf9e8;
    stim[56] = 41'h15910a80eaf;
    stim[57] = 41'h0647e09fefa;
    stim[58] = 41'h069091bfe1f;
    stim[59] = 41'h13da0c0c33f;
    stim[60] = 41'h0848edb2114;
    stim[61] = 41'h069a68b240c;
    stim[62] = 41'h095f9526246;
    stim[63] = 41'h117ce526f26;
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
      expv[0] = 4'h0;
      expv[1] = 4'ha;
      expv[2] = 4'h0;
      expv[3] = 4'he;
      expv[4] = 4'ha;
      expv[5] = 4'h0;
      expv[6] = 4'h4;
      expv[7] = 4'hc;
      expv[8] = 4'hc;
      expv[9] = 4'h8;
      expv[10] = 4'ha;
      expv[11] = 4'h6;
      expv[12] = 4'h4;
      expv[13] = 4'ha;
      expv[14] = 4'hc;
      expv[15] = 4'h2;
      expv[16] = 4'hc;
      expv[17] = 4'hc;
      expv[18] = 4'h6;
      expv[19] = 4'hc;
      expv[20] = 4'h4;
      expv[21] = 4'h6;
      expv[22] = 4'h2;
      expv[23] = 4'he;
      expv[24] = 4'h4;
      expv[25] = 4'h6;
      expv[26] = 4'h4;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'hc;
      expv[31] = 4'ha;
      expv[32] = 4'ha;
      expv[33] = 4'h0;
      expv[34] = 4'h2;
      expv[35] = 4'h6;
      expv[36] = 4'h6;
      expv[37] = 4'h4;
      expv[38] = 4'h0;
      expv[39] = 4'he;
      expv[40] = 4'he;
      expv[41] = 4'h0;
      expv[42] = 4'h8;
      expv[43] = 4'h4;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'he;
      expv[47] = 4'h6;
      expv[48] = 4'h2;
      expv[49] = 4'h0;
      expv[50] = 4'h4;
      expv[51] = 4'h4;
      expv[52] = 4'he;
      expv[53] = 4'h4;
      expv[54] = 4'h2;
      expv[55] = 4'h2;
      expv[56] = 4'h0;
      expv[57] = 4'he;
      expv[58] = 4'h4;
      expv[59] = 4'he;
      expv[60] = 4'he;
      expv[61] = 4'h8;
      expv[62] = 4'h8;
      expv[63] = 4'hc;
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
