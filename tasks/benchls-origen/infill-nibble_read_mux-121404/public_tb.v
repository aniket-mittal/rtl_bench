// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121404 dut (
    .address_0(in_vec[8:4]),
    .contrib_0(in_vec[3:0]),
    .rdata_0(out_vec[7:4]),
    .mixed(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h127;
    stim[1] = 9'h0ca;
    stim[2] = 9'h005;
    stim[3] = 9'h1d8;
    stim[4] = 9'h03f;
    stim[5] = 9'h1ec;
    stim[6] = 9'h0e2;
    stim[7] = 9'h165;
    stim[8] = 9'h1ee;
    stim[9] = 9'h1c6;
    stim[10] = 9'h01e;
    stim[11] = 9'h183;
    stim[12] = 9'h138;
    stim[13] = 9'h14d;
    stim[14] = 9'h07f;
    stim[15] = 9'h0fe;
    stim[16] = 9'h0f2;
    stim[17] = 9'h030;
    stim[18] = 9'h16f;
    stim[19] = 9'h105;
    stim[20] = 9'h132;
    stim[21] = 9'h075;
    stim[22] = 9'h01d;
    stim[23] = 9'h0ef;
    stim[24] = 9'h159;
    stim[25] = 9'h035;
    stim[26] = 9'h15f;
    stim[27] = 9'h0cf;
    stim[28] = 9'h071;
    stim[29] = 9'h11b;
    stim[30] = 9'h0f8;
    stim[31] = 9'h0c6;
    stim[32] = 9'h152;
    stim[33] = 9'h0b9;
    stim[34] = 9'h0d7;
    stim[35] = 9'h1ec;
    stim[36] = 9'h008;
    stim[37] = 9'h138;
    stim[38] = 9'h050;
    stim[39] = 9'h0ea;
    stim[40] = 9'h1a7;
    stim[41] = 9'h0a0;
    stim[42] = 9'h1be;
    stim[43] = 9'h16b;
    stim[44] = 9'h182;
    stim[45] = 9'h073;
    stim[46] = 9'h1ef;
    stim[47] = 9'h1ef;
    stim[48] = 9'h117;
    stim[49] = 9'h1c3;
    stim[50] = 9'h068;
    stim[51] = 9'h142;
    stim[52] = 9'h02c;
    stim[53] = 9'h02e;
    stim[54] = 9'h11f;
    stim[55] = 9'h001;
    stim[56] = 9'h0fc;
    stim[57] = 9'h03d;
    stim[58] = 9'h059;
    stim[59] = 9'h052;
    stim[60] = 9'h05a;
    stim[61] = 9'h1b7;
    stim[62] = 9'h1a3;
    stim[63] = 9'h1b3;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h07;
      expv[1] = 8'h0a;
      expv[2] = 8'h05;
      expv[3] = 8'h08;
      expv[4] = 8'h0f;
      expv[5] = 8'h0c;
      expv[6] = 8'h02;
      expv[7] = 8'h05;
      expv[8] = 8'h0e;
      expv[9] = 8'h06;
      expv[10] = 8'h0e;
      expv[11] = 8'h03;
      expv[12] = 8'h08;
      expv[13] = 8'h0d;
      expv[14] = 8'h0f;
      expv[15] = 8'h0e;
      expv[16] = 8'h02;
      expv[17] = 8'h00;
      expv[18] = 8'h0f;
      expv[19] = 8'h05;
      expv[20] = 8'h02;
      expv[21] = 8'h05;
      expv[22] = 8'h0d;
      expv[23] = 8'h0f;
      expv[24] = 8'h09;
      expv[25] = 8'h05;
      expv[26] = 8'h0f;
      expv[27] = 8'h0f;
      expv[28] = 8'h01;
      expv[29] = 8'h0b;
      expv[30] = 8'h08;
      expv[31] = 8'h06;
      expv[32] = 8'h02;
      expv[33] = 8'h09;
      expv[34] = 8'h07;
      expv[35] = 8'h0c;
      expv[36] = 8'h08;
      expv[37] = 8'h08;
      expv[38] = 8'h00;
      expv[39] = 8'h0a;
      expv[40] = 8'h07;
      expv[41] = 8'h00;
      expv[42] = 8'h0e;
      expv[43] = 8'h0b;
      expv[44] = 8'h02;
      expv[45] = 8'h03;
      expv[46] = 8'h0f;
      expv[47] = 8'h0f;
      expv[48] = 8'h07;
      expv[49] = 8'h03;
      expv[50] = 8'h08;
      expv[51] = 8'h02;
      expv[52] = 8'h0c;
      expv[53] = 8'h0e;
      expv[54] = 8'h0f;
      expv[55] = 8'h01;
      expv[56] = 8'h0c;
      expv[57] = 8'h0d;
      expv[58] = 8'h09;
      expv[59] = 8'h02;
      expv[60] = 8'h0a;
      expv[61] = 8'h07;
      expv[62] = 8'h03;
      expv[63] = 8'h03;
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
