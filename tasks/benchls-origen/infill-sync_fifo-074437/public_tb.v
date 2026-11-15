// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074437 dut (
    .i_clk(clk),
    .i_reset_n(in_vec[11:11]),
    .i_push(in_vec[10:10]),
    .i_pop(in_vec[9:9]),
    .i_enable(in_vec[8:8]),
    .i_data(in_vec[7:0]),
    .o_full(out_vec[9:9]),
    .o_empty(out_vec[8:8]),
    .o_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h72e;
    stim[1] = 12'h73f;
    stim[2] = 12'hec8;
    stim[3] = 12'hc0d;
    stim[4] = 12'head;
    stim[5] = 12'hf50;
    stim[6] = 12'hc7f;
    stim[7] = 12'hdb9;
    stim[8] = 12'hed0;
    stim[9] = 12'hd28;
    stim[10] = 12'hf59;
    stim[11] = 12'hdab;
    stim[12] = 12'hfe0;
    stim[13] = 12'hac2;
    stim[14] = 12'hf9d;
    stim[15] = 12'hf1c;
    stim[16] = 12'haec;
    stim[17] = 12'h8b6;
    stim[18] = 12'hda1;
    stim[19] = 12'hfa0;
    stim[20] = 12'h8f8;
    stim[21] = 12'h94c;
    stim[22] = 12'hcdf;
    stim[23] = 12'hf4c;
    stim[24] = 12'h8c4;
    stim[25] = 12'h9a9;
    stim[26] = 12'hfc5;
    stim[27] = 12'hc9d;
    stim[28] = 12'hf8a;
    stim[29] = 12'hb7b;
    stim[30] = 12'hf9c;
    stim[31] = 12'ha5c;
    stim[32] = 12'hd90;
    stim[33] = 12'hf56;
    stim[34] = 12'h810;
    stim[35] = 12'hd1c;
    stim[36] = 12'hf14;
    stim[37] = 12'h843;
    stim[38] = 12'hfe2;
    stim[39] = 12'ha2a;
    stim[40] = 12'hc5a;
    stim[41] = 12'hfe6;
    stim[42] = 12'hed4;
    stim[43] = 12'hfed;
    stim[44] = 12'h9ea;
    stim[45] = 12'h856;
    stim[46] = 12'hdbe;
    stim[47] = 12'h238;
    stim[48] = 12'hc9b;
    stim[49] = 12'h89b;
    stim[50] = 12'h98a;
    stim[51] = 12'hbb9;
    stim[52] = 12'ha61;
    stim[53] = 12'he84;
    stim[54] = 12'ha93;
    stim[55] = 12'hece;
    stim[56] = 12'hb17;
    stim[57] = 12'ha7c;
    stim[58] = 12'h8fa;
    stim[59] = 12'hffb;
    stim[60] = 12'hf30;
    stim[61] = 12'hf91;
    stim[62] = 12'h8c5;
    stim[63] = 12'ha86;
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
      expv[0] = 10'h100;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h100;
      expv[10] = 10'h000;
      expv[11] = 10'h050;
      expv[12] = 10'h050;
      expv[13] = 10'h0b9;
      expv[14] = 10'h0b9;
      expv[15] = 10'h028;
      expv[16] = 10'h059;
      expv[17] = 10'h059;
      expv[18] = 10'h059;
      expv[19] = 10'h059;
      expv[20] = 10'h0ab;
      expv[21] = 10'h0ab;
      expv[22] = 10'h0ab;
      expv[23] = 10'h0ab;
      expv[24] = 10'h0e0;
      expv[25] = 10'h0e0;
      expv[26] = 10'h0e0;
      expv[27] = 10'h09d;
      expv[28] = 10'h09d;
      expv[29] = 10'h01c;
      expv[30] = 10'h0a1;
      expv[31] = 10'h0a0;
      expv[32] = 10'h0a0;
      expv[33] = 10'h0a0;
      expv[34] = 10'h04c;
      expv[35] = 10'h04c;
      expv[36] = 10'h04c;
      expv[37] = 10'h0c5;
      expv[38] = 10'h0c5;
      expv[39] = 10'h08a;
      expv[40] = 10'h08a;
      expv[41] = 10'h08a;
      expv[42] = 10'h09c;
      expv[43] = 10'h09c;
      expv[44] = 10'h090;
      expv[45] = 10'h090;
      expv[46] = 10'h090;
      expv[47] = 10'h100;
      expv[48] = 10'h100;
      expv[49] = 10'h100;
      expv[50] = 10'h100;
      expv[51] = 10'h100;
      expv[52] = 10'h100;
      expv[53] = 10'h100;
      expv[54] = 10'h100;
      expv[55] = 10'h100;
      expv[56] = 10'h100;
      expv[57] = 10'h100;
      expv[58] = 10'h100;
      expv[59] = 10'h100;
      expv[60] = 10'h100;
      expv[61] = 10'h100;
      expv[62] = 10'h100;
      expv[63] = 10'h100;
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
