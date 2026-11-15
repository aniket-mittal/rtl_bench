// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061658 dut (
    .clk(clk),
    .rst(in_vec[3:3]),
    .ShipGRB(in_vec[2:2]),
    .ShipClr(in_vec[1:1]),
    .bdone(in_vec[0:0]),
    .Done(out_vec[11:11]),
    .allDone(out_vec[10:10]),
    .nextLED(out_vec[9:9]),
    .changeColor(out_vec[8:8]),
    .lost(out_vec[7:7]),
    .loadColor(out_vec[6:6]),
    .loadClr(out_vec[5:5]),
    .ClrCounter(out_vec[4:4]),
    .StartCoding(out_vec[3:3]),
    .ShiftPattern(out_vec[2:2]),
    .IncCounter(out_vec[1:1]),
    .qmode(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h9;
    stim[1] = 4'h9;
    stim[2] = 4'h4;
    stim[3] = 4'h4;
    stim[4] = 4'h0;
    stim[5] = 4'h0;
    stim[6] = 4'h5;
    stim[7] = 4'h3;
    stim[8] = 4'h6;
    stim[9] = 4'h7;
    stim[10] = 4'h4;
    stim[11] = 4'h3;
    stim[12] = 4'h0;
    stim[13] = 4'h4;
    stim[14] = 4'h3;
    stim[15] = 4'h4;
    stim[16] = 4'h4;
    stim[17] = 4'h6;
    stim[18] = 4'h6;
    stim[19] = 4'h7;
    stim[20] = 4'h1;
    stim[21] = 4'h4;
    stim[22] = 4'h5;
    stim[23] = 4'h1;
    stim[24] = 4'h7;
    stim[25] = 4'h2;
    stim[26] = 4'h6;
    stim[27] = 4'h4;
    stim[28] = 4'h1;
    stim[29] = 4'h5;
    stim[30] = 4'h2;
    stim[31] = 4'h3;
    stim[32] = 4'h7;
    stim[33] = 4'h5;
    stim[34] = 4'h0;
    stim[35] = 4'h3;
    stim[36] = 4'h5;
    stim[37] = 4'h3;
    stim[38] = 4'h1;
    stim[39] = 4'h0;
    stim[40] = 4'h5;
    stim[41] = 4'h2;
    stim[42] = 4'h6;
    stim[43] = 4'h4;
    stim[44] = 4'h1;
    stim[45] = 4'h2;
    stim[46] = 4'h5;
    stim[47] = 4'h4;
    stim[48] = 4'h5;
    stim[49] = 4'h3;
    stim[50] = 4'h3;
    stim[51] = 4'h2;
    stim[52] = 4'h3;
    stim[53] = 4'h0;
    stim[54] = 4'h3;
    stim[55] = 4'h6;
    stim[56] = 4'h3;
    stim[57] = 4'h5;
    stim[58] = 4'h2;
    stim[59] = 4'h7;
    stim[60] = 4'h0;
    stim[61] = 4'h4;
    stim[62] = 4'h4;
    stim[63] = 4'h7;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h009;
      expv[4] = 12'h001;
      expv[5] = 12'h001;
      expv[6] = 12'h001;
      expv[7] = 12'h007;
      expv[8] = 12'h007;
      expv[9] = 12'h007;
      expv[10] = 12'h007;
      expv[11] = 12'h007;
      expv[12] = 12'h007;
      expv[13] = 12'h007;
      expv[14] = 12'h007;
      expv[15] = 12'h007;
      expv[16] = 12'h007;
      expv[17] = 12'h007;
      expv[18] = 12'h007;
      expv[19] = 12'h007;
      expv[20] = 12'h007;
      expv[21] = 12'h007;
      expv[22] = 12'h007;
      expv[23] = 12'h007;
      expv[24] = 12'h007;
      expv[25] = 12'h007;
      expv[26] = 12'h007;
      expv[27] = 12'h007;
      expv[28] = 12'h007;
      expv[29] = 12'h007;
      expv[30] = 12'h007;
      expv[31] = 12'h007;
      expv[32] = 12'h007;
      expv[33] = 12'h007;
      expv[34] = 12'h007;
      expv[35] = 12'h007;
      expv[36] = 12'h007;
      expv[37] = 12'h007;
      expv[38] = 12'h007;
      expv[39] = 12'h007;
      expv[40] = 12'h007;
      expv[41] = 12'h007;
      expv[42] = 12'h007;
      expv[43] = 12'h007;
      expv[44] = 12'h007;
      expv[45] = 12'h007;
      expv[46] = 12'h007;
      expv[47] = 12'h007;
      expv[48] = 12'h007;
      expv[49] = 12'h007;
      expv[50] = 12'h007;
      expv[51] = 12'h007;
      expv[52] = 12'h007;
      expv[53] = 12'h007;
      expv[54] = 12'h007;
      expv[55] = 12'h007;
      expv[56] = 12'h007;
      expv[57] = 12'h007;
      expv[58] = 12'h007;
      expv[59] = 12'h007;
      expv[60] = 12'h007;
      expv[61] = 12'h007;
      expv[62] = 12'h007;
      expv[63] = 12'h007;
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
