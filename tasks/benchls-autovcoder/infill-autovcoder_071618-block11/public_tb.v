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

  autovcoder_071618 dut (
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
    stim[0] = 12'hc5d;
    stim[1] = 12'hc0e;
    stim[2] = 12'h7f8;
    stim[3] = 12'h53d;
    stim[4] = 12'h571;
    stim[5] = 12'h5cb;
    stim[6] = 12'h28b;
    stim[7] = 12'h59e;
    stim[8] = 12'h692;
    stim[9] = 12'h0da;
    stim[10] = 12'h280;
    stim[11] = 12'h177;
    stim[12] = 12'h03f;
    stim[13] = 12'h76f;
    stim[14] = 12'h038;
    stim[15] = 12'h0be;
    stim[16] = 12'h757;
    stim[17] = 12'h480;
    stim[18] = 12'h5ef;
    stim[19] = 12'h02b;
    stim[20] = 12'h226;
    stim[21] = 12'h633;
    stim[22] = 12'h143;
    stim[23] = 12'h635;
    stim[24] = 12'h649;
    stim[25] = 12'h334;
    stim[26] = 12'h266;
    stim[27] = 12'h505;
    stim[28] = 12'h764;
    stim[29] = 12'h1f1;
    stim[30] = 12'h09f;
    stim[31] = 12'h061;
    stim[32] = 12'h390;
    stim[33] = 12'h424;
    stim[34] = 12'h7cf;
    stim[35] = 12'h158;
    stim[36] = 12'h6d0;
    stim[37] = 12'h6f8;
    stim[38] = 12'h4ad;
    stim[39] = 12'h2d1;
    stim[40] = 12'h682;
    stim[41] = 12'h6a1;
    stim[42] = 12'h3bd;
    stim[43] = 12'h18d;
    stim[44] = 12'h116;
    stim[45] = 12'h650;
    stim[46] = 12'h2db;
    stim[47] = 12'h128;
    stim[48] = 12'hfaf;
    stim[49] = 12'h78e;
    stim[50] = 12'h61b;
    stim[51] = 12'h533;
    stim[52] = 12'h212;
    stim[53] = 12'h7de;
    stim[54] = 12'h6f5;
    stim[55] = 12'h60a;
    stim[56] = 12'h6cf;
    stim[57] = 12'h058;
    stim[58] = 12'h2b4;
    stim[59] = 12'h287;
    stim[60] = 12'h066;
    stim[61] = 12'h599;
    stim[62] = 12'h2ba;
    stim[63] = 12'h597;
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
      expv[4] = 10'h3f8;
      expv[5] = 10'h3f8;
      expv[6] = 10'h3f8;
      expv[7] = 10'h3f8;
      expv[8] = 10'h3f8;
      expv[9] = 10'h33d;
      expv[10] = 10'h33d;
      expv[11] = 10'h33d;
      expv[12] = 10'h33d;
      expv[13] = 10'h33d;
      expv[14] = 10'h371;
      expv[15] = 10'h371;
      expv[16] = 10'h371;
      expv[17] = 10'h3cb;
      expv[18] = 10'h3cb;
      expv[19] = 10'h3cb;
      expv[20] = 10'h3cb;
      expv[21] = 10'h3cb;
      expv[22] = 10'h39e;
      expv[23] = 10'h39e;
      expv[24] = 10'h36f;
      expv[25] = 10'h357;
      expv[26] = 10'h357;
      expv[27] = 10'h357;
      expv[28] = 10'h357;
      expv[29] = 10'h3ef;
      expv[30] = 10'h3ef;
      expv[31] = 10'h3ef;
      expv[32] = 10'h3ef;
      expv[33] = 10'h3ef;
      expv[34] = 10'h3ef;
      expv[35] = 10'h305;
      expv[36] = 10'h305;
      expv[37] = 10'h364;
      expv[38] = 10'h3cf;
      expv[39] = 10'h3cf;
      expv[40] = 10'h3cf;
      expv[41] = 10'h1cf;
      expv[42] = 10'h1cf;
      expv[43] = 10'h1cf;
      expv[44] = 10'h1cf;
      expv[45] = 10'h1cf;
      expv[46] = 10'h1cf;
      expv[47] = 10'h1cf;
      expv[48] = 10'h1cf;
      expv[49] = 10'h100;
      expv[50] = 10'h1af;
      expv[51] = 10'h38e;
      expv[52] = 10'h38e;
      expv[53] = 10'h38e;
      expv[54] = 10'h333;
      expv[55] = 10'h3de;
      expv[56] = 10'h1de;
      expv[57] = 10'h1de;
      expv[58] = 10'h1de;
      expv[59] = 10'h1de;
      expv[60] = 10'h1de;
      expv[61] = 10'h1de;
      expv[62] = 10'h1de;
      expv[63] = 10'h1de;
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
