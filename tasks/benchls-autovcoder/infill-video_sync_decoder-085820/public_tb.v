// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085820 dut (
    .CLK(clk),
    .DI(in_vec[7:1]),
    .nDSYNC(in_vec[0:0]),
    .R_o(out_vec[24:18]),
    .G_o(out_vec[17:11]),
    .B_o(out_vec[10:4]),
    .nCSYNC(out_vec[3:3]),
    .nHSYNC(out_vec[2:2]),
    .nVSYNC(out_vec[1:1]),
    .nCLAMP(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h1f;
    stim[1] = 8'h17;
    stim[2] = 8'hc0;
    stim[3] = 8'h72;
    stim[4] = 8'h43;
    stim[5] = 8'h64;
    stim[6] = 8'h21;
    stim[7] = 8'hc5;
    stim[8] = 8'hbd;
    stim[9] = 8'h36;
    stim[10] = 8'ha5;
    stim[11] = 8'h5e;
    stim[12] = 8'hfd;
    stim[13] = 8'h4d;
    stim[14] = 8'h09;
    stim[15] = 8'ha7;
    stim[16] = 8'hd0;
    stim[17] = 8'hce;
    stim[18] = 8'hb3;
    stim[19] = 8'hf3;
    stim[20] = 8'h35;
    stim[21] = 8'he0;
    stim[22] = 8'h40;
    stim[23] = 8'hc7;
    stim[24] = 8'h5a;
    stim[25] = 8'h51;
    stim[26] = 8'h5c;
    stim[27] = 8'hc4;
    stim[28] = 8'h0d;
    stim[29] = 8'he2;
    stim[30] = 8'h8b;
    stim[31] = 8'hda;
    stim[32] = 8'h67;
    stim[33] = 8'hc1;
    stim[34] = 8'heb;
    stim[35] = 8'h10;
    stim[36] = 8'h46;
    stim[37] = 8'hf3;
    stim[38] = 8'h77;
    stim[39] = 8'h99;
    stim[40] = 8'hab;
    stim[41] = 8'h4e;
    stim[42] = 8'h50;
    stim[43] = 8'he0;
    stim[44] = 8'ha7;
    stim[45] = 8'hd8;
    stim[46] = 8'h42;
    stim[47] = 8'h98;
    stim[48] = 8'h64;
    stim[49] = 8'hba;
    stim[50] = 8'h0a;
    stim[51] = 8'h29;
    stim[52] = 8'h2d;
    stim[53] = 8'h77;
    stim[54] = 8'he8;
    stim[55] = 8'h46;
    stim[56] = 8'h36;
    stim[57] = 8'h08;
    stim[58] = 8'he1;
    stim[59] = 8'h5c;
    stim[60] = 8'h11;
    stim[61] = 8'h95;
    stim[62] = 8'h8b;
    stim[63] = 8'he6;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'hxxxxxxx;
      expv[2] = 25'hxxxxxxx;
      expv[3] = 25'hxxxxxx0;
      expv[4] = 25'hxxxxxxa;
      expv[5] = 25'hxxxxxxa;
      expv[6] = 25'hxxxxxx4;
      expv[7] = 25'hxxxxxx4;
      expv[8] = 25'hxxxxxx4;
      expv[9] = 25'hxxxxxx4;
      expv[10] = 25'hxxxxxxe;
      expv[11] = 25'h14xxxxe;
      expv[12] = 25'h14xxxxf;
      expv[13] = 25'h14xxxxf;
      expv[14] = 25'h14xxxxf;
      expv[15] = 25'h14xxxxf;
      expv[16] = 25'h14xxxxf;
      expv[17] = 25'h14xxxx2;
      expv[18] = 25'h14xxxxd;
      expv[19] = 25'h16xxxxd;
      expv[20] = 25'h167cxxd;
      expv[21] = 25'h167c9ad;
      expv[22] = 25'h167c9a0;
      expv[23] = 25'h167c9a0;
      expv[24] = 25'h18fc9a0;
      expv[25] = 25'h18fc9ab;
      expv[26] = 25'h0a3c9ab;
      expv[27] = 25'h0a3c9a7;
      expv[28] = 25'h0a3c9a4;
      expv[29] = 25'h01bc9a4;
      expv[30] = 25'h01bc9a8;
      expv[31] = 25'h117c9a8;
      expv[32] = 25'h117c9ab;
      expv[33] = 25'h117c9ab;
      expv[34] = 25'h117c9ab;
      expv[35] = 25'h117c9ab;
      expv[36] = 25'h117c9a2;
      expv[37] = 25'h117c9ac;
      expv[38] = 25'h1e7c9ac;
      expv[39] = 25'h1e5d9ac;
      expv[40] = 25'h1e5dccc;
      expv[41] = 25'h1e5dccc;
      expv[42] = 25'h1e5dccd;
      expv[43] = 25'h1e5dcc2;
      expv[44] = 25'h1e5dcc0;
      expv[45] = 25'h1e5dcc0;
      expv[46] = 25'h1e5dcc3;
      expv[47] = 25'h1e5dcc8;
      expv[48] = 25'h1e5dcc3;
      expv[49] = 25'h1e5dcc4;
      expv[50] = 25'h1e5dccb;
      expv[51] = 25'h1e5dcc9;
      expv[52] = 25'h1e5dcc9;
      expv[53] = 25'h1e5dcc9;
      expv[54] = 25'h1e5dcc9;
      expv[55] = 25'h1e5dcc1;
      expv[56] = 25'h1e5dccc;
      expv[57] = 25'h1e5dcce;
      expv[58] = 25'h1e5dcc1;
      expv[59] = 25'h1c1dcc1;
      expv[60] = 25'h1c1dcc7;
      expv[61] = 25'h1c1dcc7;
      expv[62] = 25'h1c1dcc7;
      expv[63] = 25'h1c1dcc7;
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
