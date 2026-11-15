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

  autovcoder_062851 dut (
    .clk(clk),
    .s_rst(in_vec[11:11]),
    .idle(in_vec[10:10]),
    .src_vaild(in_vec[9:9]),
    .src_data_in(in_vec[8:1]),
    .dst_ready(in_vec[0:0]),
    .src_ready(out_vec[9:9]),
    .dst_vaild(out_vec[8:8]),
    .dst_data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'heaa;
    stim[1] = 12'hd60;
    stim[2] = 12'h5ea;
    stim[3] = 12'h561;
    stim[4] = 12'h736;
    stim[5] = 12'h267;
    stim[6] = 12'h0d6;
    stim[7] = 12'h60c;
    stim[8] = 12'h0e2;
    stim[9] = 12'h0e8;
    stim[10] = 12'h0ee;
    stim[11] = 12'h007;
    stim[12] = 12'h667;
    stim[13] = 12'h758;
    stim[14] = 12'h485;
    stim[15] = 12'h48a;
    stim[16] = 12'h7d7;
    stim[17] = 12'h7a3;
    stim[18] = 12'h71d;
    stim[19] = 12'h239;
    stim[20] = 12'h41e;
    stim[21] = 12'h78e;
    stim[22] = 12'h544;
    stim[23] = 12'h4f0;
    stim[24] = 12'h581;
    stim[25] = 12'h7a8;
    stim[26] = 12'h031;
    stim[27] = 12'h0e2;
    stim[28] = 12'h0ed;
    stim[29] = 12'h6ef;
    stim[30] = 12'h79d;
    stim[31] = 12'h059;
    stim[32] = 12'h72e;
    stim[33] = 12'h61b;
    stim[34] = 12'h570;
    stim[35] = 12'h115;
    stim[36] = 12'h636;
    stim[37] = 12'h2be;
    stim[38] = 12'h380;
    stim[39] = 12'h0df;
    stim[40] = 12'h1f6;
    stim[41] = 12'h091;
    stim[42] = 12'h114;
    stim[43] = 12'h25e;
    stim[44] = 12'h2c9;
    stim[45] = 12'h18f;
    stim[46] = 12'h583;
    stim[47] = 12'h1ab;
    stim[48] = 12'h0b5;
    stim[49] = 12'h674;
    stim[50] = 12'h639;
    stim[51] = 12'h107;
    stim[52] = 12'h63f;
    stim[53] = 12'h289;
    stim[54] = 12'h076;
    stim[55] = 12'h059;
    stim[56] = 12'h49c;
    stim[57] = 12'h40b;
    stim[58] = 12'h667;
    stim[59] = 12'h3c0;
    stim[60] = 12'h46e;
    stim[61] = 12'h097;
    stim[62] = 12'h05f;
    stim[63] = 12'h456;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h200;
      expv[5] = 10'h39b;
      expv[6] = 10'h333;
      expv[7] = 10'h333;
      expv[8] = 10'h133;
      expv[9] = 10'h133;
      expv[10] = 10'h133;
      expv[11] = 10'h133;
      expv[12] = 10'h306;
      expv[13] = 10'h333;
      expv[14] = 10'h133;
      expv[15] = 10'h3ac;
      expv[16] = 10'h3ac;
      expv[17] = 10'h3eb;
      expv[18] = 10'h3d1;
      expv[19] = 10'h38e;
      expv[20] = 10'h31c;
      expv[21] = 10'h31c;
      expv[22] = 10'h11c;
      expv[23] = 10'h11c;
      expv[24] = 10'h11c;
      expv[25] = 10'h3c7;
      expv[26] = 10'h1c7;
      expv[27] = 10'h3d4;
      expv[28] = 10'h3d4;
      expv[29] = 10'h2c7;
      expv[30] = 10'h377;
      expv[31] = 10'h3ce;
      expv[32] = 10'h277;
      expv[33] = 10'h397;
      expv[34] = 10'h30d;
      expv[35] = 10'h30d;
      expv[36] = 10'h297;
      expv[37] = 10'h31b;
      expv[38] = 10'h11b;
      expv[39] = 10'h11b;
      expv[40] = 10'h35f;
      expv[41] = 10'h35f;
      expv[42] = 10'h21b;
      expv[43] = 10'h21b;
      expv[44] = 10'h32f;
      expv[45] = 10'h364;
      expv[46] = 10'h22f;
      expv[47] = 10'h22f;
      expv[48] = 10'h22f;
      expv[49] = 10'h22f;
      expv[50] = 10'h33a;
      expv[51] = 10'h31c;
      expv[52] = 10'h23a;
      expv[53] = 10'h31f;
      expv[54] = 10'h344;
      expv[55] = 10'h344;
      expv[56] = 10'h21f;
      expv[57] = 10'h21f;
      expv[58] = 10'h21f;
      expv[59] = 10'h333;
      expv[60] = 10'h133;
      expv[61] = 10'h133;
      expv[62] = 10'h3e0;
      expv[63] = 10'h233;
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
