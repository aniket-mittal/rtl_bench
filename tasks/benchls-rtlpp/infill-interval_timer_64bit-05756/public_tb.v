// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05756 dut (
    .clk(clk),
    .address(in_vec[22:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h71fd92;
    stim[1] = 23'h05bfbe;
    stim[2] = 23'h1679fa;
    stim[3] = 23'h0fa812;
    stim[4] = 23'h1b1622;
    stim[5] = 23'h22a266;
    stim[6] = 23'h2ed45c;
    stim[7] = 23'h3706c2;
    stim[8] = 23'h5e5c51;
    stim[9] = 23'h7b7143;
    stim[10] = 23'h4f3221;
    stim[11] = 23'h13b9ef;
    stim[12] = 23'h6771fc;
    stim[13] = 23'h7399fc;
    stim[14] = 23'h13d2f8;
    stim[15] = 23'h2ef1a6;
    stim[16] = 23'h5f3572;
    stim[17] = 23'h3edfce;
    stim[18] = 23'h5fbd49;
    stim[19] = 23'h47280c;
    stim[20] = 23'h4630f8;
    stim[21] = 23'h5e4f89;
    stim[22] = 23'h0b5e96;
    stim[23] = 23'h5fae4a;
    stim[24] = 23'h6b5d29;
    stim[25] = 23'h746026;
    stim[26] = 23'h4e8dab;
    stim[27] = 23'h02b9a8;
    stim[28] = 23'h12ce9c;
    stim[29] = 23'h16dd4b;
    stim[30] = 23'h6f66cd;
    stim[31] = 23'h420426;
    stim[32] = 23'h3345f7;
    stim[33] = 23'h6e161f;
    stim[34] = 23'h6345f3;
    stim[35] = 23'h368aa5;
    stim[36] = 23'h635301;
    stim[37] = 23'h3f1203;
    stim[38] = 23'h6fed80;
    stim[39] = 23'h5bd1cd;
    stim[40] = 23'h36daef;
    stim[41] = 23'h1e99d3;
    stim[42] = 23'h0fd56d;
    stim[43] = 23'h3b331d;
    stim[44] = 23'h726991;
    stim[45] = 23'h377875;
    stim[46] = 23'h2b387c;
    stim[47] = 23'h667912;
    stim[48] = 23'h0287b0;
    stim[49] = 23'h66b2ac;
    stim[50] = 23'h6eaece;
    stim[51] = 23'h418005;
    stim[52] = 23'h3fd1f7;
    stim[53] = 23'h0b05e2;
    stim[54] = 23'h1f0be1;
    stim[55] = 23'h5f7046;
    stim[56] = 23'h6aea9f;
    stim[57] = 23'h5bf3c1;
    stim[58] = 23'h4e679a;
    stim[59] = 23'h43fd15;
    stim[60] = 23'h2f319c;
    stim[61] = 23'h2bee8d;
    stim[62] = 23'h633333;
    stim[63] = 23'h7a71d3;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h0c34f;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h079fa;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h079fa;
      expv[16] = 17'h0d45c;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h0c34f;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h0c34f;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h0dd4b;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0dd4b;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
