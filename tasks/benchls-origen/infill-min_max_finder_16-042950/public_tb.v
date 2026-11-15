// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042950 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .en(in_vec[16:16]),
    .data(in_vec[15:0]),
    .o_min(out_vec[31:16]),
    .o_max(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h345a3;
    stim[1] = 18'h21e1a;
    stim[2] = 18'h186ce;
    stim[3] = 18'h1ad12;
    stim[4] = 18'h1db01;
    stim[5] = 18'h16723;
    stim[6] = 18'h1ab34;
    stim[7] = 18'h08c0a;
    stim[8] = 18'h2f3a4;
    stim[9] = 18'h109ae;
    stim[10] = 18'h1cd72;
    stim[11] = 18'h1216d;
    stim[12] = 18'h17ea3;
    stim[13] = 18'h1603e;
    stim[14] = 18'h0e98c;
    stim[15] = 18'h0cf29;
    stim[16] = 18'h089b1;
    stim[17] = 18'h1a829;
    stim[18] = 18'h02497;
    stim[19] = 18'h19182;
    stim[20] = 18'h1b783;
    stim[21] = 18'h000ec;
    stim[22] = 18'h04df5;
    stim[23] = 18'h061f0;
    stim[24] = 18'h1a1ff;
    stim[25] = 18'h10062;
    stim[26] = 18'h18e34;
    stim[27] = 18'h08544;
    stim[28] = 18'h060b6;
    stim[29] = 18'h034c2;
    stim[30] = 18'h11f4a;
    stim[31] = 18'h031dd;
    stim[32] = 18'h172c7;
    stim[33] = 18'h1d58e;
    stim[34] = 18'h10f68;
    stim[35] = 18'h0d9e1;
    stim[36] = 18'h1c77c;
    stim[37] = 18'h0ba3a;
    stim[38] = 18'h13463;
    stim[39] = 18'h0f4c8;
    stim[40] = 18'h148d1;
    stim[41] = 18'h01bb7;
    stim[42] = 18'h12fa8;
    stim[43] = 18'h030cb;
    stim[44] = 18'h1bc48;
    stim[45] = 18'h137fe;
    stim[46] = 18'h083f4;
    stim[47] = 18'h1e61f;
    stim[48] = 18'h0ff08;
    stim[49] = 18'h10dae;
    stim[50] = 18'h103eb;
    stim[51] = 18'h0b286;
    stim[52] = 18'h006df;
    stim[53] = 18'h13963;
    stim[54] = 18'h024d7;
    stim[55] = 18'h0da78;
    stim[56] = 18'h02a25;
    stim[57] = 18'h1d3e6;
    stim[58] = 18'h09326;
    stim[59] = 18'h17d23;
    stim[60] = 18'h1d4f8;
    stim[61] = 18'h012ee;
    stim[62] = 18'h1d52c;
    stim[63] = 18'h1d960;
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
      expv[0] = 32'hffff0000;
      expv[1] = 32'hffff0000;
      expv[2] = 32'hffff0000;
      expv[3] = 32'hffff0000;
      expv[4] = 32'hffff0000;
      expv[5] = 32'hffff0000;
      expv[6] = 32'hffff0000;
      expv[7] = 32'hffff0000;
      expv[8] = 32'hffff0000;
      expv[9] = 32'hffff0000;
      expv[10] = 32'hffff0000;
      expv[11] = 32'hffff0000;
      expv[12] = 32'hffff0000;
      expv[13] = 32'hffff0000;
      expv[14] = 32'hffff0000;
      expv[15] = 32'hffff0000;
      expv[16] = 32'hffff0000;
      expv[17] = 32'hffff0000;
      expv[18] = 32'hffff0000;
      expv[19] = 32'hffff0000;
      expv[20] = 32'hffff0000;
      expv[21] = 32'hffff0000;
      expv[22] = 32'hffff0000;
      expv[23] = 32'hffff0000;
      expv[24] = 32'hffff0000;
      expv[25] = 32'hffff0000;
      expv[26] = 32'hffff0000;
      expv[27] = 32'hffff0000;
      expv[28] = 32'hffff0000;
      expv[29] = 32'hffff0000;
      expv[30] = 32'hffff0000;
      expv[31] = 32'hffff0000;
      expv[32] = 32'hffff0000;
      expv[33] = 32'hffff0000;
      expv[34] = 32'hffff0000;
      expv[35] = 32'hffff0000;
      expv[36] = 32'hffff0000;
      expv[37] = 32'hffff0000;
      expv[38] = 32'hffff0000;
      expv[39] = 32'hffff0000;
      expv[40] = 32'hffff0000;
      expv[41] = 32'h00ece98c;
      expv[42] = 32'h00ece98c;
      expv[43] = 32'h00ece98c;
      expv[44] = 32'h00ece98c;
      expv[45] = 32'h00ece98c;
      expv[46] = 32'h00ece98c;
      expv[47] = 32'h00ece98c;
      expv[48] = 32'h00ece98c;
      expv[49] = 32'h00ece98c;
      expv[50] = 32'h00ece98c;
      expv[51] = 32'h00ece98c;
      expv[52] = 32'h00ece98c;
      expv[53] = 32'h00ece98c;
      expv[54] = 32'h00ece98c;
      expv[55] = 32'h00ece98c;
      expv[56] = 32'h00ece98c;
      expv[57] = 32'h00ece98c;
      expv[58] = 32'h00ece98c;
      expv[59] = 32'h00ece98c;
      expv[60] = 32'h00ece98c;
      expv[61] = 32'h00ece98c;
      expv[62] = 32'h00ece98c;
      expv[63] = 32'h00ece98c;
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
