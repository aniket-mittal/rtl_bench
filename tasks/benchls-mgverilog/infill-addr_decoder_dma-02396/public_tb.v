// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02396 dut (
    .Addr(in_vec[19:4]),
    .DMA_in(in_vec[3:3]),
    .EXTSEL_in(in_vec[2:2]),
    .EXTCPU(in_vec[1:1]),
    .EXTMEM(in_vec[0:0]),
    .DMA_out(out_vec[5:5]),
    .EXTSEL_out(out_vec[4:4]),
    .D1FF(out_vec[3:3]),
    .D1XX(out_vec[2:2]),
    .D6XX(out_vec[1:1]),
    .D8XX(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hf37f6;
    stim[1] = 20'h6108a;
    stim[2] = 20'he7a4c;
    stim[3] = 20'h25b18;
    stim[4] = 20'he8cac;
    stim[5] = 20'h794e2;
    stim[6] = 20'he532c;
    stim[7] = 20'h46be9;
    stim[8] = 20'h0d1cf;
    stim[9] = 20'h17ba3;
    stim[10] = 20'he83cd;
    stim[11] = 20'h8ee2b;
    stim[12] = 20'h63b92;
    stim[13] = 20'h72234;
    stim[14] = 20'he0641;
    stim[15] = 20'h707d5;
    stim[16] = 20'h01bc1;
    stim[17] = 20'hb9fe9;
    stim[18] = 20'h59cf6;
    stim[19] = 20'h9f329;
    stim[20] = 20'hdc704;
    stim[21] = 20'h19766;
    stim[22] = 20'h6acae;
    stim[23] = 20'h5222d;
    stim[24] = 20'h555bb;
    stim[25] = 20'hfe541;
    stim[26] = 20'h243fc;
    stim[27] = 20'hdc0a8;
    stim[28] = 20'h0b59a;
    stim[29] = 20'h8f7bf;
    stim[30] = 20'h630d7;
    stim[31] = 20'ha2120;
    stim[32] = 20'hd5958;
    stim[33] = 20'h59a60;
    stim[34] = 20'h0aa15;
    stim[35] = 20'hfa95b;
    stim[36] = 20'hdea4e;
    stim[37] = 20'h15f06;
    stim[38] = 20'hfa438;
    stim[39] = 20'hb9edf;
    stim[40] = 20'h5f1e2;
    stim[41] = 20'h6a7c2;
    stim[42] = 20'hdfb7a;
    stim[43] = 20'hf1dc5;
    stim[44] = 20'hdbe7a;
    stim[45] = 20'h44fc2;
    stim[46] = 20'h9fd01;
    stim[47] = 20'hfe55f;
    stim[48] = 20'h8ebaa;
    stim[49] = 20'he4d71;
    stim[50] = 20'he1eb9;
    stim[51] = 20'h50207;
    stim[52] = 20'h565aa;
    stim[53] = 20'hb0a95;
    stim[54] = 20'h84d18;
    stim[55] = 20'h74617;
    stim[56] = 20'h5cd63;
    stim[57] = 20'he515e;
    stim[58] = 20'h3bbfa;
    stim[59] = 20'h7d3d3;
    stim[60] = 20'h07a95;
    stim[61] = 20'h5e78f;
    stim[62] = 20'h94cac;
    stim[63] = 20'hed617;
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
      expv[0] = 6'h0x;
      expv[1] = 6'hxx;
      expv[2] = 6'h0x;
      expv[3] = 6'h0x;
      expv[4] = 6'h0x;
      expv[5] = 6'h0x;
      expv[6] = 6'h0x;
      expv[7] = 6'h0x;
      expv[8] = 6'hxx;
      expv[9] = 6'h0x;
      expv[10] = 6'hxx;
      expv[11] = 6'hxx;
      expv[12] = 6'h0x;
      expv[13] = 6'h0x;
      expv[14] = 6'h0x;
      expv[15] = 6'hxx;
      expv[16] = 6'h0x;
      expv[17] = 6'h0x;
      expv[18] = 6'h0x;
      expv[19] = 6'h0x;
      expv[20] = 6'h0x;
      expv[21] = 6'h0x;
      expv[22] = 6'hxx;
      expv[23] = 6'hxx;
      expv[24] = 6'hxx;
      expv[25] = 6'h0x;
      expv[26] = 6'h0x;
      expv[27] = 6'h0x;
      expv[28] = 6'hxx;
      expv[29] = 6'hxx;
      expv[30] = 6'hxx;
      expv[31] = 6'h0x;
      expv[32] = 6'h0x;
      expv[33] = 6'h0x;
      expv[34] = 6'hxx;
      expv[35] = 6'hxx;
      expv[36] = 6'hxx;
      expv[37] = 6'h0x;
      expv[38] = 6'h0x;
      expv[39] = 6'hxx;
      expv[40] = 6'h0x;
      expv[41] = 6'h0x;
      expv[42] = 6'hxx;
      expv[43] = 6'hxx;
      expv[44] = 6'hxx;
      expv[45] = 6'h0x;
      expv[46] = 6'h0x;
      expv[47] = 6'hxx;
      expv[48] = 6'hxx;
      expv[49] = 6'h0x;
      expv[50] = 6'h0x;
      expv[51] = 6'hxx;
      expv[52] = 6'hxx;
      expv[53] = 6'hxx;
      expv[54] = 6'h0x;
      expv[55] = 6'hxx;
      expv[56] = 6'h0x;
      expv[57] = 6'hxx;
      expv[58] = 6'hxx;
      expv[59] = 6'h0x;
      expv[60] = 6'hxx;
      expv[61] = 6'hxx;
      expv[62] = 6'h0x;
      expv[63] = 6'hxx;
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
