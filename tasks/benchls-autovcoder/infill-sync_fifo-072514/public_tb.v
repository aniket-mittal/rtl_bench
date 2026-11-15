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

  autovcoder_072514 dut (
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
    stim[0] = 12'hd27;
    stim[1] = 12'h8a6;
    stim[2] = 12'h3a9;
    stim[3] = 12'h739;
    stim[4] = 12'h2d1;
    stim[5] = 12'h44c;
    stim[6] = 12'h061;
    stim[7] = 12'h70f;
    stim[8] = 12'h6ac;
    stim[9] = 12'h0c1;
    stim[10] = 12'h044;
    stim[11] = 12'h47b;
    stim[12] = 12'h4a1;
    stim[13] = 12'h6c8;
    stim[14] = 12'h216;
    stim[15] = 12'h235;
    stim[16] = 12'h48f;
    stim[17] = 12'h659;
    stim[18] = 12'h7b6;
    stim[19] = 12'h734;
    stim[20] = 12'h285;
    stim[21] = 12'h197;
    stim[22] = 12'h0b0;
    stim[23] = 12'h010;
    stim[24] = 12'h4c7;
    stim[25] = 12'h79d;
    stim[26] = 12'h737;
    stim[27] = 12'h4aa;
    stim[28] = 12'h59c;
    stim[29] = 12'h2ac;
    stim[30] = 12'h635;
    stim[31] = 12'h0fe;
    stim[32] = 12'h5a8;
    stim[33] = 12'h613;
    stim[34] = 12'h41a;
    stim[35] = 12'h1f1;
    stim[36] = 12'h224;
    stim[37] = 12'h60a;
    stim[38] = 12'h032;
    stim[39] = 12'h68f;
    stim[40] = 12'h2f8;
    stim[41] = 12'h3e8;
    stim[42] = 12'h226;
    stim[43] = 12'h0eb;
    stim[44] = 12'h379;
    stim[45] = 12'h6ca;
    stim[46] = 12'h6ae;
    stim[47] = 12'h216;
    stim[48] = 12'h4c4;
    stim[49] = 12'h7ab;
    stim[50] = 12'h17b;
    stim[51] = 12'h780;
    stim[52] = 12'h401;
    stim[53] = 12'h2a2;
    stim[54] = 12'h04b;
    stim[55] = 12'h16d;
    stim[56] = 12'h0e6;
    stim[57] = 12'h30e;
    stim[58] = 12'h5c9;
    stim[59] = 12'h471;
    stim[60] = 12'h1c3;
    stim[61] = 12'h225;
    stim[62] = 12'h5b7;
    stim[63] = 12'h744;
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
      expv[5] = 10'h1xx;
      expv[6] = 10'h339;
      expv[7] = 10'h339;
      expv[8] = 10'h139;
      expv[9] = 10'h30f;
      expv[10] = 10'h30f;
      expv[11] = 10'h30f;
      expv[12] = 10'h30f;
      expv[13] = 10'h30f;
      expv[14] = 10'h10f;
      expv[15] = 10'h10f;
      expv[16] = 10'h10f;
      expv[17] = 10'h10f;
      expv[18] = 10'h10f;
      expv[19] = 10'h10f;
      expv[20] = 10'h3b6;
      expv[21] = 10'h3b6;
      expv[22] = 10'h3b6;
      expv[23] = 10'h3b6;
      expv[24] = 10'h3b6;
      expv[25] = 10'h3b6;
      expv[26] = 10'h334;
      expv[27] = 10'h39d;
      expv[28] = 10'h39d;
      expv[29] = 10'h39d;
      expv[30] = 10'h39d;
      expv[31] = 10'h337;
      expv[32] = 10'h337;
      expv[33] = 10'h337;
      expv[34] = 10'h39c;
      expv[35] = 10'h39c;
      expv[36] = 10'h39c;
      expv[37] = 10'h39c;
      expv[38] = 10'h3a8;
      expv[39] = 10'h3a8;
      expv[40] = 10'h1a8;
      expv[41] = 10'h1a8;
      expv[42] = 10'h1a8;
      expv[43] = 10'h1a8;
      expv[44] = 10'h1a8;
      expv[45] = 10'h1a8;
      expv[46] = 10'h1a8;
      expv[47] = 10'h1a8;
      expv[48] = 10'h1a8;
      expv[49] = 10'h1a8;
      expv[50] = 10'h1a8;
      expv[51] = 10'h1a8;
      expv[52] = 10'h3ab;
      expv[53] = 10'h3ab;
      expv[54] = 10'h3ab;
      expv[55] = 10'h3ab;
      expv[56] = 10'h3ab;
      expv[57] = 10'h3ab;
      expv[58] = 10'h3ab;
      expv[59] = 10'h3ab;
      expv[60] = 10'h3ab;
      expv[61] = 10'h3ab;
      expv[62] = 10'h3ab;
      expv[63] = 10'h3ab;
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
