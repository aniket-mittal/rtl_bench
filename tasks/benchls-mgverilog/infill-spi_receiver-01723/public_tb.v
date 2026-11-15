// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01723 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .SCLK(in_vec[3:3]),
    .SSbar(in_vec[2:2]),
    .MOSI(in_vec[1:1]),
    .rd(in_vec[0:0]),
    .dout(out_vec[8:1]),
    .data_present(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h13;
    stim[1] = 5'h1b;
    stim[2] = 5'h0a;
    stim[3] = 5'h06;
    stim[4] = 5'h0b;
    stim[5] = 5'h08;
    stim[6] = 5'h0c;
    stim[7] = 5'h00;
    stim[8] = 5'h04;
    stim[9] = 5'h0a;
    stim[10] = 5'h0c;
    stim[11] = 5'h06;
    stim[12] = 5'h05;
    stim[13] = 5'h07;
    stim[14] = 5'h0c;
    stim[15] = 5'h02;
    stim[16] = 5'h00;
    stim[17] = 5'h00;
    stim[18] = 5'h04;
    stim[19] = 5'h0d;
    stim[20] = 5'h08;
    stim[21] = 5'h07;
    stim[22] = 5'h05;
    stim[23] = 5'h0f;
    stim[24] = 5'h0d;
    stim[25] = 5'h09;
    stim[26] = 5'h01;
    stim[27] = 5'h02;
    stim[28] = 5'h0b;
    stim[29] = 5'h0d;
    stim[30] = 5'h07;
    stim[31] = 5'h0f;
    stim[32] = 5'h06;
    stim[33] = 5'h0c;
    stim[34] = 5'h03;
    stim[35] = 5'h0c;
    stim[36] = 5'h0e;
    stim[37] = 5'h02;
    stim[38] = 5'h06;
    stim[39] = 5'h0a;
    stim[40] = 5'h00;
    stim[41] = 5'h1c;
    stim[42] = 5'h0f;
    stim[43] = 5'h0c;
    stim[44] = 5'h01;
    stim[45] = 5'h03;
    stim[46] = 5'h07;
    stim[47] = 5'h06;
    stim[48] = 5'h00;
    stim[49] = 5'h0c;
    stim[50] = 5'h04;
    stim[51] = 5'h09;
    stim[52] = 5'h06;
    stim[53] = 5'h0a;
    stim[54] = 5'h02;
    stim[55] = 5'h05;
    stim[56] = 5'h1f;
    stim[57] = 5'h1d;
    stim[58] = 5'h05;
    stim[59] = 5'h0a;
    stim[60] = 5'h07;
    stim[61] = 5'h03;
    stim[62] = 5'h0d;
    stim[63] = 5'h04;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h001;
      expv[6] = 9'h000;
      expv[7] = 9'h001;
      expv[8] = 9'h001;
      expv[9] = 9'h001;
      expv[10] = 9'h001;
      expv[11] = 9'h001;
      expv[12] = 9'h001;
      expv[13] = 9'h001;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h001;
      expv[20] = 9'h001;
      expv[21] = 9'h000;
      expv[22] = 9'h001;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h002;
      expv[29] = 9'h002;
      expv[30] = 9'h002;
      expv[31] = 9'h002;
      expv[32] = 9'h002;
      expv[33] = 9'h002;
      expv[34] = 9'h002;
      expv[35] = 9'h002;
      expv[36] = 9'h002;
      expv[37] = 9'h002;
      expv[38] = 9'h002;
      expv[39] = 9'h003;
      expv[40] = 9'h003;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h001;
      expv[51] = 9'h001;
      expv[52] = 9'h001;
      expv[53] = 9'h002;
      expv[54] = 9'h002;
      expv[55] = 9'h002;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h002;
      expv[60] = 9'h002;
      expv[61] = 9'h003;
      expv[62] = 9'h002;
      expv[63] = 9'h002;
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
