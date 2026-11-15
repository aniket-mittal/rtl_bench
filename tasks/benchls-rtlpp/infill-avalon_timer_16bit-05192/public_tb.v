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

  rtlpp_05192 dut (
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
    stim[0] = 22'h188aa6;
    stim[1] = 22'h1d2047;
    stim[2] = 22'h1a5f93;
    stim[3] = 22'h36d550;
    stim[4] = 22'h1effe0;
    stim[5] = 22'h2fc6b3;
    stim[6] = 22'h0256ab;
    stim[7] = 22'h2a6108;
    stim[8] = 22'h3ff4da;
    stim[9] = 22'h2fab7a;
    stim[10] = 22'h375d28;
    stim[11] = 22'h3a12ac;
    stim[12] = 22'h2a5e7b;
    stim[13] = 22'h2394b5;
    stim[14] = 22'h324d48;
    stim[15] = 22'h1baed8;
    stim[16] = 22'h1b8c94;
    stim[17] = 22'h3b6bd9;
    stim[18] = 22'h174207;
    stim[19] = 22'h2290d2;
    stim[20] = 22'h17b001;
    stim[21] = 22'h1b5a9b;
    stim[22] = 22'h3bf856;
    stim[23] = 22'h16bdd9;
    stim[24] = 22'h2ef86f;
    stim[25] = 22'h0b9aeb;
    stim[26] = 22'h184fae;
    stim[27] = 22'h0e5671;
    stim[28] = 22'h1ea35c;
    stim[29] = 22'h2bb093;
    stim[30] = 22'h2a680a;
    stim[31] = 22'h2360f6;
    stim[32] = 22'h062885;
    stim[33] = 22'h0773f4;
    stim[34] = 22'h37d126;
    stim[35] = 22'h23eda4;
    stim[36] = 22'h3f46b2;
    stim[37] = 22'h3fdf66;
    stim[38] = 22'h079489;
    stim[39] = 22'h26475c;
    stim[40] = 22'h0e52d7;
    stim[41] = 22'h36b9cd;
    stim[42] = 22'h22677e;
    stim[43] = 22'h172a02;
    stim[44] = 22'h1acd3e;
    stim[45] = 22'h17b639;
    stim[46] = 22'h225493;
    stim[47] = 22'h1e34e7;
    stim[48] = 22'h1f0c4e;
    stim[49] = 22'h1fb5a1;
    stim[50] = 22'h375470;
    stim[51] = 22'h3ffc45;
    stim[52] = 22'h12a7c9;
    stim[53] = 22'h239c70;
    stim[54] = 22'h16f339;
    stim[55] = 22'h1a43bc;
    stim[56] = 22'h330272;
    stim[57] = 22'h37b0c2;
    stim[58] = 22'h07428e;
    stim[59] = 22'h0efffd;
    stim[60] = 22'h26259d;
    stim[61] = 22'h3ef41c;
    stim[62] = 22'h22c3de;
    stim[63] = 22'h3ea3bb;
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
      expv[3] = 17'h0005f;
      expv[4] = 17'h00000;
      expv[5] = 17'h0005f;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0ffe0;
      expv[17] = 17'h0ffe0;
      expv[18] = 17'h00000;
      expv[19] = 17'h05e0f;
      expv[20] = 17'h00000;
      expv[21] = 17'h05e0f;
      expv[22] = 17'h0ffe0;
      expv[23] = 17'h00000;
      expv[24] = 17'h05e0f;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0005f;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00001;
      expv[42] = 17'h00000;
      expv[43] = 17'h05e0f;
      expv[44] = 17'h05e0f;
      expv[45] = 17'h0a35c;
      expv[46] = 17'h05e0f;
      expv[47] = 17'h05e0f;
      expv[48] = 17'h0a35c;
      expv[49] = 17'h034e7;
      expv[50] = 17'h034e7;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h05e0f;
      expv[54] = 17'h05e0f;
      expv[55] = 17'h05e0f;
      expv[56] = 17'h034e7;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00007;
      expv[61] = 17'h05e0f;
      expv[62] = 17'h00000;
      expv[63] = 17'h0f339;
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
