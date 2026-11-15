// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131307 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .data_in(in_vec[23:16]),
    .len(in_vec[15:0]),
    .checksum(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h14098a9;
    stim[1] = 25'h1161d95;
    stim[2] = 25'h05358a4;
    stim[3] = 25'h03ebd13;
    stim[4] = 25'h0765ebd;
    stim[5] = 25'h0d01c29;
    stim[6] = 25'h0a5cd12;
    stim[7] = 25'h04c5d58;
    stim[8] = 25'h072f4da;
    stim[9] = 25'h0626880;
    stim[10] = 25'h0f1c874;
    stim[11] = 25'h0c99d05;
    stim[12] = 25'h097a90f;
    stim[13] = 25'h0d3936d;
    stim[14] = 25'h0d1f6eb;
    stim[15] = 25'h0c40e2e;
    stim[16] = 25'h03dff64;
    stim[17] = 25'h067d2e2;
    stim[18] = 25'h1fc10b9;
    stim[19] = 25'h0c9ff5b;
    stim[20] = 25'h0aab24b;
    stim[21] = 25'h0c6976d;
    stim[22] = 25'h0678b76;
    stim[23] = 25'h00a4acc;
    stim[24] = 25'h07482be;
    stim[25] = 25'h053730f;
    stim[26] = 25'h001267e;
    stim[27] = 25'h06fd56a;
    stim[28] = 25'h00d868e;
    stim[29] = 25'h052b8a4;
    stim[30] = 25'h1684139;
    stim[31] = 25'h0891b9e;
    stim[32] = 25'h0a4f39e;
    stim[33] = 25'h0ed2e25;
    stim[34] = 25'h0387325;
    stim[35] = 25'h05fd8c7;
    stim[36] = 25'h0b63bbb;
    stim[37] = 25'h0efb9ed;
    stim[38] = 25'h0c8dc54;
    stim[39] = 25'h0393a90;
    stim[40] = 25'h0edc7d0;
    stim[41] = 25'h02b9675;
    stim[42] = 25'h07312ca;
    stim[43] = 25'h02cf95c;
    stim[44] = 25'h0020c54;
    stim[45] = 25'h0046ed2;
    stim[46] = 25'h0e1b7f3;
    stim[47] = 25'h0d995ec;
    stim[48] = 25'h083e8c4;
    stim[49] = 25'h0f24492;
    stim[50] = 25'h0324642;
    stim[51] = 25'h0723c37;
    stim[52] = 25'h04c4c29;
    stim[53] = 25'h13269a5;
    stim[54] = 25'h0eb8495;
    stim[55] = 25'h08f0a79;
    stim[56] = 25'h013a539;
    stim[57] = 25'h05710ba;
    stim[58] = 25'h05725fd;
    stim[59] = 25'h00d94f2;
    stim[60] = 25'h0ebddb2;
    stim[61] = 25'h020c67d;
    stim[62] = 25'h0451f2d;
    stim[63] = 25'h06f5a79;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
