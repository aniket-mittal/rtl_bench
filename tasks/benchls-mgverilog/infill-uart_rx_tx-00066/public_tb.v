// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00066 dut (
    .clk(clk),
    .rx(in_vec[9:9]),
    .data_i(in_vec[8:1]),
    .ack_i(in_vec[0:0]),
    .tx(out_vec[10:10]),
    .data_o(out_vec[9:2]),
    .ack_o(out_vec[1:1]),
    .pop_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h299;
    stim[1] = 10'h3cd;
    stim[2] = 10'h11f;
    stim[3] = 10'h182;
    stim[4] = 10'h02b;
    stim[5] = 10'h0cf;
    stim[6] = 10'h3e8;
    stim[7] = 10'h1e4;
    stim[8] = 10'h2fa;
    stim[9] = 10'h203;
    stim[10] = 10'h1b8;
    stim[11] = 10'h163;
    stim[12] = 10'h05c;
    stim[13] = 10'h38b;
    stim[14] = 10'h18d;
    stim[15] = 10'h1b7;
    stim[16] = 10'h2c2;
    stim[17] = 10'h315;
    stim[18] = 10'h1db;
    stim[19] = 10'h1ef;
    stim[20] = 10'h2ee;
    stim[21] = 10'h075;
    stim[22] = 10'h11d;
    stim[23] = 10'h091;
    stim[24] = 10'h146;
    stim[25] = 10'h005;
    stim[26] = 10'h035;
    stim[27] = 10'h3ed;
    stim[28] = 10'h3dc;
    stim[29] = 10'h23c;
    stim[30] = 10'h19d;
    stim[31] = 10'h35e;
    stim[32] = 10'h0ae;
    stim[33] = 10'h3a4;
    stim[34] = 10'h115;
    stim[35] = 10'h3fc;
    stim[36] = 10'h33f;
    stim[37] = 10'h28f;
    stim[38] = 10'h343;
    stim[39] = 10'h336;
    stim[40] = 10'h01a;
    stim[41] = 10'h282;
    stim[42] = 10'h3e5;
    stim[43] = 10'h0dd;
    stim[44] = 10'h003;
    stim[45] = 10'h16e;
    stim[46] = 10'h29a;
    stim[47] = 10'h3cc;
    stim[48] = 10'h0a1;
    stim[49] = 10'h33f;
    stim[50] = 10'h155;
    stim[51] = 10'h12b;
    stim[52] = 10'h235;
    stim[53] = 10'h089;
    stim[54] = 10'h0ba;
    stim[55] = 10'h231;
    stim[56] = 10'h2dc;
    stim[57] = 10'h16d;
    stim[58] = 10'h309;
    stim[59] = 10'h2fb;
    stim[60] = 10'h203;
    stim[61] = 10'h25e;
    stim[62] = 10'h28a;
    stim[63] = 10'h1fd;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'h4xx;
      expv[10] = 11'h4xx;
      expv[11] = 11'h4xx;
      expv[12] = 11'h4xx;
      expv[13] = 11'h4xx;
      expv[14] = 11'h4xx;
      expv[15] = 11'h4xx;
      expv[16] = 11'h40x;
      expv[17] = 11'h40x;
      expv[18] = 11'h40x;
      expv[19] = 11'h40x;
      expv[20] = 11'h40x;
      expv[21] = 11'h400;
      expv[22] = 11'h40x;
      expv[23] = 11'h40x;
      expv[24] = 11'h400;
      expv[25] = 11'h400;
      expv[26] = 11'h400;
      expv[27] = 11'h400;
      expv[28] = 11'h400;
      expv[29] = 11'h40x;
      expv[30] = 11'h400;
      expv[31] = 11'h400;
      expv[32] = 11'h40x;
      expv[33] = 11'h40x;
      expv[34] = 11'h40x;
      expv[35] = 11'h40x;
      expv[36] = 11'h40x;
      expv[37] = 11'h40x;
      expv[38] = 11'h400;
      expv[39] = 11'h400;
      expv[40] = 11'h400;
      expv[41] = 11'h400;
      expv[42] = 11'h40x;
      expv[43] = 11'h40x;
      expv[44] = 11'h400;
      expv[45] = 11'h40x;
      expv[46] = 11'h400;
      expv[47] = 11'h400;
      expv[48] = 11'h40x;
      expv[49] = 11'h400;
      expv[50] = 11'h40x;
      expv[51] = 11'h40x;
      expv[52] = 11'h40x;
      expv[53] = 11'h400;
      expv[54] = 11'h40x;
      expv[55] = 11'h40x;
      expv[56] = 11'h400;
      expv[57] = 11'h40x;
      expv[58] = 11'h400;
      expv[59] = 11'h40x;
      expv[60] = 11'h40x;
      expv[61] = 11'h400;
      expv[62] = 11'h400;
      expv[63] = 11'h400;
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
