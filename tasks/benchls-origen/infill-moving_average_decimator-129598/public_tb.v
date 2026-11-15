// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129598 dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .bypass(in_vec[34:34]),
    .run(in_vec[33:33]),
    .cpi(in_vec[32:25]),
    .stb_in(in_vec[24:24]),
    .data_in(in_vec[23:0]),
    .stb_out(out_vec[26:26]),
    .data_out(out_vec[25:2]),
    .count_out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hcbf2015d0;
    stim[1] = 36'hc77b3d371;
    stim[2] = 36'h6aec07f27;
    stim[3] = 36'h2930f7ab9;
    stim[4] = 36'h091c93f75;
    stim[5] = 36'h74cd636e8;
    stim[6] = 36'h0d5cc0a53;
    stim[7] = 36'h4a7fa8399;
    stim[8] = 36'h3d12f4f38;
    stim[9] = 36'h6f4def47d;
    stim[10] = 36'h26883f642;
    stim[11] = 36'h54177cf0c;
    stim[12] = 36'h552978b71;
    stim[13] = 36'h5ca8ceadb;
    stim[14] = 36'h0b14e5ff0;
    stim[15] = 36'h6416f8ed7;
    stim[16] = 36'h7b8fe3df3;
    stim[17] = 36'h234f3cba9;
    stim[18] = 36'h160d68a3f;
    stim[19] = 36'h18c147800;
    stim[20] = 36'h103cc4acc;
    stim[21] = 36'h5267b2126;
    stim[22] = 36'h14be72fc1;
    stim[23] = 36'h7e6045d06;
    stim[24] = 36'h63ce85c78;
    stim[25] = 36'h58d36bc96;
    stim[26] = 36'h152874c8b;
    stim[27] = 36'h3cf0cdc46;
    stim[28] = 36'h36e170809;
    stim[29] = 36'h55eab1fd6;
    stim[30] = 36'h762d4e5ac;
    stim[31] = 36'h3d4cdfb70;
    stim[32] = 36'h1793139e8;
    stim[33] = 36'h3168105b5;
    stim[34] = 36'h03171f4ae;
    stim[35] = 36'h70da36593;
    stim[36] = 36'h617387c04;
    stim[37] = 36'h722c9cf3c;
    stim[38] = 36'h3a6a7ead1;
    stim[39] = 36'h7f2688a08;
    stim[40] = 36'h6d0538c34;
    stim[41] = 36'h5e5fd34c3;
    stim[42] = 36'h007c65ad0;
    stim[43] = 36'h4e54ae2f5;
    stim[44] = 36'h6aa9a9ff0;
    stim[45] = 36'h4c6c9d011;
    stim[46] = 36'h21191ae19;
    stim[47] = 36'h184ab06f1;
    stim[48] = 36'h55f514294;
    stim[49] = 36'h310612e53;
    stim[50] = 36'h1a133c2e8;
    stim[51] = 36'h16b037875;
    stim[52] = 36'h382e4e521;
    stim[53] = 36'h3195d2f90;
    stim[54] = 36'h5fc91d8c5;
    stim[55] = 36'h4f92433ac;
    stim[56] = 36'h0c434db06;
    stim[57] = 36'h724e6baf8;
    stim[58] = 36'h4275d7dbe;
    stim[59] = 36'h789856f36;
    stim[60] = 36'h490ae5193;
    stim[61] = 36'h5bcb7361d;
    stim[62] = 36'h20e052991;
    stim[63] = 36'h41127115a;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0000000;
      expv[6] = 27'h0000000;
      expv[7] = 27'h0000000;
      expv[8] = 27'h0000000;
      expv[9] = 27'h0000000;
      expv[10] = 27'h0000000;
      expv[11] = 27'h0000000;
      expv[12] = 27'h0000000;
      expv[13] = 27'h0000000;
      expv[14] = 27'h0000000;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000000;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000000;
      expv[20] = 27'h0000000;
      expv[21] = 27'h0000000;
      expv[22] = 27'h0000000;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000000;
      expv[25] = 27'h0000000;
      expv[26] = 27'h0000000;
      expv[27] = 27'h0000000;
      expv[28] = 27'h0000000;
      expv[29] = 27'h0000000;
      expv[30] = 27'h0000000;
      expv[31] = 27'h0000000;
      expv[32] = 27'h0000000;
      expv[33] = 27'h0000000;
      expv[34] = 27'h0000000;
      expv[35] = 27'h0000000;
      expv[36] = 27'h0000000;
      expv[37] = 27'h0000000;
      expv[38] = 27'h0000000;
      expv[39] = 27'h0000000;
      expv[40] = 27'h0000000;
      expv[41] = 27'h0000000;
      expv[42] = 27'h0000000;
      expv[43] = 27'h0000000;
      expv[44] = 27'h0000000;
      expv[45] = 27'h0000000;
      expv[46] = 27'h0000000;
      expv[47] = 27'h0000000;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000000;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000000;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000000;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000000;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000000;
      expv[62] = 27'h0000000;
      expv[63] = 27'h0000000;
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
