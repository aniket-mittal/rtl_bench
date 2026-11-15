// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164360 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .fifo_read_data(in_vec[9:2]),
    .empty(in_vec[1:1]),
    .tx_done(in_vec[0:0]),
    .fifo_read_req(out_vec[9:9]),
    .tx_en_sig(out_vec[8:8]),
    .tx_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h354;
    stim[1] = 11'h00e;
    stim[2] = 11'h59e;
    stim[3] = 11'h46b;
    stim[4] = 11'h6b1;
    stim[5] = 11'h783;
    stim[6] = 11'h7c3;
    stim[7] = 11'h63a;
    stim[8] = 11'h5a3;
    stim[9] = 11'h671;
    stim[10] = 11'h6ad;
    stim[11] = 11'h539;
    stim[12] = 11'h74f;
    stim[13] = 11'h67e;
    stim[14] = 11'h416;
    stim[15] = 11'h460;
    stim[16] = 11'h4fe;
    stim[17] = 11'h44d;
    stim[18] = 11'h50d;
    stim[19] = 11'h712;
    stim[20] = 11'h448;
    stim[21] = 11'h54d;
    stim[22] = 11'h5ec;
    stim[23] = 11'h716;
    stim[24] = 11'h5be;
    stim[25] = 11'h7b1;
    stim[26] = 11'h729;
    stim[27] = 11'h716;
    stim[28] = 11'h5be;
    stim[29] = 11'h6ad;
    stim[30] = 11'h7e3;
    stim[31] = 11'h598;
    stim[32] = 11'h455;
    stim[33] = 11'h5ec;
    stim[34] = 11'h7b4;
    stim[35] = 11'h64c;
    stim[36] = 11'h422;
    stim[37] = 11'h7cb;
    stim[38] = 11'h526;
    stim[39] = 11'h7c0;
    stim[40] = 11'h6b5;
    stim[41] = 11'h580;
    stim[42] = 11'h7a7;
    stim[43] = 11'h6a2;
    stim[44] = 11'h6e2;
    stim[45] = 11'h532;
    stim[46] = 11'h4f8;
    stim[47] = 11'h5c0;
    stim[48] = 11'h7a3;
    stim[49] = 11'h4a7;
    stim[50] = 11'h743;
    stim[51] = 11'h592;
    stim[52] = 11'h62a;
    stim[53] = 11'h6df;
    stim[54] = 11'h6b3;
    stim[55] = 11'h793;
    stim[56] = 11'h6fb;
    stim[57] = 11'h7b1;
    stim[58] = 11'h5b1;
    stim[59] = 11'h545;
    stim[60] = 11'h7d7;
    stim[61] = 11'h61b;
    stim[62] = 11'h714;
    stim[63] = 11'h654;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h200;
      expv[7] = 10'h000;
      expv[8] = 10'h18e;
      expv[9] = 10'h08e;
      expv[10] = 10'h08e;
      expv[11] = 10'h28e;
      expv[12] = 10'h08e;
      expv[13] = 10'h1d3;
      expv[14] = 10'h1d3;
      expv[15] = 10'h1d3;
      expv[16] = 10'h1d3;
      expv[17] = 10'h1d3;
      expv[18] = 10'h0d3;
      expv[19] = 10'h0d3;
      expv[20] = 10'h2d3;
      expv[21] = 10'h0d3;
      expv[22] = 10'h153;
      expv[23] = 10'h153;
      expv[24] = 10'h153;
      expv[25] = 10'h153;
      expv[26] = 10'h053;
      expv[27] = 10'h053;
      expv[28] = 10'h253;
      expv[29] = 10'h053;
      expv[30] = 10'h1ab;
      expv[31] = 10'h0ab;
      expv[32] = 10'h0ab;
      expv[33] = 10'h2ab;
      expv[34] = 10'h0ab;
      expv[35] = 10'h1ed;
      expv[36] = 10'h1ed;
      expv[37] = 10'h1ed;
      expv[38] = 10'h0ed;
      expv[39] = 10'h0ed;
      expv[40] = 10'h0ed;
      expv[41] = 10'h2ed;
      expv[42] = 10'h0ed;
      expv[43] = 10'h1e9;
      expv[44] = 10'h1e9;
      expv[45] = 10'h1e9;
      expv[46] = 10'h1e9;
      expv[47] = 10'h1e9;
      expv[48] = 10'h1e9;
      expv[49] = 10'h0e9;
      expv[50] = 10'h0e9;
      expv[51] = 10'h0e9;
      expv[52] = 10'h0e9;
      expv[53] = 10'h0e9;
      expv[54] = 10'h0e9;
      expv[55] = 10'h0e9;
      expv[56] = 10'h0e9;
      expv[57] = 10'h0e9;
      expv[58] = 10'h0e9;
      expv[59] = 10'h2e9;
      expv[60] = 10'h0e9;
      expv[61] = 10'h1f5;
      expv[62] = 10'h0f5;
      expv[63] = 10'h0f5;
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
