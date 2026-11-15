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

  autovcoder_071921 dut (
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
    stim[0] = 12'ha17;
    stim[1] = 12'hdc1;
    stim[2] = 12'h050;
    stim[3] = 12'h3f1;
    stim[4] = 12'h5f3;
    stim[5] = 12'h377;
    stim[6] = 12'h5aa;
    stim[7] = 12'h7cb;
    stim[8] = 12'h0b8;
    stim[9] = 12'h5fa;
    stim[10] = 12'h529;
    stim[11] = 12'h3ec;
    stim[12] = 12'h0f7;
    stim[13] = 12'h574;
    stim[14] = 12'h7c9;
    stim[15] = 12'h733;
    stim[16] = 12'h7d6;
    stim[17] = 12'h747;
    stim[18] = 12'h7f7;
    stim[19] = 12'h518;
    stim[20] = 12'h6fc;
    stim[21] = 12'h45c;
    stim[22] = 12'h21b;
    stim[23] = 12'h17b;
    stim[24] = 12'h162;
    stim[25] = 12'h1ce;
    stim[26] = 12'h657;
    stim[27] = 12'h322;
    stim[28] = 12'h260;
    stim[29] = 12'h59c;
    stim[30] = 12'h711;
    stim[31] = 12'h0d6;
    stim[32] = 12'h579;
    stim[33] = 12'h437;
    stim[34] = 12'h230;
    stim[35] = 12'h7cf;
    stim[36] = 12'h79c;
    stim[37] = 12'h21e;
    stim[38] = 12'h54a;
    stim[39] = 12'hb4b;
    stim[40] = 12'h39c;
    stim[41] = 12'h6fb;
    stim[42] = 12'h7d1;
    stim[43] = 12'h478;
    stim[44] = 12'h2f6;
    stim[45] = 12'h51b;
    stim[46] = 12'h615;
    stim[47] = 12'h558;
    stim[48] = 12'h488;
    stim[49] = 12'h39f;
    stim[50] = 12'h08b;
    stim[51] = 12'h26f;
    stim[52] = 12'h574;
    stim[53] = 12'h5b8;
    stim[54] = 12'h204;
    stim[55] = 12'h6c9;
    stim[56] = 12'h17a;
    stim[57] = 12'h6d8;
    stim[58] = 12'h625;
    stim[59] = 12'h631;
    stim[60] = 12'h3b1;
    stim[61] = 12'h117;
    stim[62] = 12'h28c;
    stim[63] = 12'h11d;
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
      expv[5] = 10'h1c1;
      expv[6] = 10'h1c1;
      expv[7] = 10'h3f3;
      expv[8] = 10'h3aa;
      expv[9] = 10'h3aa;
      expv[10] = 10'h3aa;
      expv[11] = 10'h3aa;
      expv[12] = 10'h3aa;
      expv[13] = 10'h3aa;
      expv[14] = 10'h3aa;
      expv[15] = 10'h3cb;
      expv[16] = 10'h3fa;
      expv[17] = 10'h329;
      expv[18] = 10'h374;
      expv[19] = 10'h3c9;
      expv[20] = 10'h3c9;
      expv[21] = 10'h333;
      expv[22] = 10'h333;
      expv[23] = 10'h333;
      expv[24] = 10'h333;
      expv[25] = 10'h333;
      expv[26] = 10'h333;
      expv[27] = 10'h3d6;
      expv[28] = 10'h3d6;
      expv[29] = 10'h3d6;
      expv[30] = 10'h3d6;
      expv[31] = 10'h347;
      expv[32] = 10'h347;
      expv[33] = 10'h347;
      expv[34] = 10'h347;
      expv[35] = 10'h347;
      expv[36] = 10'h3f7;
      expv[37] = 10'h318;
      expv[38] = 10'h318;
      expv[39] = 10'h318;
      expv[40] = 10'h100;
      expv[41] = 10'h100;
      expv[42] = 10'h14a;
      expv[43] = 10'h14a;
      expv[44] = 10'h3d1;
      expv[45] = 10'h3d1;
      expv[46] = 10'h3d1;
      expv[47] = 10'h31b;
      expv[48] = 10'h31b;
      expv[49] = 10'h31b;
      expv[50] = 10'h31b;
      expv[51] = 10'h31b;
      expv[52] = 10'h31b;
      expv[53] = 10'h31b;
      expv[54] = 10'h31b;
      expv[55] = 10'h31b;
      expv[56] = 10'h358;
      expv[57] = 10'h358;
      expv[58] = 10'h374;
      expv[59] = 10'h3b8;
      expv[60] = 10'h1b8;
      expv[61] = 10'h1b8;
      expv[62] = 10'h1b8;
      expv[63] = 10'h1b8;
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
