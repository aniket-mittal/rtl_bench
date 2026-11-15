// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004837 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .loadInst(in_vec[1:1]),
    .memoryReadValid(in_vec[0:0]),
    .fetch_RequestState(out_vec[6:6]),
    .fetch_ReceiveState(out_vec[5:5]),
    .decodeState(out_vec[4:4]),
    .setupState(out_vec[3:3]),
    .executeState(out_vec[2:2]),
    .memReadState(out_vec[1:1]),
    .writebackState(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h7;
    stim[2] = 3'h0;
    stim[3] = 3'h3;
    stim[4] = 3'h1;
    stim[5] = 3'h0;
    stim[6] = 3'h3;
    stim[7] = 3'h2;
    stim[8] = 3'h3;
    stim[9] = 3'h0;
    stim[10] = 3'h3;
    stim[11] = 3'h3;
    stim[12] = 3'h1;
    stim[13] = 3'h2;
    stim[14] = 3'h2;
    stim[15] = 3'h2;
    stim[16] = 3'h3;
    stim[17] = 3'h1;
    stim[18] = 3'h3;
    stim[19] = 3'h3;
    stim[20] = 3'h2;
    stim[21] = 3'h2;
    stim[22] = 3'h1;
    stim[23] = 3'h1;
    stim[24] = 3'h0;
    stim[25] = 3'h1;
    stim[26] = 3'h2;
    stim[27] = 3'h0;
    stim[28] = 3'h1;
    stim[29] = 3'h0;
    stim[30] = 3'h2;
    stim[31] = 3'h3;
    stim[32] = 3'h3;
    stim[33] = 3'h1;
    stim[34] = 3'h3;
    stim[35] = 3'h2;
    stim[36] = 3'h0;
    stim[37] = 3'h1;
    stim[38] = 3'h3;
    stim[39] = 3'h0;
    stim[40] = 3'h0;
    stim[41] = 3'h3;
    stim[42] = 3'h2;
    stim[43] = 3'h2;
    stim[44] = 3'h1;
    stim[45] = 3'h0;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h3;
    stim[49] = 3'h3;
    stim[50] = 3'h3;
    stim[51] = 3'h1;
    stim[52] = 3'h0;
    stim[53] = 3'h0;
    stim[54] = 3'h2;
    stim[55] = 3'h3;
    stim[56] = 3'h1;
    stim[57] = 3'h0;
    stim[58] = 3'h2;
    stim[59] = 3'h0;
    stim[60] = 3'h3;
    stim[61] = 3'h3;
    stim[62] = 3'h1;
    stim[63] = 3'h3;
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
      expv[0] = 7'h40;
      expv[1] = 7'h40;
      expv[2] = 7'h40;
      expv[3] = 7'h40;
      expv[4] = 7'h20;
      expv[5] = 7'h10;
      expv[6] = 7'h08;
      expv[7] = 7'h04;
      expv[8] = 7'h02;
      expv[9] = 7'h01;
      expv[10] = 7'h40;
      expv[11] = 7'h20;
      expv[12] = 7'h10;
      expv[13] = 7'h08;
      expv[14] = 7'h04;
      expv[15] = 7'h02;
      expv[16] = 7'h02;
      expv[17] = 7'h01;
      expv[18] = 7'h40;
      expv[19] = 7'h20;
      expv[20] = 7'h10;
      expv[21] = 7'h08;
      expv[22] = 7'h04;
      expv[23] = 7'h40;
      expv[24] = 7'h20;
      expv[25] = 7'h10;
      expv[26] = 7'h08;
      expv[27] = 7'h04;
      expv[28] = 7'h40;
      expv[29] = 7'h20;
      expv[30] = 7'h10;
      expv[31] = 7'h08;
      expv[32] = 7'h04;
      expv[33] = 7'h02;
      expv[34] = 7'h01;
      expv[35] = 7'h40;
      expv[36] = 7'h40;
      expv[37] = 7'h40;
      expv[38] = 7'h20;
      expv[39] = 7'h10;
      expv[40] = 7'h08;
      expv[41] = 7'h04;
      expv[42] = 7'h02;
      expv[43] = 7'h02;
      expv[44] = 7'h02;
      expv[45] = 7'h01;
      expv[46] = 7'h40;
      expv[47] = 7'h20;
      expv[48] = 7'h10;
      expv[49] = 7'h08;
      expv[50] = 7'h04;
      expv[51] = 7'h02;
      expv[52] = 7'h01;
      expv[53] = 7'h40;
      expv[54] = 7'h40;
      expv[55] = 7'h40;
      expv[56] = 7'h20;
      expv[57] = 7'h10;
      expv[58] = 7'h08;
      expv[59] = 7'h04;
      expv[60] = 7'h40;
      expv[61] = 7'h20;
      expv[62] = 7'h10;
      expv[63] = 7'h08;
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
