// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_206851 dut (
    .clk(clk),
    .IR_Input(in_vec[8:1]),
    .flag(in_vec[0:0]),
    .C_Bus_CU(out_vec[20:16]),
    .B_Bus_CU(out_vec[15:11]),
    .DATA_Con_CU(out_vec[10:8]),
    .ALU_CU(out_vec[7:4]),
    .Reg_Inc_CU(out_vec[3:1]),
    .IR_Load(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h07d;
    stim[1] = 9'h10f;
    stim[2] = 9'h049;
    stim[3] = 9'h189;
    stim[4] = 9'h146;
    stim[5] = 9'h0a6;
    stim[6] = 9'h129;
    stim[7] = 9'h1b1;
    stim[8] = 9'h08a;
    stim[9] = 9'h169;
    stim[10] = 9'h0aa;
    stim[11] = 9'h167;
    stim[12] = 9'h070;
    stim[13] = 9'h1b3;
    stim[14] = 9'h103;
    stim[15] = 9'h0fe;
    stim[16] = 9'h067;
    stim[17] = 9'h1ab;
    stim[18] = 9'h0ad;
    stim[19] = 9'h1e2;
    stim[20] = 9'h039;
    stim[21] = 9'h0e4;
    stim[22] = 9'h1a9;
    stim[23] = 9'h13c;
    stim[24] = 9'h059;
    stim[25] = 9'h0fa;
    stim[26] = 9'h04e;
    stim[27] = 9'h0a9;
    stim[28] = 9'h027;
    stim[29] = 9'h0b7;
    stim[30] = 9'h180;
    stim[31] = 9'h0c2;
    stim[32] = 9'h068;
    stim[33] = 9'h0f8;
    stim[34] = 9'h0ff;
    stim[35] = 9'h146;
    stim[36] = 9'h09e;
    stim[37] = 9'h084;
    stim[38] = 9'h0e3;
    stim[39] = 9'h07c;
    stim[40] = 9'h1c7;
    stim[41] = 9'h0d4;
    stim[42] = 9'h127;
    stim[43] = 9'h19c;
    stim[44] = 9'h042;
    stim[45] = 9'h170;
    stim[46] = 9'h130;
    stim[47] = 9'h132;
    stim[48] = 9'h1c8;
    stim[49] = 9'h153;
    stim[50] = 9'h03d;
    stim[51] = 9'h07f;
    stim[52] = 9'h0f3;
    stim[53] = 9'h1cb;
    stim[54] = 9'h187;
    stim[55] = 9'h0a5;
    stim[56] = 9'h182;
    stim[57] = 9'h14e;
    stim[58] = 9'h178;
    stim[59] = 9'h18e;
    stim[60] = 9'h177;
    stim[61] = 9'h0aa;
    stim[62] = 9'h1e1;
    stim[63] = 9'h1d0;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h000000;
      expv[4] = 21'h000000;
      expv[5] = 21'h000000;
      expv[6] = 21'h000000;
      expv[7] = 21'h000000;
      expv[8] = 21'h000000;
      expv[9] = 21'h000000;
      expv[10] = 21'h000000;
      expv[11] = 21'h000000;
      expv[12] = 21'h000000;
      expv[13] = 21'h000000;
      expv[14] = 21'h000000;
      expv[15] = 21'h000000;
      expv[16] = 21'h000000;
      expv[17] = 21'h000000;
      expv[18] = 21'h000000;
      expv[19] = 21'h000000;
      expv[20] = 21'h000000;
      expv[21] = 21'h000000;
      expv[22] = 21'h000000;
      expv[23] = 21'h000000;
      expv[24] = 21'h000000;
      expv[25] = 21'h000000;
      expv[26] = 21'h000000;
      expv[27] = 21'h000000;
      expv[28] = 21'h000000;
      expv[29] = 21'h000000;
      expv[30] = 21'h000000;
      expv[31] = 21'h000000;
      expv[32] = 21'h000000;
      expv[33] = 21'h000000;
      expv[34] = 21'h000000;
      expv[35] = 21'h000000;
      expv[36] = 21'h000000;
      expv[37] = 21'h000000;
      expv[38] = 21'h000000;
      expv[39] = 21'h000000;
      expv[40] = 21'h000000;
      expv[41] = 21'h000000;
      expv[42] = 21'h000000;
      expv[43] = 21'h000000;
      expv[44] = 21'h000000;
      expv[45] = 21'h000000;
      expv[46] = 21'h000000;
      expv[47] = 21'h000000;
      expv[48] = 21'h000000;
      expv[49] = 21'h000000;
      expv[50] = 21'h000000;
      expv[51] = 21'h000000;
      expv[52] = 21'h000000;
      expv[53] = 21'h000000;
      expv[54] = 21'h000000;
      expv[55] = 21'h000000;
      expv[56] = 21'h000000;
      expv[57] = 21'h000000;
      expv[58] = 21'h000000;
      expv[59] = 21'h000000;
      expv[60] = 21'h000000;
      expv[61] = 21'h000000;
      expv[62] = 21'h000000;
      expv[63] = 21'h000000;
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
