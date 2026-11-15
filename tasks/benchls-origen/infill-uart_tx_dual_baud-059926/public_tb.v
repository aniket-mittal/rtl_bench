// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059926 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .requested_speed(in_vec[10:10]),
    .block(in_vec[9:9]),
    .data(in_vec[8:1]),
    .new_data(in_vec[0:0]),
    .current_speed(out_vec[2:2]),
    .tx(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h86d;
    stim[1] = 12'ha8f;
    stim[2] = 12'h413;
    stim[3] = 12'h50c;
    stim[4] = 12'h013;
    stim[5] = 12'h493;
    stim[6] = 12'h003;
    stim[7] = 12'h004;
    stim[8] = 12'h39d;
    stim[9] = 12'h337;
    stim[10] = 12'h532;
    stim[11] = 12'h6f2;
    stim[12] = 12'h5bb;
    stim[13] = 12'h4db;
    stim[14] = 12'h6f1;
    stim[15] = 12'h659;
    stim[16] = 12'h0df;
    stim[17] = 12'h58e;
    stim[18] = 12'h5f1;
    stim[19] = 12'h23b;
    stim[20] = 12'h5ff;
    stim[21] = 12'h3b1;
    stim[22] = 12'h6b3;
    stim[23] = 12'h652;
    stim[24] = 12'h63b;
    stim[25] = 12'h0e9;
    stim[26] = 12'h406;
    stim[27] = 12'h7ed;
    stim[28] = 12'h350;
    stim[29] = 12'h663;
    stim[30] = 12'h2cd;
    stim[31] = 12'h0d0;
    stim[32] = 12'h236;
    stim[33] = 12'h5b4;
    stim[34] = 12'h37f;
    stim[35] = 12'h711;
    stim[36] = 12'h269;
    stim[37] = 12'h407;
    stim[38] = 12'h465;
    stim[39] = 12'h581;
    stim[40] = 12'h25c;
    stim[41] = 12'h31f;
    stim[42] = 12'h338;
    stim[43] = 12'h50d;
    stim[44] = 12'h761;
    stim[45] = 12'h5ab;
    stim[46] = 12'h4c6;
    stim[47] = 12'h35e;
    stim[48] = 12'h06d;
    stim[49] = 12'h1f5;
    stim[50] = 12'h54a;
    stim[51] = 12'h162;
    stim[52] = 12'h569;
    stim[53] = 12'h249;
    stim[54] = 12'h358;
    stim[55] = 12'h336;
    stim[56] = 12'h716;
    stim[57] = 12'h1f9;
    stim[58] = 12'h6c7;
    stim[59] = 12'h0d7;
    stim[60] = 12'h622;
    stim[61] = 12'h3c7;
    stim[62] = 12'h398;
    stim[63] = 12'h035;
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
      expv[0] = 3'h2;
      expv[1] = 3'h2;
      expv[2] = 3'h2;
      expv[3] = 3'h7;
      expv[4] = 3'h5;
      expv[5] = 3'h5;
      expv[6] = 3'h5;
      expv[7] = 3'h5;
      expv[8] = 3'h5;
      expv[9] = 3'h5;
      expv[10] = 3'h5;
      expv[11] = 3'h5;
      expv[12] = 3'h5;
      expv[13] = 3'h5;
      expv[14] = 3'h5;
      expv[15] = 3'h5;
      expv[16] = 3'h5;
      expv[17] = 3'h5;
      expv[18] = 3'h5;
      expv[19] = 3'h5;
      expv[20] = 3'h5;
      expv[21] = 3'h5;
      expv[22] = 3'h5;
      expv[23] = 3'h5;
      expv[24] = 3'h5;
      expv[25] = 3'h5;
      expv[26] = 3'h5;
      expv[27] = 3'h5;
      expv[28] = 3'h5;
      expv[29] = 3'h5;
      expv[30] = 3'h5;
      expv[31] = 3'h5;
      expv[32] = 3'h5;
      expv[33] = 3'h5;
      expv[34] = 3'h5;
      expv[35] = 3'h5;
      expv[36] = 3'h5;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h5;
      expv[40] = 3'h5;
      expv[41] = 3'h5;
      expv[42] = 3'h5;
      expv[43] = 3'h5;
      expv[44] = 3'h5;
      expv[45] = 3'h5;
      expv[46] = 3'h5;
      expv[47] = 3'h5;
      expv[48] = 3'h5;
      expv[49] = 3'h5;
      expv[50] = 3'h5;
      expv[51] = 3'h5;
      expv[52] = 3'h5;
      expv[53] = 3'h5;
      expv[54] = 3'h5;
      expv[55] = 3'h5;
      expv[56] = 3'h5;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h5;
      expv[60] = 3'h5;
      expv[61] = 3'h5;
      expv[62] = 3'h5;
      expv[63] = 3'h5;
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
