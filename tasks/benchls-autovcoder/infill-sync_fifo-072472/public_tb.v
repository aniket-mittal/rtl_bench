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

  autovcoder_072472 dut (
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
    stim[0] = 12'h8fc;
    stim[1] = 12'he68;
    stim[2] = 12'h003;
    stim[3] = 12'h79a;
    stim[4] = 12'h5e0;
    stim[5] = 12'h637;
    stim[6] = 12'h7c8;
    stim[7] = 12'h679;
    stim[8] = 12'h2b6;
    stim[9] = 12'h763;
    stim[10] = 12'h168;
    stim[11] = 12'h6a2;
    stim[12] = 12'h043;
    stim[13] = 12'h264;
    stim[14] = 12'h73d;
    stim[15] = 12'h72d;
    stim[16] = 12'h211;
    stim[17] = 12'h6da;
    stim[18] = 12'h3a9;
    stim[19] = 12'h322;
    stim[20] = 12'h5b8;
    stim[21] = 12'h55f;
    stim[22] = 12'h673;
    stim[23] = 12'h326;
    stim[24] = 12'h3e9;
    stim[25] = 12'h651;
    stim[26] = 12'h165;
    stim[27] = 12'h73d;
    stim[28] = 12'h78b;
    stim[29] = 12'h4e7;
    stim[30] = 12'h7cf;
    stim[31] = 12'h667;
    stim[32] = 12'h56b;
    stim[33] = 12'h1f5;
    stim[34] = 12'h7fb;
    stim[35] = 12'h424;
    stim[36] = 12'h38d;
    stim[37] = 12'h49e;
    stim[38] = 12'h4cd;
    stim[39] = 12'h371;
    stim[40] = 12'h105;
    stim[41] = 12'h74c;
    stim[42] = 12'h742;
    stim[43] = 12'h32b;
    stim[44] = 12'h05f;
    stim[45] = 12'h67c;
    stim[46] = 12'h35d;
    stim[47] = 12'h366;
    stim[48] = 12'h190;
    stim[49] = 12'h228;
    stim[50] = 12'h35a;
    stim[51] = 12'h463;
    stim[52] = 12'h61e;
    stim[53] = 12'h4d8;
    stim[54] = 12'h016;
    stim[55] = 12'h46d;
    stim[56] = 12'h0c4;
    stim[57] = 12'h0b4;
    stim[58] = 12'h390;
    stim[59] = 12'h485;
    stim[60] = 12'h265;
    stim[61] = 12'h002;
    stim[62] = 12'h07c;
    stim[63] = 12'h478;
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
      expv[4] = 10'h1xx;
      expv[5] = 10'h39a;
      expv[6] = 10'h3e0;
      expv[7] = 10'h1e0;
      expv[8] = 10'h3c8;
      expv[9] = 10'h3c8;
      expv[10] = 10'h1c8;
      expv[11] = 10'h1c8;
      expv[12] = 10'h363;
      expv[13] = 10'h363;
      expv[14] = 10'h363;
      expv[15] = 10'h163;
      expv[16] = 10'h33d;
      expv[17] = 10'h33d;
      expv[18] = 10'h32d;
      expv[19] = 10'h32d;
      expv[20] = 10'h32d;
      expv[21] = 10'h32d;
      expv[22] = 10'h32d;
      expv[23] = 10'h3b8;
      expv[24] = 10'h3b8;
      expv[25] = 10'h3b8;
      expv[26] = 10'h35f;
      expv[27] = 10'h35f;
      expv[28] = 10'h15f;
      expv[29] = 10'h33d;
      expv[30] = 10'h33d;
      expv[31] = 10'h38b;
      expv[32] = 10'h3cf;
      expv[33] = 10'h3cf;
      expv[34] = 10'h3cf;
      expv[35] = 10'h36b;
      expv[36] = 10'h36b;
      expv[37] = 10'h36b;
      expv[38] = 10'h36b;
      expv[39] = 10'h36b;
      expv[40] = 10'h36b;
      expv[41] = 10'h36b;
      expv[42] = 10'h3fb;
      expv[43] = 10'h34c;
      expv[44] = 10'h34c;
      expv[45] = 10'h34c;
      expv[46] = 10'h342;
      expv[47] = 10'h342;
      expv[48] = 10'h342;
      expv[49] = 10'h342;
      expv[50] = 10'h342;
      expv[51] = 10'h342;
      expv[52] = 10'h342;
      expv[53] = 10'h142;
      expv[54] = 10'h142;
      expv[55] = 10'h142;
      expv[56] = 10'h142;
      expv[57] = 10'h142;
      expv[58] = 10'h142;
      expv[59] = 10'h142;
      expv[60] = 10'h142;
      expv[61] = 10'h142;
      expv[62] = 10'h142;
      expv[63] = 10'h142;
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
