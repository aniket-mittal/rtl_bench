// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063255 dut (
    .clk(clk),
    .rst_n(in_vec[3:3]),
    .start(in_vec[2:2]),
    .valid(in_vec[1:1]),
    .Done(in_vec[0:0]),
    .valid_out(out_vec[10:10]),
    .cnt(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h3;
    stim[1] = 4'h7;
    stim[2] = 4'he;
    stim[3] = 4'h9;
    stim[4] = 4'h8;
    stim[5] = 4'he;
    stim[6] = 4'h9;
    stim[7] = 4'hd;
    stim[8] = 4'he;
    stim[9] = 4'h8;
    stim[10] = 4'h8;
    stim[11] = 4'hd;
    stim[12] = 4'he;
    stim[13] = 4'he;
    stim[14] = 4'hf;
    stim[15] = 4'hc;
    stim[16] = 4'hb;
    stim[17] = 4'hd;
    stim[18] = 4'h9;
    stim[19] = 4'hc;
    stim[20] = 4'hc;
    stim[21] = 4'ha;
    stim[22] = 4'hf;
    stim[23] = 4'hd;
    stim[24] = 4'h8;
    stim[25] = 4'h8;
    stim[26] = 4'hf;
    stim[27] = 4'hd;
    stim[28] = 4'h8;
    stim[29] = 4'h9;
    stim[30] = 4'hb;
    stim[31] = 4'hb;
    stim[32] = 4'hf;
    stim[33] = 4'h8;
    stim[34] = 4'hf;
    stim[35] = 4'hf;
    stim[36] = 4'h9;
    stim[37] = 4'h8;
    stim[38] = 4'he;
    stim[39] = 4'hb;
    stim[40] = 4'h9;
    stim[41] = 4'hf;
    stim[42] = 4'ha;
    stim[43] = 4'hd;
    stim[44] = 4'ha;
    stim[45] = 4'ha;
    stim[46] = 4'h8;
    stim[47] = 4'h9;
    stim[48] = 4'hf;
    stim[49] = 4'he;
    stim[50] = 4'h8;
    stim[51] = 4'hb;
    stim[52] = 4'hf;
    stim[53] = 4'hf;
    stim[54] = 4'hd;
    stim[55] = 4'hf;
    stim[56] = 4'ha;
    stim[57] = 4'he;
    stim[58] = 4'h8;
    stim[59] = 4'he;
    stim[60] = 4'h7;
    stim[61] = 4'hf;
    stim[62] = 4'hd;
    stim[63] = 4'he;
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
      expv[0] = 11'h3ff;
      expv[1] = 11'h3ff;
      expv[2] = 11'h3ff;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h001;
      expv[7] = 11'h001;
      expv[8] = 11'h001;
      expv[9] = 11'h002;
      expv[10] = 11'h002;
      expv[11] = 11'h002;
      expv[12] = 11'h002;
      expv[13] = 11'h003;
      expv[14] = 11'h004;
      expv[15] = 11'h005;
      expv[16] = 11'h005;
      expv[17] = 11'h006;
      expv[18] = 11'h006;
      expv[19] = 11'h006;
      expv[20] = 11'h006;
      expv[21] = 11'h006;
      expv[22] = 11'h007;
      expv[23] = 11'h008;
      expv[24] = 11'h008;
      expv[25] = 11'h008;
      expv[26] = 11'h008;
      expv[27] = 11'h009;
      expv[28] = 11'h009;
      expv[29] = 11'h009;
      expv[30] = 11'h009;
      expv[31] = 11'h00a;
      expv[32] = 11'h00b;
      expv[33] = 11'h00c;
      expv[34] = 11'h00c;
      expv[35] = 11'h00d;
      expv[36] = 11'h00e;
      expv[37] = 11'h00e;
      expv[38] = 11'h00e;
      expv[39] = 11'h00f;
      expv[40] = 11'h010;
      expv[41] = 11'h010;
      expv[42] = 11'h011;
      expv[43] = 11'h012;
      expv[44] = 11'h012;
      expv[45] = 11'h013;
      expv[46] = 11'h014;
      expv[47] = 11'h014;
      expv[48] = 11'h014;
      expv[49] = 11'h015;
      expv[50] = 11'h016;
      expv[51] = 11'h016;
      expv[52] = 11'h017;
      expv[53] = 11'h018;
      expv[54] = 11'h019;
      expv[55] = 11'h019;
      expv[56] = 11'h01a;
      expv[57] = 11'h01b;
      expv[58] = 11'h01c;
      expv[59] = 11'h01c;
      expv[60] = 11'h3ff;
      expv[61] = 11'h3ff;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
