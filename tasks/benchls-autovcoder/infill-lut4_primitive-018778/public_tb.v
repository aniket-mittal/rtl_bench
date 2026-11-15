// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018778 dut (
    .in0(in_vec[23:23]),
    .in1(in_vec[22:22]),
    .in2(in_vec[21:21]),
    .in3(in_vec[20:20]),
    .in0b(in_vec[19:19]),
    .in1b(in_vec[18:18]),
    .in2b(in_vec[17:17]),
    .in3b(in_vec[16:16]),
    .cbit(in_vec[15:0]),
    .lut4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h728b47;
    stim[1] = 24'h1d4d80;
    stim[2] = 24'h627ae5;
    stim[3] = 24'h8fce9f;
    stim[4] = 24'h234ee2;
    stim[5] = 24'hae6c35;
    stim[6] = 24'h50a6fe;
    stim[7] = 24'h67ee66;
    stim[8] = 24'he3e330;
    stim[9] = 24'h087cdb;
    stim[10] = 24'h9be871;
    stim[11] = 24'h51400b;
    stim[12] = 24'h7605b7;
    stim[13] = 24'h9a6cac;
    stim[14] = 24'haa6446;
    stim[15] = 24'hebc90d;
    stim[16] = 24'h820baf;
    stim[17] = 24'h101581;
    stim[18] = 24'h40dfa9;
    stim[19] = 24'h3fed43;
    stim[20] = 24'h49617f;
    stim[21] = 24'h0e6e95;
    stim[22] = 24'h26d45a;
    stim[23] = 24'h604456;
    stim[24] = 24'h9a7e72;
    stim[25] = 24'h4623be;
    stim[26] = 24'hb72540;
    stim[27] = 24'hefbdbe;
    stim[28] = 24'hee6b71;
    stim[29] = 24'hc4ea12;
    stim[30] = 24'he5dae4;
    stim[31] = 24'h89673c;
    stim[32] = 24'h0c0a54;
    stim[33] = 24'h735045;
    stim[34] = 24'h2bfcd4;
    stim[35] = 24'hc5dcdc;
    stim[36] = 24'h17a765;
    stim[37] = 24'hee7abd;
    stim[38] = 24'hfe8f19;
    stim[39] = 24'h2d4c73;
    stim[40] = 24'hd79a02;
    stim[41] = 24'h1a9126;
    stim[42] = 24'hccdb6d;
    stim[43] = 24'h381248;
    stim[44] = 24'h5c5a92;
    stim[45] = 24'h5526ed;
    stim[46] = 24'h87f234;
    stim[47] = 24'h86e606;
    stim[48] = 24'hcaddd3;
    stim[49] = 24'h5e8ecb;
    stim[50] = 24'hd0aac2;
    stim[51] = 24'hddf7e5;
    stim[52] = 24'hf2c34a;
    stim[53] = 24'hdb8bcc;
    stim[54] = 24'h1bca77;
    stim[55] = 24'h3221bb;
    stim[56] = 24'h7a7368;
    stim[57] = 24'h592ec9;
    stim[58] = 24'h626618;
    stim[59] = 24'h05a9c6;
    stim[60] = 24'h27da9f;
    stim[61] = 24'ha1c266;
    stim[62] = 24'hee3711;
    stim[63] = 24'h601e22;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'hx;
      expv[4] = 1'hx;
      expv[5] = 1'hx;
      expv[6] = 1'hx;
      expv[7] = 1'hx;
      expv[8] = 1'hx;
      expv[9] = 1'hx;
      expv[10] = 1'hx;
      expv[11] = 1'hx;
      expv[12] = 1'hx;
      expv[13] = 1'hx;
      expv[14] = 1'hx;
      expv[15] = 1'hx;
      expv[16] = 1'hx;
      expv[17] = 1'hx;
      expv[18] = 1'hx;
      expv[19] = 1'hx;
      expv[20] = 1'hx;
      expv[21] = 1'hx;
      expv[22] = 1'hx;
      expv[23] = 1'hx;
      expv[24] = 1'hx;
      expv[25] = 1'hx;
      expv[26] = 1'hx;
      expv[27] = 1'hx;
      expv[28] = 1'hx;
      expv[29] = 1'hx;
      expv[30] = 1'hx;
      expv[31] = 1'hx;
      expv[32] = 1'hx;
      expv[33] = 1'hx;
      expv[34] = 1'hx;
      expv[35] = 1'hx;
      expv[36] = 1'hx;
      expv[37] = 1'hx;
      expv[38] = 1'hx;
      expv[39] = 1'h1;
      expv[40] = 1'hx;
      expv[41] = 1'hx;
      expv[42] = 1'hx;
      expv[43] = 1'hx;
      expv[44] = 1'hx;
      expv[45] = 1'hx;
      expv[46] = 1'h0;
      expv[47] = 1'hx;
      expv[48] = 1'hx;
      expv[49] = 1'hx;
      expv[50] = 1'hx;
      expv[51] = 1'hx;
      expv[52] = 1'hx;
      expv[53] = 1'hx;
      expv[54] = 1'hx;
      expv[55] = 1'hx;
      expv[56] = 1'hx;
      expv[57] = 1'hx;
      expv[58] = 1'hx;
      expv[59] = 1'hx;
      expv[60] = 1'hx;
      expv[61] = 1'hx;
      expv[62] = 1'hx;
      expv[63] = 1'hx;
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
