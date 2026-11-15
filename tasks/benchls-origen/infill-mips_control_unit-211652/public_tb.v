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

  origen_211652 dut (
    .instr_op_i(in_vec[11:6]),
    .instr_jr_i(in_vec[5:0]),
    .RegWrite_o(out_vec[12:12]),
    .ALU_op_o(out_vec[11:9]),
    .ALUSrc_o(out_vec[8:8]),
    .RegDst_o(out_vec[7:7]),
    .Branch_o(out_vec[6:6]),
    .Jump_o(out_vec[5:5]),
    .MemRead_o(out_vec[4:4]),
    .MemWrite_o(out_vec[3:3]),
    .MemtoReg_o(out_vec[2:2]),
    .jr_o(out_vec[1:1]),
    .jal_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h109;
    stim[1] = 12'h2eb;
    stim[2] = 12'hb9d;
    stim[3] = 12'h45b;
    stim[4] = 12'hdb6;
    stim[5] = 12'h192;
    stim[6] = 12'hb92;
    stim[7] = 12'h407;
    stim[8] = 12'h78d;
    stim[9] = 12'h39b;
    stim[10] = 12'hdd6;
    stim[11] = 12'h2cf;
    stim[12] = 12'h4ea;
    stim[13] = 12'h06a;
    stim[14] = 12'had5;
    stim[15] = 12'h994;
    stim[16] = 12'h25b;
    stim[17] = 12'h8df;
    stim[18] = 12'h09e;
    stim[19] = 12'h387;
    stim[20] = 12'h596;
    stim[21] = 12'heab;
    stim[22] = 12'h14c;
    stim[23] = 12'he28;
    stim[24] = 12'hbb8;
    stim[25] = 12'hd8e;
    stim[26] = 12'ha7b;
    stim[27] = 12'he96;
    stim[28] = 12'h00e;
    stim[29] = 12'hb76;
    stim[30] = 12'h225;
    stim[31] = 12'h237;
    stim[32] = 12'h808;
    stim[33] = 12'hf60;
    stim[34] = 12'h65b;
    stim[35] = 12'h9d3;
    stim[36] = 12'hcdd;
    stim[37] = 12'hf65;
    stim[38] = 12'he43;
    stim[39] = 12'hc92;
    stim[40] = 12'h093;
    stim[41] = 12'h7f9;
    stim[42] = 12'h15c;
    stim[43] = 12'hb8c;
    stim[44] = 12'h67f;
    stim[45] = 12'hcbc;
    stim[46] = 12'hb90;
    stim[47] = 12'h0f3;
    stim[48] = 12'h76f;
    stim[49] = 12'h8ef;
    stim[50] = 12'hea2;
    stim[51] = 12'hb3e;
    stim[52] = 12'h4d8;
    stim[53] = 12'h3ca;
    stim[54] = 12'h23a;
    stim[55] = 12'hcf9;
    stim[56] = 12'ha64;
    stim[57] = 12'h90c;
    stim[58] = 12'h801;
    stim[59] = 12'h9b7;
    stim[60] = 12'heeb;
    stim[61] = 12'h240;
    stim[62] = 12'h989;
    stim[63] = 12'h225;
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
      expv[0] = 13'h0240;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0108;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h1114;
      expv[18] = 13'h0020;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h1480;
      expv[29] = 13'h0000;
      expv[30] = 13'h1100;
      expv[31] = 13'h1100;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0020;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h1025;
      expv[48] = 13'h0000;
      expv[49] = 13'h1114;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h1100;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h1100;
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
