// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05873 dut (
    .clk(clk),
    .n_lines(in_vec[4:2]),
    .start(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .score(out_vec[23:8]),
    .level(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0f;
    stim[1] = 5'h05;
    stim[2] = 5'h10;
    stim[3] = 5'h12;
    stim[4] = 5'h18;
    stim[5] = 5'h12;
    stim[6] = 5'h1d;
    stim[7] = 5'h0a;
    stim[8] = 5'h1c;
    stim[9] = 5'h04;
    stim[10] = 5'h1e;
    stim[11] = 5'h00;
    stim[12] = 5'h0f;
    stim[13] = 5'h1a;
    stim[14] = 5'h1e;
    stim[15] = 5'h1e;
    stim[16] = 5'h04;
    stim[17] = 5'h0a;
    stim[18] = 5'h00;
    stim[19] = 5'h18;
    stim[20] = 5'h00;
    stim[21] = 5'h0e;
    stim[22] = 5'h1c;
    stim[23] = 5'h04;
    stim[24] = 5'h08;
    stim[25] = 5'h10;
    stim[26] = 5'h10;
    stim[27] = 5'h0a;
    stim[28] = 5'h06;
    stim[29] = 5'h14;
    stim[30] = 5'h12;
    stim[31] = 5'h16;
    stim[32] = 5'h04;
    stim[33] = 5'h06;
    stim[34] = 5'h12;
    stim[35] = 5'h14;
    stim[36] = 5'h14;
    stim[37] = 5'h18;
    stim[38] = 5'h02;
    stim[39] = 5'h12;
    stim[40] = 5'h11;
    stim[41] = 5'h00;
    stim[42] = 5'h14;
    stim[43] = 5'h02;
    stim[44] = 5'h08;
    stim[45] = 5'h06;
    stim[46] = 5'h14;
    stim[47] = 5'h14;
    stim[48] = 5'h04;
    stim[49] = 5'h0a;
    stim[50] = 5'h02;
    stim[51] = 5'h04;
    stim[52] = 5'h1a;
    stim[53] = 5'h0e;
    stim[54] = 5'h04;
    stim[55] = 5'h0a;
    stim[56] = 5'h10;
    stim[57] = 5'h08;
    stim[58] = 5'h0e;
    stim[59] = 5'h04;
    stim[60] = 5'h04;
    stim[61] = 5'h1a;
    stim[62] = 5'h1e;
    stim[63] = 5'h0a;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h000001;
      expv[2] = 24'h000001;
      expv[3] = 24'h000001;
      expv[4] = 24'h001001;
      expv[5] = 24'h001001;
      expv[6] = 24'h002001;
      expv[7] = 24'h000001;
      expv[8] = 24'h000401;
      expv[9] = 24'h000401;
      expv[10] = 24'h000401;
      expv[11] = 24'h003501;
      expv[12] = 24'h003502;
      expv[13] = 24'h000001;
      expv[14] = 24'h002401;
      expv[15] = 24'h005502;
      expv[16] = 24'h00b702;
      expv[17] = 24'h00b703;
      expv[18] = 24'h00c303;
      expv[19] = 24'h00c303;
      expv[20] = 24'h00c303;
      expv[21] = 24'h00c303;
      expv[22] = 24'h00de03;
      expv[23] = 24'h00de03;
      expv[24] = 24'h00de03;
      expv[25] = 24'h00de03;
      expv[26] = 24'h00de03;
      expv[27] = 24'h00de03;
      expv[28] = 24'h00ea03;
      expv[29] = 24'h00ed04;
      expv[30] = 24'h00ed04;
      expv[31] = 24'h012d04;
      expv[32] = 24'h019104;
      expv[33] = 24'h019105;
      expv[34] = 24'h019605;
      expv[35] = 24'h01e605;
      expv[36] = 24'h01e605;
      expv[37] = 24'h01e605;
      expv[38] = 24'h01e605;
      expv[39] = 24'h01e605;
      expv[40] = 24'h023605;
      expv[41] = 24'h000001;
      expv[42] = 24'h000001;
      expv[43] = 24'h000001;
      expv[44] = 24'h000001;
      expv[45] = 24'h000001;
      expv[46] = 24'h000101;
      expv[47] = 24'h000101;
      expv[48] = 24'h000101;
      expv[49] = 24'h000101;
      expv[50] = 24'h000501;
      expv[51] = 24'h000501;
      expv[52] = 24'h000501;
      expv[53] = 24'h002901;
      expv[54] = 24'h003202;
      expv[55] = 24'h003202;
      expv[56] = 24'h003a02;
      expv[57] = 24'h003a02;
      expv[58] = 24'h003a02;
      expv[59] = 24'h004c02;
      expv[60] = 24'h004c02;
      expv[61] = 24'h004c02;
      expv[62] = 24'h009402;
      expv[63] = 24'h00f603;
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
