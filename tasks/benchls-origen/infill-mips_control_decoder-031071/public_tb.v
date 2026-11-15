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

  origen_031071 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegDst(out_vec[11:11]),
    .MemRead(out_vec[10:10]),
    .MemtoReg(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .ALUsrc(out_vec[7:7]),
    .RegWrite(out_vec[6:6]),
    .ALUop(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h401;
    stim[1] = 12'hbc9;
    stim[2] = 12'h8c1;
    stim[3] = 12'hcbb;
    stim[4] = 12'h1c4;
    stim[5] = 12'hfdb;
    stim[6] = 12'h710;
    stim[7] = 12'h8f2;
    stim[8] = 12'h8ee;
    stim[9] = 12'he34;
    stim[10] = 12'h714;
    stim[11] = 12'hea8;
    stim[12] = 12'h57e;
    stim[13] = 12'h219;
    stim[14] = 12'h540;
    stim[15] = 12'hb19;
    stim[16] = 12'hbf5;
    stim[17] = 12'h6ed;
    stim[18] = 12'h87c;
    stim[19] = 12'hf6c;
    stim[20] = 12'hc26;
    stim[21] = 12'h3a8;
    stim[22] = 12'hec9;
    stim[23] = 12'h44e;
    stim[24] = 12'h36f;
    stim[25] = 12'ha2c;
    stim[26] = 12'h9c6;
    stim[27] = 12'hef3;
    stim[28] = 12'h2f3;
    stim[29] = 12'h30e;
    stim[30] = 12'he49;
    stim[31] = 12'hc4a;
    stim[32] = 12'h981;
    stim[33] = 12'ha12;
    stim[34] = 12'h77b;
    stim[35] = 12'hd04;
    stim[36] = 12'h28c;
    stim[37] = 12'he3b;
    stim[38] = 12'h512;
    stim[39] = 12'hbfd;
    stim[40] = 12'he42;
    stim[41] = 12'h588;
    stim[42] = 12'hf2e;
    stim[43] = 12'hc8c;
    stim[44] = 12'he96;
    stim[45] = 12'h23e;
    stim[46] = 12'hc62;
    stim[47] = 12'hed9;
    stim[48] = 12'he81;
    stim[49] = 12'h47b;
    stim[50] = 12'hc3f;
    stim[51] = 12'h082;
    stim[52] = 12'h1f4;
    stim[53] = 12'h5f3;
    stim[54] = 12'h4ed;
    stim[55] = 12'hb30;
    stim[56] = 12'hee5;
    stim[57] = 12'h87f;
    stim[58] = 12'h5b0;
    stim[59] = 12'h0c9;
    stim[60] = 12'h830;
    stim[61] = 12'h354;
    stim[62] = 12'hea8;
    stim[63] = 12'hf95;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h6e0;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h6e0;
      expv[8] = 12'h6e0;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h0e0;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h0e6;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h0e5;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h0eb;
      expv[29] = 12'h0e4;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h0ea;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h0e0;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h0e5;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
