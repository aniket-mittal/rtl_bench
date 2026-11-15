// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_137527 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .start(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .miso(in_vec[0:0]),
    .sck(out_vec[10:10]),
    .cs(out_vec[9:9]),
    .data_out(out_vec[8:1]),
    .data_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h53d;
    stim[1] = 11'h7ca;
    stim[2] = 11'h37c;
    stim[3] = 11'h104;
    stim[4] = 11'h0aa;
    stim[5] = 11'h0e3;
    stim[6] = 11'h143;
    stim[7] = 11'h285;
    stim[8] = 11'h061;
    stim[9] = 11'h13b;
    stim[10] = 11'h116;
    stim[11] = 11'h1a2;
    stim[12] = 11'h2b1;
    stim[13] = 11'h36d;
    stim[14] = 11'h098;
    stim[15] = 11'h321;
    stim[16] = 11'h08f;
    stim[17] = 11'h054;
    stim[18] = 11'h1bf;
    stim[19] = 11'h2be;
    stim[20] = 11'h176;
    stim[21] = 11'h10d;
    stim[22] = 11'h3cf;
    stim[23] = 11'h7e6;
    stim[24] = 11'h0b4;
    stim[25] = 11'h176;
    stim[26] = 11'h075;
    stim[27] = 11'h094;
    stim[28] = 11'h304;
    stim[29] = 11'h0fd;
    stim[30] = 11'h0ec;
    stim[31] = 11'h263;
    stim[32] = 11'h374;
    stim[33] = 11'h112;
    stim[34] = 11'h3c3;
    stim[35] = 11'h014;
    stim[36] = 11'h3bd;
    stim[37] = 11'h386;
    stim[38] = 11'h152;
    stim[39] = 11'h187;
    stim[40] = 11'h14c;
    stim[41] = 11'h23a;
    stim[42] = 11'h1bb;
    stim[43] = 11'h16e;
    stim[44] = 11'h399;
    stim[45] = 11'h153;
    stim[46] = 11'h1ae;
    stim[47] = 11'h1d7;
    stim[48] = 11'h15e;
    stim[49] = 11'h386;
    stim[50] = 11'h222;
    stim[51] = 11'h3b8;
    stim[52] = 11'h179;
    stim[53] = 11'h174;
    stim[54] = 11'h39c;
    stim[55] = 11'h18f;
    stim[56] = 11'h36a;
    stim[57] = 11'h14c;
    stim[58] = 11'h199;
    stim[59] = 11'h7bd;
    stim[60] = 11'h09f;
    stim[61] = 11'h2d4;
    stim[62] = 11'h214;
    stim[63] = 11'h3f6;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'hxxc;
      expv[10] = 11'hxxc;
      expv[11] = 11'hxxc;
      expv[12] = 11'hxxc;
      expv[13] = 11'hxxc;
      expv[14] = 11'hxxc;
      expv[15] = 11'hxxc;
      expv[16] = 11'hxxc;
      expv[17] = 11'hxac;
      expv[18] = 11'hxac;
      expv[19] = 11'h3ad;
      expv[20] = 11'h1ac;
      expv[21] = 11'h5ac;
      expv[22] = 11'h1ae;
      expv[23] = 11'h3ae;
      expv[24] = 11'h3ae;
      expv[25] = 11'h3ae;
      expv[26] = 11'h3ae;
      expv[27] = 11'h3ae;
      expv[28] = 11'h3ae;
      expv[29] = 11'h1ae;
      expv[30] = 11'h5ae;
      expv[31] = 11'h1ac;
      expv[32] = 11'h5ac;
      expv[33] = 11'h1a8;
      expv[34] = 11'h5a8;
      expv[35] = 11'h1a8;
      expv[36] = 11'h5a8;
      expv[37] = 11'h1b8;
      expv[38] = 11'h5b8;
      expv[39] = 11'h198;
      expv[40] = 11'h598;
      expv[41] = 11'h198;
      expv[42] = 11'h598;
      expv[43] = 11'h198;
      expv[44] = 11'h598;
      expv[45] = 11'h399;
      expv[46] = 11'h399;
      expv[47] = 11'h399;
      expv[48] = 11'h399;
      expv[49] = 11'h399;
      expv[50] = 11'h198;
      expv[51] = 11'h598;
      expv[52] = 11'h198;
      expv[53] = 11'h598;
      expv[54] = 11'h198;
      expv[55] = 11'h598;
      expv[56] = 11'h198;
      expv[57] = 11'h598;
      expv[58] = 11'h188;
      expv[59] = 11'h388;
      expv[60] = 11'h388;
      expv[61] = 11'h388;
      expv[62] = 11'h188;
      expv[63] = 11'h588;
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
