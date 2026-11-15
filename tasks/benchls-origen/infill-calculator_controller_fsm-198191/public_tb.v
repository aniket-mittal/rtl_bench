// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198191 dut (
    .clk(clk),
    .reset(in_vec[3:3]),
    .opCodeIn(in_vec[2:0]),
    .ld_number(out_vec[14:14]),
    .clr_number(out_vec[13:13]),
    .ld_opcode(out_vec[12:12]),
    .ld_result(out_vec[11:11]),
    .clr_result(out_vec[10:10]),
    .sel_muxAlu(out_vec[9:9]),
    .sel_muxDisplay(out_vec[8:8]),
    .clr_opCode(out_vec[7:7]),
    .opCodeOut(out_vec[6:4]),
    .E0(out_vec[3:3]),
    .E1(out_vec[2:2]),
    .E2(out_vec[1:1]),
    .E3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h8;
    stim[1] = 4'hf;
    stim[2] = 4'h0;
    stim[3] = 4'h7;
    stim[4] = 4'h0;
    stim[5] = 4'h2;
    stim[6] = 4'h1;
    stim[7] = 4'h2;
    stim[8] = 4'h5;
    stim[9] = 4'h3;
    stim[10] = 4'h3;
    stim[11] = 4'h1;
    stim[12] = 4'h2;
    stim[13] = 4'h4;
    stim[14] = 4'h4;
    stim[15] = 4'h7;
    stim[16] = 4'h2;
    stim[17] = 4'h6;
    stim[18] = 4'h1;
    stim[19] = 4'h3;
    stim[20] = 4'h4;
    stim[21] = 4'h5;
    stim[22] = 4'h5;
    stim[23] = 4'h0;
    stim[24] = 4'h0;
    stim[25] = 4'h0;
    stim[26] = 4'hb;
    stim[27] = 4'h3;
    stim[28] = 4'h1;
    stim[29] = 4'h4;
    stim[30] = 4'h0;
    stim[31] = 4'h4;
    stim[32] = 4'h5;
    stim[33] = 4'h4;
    stim[34] = 4'h6;
    stim[35] = 4'h4;
    stim[36] = 4'h7;
    stim[37] = 4'h2;
    stim[38] = 4'hc;
    stim[39] = 4'h3;
    stim[40] = 4'h7;
    stim[41] = 4'h1;
    stim[42] = 4'h2;
    stim[43] = 4'h6;
    stim[44] = 4'h4;
    stim[45] = 4'h4;
    stim[46] = 4'h3;
    stim[47] = 4'h4;
    stim[48] = 4'h7;
    stim[49] = 4'h9;
    stim[50] = 4'h0;
    stim[51] = 4'h7;
    stim[52] = 4'h2;
    stim[53] = 4'h2;
    stim[54] = 4'h9;
    stim[55] = 4'h6;
    stim[56] = 4'h1;
    stim[57] = 4'h7;
    stim[58] = 4'h5;
    stim[59] = 4'h3;
    stim[60] = 4'h1;
    stim[61] = 4'h2;
    stim[62] = 4'h2;
    stim[63] = 4'h2;
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
      expv[0] = 15'h0008;
      expv[1] = 15'h0008;
      expv[2] = 15'h0008;
      expv[3] = 15'h0008;
      expv[4] = 15'h0008;
      expv[5] = 15'h0008;
      expv[6] = 15'h0008;
      expv[7] = 15'h0008;
      expv[8] = 15'h0008;
      expv[9] = 15'h0008;
      expv[10] = 15'h0008;
      expv[11] = 15'h0008;
      expv[12] = 15'h0008;
      expv[13] = 15'h0008;
      expv[14] = 15'h0008;
      expv[15] = 15'h0008;
      expv[16] = 15'h0008;
      expv[17] = 15'h0008;
      expv[18] = 15'h0008;
      expv[19] = 15'h0008;
      expv[20] = 15'h0008;
      expv[21] = 15'h0008;
      expv[22] = 15'h0008;
      expv[23] = 15'h0008;
      expv[24] = 15'h0008;
      expv[25] = 15'h0008;
      expv[26] = 15'h0008;
      expv[27] = 15'h0008;
      expv[28] = 15'h0008;
      expv[29] = 15'h0008;
      expv[30] = 15'h0008;
      expv[31] = 15'h0008;
      expv[32] = 15'h0008;
      expv[33] = 15'h0008;
      expv[34] = 15'h0008;
      expv[35] = 15'h0008;
      expv[36] = 15'h0008;
      expv[37] = 15'h0008;
      expv[38] = 15'h0008;
      expv[39] = 15'h0008;
      expv[40] = 15'h0008;
      expv[41] = 15'h0008;
      expv[42] = 15'h0008;
      expv[43] = 15'h0008;
      expv[44] = 15'h0008;
      expv[45] = 15'h0008;
      expv[46] = 15'h0008;
      expv[47] = 15'h0008;
      expv[48] = 15'h0008;
      expv[49] = 15'h0008;
      expv[50] = 15'h0008;
      expv[51] = 15'h0008;
      expv[52] = 15'h0008;
      expv[53] = 15'h0008;
      expv[54] = 15'h0008;
      expv[55] = 15'h0008;
      expv[56] = 15'h0008;
      expv[57] = 15'h0008;
      expv[58] = 15'h0008;
      expv[59] = 15'h0008;
      expv[60] = 15'h0008;
      expv[61] = 15'h0008;
      expv[62] = 15'h0008;
      expv[63] = 15'h0008;
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
