// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06881 dut (
    .clk(clk),
    .address(in_vec[16:9]),
    .data_in(in_vec[8:1]),
    .write_enable(in_vec[0:0]),
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
    stim[0] = 17'h07412;
    stim[1] = 17'h02f40;
    stim[2] = 17'h1dfe7;
    stim[3] = 17'h071cf;
    stim[4] = 17'h1544d;
    stim[5] = 17'h1ec65;
    stim[6] = 17'h18ccd;
    stim[7] = 17'h1862a;
    stim[8] = 17'h0b26a;
    stim[9] = 17'h13a5d;
    stim[10] = 17'h0c1a2;
    stim[11] = 17'h07541;
    stim[12] = 17'h05d1b;
    stim[13] = 17'h0a928;
    stim[14] = 17'h1b7fd;
    stim[15] = 17'h09ab1;
    stim[16] = 17'h095dc;
    stim[17] = 17'h124e5;
    stim[18] = 17'h1a988;
    stim[19] = 17'h06280;
    stim[20] = 17'h03009;
    stim[21] = 17'h15d30;
    stim[22] = 17'h05632;
    stim[23] = 17'h08c3b;
    stim[24] = 17'h175cf;
    stim[25] = 17'h15958;
    stim[26] = 17'h07256;
    stim[27] = 17'h0f10d;
    stim[28] = 17'h12b64;
    stim[29] = 17'h1ece0;
    stim[30] = 17'h0b534;
    stim[31] = 17'h0cb37;
    stim[32] = 17'h0e6f9;
    stim[33] = 17'h0a35d;
    stim[34] = 17'h14f67;
    stim[35] = 17'h0508b;
    stim[36] = 17'h1cdb0;
    stim[37] = 17'h1ce6a;
    stim[38] = 17'h1adce;
    stim[39] = 17'h0c3ee;
    stim[40] = 17'h0c471;
    stim[41] = 17'h1923c;
    stim[42] = 17'h1b2ec;
    stim[43] = 17'h14a38;
    stim[44] = 17'h096b6;
    stim[45] = 17'h0f303;
    stim[46] = 17'h0b71f;
    stim[47] = 17'h10a19;
    stim[48] = 17'h1761e;
    stim[49] = 17'h12eca;
    stim[50] = 17'h0a098;
    stim[51] = 17'h0fffd;
    stim[52] = 17'h03d73;
    stim[53] = 17'h09bb0;
    stim[54] = 17'h0a8fc;
    stim[55] = 17'h03554;
    stim[56] = 17'h168c8;
    stim[57] = 17'h1aeae;
    stim[58] = 17'h1d384;
    stim[59] = 17'h03cd1;
    stim[60] = 17'h0b9ce;
    stim[61] = 17'h0d433;
    stim[62] = 17'h0ec96;
    stim[63] = 17'h175f5;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'h32;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'h58;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hb9;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
