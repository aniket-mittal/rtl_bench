// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04457 dut (
    .clk(clk),
    .address(in_vec[12:11]),
    .chipselect(in_vec[10:10]),
    .in_port(in_vec[9:6]),
    .reset_n(in_vec[5:5]),
    .write_n(in_vec[4:4]),
    .writedata(in_vec[3:0]),
    .irq(out_vec[4:4]),
    .readdata(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0216;
    stim[1] = 13'h17d3;
    stim[2] = 13'h15ef;
    stim[3] = 13'h0a6b;
    stim[4] = 13'h1672;
    stim[5] = 13'h15af;
    stim[6] = 13'h016d;
    stim[7] = 13'h1e78;
    stim[8] = 13'h1fe1;
    stim[9] = 13'h0b20;
    stim[10] = 13'h1ff9;
    stim[11] = 13'h0525;
    stim[12] = 13'h0de3;
    stim[13] = 13'h00bd;
    stim[14] = 13'h0dad;
    stim[15] = 13'h166e;
    stim[16] = 13'h0fbb;
    stim[17] = 13'h1c20;
    stim[18] = 13'h04bc;
    stim[19] = 13'h0e74;
    stim[20] = 13'h0d27;
    stim[21] = 13'h1236;
    stim[22] = 13'h05e2;
    stim[23] = 13'h1cbc;
    stim[24] = 13'h11ea;
    stim[25] = 13'h09fc;
    stim[26] = 13'h13ab;
    stim[27] = 13'h1b38;
    stim[28] = 13'h1c30;
    stim[29] = 13'h0db9;
    stim[30] = 13'h0035;
    stim[31] = 13'h0fb8;
    stim[32] = 13'h1231;
    stim[33] = 13'h1171;
    stim[34] = 13'h1df2;
    stim[35] = 13'h13a5;
    stim[36] = 13'h17bc;
    stim[37] = 13'h1f34;
    stim[38] = 13'h10e8;
    stim[39] = 13'h16a2;
    stim[40] = 13'h0d29;
    stim[41] = 13'h10e1;
    stim[42] = 13'h11bf;
    stim[43] = 13'h1a2c;
    stim[44] = 13'h1425;
    stim[45] = 13'h1221;
    stim[46] = 13'h0538;
    stim[47] = 13'h1733;
    stim[48] = 13'h15e2;
    stim[49] = 13'h066d;
    stim[50] = 13'h07aa;
    stim[51] = 13'h0fe3;
    stim[52] = 13'h0c76;
    stim[53] = 13'h1b76;
    stim[54] = 13'h14f1;
    stim[55] = 13'h08f1;
    stim[56] = 13'h1b25;
    stim[57] = 13'h0fb8;
    stim[58] = 13'h0d2e;
    stim[59] = 13'h0322;
    stim[60] = 13'h0a2f;
    stim[61] = 13'h1321;
    stim[62] = 13'h123c;
    stim[63] = 13'h1bb8;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h1f;
      expv[6] = 5'h1f;
      expv[7] = 5'h15;
      expv[8] = 5'h1f;
      expv[9] = 5'h0f;
      expv[10] = 5'h00;
      expv[11] = 5'h10;
      expv[12] = 5'h14;
      expv[13] = 5'h10;
      expv[14] = 5'h12;
      expv[15] = 5'h10;
      expv[16] = 5'h1f;
      expv[17] = 5'h10;
      expv[18] = 5'h0f;
      expv[19] = 5'h12;
      expv[20] = 5'h10;
      expv[21] = 5'h10;
      expv[22] = 5'h1e;
      expv[23] = 5'h17;
      expv[24] = 5'h1f;
      expv[25] = 5'h1e;
      expv[26] = 5'h10;
      expv[27] = 5'h1e;
      expv[28] = 5'h1f;
      expv[29] = 5'h1f;
      expv[30] = 5'h10;
      expv[31] = 5'h10;
      expv[32] = 5'h10;
      expv[33] = 5'h1e;
      expv[34] = 5'h1e;
      expv[35] = 5'h1f;
      expv[36] = 5'h1e;
      expv[37] = 5'h1e;
      expv[38] = 5'h1f;
      expv[39] = 5'h1e;
      expv[40] = 5'h1e;
      expv[41] = 5'h10;
      expv[42] = 5'h12;
      expv[43] = 5'h12;
      expv[44] = 5'h1f;
      expv[45] = 5'h12;
      expv[46] = 5'h15;
      expv[47] = 5'h14;
      expv[48] = 5'h15;
      expv[49] = 5'h15;
      expv[50] = 5'h19;
      expv[51] = 5'h1e;
      expv[52] = 5'h10;
      expv[53] = 5'h10;
      expv[54] = 5'h1f;
      expv[55] = 5'h12;
      expv[56] = 5'h10;
      expv[57] = 5'h1f;
      expv[58] = 5'h10;
      expv[59] = 5'h10;
      expv[60] = 5'h1c;
      expv[61] = 5'h10;
      expv[62] = 5'h12;
      expv[63] = 5'h12;
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
