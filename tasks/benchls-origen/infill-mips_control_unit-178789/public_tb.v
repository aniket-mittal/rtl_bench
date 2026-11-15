// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178789 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegDst(out_vec[12:12]),
    .Jump(out_vec[11:11]),
    .Branch(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemtoReg(out_vec[8:8]),
    .aluo(out_vec[7:4]),
    .MemWrite(out_vec[3:3]),
    .AluSrc(out_vec[2:2]),
    .RegWrite(out_vec[1:1]),
    .bne(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h5ea;
    stim[1] = 12'he3e;
    stim[2] = 12'h4e7;
    stim[3] = 12'hc85;
    stim[4] = 12'h5df;
    stim[5] = 12'haeb;
    stim[6] = 12'ha60;
    stim[7] = 12'hae9;
    stim[8] = 12'h336;
    stim[9] = 12'hf83;
    stim[10] = 12'hecc;
    stim[11] = 12'hd17;
    stim[12] = 12'h02a;
    stim[13] = 12'h0f9;
    stim[14] = 12'haf1;
    stim[15] = 12'h48b;
    stim[16] = 12'h4b2;
    stim[17] = 12'hf56;
    stim[18] = 12'h410;
    stim[19] = 12'h735;
    stim[20] = 12'h1cf;
    stim[21] = 12'hdef;
    stim[22] = 12'hc55;
    stim[23] = 12'hf09;
    stim[24] = 12'h5b8;
    stim[25] = 12'h895;
    stim[26] = 12'h1d6;
    stim[27] = 12'hefd;
    stim[28] = 12'h970;
    stim[29] = 12'h2d3;
    stim[30] = 12'h93c;
    stim[31] = 12'h948;
    stim[32] = 12'h555;
    stim[33] = 12'h147;
    stim[34] = 12'h29d;
    stim[35] = 12'h98e;
    stim[36] = 12'he15;
    stim[37] = 12'h2cc;
    stim[38] = 12'h4ff;
    stim[39] = 12'h2fe;
    stim[40] = 12'h7b7;
    stim[41] = 12'h44c;
    stim[42] = 12'h818;
    stim[43] = 12'hf2b;
    stim[44] = 12'h400;
    stim[45] = 12'hc1b;
    stim[46] = 12'hec2;
    stim[47] = 12'h72b;
    stim[48] = 12'hb23;
    stim[49] = 12'h4ef;
    stim[50] = 12'he46;
    stim[51] = 12'h14f;
    stim[52] = 12'hef2;
    stim[53] = 12'hc09;
    stim[54] = 12'h4ca;
    stim[55] = 12'hbd9;
    stim[56] = 12'ha38;
    stim[57] = 12'he88;
    stim[58] = 12'h287;
    stim[59] = 12'hefb;
    stim[60] = 12'h2ac;
    stim[61] = 12'h8d3;
    stim[62] = 12'h03b;
    stim[63] = 12'h85d;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h000c;
      expv[6] = 13'h0000;
      expv[7] = 13'h000c;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h1042;
      expv[13] = 13'h0000;
      expv[14] = 13'h000c;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0411;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0411;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0306;
      expv[62] = 13'h1002;
      expv[63] = 13'h0000;
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
