// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02415 dut (
    .opcode(in_vec[3:0]),
    .ALUControl(out_vec[8:6]),
    .RegWrite(out_vec[5:5]),
    .RegDst(out_vec[4:4]),
    .ALUSrc(out_vec[3:3]),
    .Branch(out_vec[2:2]),
    .MemWrite(out_vec[1:1]),
    .MemtoReg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'ha;
    stim[1] = 4'h0;
    stim[2] = 4'ha;
    stim[3] = 4'hf;
    stim[4] = 4'hb;
    stim[5] = 4'h0;
    stim[6] = 4'h0;
    stim[7] = 4'hf;
    stim[8] = 4'h8;
    stim[9] = 4'he;
    stim[10] = 4'h0;
    stim[11] = 4'h9;
    stim[12] = 4'h9;
    stim[13] = 4'h4;
    stim[14] = 4'h8;
    stim[15] = 4'h8;
    stim[16] = 4'h9;
    stim[17] = 4'he;
    stim[18] = 4'hc;
    stim[19] = 4'he;
    stim[20] = 4'h9;
    stim[21] = 4'h5;
    stim[22] = 4'hd;
    stim[23] = 4'h5;
    stim[24] = 4'hb;
    stim[25] = 4'hc;
    stim[26] = 4'h5;
    stim[27] = 4'h6;
    stim[28] = 4'h4;
    stim[29] = 4'hc;
    stim[30] = 4'h8;
    stim[31] = 4'h3;
    stim[32] = 4'hb;
    stim[33] = 4'h3;
    stim[34] = 4'hb;
    stim[35] = 4'h8;
    stim[36] = 4'hc;
    stim[37] = 4'ha;
    stim[38] = 4'h8;
    stim[39] = 4'h8;
    stim[40] = 4'ha;
    stim[41] = 4'h9;
    stim[42] = 4'h6;
    stim[43] = 4'h3;
    stim[44] = 4'h1;
    stim[45] = 4'h9;
    stim[46] = 4'h6;
    stim[47] = 4'h0;
    stim[48] = 4'hd;
    stim[49] = 4'hc;
    stim[50] = 4'hc;
    stim[51] = 4'h4;
    stim[52] = 4'hd;
    stim[53] = 4'h4;
    stim[54] = 4'h0;
    stim[55] = 4'h3;
    stim[56] = 4'hd;
    stim[57] = 4'h0;
    stim[58] = 4'h5;
    stim[59] = 4'hb;
    stim[60] = 4'hd;
    stim[61] = 4'h5;
    stim[62] = 4'h4;
    stim[63] = 4'he;
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
      expv[0] = 9'h04a;
      expv[1] = 9'h000;
      expv[2] = 9'h04a;
      expv[3] = 9'h000;
      expv[4] = 9'h069;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h0a8;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h069;
      expv[12] = 9'h069;
      expv[13] = 9'h0b0;
      expv[14] = 9'h0a8;
      expv[15] = 9'h0a8;
      expv[16] = 9'h069;
      expv[17] = 9'h000;
      expv[18] = 9'h04a;
      expv[19] = 9'h000;
      expv[20] = 9'h069;
      expv[21] = 9'h168;
      expv[22] = 9'h084;
      expv[23] = 9'h168;
      expv[24] = 9'h069;
      expv[25] = 9'h04a;
      expv[26] = 9'h168;
      expv[27] = 9'h1a8;
      expv[28] = 9'h0b0;
      expv[29] = 9'h04a;
      expv[30] = 9'h0a8;
      expv[31] = 9'h0f0;
      expv[32] = 9'h069;
      expv[33] = 9'h0f0;
      expv[34] = 9'h069;
      expv[35] = 9'h0a8;
      expv[36] = 9'h04a;
      expv[37] = 9'h04a;
      expv[38] = 9'h0a8;
      expv[39] = 9'h0a8;
      expv[40] = 9'h04a;
      expv[41] = 9'h069;
      expv[42] = 9'h1a8;
      expv[43] = 9'h0f0;
      expv[44] = 9'h070;
      expv[45] = 9'h069;
      expv[46] = 9'h1a8;
      expv[47] = 9'h000;
      expv[48] = 9'h084;
      expv[49] = 9'h04a;
      expv[50] = 9'h04a;
      expv[51] = 9'h0b0;
      expv[52] = 9'h084;
      expv[53] = 9'h0b0;
      expv[54] = 9'h000;
      expv[55] = 9'h0f0;
      expv[56] = 9'h084;
      expv[57] = 9'h000;
      expv[58] = 9'h168;
      expv[59] = 9'h069;
      expv[60] = 9'h084;
      expv[61] = 9'h168;
      expv[62] = 9'h0b0;
      expv[63] = 9'h000;
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
