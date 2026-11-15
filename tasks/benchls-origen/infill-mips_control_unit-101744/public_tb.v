// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101744 dut (
    .ins_H(in_vec[11:6]),
    .ins_L(in_vec[5:0]),
    .RegDst(out_vec[11:11]),
    .RegWrite(out_vec[10:10]),
    .ALUSrc(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemToReg(out_vec[6:6]),
    .PCSrc(out_vec[5:5]),
    .Branch(out_vec[4:4]),
    .outOp(out_vec[3:1]),
    .FPO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb1f;
    stim[1] = 12'h936;
    stim[2] = 12'h708;
    stim[3] = 12'h324;
    stim[4] = 12'h278;
    stim[5] = 12'h3d2;
    stim[6] = 12'hf68;
    stim[7] = 12'h56b;
    stim[8] = 12'hea8;
    stim[9] = 12'hc3d;
    stim[10] = 12'hd96;
    stim[11] = 12'h4e6;
    stim[12] = 12'h78e;
    stim[13] = 12'hb8d;
    stim[14] = 12'ha33;
    stim[15] = 12'had0;
    stim[16] = 12'hc43;
    stim[17] = 12'ha85;
    stim[18] = 12'hb11;
    stim[19] = 12'h1b9;
    stim[20] = 12'h396;
    stim[21] = 12'h3d4;
    stim[22] = 12'h246;
    stim[23] = 12'hfd2;
    stim[24] = 12'hd6e;
    stim[25] = 12'hb44;
    stim[26] = 12'h15d;
    stim[27] = 12'h938;
    stim[28] = 12'h343;
    stim[29] = 12'hd86;
    stim[30] = 12'h478;
    stim[31] = 12'h5ac;
    stim[32] = 12'h72d;
    stim[33] = 12'h376;
    stim[34] = 12'h4a6;
    stim[35] = 12'h5ff;
    stim[36] = 12'h939;
    stim[37] = 12'hc93;
    stim[38] = 12'h7b0;
    stim[39] = 12'h59b;
    stim[40] = 12'he86;
    stim[41] = 12'hb69;
    stim[42] = 12'hac8;
    stim[43] = 12'h733;
    stim[44] = 12'h91c;
    stim[45] = 12'hd39;
    stim[46] = 12'h1cf;
    stim[47] = 12'hb4c;
    stim[48] = 12'h32b;
    stim[49] = 12'hec1;
    stim[50] = 12'hfc5;
    stim[51] = 12'h672;
    stim[52] = 12'h698;
    stim[53] = 12'he99;
    stim[54] = 12'h2df;
    stim[55] = 12'h0ef;
    stim[56] = 12'h407;
    stim[57] = 12'h41c;
    stim[58] = 12'h486;
    stim[59] = 12'hb14;
    stim[60] = 12'h108;
    stim[61] = 12'hb2e;
    stim[62] = 12'h114;
    stim[63] = 12'hedf;
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
      expv[0] = 12'h004;
      expv[1] = 12'h004;
      expv[2] = 12'h004;
      expv[3] = 12'h600;
      expv[4] = 12'h004;
      expv[5] = 12'h004;
      expv[6] = 12'h004;
      expv[7] = 12'h004;
      expv[8] = 12'h004;
      expv[9] = 12'h405;
      expv[10] = 12'h004;
      expv[11] = 12'h004;
      expv[12] = 12'h004;
      expv[13] = 12'h004;
      expv[14] = 12'h004;
      expv[15] = 12'h304;
      expv[16] = 12'h004;
      expv[17] = 12'h004;
      expv[18] = 12'h004;
      expv[19] = 12'h004;
      expv[20] = 12'h004;
      expv[21] = 12'h004;
      expv[22] = 12'h004;
      expv[23] = 12'h004;
      expv[24] = 12'h004;
      expv[25] = 12'h004;
      expv[26] = 12'h01c;
      expv[27] = 12'h004;
      expv[28] = 12'h004;
      expv[29] = 12'h004;
      expv[30] = 12'h004;
      expv[31] = 12'h004;
      expv[32] = 12'h004;
      expv[33] = 12'h004;
      expv[34] = 12'h004;
      expv[35] = 12'h004;
      expv[36] = 12'h004;
      expv[37] = 12'h004;
      expv[38] = 12'h004;
      expv[39] = 12'h004;
      expv[40] = 12'h004;
      expv[41] = 12'h004;
      expv[42] = 12'h304;
      expv[43] = 12'h004;
      expv[44] = 12'h004;
      expv[45] = 12'h004;
      expv[46] = 12'h004;
      expv[47] = 12'h004;
      expv[48] = 12'h600;
      expv[49] = 12'h004;
      expv[50] = 12'h004;
      expv[51] = 12'h004;
      expv[52] = 12'h004;
      expv[53] = 12'h004;
      expv[54] = 12'h004;
      expv[55] = 12'h004;
      expv[56] = 12'h004;
      expv[57] = 12'h004;
      expv[58] = 12'h004;
      expv[59] = 12'h004;
      expv[60] = 12'h01c;
      expv[61] = 12'h004;
      expv[62] = 12'h01c;
      expv[63] = 12'h004;
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
