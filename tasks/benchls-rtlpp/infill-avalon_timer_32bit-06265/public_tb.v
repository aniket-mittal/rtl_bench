// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06265 dut (
    .clk(clk),
    .address(in_vec[21:19]),
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
    stim[0] = 22'h3dceca;
    stim[1] = 22'h24f2ca;
    stim[2] = 22'h2fe9db;
    stim[3] = 22'h0f1eba;
    stim[4] = 22'h1b1a79;
    stim[5] = 22'h1a66de;
    stim[6] = 22'h3e35aa;
    stim[7] = 22'h1f4551;
    stim[8] = 22'h0bdf4f;
    stim[9] = 22'h060d02;
    stim[10] = 22'h356556;
    stim[11] = 22'h0b5184;
    stim[12] = 22'h222b90;
    stim[13] = 22'h07a2fb;
    stim[14] = 22'h3b8d86;
    stim[15] = 22'h133df9;
    stim[16] = 22'h232a7c;
    stim[17] = 22'h0269ac;
    stim[18] = 22'h1f997e;
    stim[19] = 22'h2bea0f;
    stim[20] = 22'h077c1e;
    stim[21] = 22'h1f9342;
    stim[22] = 22'h1bcc44;
    stim[23] = 22'h2ed60a;
    stim[24] = 22'h12ccf5;
    stim[25] = 22'h3b2c4e;
    stim[26] = 22'h26de0a;
    stim[27] = 22'h17eb70;
    stim[28] = 22'h0eb775;
    stim[29] = 22'h22bc42;
    stim[30] = 22'h336f05;
    stim[31] = 22'h0f8739;
    stim[32] = 22'h3eacc2;
    stim[33] = 22'h2b0a9f;
    stim[34] = 22'h07e11b;
    stim[35] = 22'h3afbb0;
    stim[36] = 22'h23b6ec;
    stim[37] = 22'h1b3aaf;
    stim[38] = 22'h0e53f3;
    stim[39] = 22'h2fb47c;
    stim[40] = 22'h3e1e4b;
    stim[41] = 22'h1a6c7f;
    stim[42] = 22'h2e5cb8;
    stim[43] = 22'h1206a7;
    stim[44] = 22'h37559d;
    stim[45] = 22'h334485;
    stim[46] = 22'h1bb5ed;
    stim[47] = 22'h1ec3ec;
    stim[48] = 22'h1f0416;
    stim[49] = 22'h2b2675;
    stim[50] = 22'h1a1d31;
    stim[51] = 22'h1eec0d;
    stim[52] = 22'h1bf17c;
    stim[53] = 22'h32cfba;
    stim[54] = 22'h3bb8fd;
    stim[55] = 22'h17185f;
    stim[56] = 22'h227070;
    stim[57] = 22'h26ce62;
    stim[58] = 22'h079816;
    stim[59] = 22'h038de3;
    stim[60] = 22'h3be7ef;
    stim[61] = 22'h1246bf;
    stim[62] = 22'h1ede2f;
    stim[63] = 22'h232c93;
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
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00002;
      expv[6] = 17'h00002;
      expv[7] = 17'h00000;
      expv[8] = 17'h00002;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h049ef;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00002;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00002;
      expv[23] = 17'h00002;
      expv[24] = 17'h00000;
      expv[25] = 17'h049ef;
      expv[26] = 17'h00000;
      expv[27] = 17'h049ef;
      expv[28] = 17'h049ef;
      expv[29] = 17'h00000;
      expv[30] = 17'h049ef;
      expv[31] = 17'h00000;
      expv[32] = 17'h00005;
      expv[33] = 17'h00000;
      expv[34] = 17'h00002;
      expv[35] = 17'h00002;
      expv[36] = 17'h00000;
      expv[37] = 17'h049ef;
      expv[38] = 17'h00002;
      expv[39] = 17'h00005;
      expv[40] = 17'h00002;
      expv[41] = 17'h00000;
      expv[42] = 17'h00002;
      expv[43] = 17'h00002;
      expv[44] = 17'h049ef;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00002;
      expv[48] = 17'h00002;
      expv[49] = 17'h0c3ec;
      expv[50] = 17'h00002;
      expv[51] = 17'h0c3ec;
      expv[52] = 17'h0c3ec;
      expv[53] = 17'h0ec0d;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h049ef;
      expv[57] = 17'h049e2;
      expv[58] = 17'h049e2;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h049ef;
      expv[63] = 17'h0ec0d;
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
