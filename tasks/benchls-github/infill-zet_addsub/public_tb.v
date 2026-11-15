// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_addsub dut (
    .x(in_vec[36:21]),
    .y(in_vec[20:5]),
    .f(in_vec[4:2]),
    .word_op(in_vec[1:1]),
    .cfi(in_vec[0:0]),
    .out(out_vec[18:3]),
    .cfo(out_vec[2:2]),
    .afo(out_vec[1:1]),
    .ofo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0a5a87afed;
    stim[1] = 37'h16f1723318;
    stim[2] = 37'h1a673b5130;
    stim[3] = 37'h0d2973c421;
    stim[4] = 37'h191272ffe4;
    stim[5] = 37'h09e3a3f546;
    stim[6] = 37'h0c17321f00;
    stim[7] = 37'h16c13128ed;
    stim[8] = 37'h09a2959870;
    stim[9] = 37'h03e161bc15;
    stim[10] = 37'h079d943c8b;
    stim[11] = 37'h185fdba8f5;
    stim[12] = 37'h0242724c0e;
    stim[13] = 37'h11adbe549f;
    stim[14] = 37'h062f8a5567;
    stim[15] = 37'h0d2943d7ff;
    stim[16] = 37'h17f679c69d;
    stim[17] = 37'h175709357e;
    stim[18] = 37'h18cfc30f7b;
    stim[19] = 37'h11cd13b74c;
    stim[20] = 37'h0f416f8c8b;
    stim[21] = 37'h146119d0e2;
    stim[22] = 37'h1d16d58a96;
    stim[23] = 37'h13beae3587;
    stim[24] = 37'h08f99136e5;
    stim[25] = 37'h1e324e2472;
    stim[26] = 37'h0b84ef46d8;
    stim[27] = 37'h0f90c8fad8;
    stim[28] = 37'h0fccff6cce;
    stim[29] = 37'h137dd85bda;
    stim[30] = 37'h1de0e35440;
    stim[31] = 37'h1731d3469b;
    stim[32] = 37'h0b9395bdad;
    stim[33] = 37'h0b55cbba26;
    stim[34] = 37'h0a2f16eb2a;
    stim[35] = 37'h0eacb0212d;
    stim[36] = 37'h1d89a187b8;
    stim[37] = 37'h1b300d2a2e;
    stim[38] = 37'h1d8f789db4;
    stim[39] = 37'h0ca309fd18;
    stim[40] = 37'h1d907bfff3;
    stim[41] = 37'h032ada77c0;
    stim[42] = 37'h0fc5d70303;
    stim[43] = 37'h0a8c370cd6;
    stim[44] = 37'h1b2652b19e;
    stim[45] = 37'h1d30ec668b;
    stim[46] = 37'h14ac3d8de9;
    stim[47] = 37'h036b061f45;
    stim[48] = 37'h0a8ca35dc7;
    stim[49] = 37'h18bd8cbaef;
    stim[50] = 37'h1a4d239fcb;
    stim[51] = 37'h1870043fc9;
    stim[52] = 37'h1e103f8405;
    stim[53] = 37'h0b7ed257f6;
    stim[54] = 37'h17f8d9429c;
    stim[55] = 37'h153587e7a3;
    stim[56] = 37'h0b1d88fbe2;
    stim[57] = 37'h0e1a7e8ab7;
    stim[58] = 37'h1580c5c302;
    stim[59] = 37'h1ef9a998d3;
    stim[60] = 37'h035b3d22cd;
    stim[61] = 37'h01ded901ca;
    stim[62] = 37'h171e24f21d;
    stim[63] = 37'h07dba3db2d;
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
      expv[0] = 19'h29a9c;
      expv[1] = 19'h12f98;
      expv[2] = 19'h7c585;
      expv[3] = 19'h03b68;
      expv[4] = 19'h30496;
      expv[5] = 19'h3763a;
      expv[6] = 19'h78d8e;
      expv[7] = 19'h5b286;
      expv[8] = 19'h5028c;
      expv[9] = 19'h0895c;
      expv[10] = 19'h6f686;
      expv[11] = 19'h72db8;
      expv[12] = 19'h09398;
      expv[13] = 19'h4d64c;
      expv[14] = 19'h4213b;
      expv[15] = 19'h2545c;
      expv[16] = 19'h78bff;
      expv[17] = 19'h38869;
      expv[18] = 19'h5701c;
      expv[19] = 19'h47910;
      expv[20] = 19'h7b37d;
      expv[21] = 19'h38c7d;
      expv[22] = 19'h1e310;
      expv[23] = 19'h07d0e;
      expv[24] = 19'h68c1e;
      expv[25] = 19'h4037a;
      expv[26] = 19'h70f88;
      expv[27] = 19'h1a580;
      expv[28] = 19'h3f668;
      expv[29] = 19'h6c880;
      expv[30] = 19'h04d48;
      expv[31] = 19'h0fad4;
      expv[32] = 19'h2ec4c;
      expv[33] = 19'h5c3f9;
      expv[34] = 19'h04688;
      expv[35] = 19'h3ab74;
      expv[36] = 19'h70080;
      expv[37] = 19'h6ce88;
      expv[38] = 19'h13c77;
      expv[39] = 19'h0a980;
      expv[40] = 19'h0641a;
      expv[41] = 19'h768a6;
      expv[42] = 19'h1b23e;
      expv[43] = 19'h4dfdf;
      expv[44] = 19'h21d30;
      expv[45] = 19'h265dc;
      expv[46] = 19'h48e87;
      expv[47] = 19'h26296;
      expv[48] = 19'h37a9a;
      expv[49] = 19'h6361c;
      expv[50] = 19'h77b3c;
      expv[51] = 19'h72bf5;
      expv[52] = 19'h76508;
      expv[53] = 19'h649bf;
      expv[54] = 19'h7ad90;
      expv[55] = 19'h74752;
      expv[56] = 19'h5065b;
      expv[57] = 19'h3e3f6;
      expv[58] = 19'h6d0f0;
      expv[59] = 19'h55830;
      expv[60] = 19'h0d77c;
      expv[61] = 19'h6b820;
      expv[62] = 19'h48b0c;
      expv[63] = 19'h1fdb4;
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
