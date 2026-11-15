// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04001 dut (
    .clk(clk),
    .resetq(in_vec[11:11]),
    .rx(in_vec[10:10]),
    .rd(in_vec[9:9]),
    .wr(in_vec[8:8]),
    .tx_data(in_vec[7:0]),
    .tx(out_vec[10:10]),
    .valid(out_vec[9:9]),
    .busy(out_vec[8:8]),
    .rx_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hcd8;
    stim[1] = 12'hfce;
    stim[2] = 12'h089;
    stim[3] = 12'h6d0;
    stim[4] = 12'h012;
    stim[5] = 12'h07f;
    stim[6] = 12'h1ed;
    stim[7] = 12'h5df;
    stim[8] = 12'h298;
    stim[9] = 12'h68e;
    stim[10] = 12'h4e4;
    stim[11] = 12'h350;
    stim[12] = 12'h430;
    stim[13] = 12'h733;
    stim[14] = 12'h410;
    stim[15] = 12'h41f;
    stim[16] = 12'h463;
    stim[17] = 12'h7f3;
    stim[18] = 12'h206;
    stim[19] = 12'h514;
    stim[20] = 12'h0a3;
    stim[21] = 12'h1ed;
    stim[22] = 12'h7ca;
    stim[23] = 12'h7f2;
    stim[24] = 12'h422;
    stim[25] = 12'h38a;
    stim[26] = 12'h2ef;
    stim[27] = 12'h33c;
    stim[28] = 12'h4b1;
    stim[29] = 12'h593;
    stim[30] = 12'h047;
    stim[31] = 12'h272;
    stim[32] = 12'h0b9;
    stim[33] = 12'h3b6;
    stim[34] = 12'h738;
    stim[35] = 12'h61e;
    stim[36] = 12'h3f2;
    stim[37] = 12'h1e9;
    stim[38] = 12'h11a;
    stim[39] = 12'h775;
    stim[40] = 12'h65f;
    stim[41] = 12'h281;
    stim[42] = 12'h085;
    stim[43] = 12'h6f7;
    stim[44] = 12'h290;
    stim[45] = 12'h56e;
    stim[46] = 12'h62a;
    stim[47] = 12'h1f1;
    stim[48] = 12'h309;
    stim[49] = 12'h01b;
    stim[50] = 12'h391;
    stim[51] = 12'h2d4;
    stim[52] = 12'h298;
    stim[53] = 12'h659;
    stim[54] = 12'h650;
    stim[55] = 12'h499;
    stim[56] = 12'h172;
    stim[57] = 12'h4d0;
    stim[58] = 12'h30f;
    stim[59] = 12'h24e;
    stim[60] = 12'h5b1;
    stim[61] = 12'h167;
    stim[62] = 12'h120;
    stim[63] = 12'h67c;
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
      expv[0] = 11'h4xx;
      expv[1] = 11'h4xx;
      expv[2] = 11'h1xx;
      expv[3] = 11'h0xx;
      expv[4] = 11'h0xx;
      expv[5] = 11'h0xx;
      expv[6] = 11'h0xx;
      expv[7] = 11'h0xx;
      expv[8] = 11'h0xx;
      expv[9] = 11'h0xx;
      expv[10] = 11'h0xx;
      expv[11] = 11'h0xx;
      expv[12] = 11'h0xx;
      expv[13] = 11'h0xx;
      expv[14] = 11'h0xx;
      expv[15] = 11'h0xx;
      expv[16] = 11'h0xx;
      expv[17] = 11'h0xx;
      expv[18] = 11'h0xx;
      expv[19] = 11'h0xx;
      expv[20] = 11'h0xx;
      expv[21] = 11'h0xx;
      expv[22] = 11'h0xx;
      expv[23] = 11'h0xx;
      expv[24] = 11'h0xx;
      expv[25] = 11'h0xx;
      expv[26] = 11'h0xx;
      expv[27] = 11'h0xx;
      expv[28] = 11'h0xx;
      expv[29] = 11'h0xx;
      expv[30] = 11'h0xx;
      expv[31] = 11'h0xx;
      expv[32] = 11'h0xx;
      expv[33] = 11'h0xx;
      expv[34] = 11'h0xx;
      expv[35] = 11'h0xx;
      expv[36] = 11'h0xx;
      expv[37] = 11'h0xx;
      expv[38] = 11'h0xx;
      expv[39] = 11'h0xx;
      expv[40] = 11'h0xx;
      expv[41] = 11'h0xx;
      expv[42] = 11'h0xx;
      expv[43] = 11'h0xx;
      expv[44] = 11'h0xx;
      expv[45] = 11'h0xx;
      expv[46] = 11'h0xx;
      expv[47] = 11'h0xx;
      expv[48] = 11'h0xx;
      expv[49] = 11'h0xx;
      expv[50] = 11'h0xx;
      expv[51] = 11'h0xx;
      expv[52] = 11'h0xx;
      expv[53] = 11'h0xx;
      expv[54] = 11'h0xx;
      expv[55] = 11'h0xx;
      expv[56] = 11'h0xx;
      expv[57] = 11'h0xx;
      expv[58] = 11'h0xx;
      expv[59] = 11'h0xx;
      expv[60] = 11'h0xx;
      expv[61] = 11'h0xx;
      expv[62] = 11'h0xx;
      expv[63] = 11'h0xx;
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
