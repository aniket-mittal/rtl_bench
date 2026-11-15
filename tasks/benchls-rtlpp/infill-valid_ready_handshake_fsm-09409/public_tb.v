// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09409 dut (
    .clock(clk),
    .reset(in_vec[9:9]),
    .addr_e(in_vec[8:8]),
    .addr_v(in_vec[7:7]),
    .dataR_b(in_vec[6:6]),
    .dataW_e(in_vec[5:5]),
    .dataW_v(in_vec[4:4]),
    .write_e(in_vec[3:3]),
    .write_v(in_vec[2:2]),
    .flag_steady_0(in_vec[1:1]),
    .flag_steady_1(in_vec[0:0]),
    .addr_b(out_vec[7:7]),
    .dataR_e(out_vec[6:6]),
    .dataR_v(out_vec[5:5]),
    .dataW_b(out_vec[4:4]),
    .write_b(out_vec[3:3]),
    .state(out_vec[2:2]),
    .statecase(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2d7;
    stim[1] = 10'h3be;
    stim[2] = 10'h092;
    stim[3] = 10'h1a9;
    stim[4] = 10'h1f4;
    stim[5] = 10'h11c;
    stim[6] = 10'h147;
    stim[7] = 10'h0a0;
    stim[8] = 10'h16f;
    stim[9] = 10'h11e;
    stim[10] = 10'h0a7;
    stim[11] = 10'h164;
    stim[12] = 10'h0c0;
    stim[13] = 10'h068;
    stim[14] = 10'h088;
    stim[15] = 10'h1b3;
    stim[16] = 10'h115;
    stim[17] = 10'h066;
    stim[18] = 10'h18d;
    stim[19] = 10'h162;
    stim[20] = 10'h125;
    stim[21] = 10'h00b;
    stim[22] = 10'h04f;
    stim[23] = 10'h0ce;
    stim[24] = 10'h04b;
    stim[25] = 10'h11e;
    stim[26] = 10'h01b;
    stim[27] = 10'h1f8;
    stim[28] = 10'h106;
    stim[29] = 10'h106;
    stim[30] = 10'h06a;
    stim[31] = 10'h1f7;
    stim[32] = 10'h10b;
    stim[33] = 10'h079;
    stim[34] = 10'h011;
    stim[35] = 10'h003;
    stim[36] = 10'h119;
    stim[37] = 10'h1b0;
    stim[38] = 10'h050;
    stim[39] = 10'h174;
    stim[40] = 10'h11d;
    stim[41] = 10'h1eb;
    stim[42] = 10'h0dd;
    stim[43] = 10'h113;
    stim[44] = 10'h1f8;
    stim[45] = 10'h0c0;
    stim[46] = 10'h09a;
    stim[47] = 10'h1b8;
    stim[48] = 10'h1a0;
    stim[49] = 10'h1a4;
    stim[50] = 10'h176;
    stim[51] = 10'h18c;
    stim[52] = 10'h044;
    stim[53] = 10'h1f2;
    stim[54] = 10'h089;
    stim[55] = 10'h15c;
    stim[56] = 10'h0ae;
    stim[57] = 10'h113;
    stim[58] = 10'h14b;
    stim[59] = 10'h19e;
    stim[60] = 10'h101;
    stim[61] = 10'h06d;
    stim[62] = 10'h0dd;
    stim[63] = 10'h058;
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
      expv[0] = 8'h01;
      expv[1] = 8'hbe;
      expv[2] = 8'h98;
      expv[3] = 8'h98;
      expv[4] = 8'h98;
      expv[5] = 8'h98;
      expv[6] = 8'h98;
      expv[7] = 8'h98;
      expv[8] = 8'h98;
      expv[9] = 8'h98;
      expv[10] = 8'h98;
      expv[11] = 8'h98;
      expv[12] = 8'h98;
      expv[13] = 8'h98;
      expv[14] = 8'h98;
      expv[15] = 8'h98;
      expv[16] = 8'h98;
      expv[17] = 8'h98;
      expv[18] = 8'h98;
      expv[19] = 8'h98;
      expv[20] = 8'h98;
      expv[21] = 8'h98;
      expv[22] = 8'h98;
      expv[23] = 8'h98;
      expv[24] = 8'h98;
      expv[25] = 8'h98;
      expv[26] = 8'h98;
      expv[27] = 8'h98;
      expv[28] = 8'h98;
      expv[29] = 8'h98;
      expv[30] = 8'h98;
      expv[31] = 8'h98;
      expv[32] = 8'h98;
      expv[33] = 8'h98;
      expv[34] = 8'h98;
      expv[35] = 8'h98;
      expv[36] = 8'h98;
      expv[37] = 8'h98;
      expv[38] = 8'h98;
      expv[39] = 8'h98;
      expv[40] = 8'h98;
      expv[41] = 8'h98;
      expv[42] = 8'h98;
      expv[43] = 8'h98;
      expv[44] = 8'h98;
      expv[45] = 8'h98;
      expv[46] = 8'h98;
      expv[47] = 8'h98;
      expv[48] = 8'h98;
      expv[49] = 8'h98;
      expv[50] = 8'h98;
      expv[51] = 8'h98;
      expv[52] = 8'h98;
      expv[53] = 8'h98;
      expv[54] = 8'h98;
      expv[55] = 8'h98;
      expv[56] = 8'h98;
      expv[57] = 8'h98;
      expv[58] = 8'h98;
      expv[59] = 8'h98;
      expv[60] = 8'h98;
      expv[61] = 8'h98;
      expv[62] = 8'h98;
      expv[63] = 8'h98;
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
