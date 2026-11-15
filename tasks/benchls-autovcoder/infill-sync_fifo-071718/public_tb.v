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

  autovcoder_071718 dut (
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
    stim[0] = 12'hb37;
    stim[1] = 12'hd09;
    stim[2] = 12'h388;
    stim[3] = 12'h191;
    stim[4] = 12'h3df;
    stim[5] = 12'h367;
    stim[6] = 12'h39c;
    stim[7] = 12'h10e;
    stim[8] = 12'h568;
    stim[9] = 12'h0ed;
    stim[10] = 12'h1c2;
    stim[11] = 12'h4bd;
    stim[12] = 12'h4ff;
    stim[13] = 12'h4db;
    stim[14] = 12'h7da;
    stim[15] = 12'h3d3;
    stim[16] = 12'h35a;
    stim[17] = 12'h643;
    stim[18] = 12'h66d;
    stim[19] = 12'h77a;
    stim[20] = 12'h7ac;
    stim[21] = 12'h4b4;
    stim[22] = 12'h73b;
    stim[23] = 12'h07a;
    stim[24] = 12'h280;
    stim[25] = 12'h73c;
    stim[26] = 12'h225;
    stim[27] = 12'h03e;
    stim[28] = 12'h7f7;
    stim[29] = 12'h013;
    stim[30] = 12'h194;
    stim[31] = 12'h5b2;
    stim[32] = 12'h69d;
    stim[33] = 12'h051;
    stim[34] = 12'h6fd;
    stim[35] = 12'h62f;
    stim[36] = 12'h513;
    stim[37] = 12'h29f;
    stim[38] = 12'h0c0;
    stim[39] = 12'h626;
    stim[40] = 12'h13a;
    stim[41] = 12'h5a9;
    stim[42] = 12'h727;
    stim[43] = 12'h32b;
    stim[44] = 12'h7c3;
    stim[45] = 12'h5b6;
    stim[46] = 12'h5cc;
    stim[47] = 12'h3f5;
    stim[48] = 12'h690;
    stim[49] = 12'h67f;
    stim[50] = 12'h528;
    stim[51] = 12'h5f2;
    stim[52] = 12'h5f6;
    stim[53] = 12'h70b;
    stim[54] = 12'h3c2;
    stim[55] = 12'h3e6;
    stim[56] = 12'h05d;
    stim[57] = 12'h231;
    stim[58] = 12'h7f5;
    stim[59] = 12'he67;
    stim[60] = 12'h7d0;
    stim[61] = 12'h188;
    stim[62] = 12'h14d;
    stim[63] = 12'h60b;
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
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h109;
      expv[10] = 10'h109;
      expv[11] = 10'h109;
      expv[12] = 10'h368;
      expv[13] = 10'h368;
      expv[14] = 10'h368;
      expv[15] = 10'h168;
      expv[16] = 10'h168;
      expv[17] = 10'h168;
      expv[18] = 10'h3da;
      expv[19] = 10'h1da;
      expv[20] = 10'h1da;
      expv[21] = 10'h37a;
      expv[22] = 10'h37a;
      expv[23] = 10'h3ac;
      expv[24] = 10'h3ac;
      expv[25] = 10'h3ac;
      expv[26] = 10'h33b;
      expv[27] = 10'h33b;
      expv[28] = 10'h33b;
      expv[29] = 10'h33c;
      expv[30] = 10'h33c;
      expv[31] = 10'h33c;
      expv[32] = 10'h33c;
      expv[33] = 10'h3f7;
      expv[34] = 10'h3f7;
      expv[35] = 10'h3b2;
      expv[36] = 10'h1b2;
      expv[37] = 10'h1b2;
      expv[38] = 10'h1b2;
      expv[39] = 10'h1b2;
      expv[40] = 10'h313;
      expv[41] = 10'h313;
      expv[42] = 10'h313;
      expv[43] = 10'h3a9;
      expv[44] = 10'h3a9;
      expv[45] = 10'h327;
      expv[46] = 10'h327;
      expv[47] = 10'h327;
      expv[48] = 10'h327;
      expv[49] = 10'h3c3;
      expv[50] = 10'h3b6;
      expv[51] = 10'h3b6;
      expv[52] = 10'h3b6;
      expv[53] = 10'h3b6;
      expv[54] = 10'h3cc;
      expv[55] = 10'h3cc;
      expv[56] = 10'h3cc;
      expv[57] = 10'h3cc;
      expv[58] = 10'h3cc;
      expv[59] = 10'h328;
      expv[60] = 10'h100;
      expv[61] = 10'h1f5;
      expv[62] = 10'h1f5;
      expv[63] = 10'h1f5;
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
