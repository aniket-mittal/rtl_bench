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

  rtlpp_06332 dut (
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
    stim[0] = 22'h2d577e;
    stim[1] = 22'h153d2a;
    stim[2] = 22'h02c7ad;
    stim[3] = 22'h2b6a2d;
    stim[4] = 22'h1ba1f9;
    stim[5] = 22'h3710d9;
    stim[6] = 22'h36e3e3;
    stim[7] = 22'h2494c5;
    stim[8] = 22'h36364f;
    stim[9] = 22'h0a380c;
    stim[10] = 22'h1713e2;
    stim[11] = 22'h12dc1d;
    stim[12] = 22'h363686;
    stim[13] = 22'h07b4b2;
    stim[14] = 22'h1a4abf;
    stim[15] = 22'h17a116;
    stim[16] = 22'h377134;
    stim[17] = 22'h2ed7d9;
    stim[18] = 22'h2afa94;
    stim[19] = 22'h229533;
    stim[20] = 22'h2aa0de;
    stim[21] = 22'h1a657b;
    stim[22] = 22'h13cbdc;
    stim[23] = 22'h177206;
    stim[24] = 22'h3f84b8;
    stim[25] = 22'h1798ad;
    stim[26] = 22'h0b4808;
    stim[27] = 22'h33662a;
    stim[28] = 22'h0fac82;
    stim[29] = 22'h0238e9;
    stim[30] = 22'h3a193b;
    stim[31] = 22'h079742;
    stim[32] = 22'h07fb40;
    stim[33] = 22'h2ee776;
    stim[34] = 22'h37806b;
    stim[35] = 22'h0ecb66;
    stim[36] = 22'h2f590a;
    stim[37] = 22'h0fc292;
    stim[38] = 22'h27140c;
    stim[39] = 22'h027764;
    stim[40] = 22'h1e36c0;
    stim[41] = 22'h138580;
    stim[42] = 22'h0a8b10;
    stim[43] = 22'h274977;
    stim[44] = 22'h3bd7b2;
    stim[45] = 22'h0bc163;
    stim[46] = 22'h3f1b7e;
    stim[47] = 22'h1ec1d6;
    stim[48] = 22'h137785;
    stim[49] = 22'h2376d0;
    stim[50] = 22'h3b4f04;
    stim[51] = 22'h368635;
    stim[52] = 22'h3ef3ff;
    stim[53] = 22'h2e5387;
    stim[54] = 22'h0b1ae2;
    stim[55] = 22'h23ea30;
    stim[56] = 22'h26bb31;
    stim[57] = 22'h07ad7a;
    stim[58] = 22'h3fd03f;
    stim[59] = 22'h1f913c;
    stim[60] = 22'h3650af;
    stim[61] = 22'h0b7e5b;
    stim[62] = 22'h1bb523;
    stim[63] = 22'h1be2fc;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h0c34f;
      expv[12] = 17'h0c34f;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h0c34f;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h0c34f;
      expv[25] = 17'h00000;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00006;
      expv[39] = 17'h0c34f;
      expv[40] = 17'h08000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0c34f;
      expv[43] = 17'h00006;
      expv[44] = 17'h0c34f;
      expv[45] = 17'h00000;
      expv[46] = 17'h00006;
      expv[47] = 17'h00000;
      expv[48] = 17'h036c0;
      expv[49] = 17'h0c34f;
      expv[50] = 17'h0c34f;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00006;
      expv[56] = 17'h0c34f;
      expv[57] = 17'h0c34f;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h0c1d6;
      expv[61] = 17'h00000;
      expv[62] = 17'h00006;
      expv[63] = 17'h0c1d6;
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
