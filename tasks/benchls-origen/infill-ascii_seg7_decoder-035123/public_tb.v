// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035123 dut (
    .INDEX(in_vec[7:0]),
    .CODE(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h48;
    stim[1] = 8'h8c;
    stim[2] = 8'hb7;
    stim[3] = 8'he2;
    stim[4] = 8'h8d;
    stim[5] = 8'hb3;
    stim[6] = 8'h96;
    stim[7] = 8'h28;
    stim[8] = 8'h30;
    stim[9] = 8'hc6;
    stim[10] = 8'hda;
    stim[11] = 8'hcd;
    stim[12] = 8'h38;
    stim[13] = 8'hfa;
    stim[14] = 8'h12;
    stim[15] = 8'hd2;
    stim[16] = 8'h6f;
    stim[17] = 8'hfc;
    stim[18] = 8'h48;
    stim[19] = 8'h77;
    stim[20] = 8'h2b;
    stim[21] = 8'h31;
    stim[22] = 8'hc7;
    stim[23] = 8'h60;
    stim[24] = 8'h32;
    stim[25] = 8'h16;
    stim[26] = 8'hbd;
    stim[27] = 8'hfd;
    stim[28] = 8'h3f;
    stim[29] = 8'h35;
    stim[30] = 8'h10;
    stim[31] = 8'h1a;
    stim[32] = 8'h2b;
    stim[33] = 8'h84;
    stim[34] = 8'hc0;
    stim[35] = 8'h5b;
    stim[36] = 8'h96;
    stim[37] = 8'hfc;
    stim[38] = 8'h38;
    stim[39] = 8'hf3;
    stim[40] = 8'hef;
    stim[41] = 8'h8e;
    stim[42] = 8'hff;
    stim[43] = 8'hc6;
    stim[44] = 8'h82;
    stim[45] = 8'hba;
    stim[46] = 8'h0a;
    stim[47] = 8'h61;
    stim[48] = 8'hf9;
    stim[49] = 8'hcd;
    stim[50] = 8'h03;
    stim[51] = 8'hdb;
    stim[52] = 8'h15;
    stim[53] = 8'h94;
    stim[54] = 8'hdf;
    stim[55] = 8'h12;
    stim[56] = 8'hb7;
    stim[57] = 8'h40;
    stim[58] = 8'h67;
    stim[59] = 8'hd4;
    stim[60] = 8'h56;
    stim[61] = 8'h72;
    stim[62] = 8'hd1;
    stim[63] = 8'h87;
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
      expv[0] = 8'h89;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hff;
      expv[5] = 8'hff;
      expv[6] = 8'hff;
      expv[7] = 8'hff;
      expv[8] = 8'hc0;
      expv[9] = 8'hff;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'h80;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hff;
      expv[16] = 8'ha3;
      expv[17] = 8'hff;
      expv[18] = 8'h89;
      expv[19] = 8'h81;
      expv[20] = 8'hff;
      expv[21] = 8'hf9;
      expv[22] = 8'hff;
      expv[23] = 8'hff;
      expv[24] = 8'ha4;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hff;
      expv[28] = 8'hff;
      expv[29] = 8'h92;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'h80;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'h88;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hc2;
      expv[59] = 8'hff;
      expv[60] = 8'he3;
      expv[61] = 8'haf;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
