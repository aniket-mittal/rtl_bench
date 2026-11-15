// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071909 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc6f;
    stim[1] = 12'h806;
    stim[2] = 12'h502;
    stim[3] = 12'h4c1;
    stim[4] = 12'h5da;
    stim[5] = 12'h656;
    stim[6] = 12'h215;
    stim[7] = 12'h3ad;
    stim[8] = 12'h2f6;
    stim[9] = 12'h73c;
    stim[10] = 12'h4b9;
    stim[11] = 12'h10a;
    stim[12] = 12'h15f;
    stim[13] = 12'h0e5;
    stim[14] = 12'h74d;
    stim[15] = 12'h77c;
    stim[16] = 12'h0e1;
    stim[17] = 12'h6a7;
    stim[18] = 12'h32f;
    stim[19] = 12'h40d;
    stim[20] = 12'h381;
    stim[21] = 12'h31a;
    stim[22] = 12'h15f;
    stim[23] = 12'hee4;
    stim[24] = 12'h108;
    stim[25] = 12'h2e3;
    stim[26] = 12'h29e;
    stim[27] = 12'h5d8;
    stim[28] = 12'h2f2;
    stim[29] = 12'h05b;
    stim[30] = 12'h244;
    stim[31] = 12'h1d8;
    stim[32] = 12'h46c;
    stim[33] = 12'h484;
    stim[34] = 12'h101;
    stim[35] = 12'h1fe;
    stim[36] = 12'h41f;
    stim[37] = 12'h783;
    stim[38] = 12'h375;
    stim[39] = 12'h39b;
    stim[40] = 12'h0c4;
    stim[41] = 12'h08b;
    stim[42] = 12'h7eb;
    stim[43] = 12'h476;
    stim[44] = 12'h1a6;
    stim[45] = 12'h412;
    stim[46] = 12'h2ad;
    stim[47] = 12'h3f2;
    stim[48] = 12'h033;
    stim[49] = 12'ha0a;
    stim[50] = 12'h0b3;
    stim[51] = 12'h0b6;
    stim[52] = 12'h7d2;
    stim[53] = 12'h499;
    stim[54] = 12'h7a7;
    stim[55] = 12'h115;
    stim[56] = 12'h6e8;
    stim[57] = 12'h2ac;
    stim[58] = 12'h07c;
    stim[59] = 12'h6dd;
    stim[60] = 12'h036;
    stim[61] = 12'h225;
    stim[62] = 12'h4f2;
    stim[63] = 12'h6df;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h302;
      expv[5] = 10'h302;
      expv[6] = 10'h3da;
      expv[7] = 10'h3da;
      expv[8] = 10'h3da;
      expv[9] = 10'h3da;
      expv[10] = 10'h1da;
      expv[11] = 10'h33c;
      expv[12] = 10'h33c;
      expv[13] = 10'h33c;
      expv[14] = 10'h33c;
      expv[15] = 10'h13c;
      expv[16] = 10'h34d;
      expv[17] = 10'h34d;
      expv[18] = 10'h37c;
      expv[19] = 10'h37c;
      expv[20] = 10'h37c;
      expv[21] = 10'h37c;
      expv[22] = 10'h37c;
      expv[23] = 10'h37c;
      expv[24] = 10'h100;
      expv[25] = 10'h100;
      expv[26] = 10'h100;
      expv[27] = 10'h100;
      expv[28] = 10'h17c;
      expv[29] = 10'h17c;
      expv[30] = 10'h17c;
      expv[31] = 10'h17c;
      expv[32] = 10'h17c;
      expv[33] = 10'h3d8;
      expv[34] = 10'h3d8;
      expv[35] = 10'h3d8;
      expv[36] = 10'h3d8;
      expv[37] = 10'h3d8;
      expv[38] = 10'h1d8;
      expv[39] = 10'h1d8;
      expv[40] = 10'h1d8;
      expv[41] = 10'h1d8;
      expv[42] = 10'h1d8;
      expv[43] = 10'h383;
      expv[44] = 10'h383;
      expv[45] = 10'h383;
      expv[46] = 10'h383;
      expv[47] = 10'h383;
      expv[48] = 10'h383;
      expv[49] = 10'h383;
      expv[50] = 10'h100;
      expv[51] = 10'h100;
      expv[52] = 10'h100;
      expv[53] = 10'h1eb;
      expv[54] = 10'h3d2;
      expv[55] = 10'h1d2;
      expv[56] = 10'h1d2;
      expv[57] = 10'h3a7;
      expv[58] = 10'h3a7;
      expv[59] = 10'h3a7;
      expv[60] = 10'h1a7;
      expv[61] = 10'h1a7;
      expv[62] = 10'h1a7;
      expv[63] = 10'h1a7;
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
