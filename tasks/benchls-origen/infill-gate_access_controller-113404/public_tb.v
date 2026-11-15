// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_113404 dut (
    .clk_2(clk),
    .SWI(in_vec[7:0]),
    .LED(out_vec[26:19]),
    .SEG(out_vec[18:11]),
    .LCD_E(out_vec[10:10]),
    .LCD_RS(out_vec[9:9]),
    .LCD_RW(out_vec[8:8]),
    .LCD_DATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hcf;
    stim[1] = 8'h15;
    stim[2] = 8'h0e;
    stim[3] = 8'hb7;
    stim[4] = 8'h9c;
    stim[5] = 8'hb0;
    stim[6] = 8'h45;
    stim[7] = 8'h1a;
    stim[8] = 8'h60;
    stim[9] = 8'hff;
    stim[10] = 8'h46;
    stim[11] = 8'h46;
    stim[12] = 8'h31;
    stim[13] = 8'h1e;
    stim[14] = 8'h24;
    stim[15] = 8'h28;
    stim[16] = 8'h82;
    stim[17] = 8'h12;
    stim[18] = 8'hb6;
    stim[19] = 8'h70;
    stim[20] = 8'h61;
    stim[21] = 8'h1d;
    stim[22] = 8'h5d;
    stim[23] = 8'h06;
    stim[24] = 8'h20;
    stim[25] = 8'hea;
    stim[26] = 8'h4e;
    stim[27] = 8'h05;
    stim[28] = 8'h64;
    stim[29] = 8'ha4;
    stim[30] = 8'hf8;
    stim[31] = 8'h7d;
    stim[32] = 8'h70;
    stim[33] = 8'h3f;
    stim[34] = 8'h14;
    stim[35] = 8'hb6;
    stim[36] = 8'hbe;
    stim[37] = 8'hd5;
    stim[38] = 8'h33;
    stim[39] = 8'he1;
    stim[40] = 8'h56;
    stim[41] = 8'h83;
    stim[42] = 8'h3c;
    stim[43] = 8'h6c;
    stim[44] = 8'he3;
    stim[45] = 8'hca;
    stim[46] = 8'h04;
    stim[47] = 8'h59;
    stim[48] = 8'ha6;
    stim[49] = 8'hbd;
    stim[50] = 8'hc1;
    stim[51] = 8'hf2;
    stim[52] = 8'hf8;
    stim[53] = 8'h01;
    stim[54] = 8'h18;
    stim[55] = 8'hc9;
    stim[56] = 8'h78;
    stim[57] = 8'h3e;
    stim[58] = 8'hb0;
    stim[59] = 8'h66;
    stim[60] = 8'hc4;
    stim[61] = 8'hde;
    stim[62] = 8'h2f;
    stim[63] = 8'h56;
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
      expv[0] = 27'h0xx0xxx;
      expv[1] = 27'h0xx0xxx;
      expv[2] = 27'h0xx0xxx;
      expv[3] = 27'h0xx0xxx;
      expv[4] = 27'h0xx0xxx;
      expv[5] = 27'h0xx0xxx;
      expv[6] = 27'h0xx0xxx;
      expv[7] = 27'h0xx0xxx;
      expv[8] = 27'h0xx0xxx;
      expv[9] = 27'h0xx0xxx;
      expv[10] = 27'h0xx0xxx;
      expv[11] = 27'h0xx0xxx;
      expv[12] = 27'h0xx0xxx;
      expv[13] = 27'h0xx0xxx;
      expv[14] = 27'h0xx0xxx;
      expv[15] = 27'h0xx0xxx;
      expv[16] = 27'h0xx0xxx;
      expv[17] = 27'h0xx0xxx;
      expv[18] = 27'h0xx0xxx;
      expv[19] = 27'h0xx0xxx;
      expv[20] = 27'h0xx0xxx;
      expv[21] = 27'h0xx0xxx;
      expv[22] = 27'h0xx0xxx;
      expv[23] = 27'h0xx0xxx;
      expv[24] = 27'h0xx0xxx;
      expv[25] = 27'h0xx0xxx;
      expv[26] = 27'h0xx0xxx;
      expv[27] = 27'h0xx0xxx;
      expv[28] = 27'h0xx0xxx;
      expv[29] = 27'h0xx0xxx;
      expv[30] = 27'h0xx0xxx;
      expv[31] = 27'h0xx0xxx;
      expv[32] = 27'h0xx0xxx;
      expv[33] = 27'h0xx0xxx;
      expv[34] = 27'h0xx0xxx;
      expv[35] = 27'h0xx0xxx;
      expv[36] = 27'h0xx0xxx;
      expv[37] = 27'h0xx0xxx;
      expv[38] = 27'h0xx0xxx;
      expv[39] = 27'h0xx0xxx;
      expv[40] = 27'h0xx0xxx;
      expv[41] = 27'h0xx0xxx;
      expv[42] = 27'h0xx0xxx;
      expv[43] = 27'h0xx0xxx;
      expv[44] = 27'h0xx0xxx;
      expv[45] = 27'h0xx0xxx;
      expv[46] = 27'h0xx0xxx;
      expv[47] = 27'h0xx0xxx;
      expv[48] = 27'h0xx0xxx;
      expv[49] = 27'h0xx0xxx;
      expv[50] = 27'h0xx0xxx;
      expv[51] = 27'h0xx0xxx;
      expv[52] = 27'h0xx0xxx;
      expv[53] = 27'h0xx0xxx;
      expv[54] = 27'h0xx0xxx;
      expv[55] = 27'h0xx0xxx;
      expv[56] = 27'h0xx0xxx;
      expv[57] = 27'h0xx0xxx;
      expv[58] = 27'h0xx0xxx;
      expv[59] = 27'h0xx0xxx;
      expv[60] = 27'h0xx0xxx;
      expv[61] = 27'h0xx0xxx;
      expv[62] = 27'h0xx0xxx;
      expv[63] = 27'h0xx0xxx;
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
