// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  wptr_full dut (
    .wclk(clk),
    .wrst_n(in_vec[6:6]),
    .winc(in_vec[5:5]),
    .wq2_rptr(in_vec[4:0]),
    .wfull(out_vec[10:10]),
    .awfull(out_vec[9:9]),
    .waddr(out_vec[8:5]),
    .wptr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h34;
    stim[1] = 7'h0d;
    stim[2] = 7'h5c;
    stim[3] = 7'h7d;
    stim[4] = 7'h76;
    stim[5] = 7'h5c;
    stim[6] = 7'h7d;
    stim[7] = 7'h65;
    stim[8] = 7'h52;
    stim[9] = 7'h52;
    stim[10] = 7'h55;
    stim[11] = 7'h4c;
    stim[12] = 7'h78;
    stim[13] = 7'h72;
    stim[14] = 7'h73;
    stim[15] = 7'h68;
    stim[16] = 7'h49;
    stim[17] = 7'h4b;
    stim[18] = 7'h42;
    stim[19] = 7'h49;
    stim[20] = 7'h54;
    stim[21] = 7'h7b;
    stim[22] = 7'h79;
    stim[23] = 7'h6d;
    stim[24] = 7'h5b;
    stim[25] = 7'h4d;
    stim[26] = 7'h50;
    stim[27] = 7'h58;
    stim[28] = 7'h7d;
    stim[29] = 7'h47;
    stim[30] = 7'h4b;
    stim[31] = 7'h5d;
    stim[32] = 7'h5e;
    stim[33] = 7'h4a;
    stim[34] = 7'h44;
    stim[35] = 7'h42;
    stim[36] = 7'h7d;
    stim[37] = 7'h78;
    stim[38] = 7'h45;
    stim[39] = 7'h5b;
    stim[40] = 7'h4f;
    stim[41] = 7'h7f;
    stim[42] = 7'h54;
    stim[43] = 7'h61;
    stim[44] = 7'h67;
    stim[45] = 7'h44;
    stim[46] = 7'h64;
    stim[47] = 7'h57;
    stim[48] = 7'h47;
    stim[49] = 7'h6b;
    stim[50] = 7'h40;
    stim[51] = 7'h46;
    stim[52] = 7'h71;
    stim[53] = 7'h70;
    stim[54] = 7'h7e;
    stim[55] = 7'h79;
    stim[56] = 7'h59;
    stim[57] = 7'h54;
    stim[58] = 7'h50;
    stim[59] = 7'h42;
    stim[60] = 7'h7e;
    stim[61] = 7'h6b;
    stim[62] = 7'h7e;
    stim[63] = 7'h41;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h021;
      expv[5] = 11'h043;
      expv[6] = 11'h043;
      expv[7] = 11'h062;
      expv[8] = 11'h086;
      expv[9] = 11'h086;
      expv[10] = 11'h086;
      expv[11] = 11'h086;
      expv[12] = 11'h086;
      expv[13] = 11'h0a7;
      expv[14] = 11'h0c5;
      expv[15] = 11'h0e4;
      expv[16] = 11'h10c;
      expv[17] = 11'h10c;
      expv[18] = 11'h10c;
      expv[19] = 11'h10c;
      expv[20] = 11'h10c;
      expv[21] = 11'h50c;
      expv[22] = 11'h10c;
      expv[23] = 11'h12d;
      expv[24] = 11'h14f;
      expv[25] = 11'h14f;
      expv[26] = 11'h14f;
      expv[27] = 11'h14f;
      expv[28] = 11'h14f;
      expv[29] = 11'h16e;
      expv[30] = 11'h16e;
      expv[31] = 11'h16e;
      expv[32] = 11'h16e;
      expv[33] = 11'h16e;
      expv[34] = 11'h16e;
      expv[35] = 11'h16e;
      expv[36] = 11'h16e;
      expv[37] = 11'h18a;
      expv[38] = 11'h1ab;
      expv[39] = 11'h1ab;
      expv[40] = 11'h1ab;
      expv[41] = 11'h1ab;
      expv[42] = 11'h1c9;
      expv[43] = 11'h1c9;
      expv[44] = 11'h1e8;
      expv[45] = 11'h018;
      expv[46] = 11'h018;
      expv[47] = 11'h039;
      expv[48] = 11'h039;
      expv[49] = 11'h039;
      expv[50] = 11'h05b;
      expv[51] = 11'h05b;
      expv[52] = 11'h05b;
      expv[53] = 11'h07a;
      expv[54] = 11'h09e;
      expv[55] = 11'h0bf;
      expv[56] = 11'h0dd;
      expv[57] = 11'h0dd;
      expv[58] = 11'h0dd;
      expv[59] = 11'h0dd;
      expv[60] = 11'h0dd;
      expv[61] = 11'h0fc;
      expv[62] = 11'h114;
      expv[63] = 11'h135;
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
