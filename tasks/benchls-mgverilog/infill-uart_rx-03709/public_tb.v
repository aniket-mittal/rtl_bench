// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03709 dut (
    .clk(clk),
    .rst_n(in_vec[2:2]),
    .clk_bps(in_vec[1:1]),
    .RS232_rx(in_vec[0:0]),
    .bps_start(out_vec[17:17]),
    .rx_data(out_vec[16:9]),
    .rx_int(out_vec[8:8]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h2;
    stim[1] = 3'h1;
    stim[2] = 3'h4;
    stim[3] = 3'h5;
    stim[4] = 3'h7;
    stim[5] = 3'h6;
    stim[6] = 3'h4;
    stim[7] = 3'h4;
    stim[8] = 3'h4;
    stim[9] = 3'h5;
    stim[10] = 3'h7;
    stim[11] = 3'h5;
    stim[12] = 3'h6;
    stim[13] = 3'h6;
    stim[14] = 3'h5;
    stim[15] = 3'h6;
    stim[16] = 3'h4;
    stim[17] = 3'h5;
    stim[18] = 3'h4;
    stim[19] = 3'h5;
    stim[20] = 3'h5;
    stim[21] = 3'h7;
    stim[22] = 3'h5;
    stim[23] = 3'h7;
    stim[24] = 3'h7;
    stim[25] = 3'h7;
    stim[26] = 3'h5;
    stim[27] = 3'h5;
    stim[28] = 3'h5;
    stim[29] = 3'h7;
    stim[30] = 3'h6;
    stim[31] = 3'h5;
    stim[32] = 3'h7;
    stim[33] = 3'h4;
    stim[34] = 3'h5;
    stim[35] = 3'h7;
    stim[36] = 3'h7;
    stim[37] = 3'h4;
    stim[38] = 3'h6;
    stim[39] = 3'h7;
    stim[40] = 3'h7;
    stim[41] = 3'h5;
    stim[42] = 3'h7;
    stim[43] = 3'h4;
    stim[44] = 3'h6;
    stim[45] = 3'h7;
    stim[46] = 3'h6;
    stim[47] = 3'h7;
    stim[48] = 3'h7;
    stim[49] = 3'h5;
    stim[50] = 3'h7;
    stim[51] = 3'h5;
    stim[52] = 3'h4;
    stim[53] = 3'h7;
    stim[54] = 3'h5;
    stim[55] = 3'h5;
    stim[56] = 3'h6;
    stim[57] = 3'h6;
    stim[58] = 3'h4;
    stim[59] = 3'h7;
    stim[60] = 3'h4;
    stim[61] = 3'h6;
    stim[62] = 3'h4;
    stim[63] = 3'h7;
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
      expv[0] = 18'hx00xx;
      expv[1] = 18'hx00xx;
      expv[2] = 18'hx00xx;
      expv[3] = 18'hx00xx;
      expv[4] = 18'hx00xx;
      expv[5] = 18'hx00xx;
      expv[6] = 18'hx00xx;
      expv[7] = 18'hx00xx;
      expv[8] = 18'h201xx;
      expv[9] = 18'h201xx;
      expv[10] = 18'h201xx;
      expv[11] = 18'h20100;
      expv[12] = 18'h20100;
      expv[13] = 18'h20100;
      expv[14] = 18'h20100;
      expv[15] = 18'h20100;
      expv[16] = 18'h20100;
      expv[17] = 18'h20100;
      expv[18] = 18'h20100;
      expv[19] = 18'h20100;
      expv[20] = 18'h20100;
      expv[21] = 18'h20100;
      expv[22] = 18'h20100;
      expv[23] = 18'h20100;
      expv[24] = 18'h20108;
      expv[25] = 18'h20118;
      expv[26] = 18'h20138;
      expv[27] = 18'h20138;
      expv[28] = 18'h20138;
      expv[29] = 18'h20138;
      expv[30] = 18'h20178;
      expv[31] = 18'h201f8;
      expv[32] = 18'h201f8;
      expv[33] = 18'h201f8;
      expv[34] = 18'h201f8;
      expv[35] = 18'h201f8;
      expv[36] = 18'h201f8;
      expv[37] = 18'h000f8;
      expv[38] = 18'h000f8;
      expv[39] = 18'h000f8;
      expv[40] = 18'h201f8;
      expv[41] = 18'h201f8;
      expv[42] = 18'h201f8;
      expv[43] = 18'h201f8;
      expv[44] = 18'h201f8;
      expv[45] = 18'h201f8;
      expv[46] = 18'h201f8;
      expv[47] = 18'h201f8;
      expv[48] = 18'h201f8;
      expv[49] = 18'h201fa;
      expv[50] = 18'h201fa;
      expv[51] = 18'h201fe;
      expv[52] = 18'h201fe;
      expv[53] = 18'h201fe;
      expv[54] = 18'h201fe;
      expv[55] = 18'h201fe;
      expv[56] = 18'h201fe;
      expv[57] = 18'h201fe;
      expv[58] = 18'h201de;
      expv[59] = 18'h201de;
      expv[60] = 18'h2019e;
      expv[61] = 18'h2019e;
      expv[62] = 18'h2019e;
      expv[63] = 18'h2019e;
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
