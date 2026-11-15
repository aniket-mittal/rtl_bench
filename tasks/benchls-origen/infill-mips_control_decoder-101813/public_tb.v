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

  origen_101813 dut (
    .op(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .MemToReg(out_vec[12:12]),
    .MemWrite(out_vec[11:11]),
    .MemRead(out_vec[10:10]),
    .Branch(out_vec[9:9]),
    .ALUSrc(out_vec[8:8]),
    .RegDst(out_vec[7:7]),
    .RegWrite(out_vec[6:6]),
    .ALUOp(out_vec[5:4]),
    .ALUControl(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb58;
    stim[1] = 12'hd9a;
    stim[2] = 12'h9eb;
    stim[3] = 12'hcc3;
    stim[4] = 12'h97e;
    stim[5] = 12'h415;
    stim[6] = 12'h4ae;
    stim[7] = 12'hf03;
    stim[8] = 12'h430;
    stim[9] = 12'h01c;
    stim[10] = 12'h9a5;
    stim[11] = 12'hc72;
    stim[12] = 12'h54f;
    stim[13] = 12'hfc4;
    stim[14] = 12'h2bd;
    stim[15] = 12'ha43;
    stim[16] = 12'h377;
    stim[17] = 12'hab7;
    stim[18] = 12'hf76;
    stim[19] = 12'hed2;
    stim[20] = 12'hbf4;
    stim[21] = 12'h213;
    stim[22] = 12'h414;
    stim[23] = 12'h0c3;
    stim[24] = 12'h01f;
    stim[25] = 12'h951;
    stim[26] = 12'h4a9;
    stim[27] = 12'hedb;
    stim[28] = 12'hfdd;
    stim[29] = 12'h849;
    stim[30] = 12'h8c5;
    stim[31] = 12'h0ca;
    stim[32] = 12'hb95;
    stim[33] = 12'h2ef;
    stim[34] = 12'h95e;
    stim[35] = 12'h059;
    stim[36] = 12'hf70;
    stim[37] = 12'h230;
    stim[38] = 12'h898;
    stim[39] = 12'h12c;
    stim[40] = 12'h4ad;
    stim[41] = 12'h984;
    stim[42] = 12'hb2a;
    stim[43] = 12'h05a;
    stim[44] = 12'h679;
    stim[45] = 12'h879;
    stim[46] = 12'hb94;
    stim[47] = 12'hacb;
    stim[48] = 12'h879;
    stim[49] = 12'h16c;
    stim[50] = 12'h036;
    stim[51] = 12'h18e;
    stim[52] = 12'h077;
    stim[53] = 12'h3fb;
    stim[54] = 12'h3d4;
    stim[55] = 12'h7cb;
    stim[56] = 12'h38d;
    stim[57] = 12'hbb3;
    stim[58] = 12'h9e9;
    stim[59] = 12'hec0;
    stim[60] = 12'h855;
    stim[61] = 12'hd61;
    stim[62] = 12'h348;
    stim[63] = 12'h96c;
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
      expv[0] = 13'hxxx6;
      expv[1] = 13'hxxx6;
      expv[2] = 13'hxxx6;
      expv[3] = 13'hxxx6;
      expv[4] = 13'hxxx6;
      expv[5] = 13'hxxx6;
      expv[6] = 13'hxxx6;
      expv[7] = 13'hxxx6;
      expv[8] = 13'hxxx6;
      expv[9] = 13'h00e6;
      expv[10] = 13'hxxx6;
      expv[11] = 13'hxxx6;
      expv[12] = 13'hxxx6;
      expv[13] = 13'hxxx6;
      expv[14] = 13'hxxx6;
      expv[15] = 13'hxxx6;
      expv[16] = 13'hxxx6;
      expv[17] = 13'hxxx6;
      expv[18] = 13'hxxx6;
      expv[19] = 13'hxxx6;
      expv[20] = 13'hxxx6;
      expv[21] = 13'hxxx6;
      expv[22] = 13'hxxx6;
      expv[23] = 13'hxxx6;
      expv[24] = 13'h00e6;
      expv[25] = 13'hxxx6;
      expv[26] = 13'hxxx6;
      expv[27] = 13'hxxx6;
      expv[28] = 13'hxxx6;
      expv[29] = 13'hxxx6;
      expv[30] = 13'h1542;
      expv[31] = 13'hxxx6;
      expv[32] = 13'hxxx6;
      expv[33] = 13'hxxx6;
      expv[34] = 13'hxxx6;
      expv[35] = 13'hxxx6;
      expv[36] = 13'hxxx6;
      expv[37] = 13'hxxx6;
      expv[38] = 13'hxxx6;
      expv[39] = 13'hx2x6;
      expv[40] = 13'hxxx6;
      expv[41] = 13'hxxx6;
      expv[42] = 13'hxxx6;
      expv[43] = 13'hxxx6;
      expv[44] = 13'hxxx6;
      expv[45] = 13'hxxx6;
      expv[46] = 13'hxxx6;
      expv[47] = 13'hx9x2;
      expv[48] = 13'hxxx6;
      expv[49] = 13'hxxx6;
      expv[50] = 13'h00e6;
      expv[51] = 13'hxxx6;
      expv[52] = 13'hxxx6;
      expv[53] = 13'hxxx6;
      expv[54] = 13'hxxx6;
      expv[55] = 13'hxxx6;
      expv[56] = 13'hxxx6;
      expv[57] = 13'hxxx6;
      expv[58] = 13'hxxx6;
      expv[59] = 13'hxxx6;
      expv[60] = 13'hxxx6;
      expv[61] = 13'hxxx6;
      expv[62] = 13'hxxx6;
      expv[63] = 13'hxxx6;
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
