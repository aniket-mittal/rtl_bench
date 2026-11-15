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

  origen_157539 dut (
    .OP(in_vec[11:6]),
    .FUNCT(in_vec[5:0]),
    .jrctrl(out_vec[12:12]),
    .Jctrl(out_vec[11:11]),
    .beq(out_vec[10:10]),
    .bne(out_vec[9:9]),
    .jl(out_vec[8:8]),
    .Rctrl(out_vec[7:7]),
    .Wren(out_vec[6:6]),
    .ALUctrl(out_vec[5:3]),
    .Ictrl(out_vec[2:2]),
    .MemWren(out_vec[1:1]),
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
    stim[0] = 12'hc23;
    stim[1] = 12'hedb;
    stim[2] = 12'h8fd;
    stim[3] = 12'h856;
    stim[4] = 12'h076;
    stim[5] = 12'h1eb;
    stim[6] = 12'h6c4;
    stim[7] = 12'h84a;
    stim[8] = 12'h9d5;
    stim[9] = 12'h062;
    stim[10] = 12'hb92;
    stim[11] = 12'h4ec;
    stim[12] = 12'hb5e;
    stim[13] = 12'h208;
    stim[14] = 12'h62c;
    stim[15] = 12'h879;
    stim[16] = 12'ha8b;
    stim[17] = 12'hae2;
    stim[18] = 12'h668;
    stim[19] = 12'h47a;
    stim[20] = 12'h000;
    stim[21] = 12'hed0;
    stim[22] = 12'heee;
    stim[23] = 12'h140;
    stim[24] = 12'h9c5;
    stim[25] = 12'h7c4;
    stim[26] = 12'h907;
    stim[27] = 12'h405;
    stim[28] = 12'hff3;
    stim[29] = 12'h97f;
    stim[30] = 12'hcd7;
    stim[31] = 12'he31;
    stim[32] = 12'hc90;
    stim[33] = 12'h33a;
    stim[34] = 12'h1b9;
    stim[35] = 12'h44c;
    stim[36] = 12'h225;
    stim[37] = 12'hb08;
    stim[38] = 12'h61f;
    stim[39] = 12'h8fc;
    stim[40] = 12'hf35;
    stim[41] = 12'h5ca;
    stim[42] = 12'hbc7;
    stim[43] = 12'h9cd;
    stim[44] = 12'hcf7;
    stim[45] = 12'h24d;
    stim[46] = 12'h683;
    stim[47] = 12'h794;
    stim[48] = 12'hcdd;
    stim[49] = 12'he5d;
    stim[50] = 12'h12d;
    stim[51] = 12'hf21;
    stim[52] = 12'h998;
    stim[53] = 12'h89f;
    stim[54] = 12'h69c;
    stim[55] = 12'h5ac;
    stim[56] = 12'h24e;
    stim[57] = 12'h390;
    stim[58] = 12'h6a5;
    stim[59] = 12'h73d;
    stim[60] = 12'hc4b;
    stim[61] = 12'h701;
    stim[62] = 12'h104;
    stim[63] = 12'h843;
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
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0234;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
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
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
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
