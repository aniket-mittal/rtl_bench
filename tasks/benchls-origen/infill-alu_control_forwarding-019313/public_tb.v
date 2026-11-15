// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019313 dut (
    .funct_i(in_vec[8:3]),
    .ALUOp_i(in_vec[2:0]),
    .ALU_operation_o(out_vec[6:3]),
    .FURslt_o(out_vec[2:1]),
    .jr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h139;
    stim[1] = 9'h15f;
    stim[2] = 9'h195;
    stim[3] = 9'h0ef;
    stim[4] = 9'h17c;
    stim[5] = 9'h0cb;
    stim[6] = 9'h1e6;
    stim[7] = 9'h121;
    stim[8] = 9'h0d9;
    stim[9] = 9'h0c1;
    stim[10] = 9'h03b;
    stim[11] = 9'h0ca;
    stim[12] = 9'h11a;
    stim[13] = 9'h03a;
    stim[14] = 9'h05a;
    stim[15] = 9'h0b7;
    stim[16] = 9'h0ff;
    stim[17] = 9'h14b;
    stim[18] = 9'h05f;
    stim[19] = 9'h102;
    stim[20] = 9'h122;
    stim[21] = 9'h0d9;
    stim[22] = 9'h1cd;
    stim[23] = 9'h0ab;
    stim[24] = 9'h003;
    stim[25] = 9'h1a0;
    stim[26] = 9'h015;
    stim[27] = 9'h038;
    stim[28] = 9'h066;
    stim[29] = 9'h075;
    stim[30] = 9'h1d5;
    stim[31] = 9'h0fe;
    stim[32] = 9'h1c7;
    stim[33] = 9'h1b8;
    stim[34] = 9'h1b0;
    stim[35] = 9'h023;
    stim[36] = 9'h179;
    stim[37] = 9'h1dc;
    stim[38] = 9'h19d;
    stim[39] = 9'h17e;
    stim[40] = 9'h0ff;
    stim[41] = 9'h146;
    stim[42] = 9'h1e8;
    stim[43] = 9'h0b6;
    stim[44] = 9'h1c2;
    stim[45] = 9'h06a;
    stim[46] = 9'h103;
    stim[47] = 9'h191;
    stim[48] = 9'h047;
    stim[49] = 9'h115;
    stim[50] = 9'h037;
    stim[51] = 9'h166;
    stim[52] = 9'h0f4;
    stim[53] = 9'h083;
    stim[54] = 9'h1ef;
    stim[55] = 9'h1b6;
    stim[56] = 9'h0bf;
    stim[57] = 9'h022;
    stim[58] = 9'h162;
    stim[59] = 9'h068;
    stim[60] = 9'h133;
    stim[61] = 9'h17b;
    stim[62] = 9'h0b6;
    stim[63] = 9'h1c0;
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
      expv[0] = 7'h30;
      expv[1] = 7'h00;
      expv[2] = 7'h3c;
      expv[3] = 7'h00;
      expv[4] = 7'h08;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h30;
      expv[8] = 7'h30;
      expv[9] = 7'h30;
      expv[10] = 7'h00;
      expv[11] = 7'h00;
      expv[12] = 7'h00;
      expv[13] = 7'h00;
      expv[14] = 7'h00;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h00;
      expv[18] = 7'h00;
      expv[19] = 7'h10;
      expv[20] = 7'h00;
      expv[21] = 7'h30;
      expv[22] = 7'h3c;
      expv[23] = 7'h00;
      expv[24] = 7'h00;
      expv[25] = 7'h10;
      expv[26] = 7'h3c;
      expv[27] = 7'h10;
      expv[28] = 7'h00;
      expv[29] = 7'h3c;
      expv[30] = 7'h3c;
      expv[31] = 7'h00;
      expv[32] = 7'h00;
      expv[33] = 7'h10;
      expv[34] = 7'h10;
      expv[35] = 7'h00;
      expv[36] = 7'h30;
      expv[37] = 7'h08;
      expv[38] = 7'h3c;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h10;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h00;
      expv[46] = 7'h00;
      expv[47] = 7'h30;
      expv[48] = 7'h00;
      expv[49] = 7'h3c;
      expv[50] = 7'h00;
      expv[51] = 7'h00;
      expv[52] = 7'h08;
      expv[53] = 7'h00;
      expv[54] = 7'h00;
      expv[55] = 7'h00;
      expv[56] = 7'h00;
      expv[57] = 7'h00;
      expv[58] = 7'h00;
      expv[59] = 7'h10;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h10;
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
