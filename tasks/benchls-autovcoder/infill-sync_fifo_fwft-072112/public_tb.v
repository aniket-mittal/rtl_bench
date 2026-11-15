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

  autovcoder_072112 dut (
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
    stim[0] = 12'hbfd;
    stim[1] = 12'hdd1;
    stim[2] = 12'h681;
    stim[3] = 12'h718;
    stim[4] = 12'h169;
    stim[5] = 12'h534;
    stim[6] = 12'h12b;
    stim[7] = 12'h0a4;
    stim[8] = 12'h2f9;
    stim[9] = 12'h79f;
    stim[10] = 12'h611;
    stim[11] = 12'h640;
    stim[12] = 12'h3eb;
    stim[13] = 12'h5cc;
    stim[14] = 12'h52e;
    stim[15] = 12'h320;
    stim[16] = 12'h7ae;
    stim[17] = 12'h3f9;
    stim[18] = 12'h4cb;
    stim[19] = 12'h585;
    stim[20] = 12'h7b2;
    stim[21] = 12'h19b;
    stim[22] = 12'h718;
    stim[23] = 12'h172;
    stim[24] = 12'h0d4;
    stim[25] = 12'h03d;
    stim[26] = 12'h594;
    stim[27] = 12'h79d;
    stim[28] = 12'h7d9;
    stim[29] = 12'h40f;
    stim[30] = 12'h7dd;
    stim[31] = 12'h140;
    stim[32] = 12'h130;
    stim[33] = 12'h24a;
    stim[34] = 12'h554;
    stim[35] = 12'h416;
    stim[36] = 12'h036;
    stim[37] = 12'h0d1;
    stim[38] = 12'h49b;
    stim[39] = 12'h0c3;
    stim[40] = 12'h607;
    stim[41] = 12'h1a4;
    stim[42] = 12'h4c1;
    stim[43] = 12'h77c;
    stim[44] = 12'h61c;
    stim[45] = 12'h2d5;
    stim[46] = 12'h488;
    stim[47] = 12'h7d1;
    stim[48] = 12'h1e2;
    stim[49] = 12'h549;
    stim[50] = 12'h466;
    stim[51] = 12'h3a9;
    stim[52] = 12'h6f6;
    stim[53] = 12'h2a7;
    stim[54] = 12'h42c;
    stim[55] = 12'h63f;
    stim[56] = 12'h1e8;
    stim[57] = 12'h682;
    stim[58] = 12'h192;
    stim[59] = 12'h704;
    stim[60] = 12'h68d;
    stim[61] = 12'h37c;
    stim[62] = 12'h42a;
    stim[63] = 12'h3e8;
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
      expv[3] = 10'h1d1;
      expv[4] = 10'h1d1;
      expv[5] = 10'h1d1;
      expv[6] = 10'h318;
      expv[7] = 10'h318;
      expv[8] = 10'h318;
      expv[9] = 10'h318;
      expv[10] = 10'h334;
      expv[11] = 10'h39f;
      expv[12] = 10'h19f;
      expv[13] = 10'h19f;
      expv[14] = 10'h19f;
      expv[15] = 10'h3cc;
      expv[16] = 10'h3cc;
      expv[17] = 10'h32e;
      expv[18] = 10'h32e;
      expv[19] = 10'h32e;
      expv[20] = 10'h32e;
      expv[21] = 10'h3ae;
      expv[22] = 10'h3ae;
      expv[23] = 10'h385;
      expv[24] = 10'h385;
      expv[25] = 10'h385;
      expv[26] = 10'h385;
      expv[27] = 10'h385;
      expv[28] = 10'h3b2;
      expv[29] = 10'h318;
      expv[30] = 10'h318;
      expv[31] = 10'h394;
      expv[32] = 10'h394;
      expv[33] = 10'h394;
      expv[34] = 10'h394;
      expv[35] = 10'h394;
      expv[36] = 10'h394;
      expv[37] = 10'h394;
      expv[38] = 10'h394;
      expv[39] = 10'h394;
      expv[40] = 10'h394;
      expv[41] = 10'h39d;
      expv[42] = 10'h39d;
      expv[43] = 10'h39d;
      expv[44] = 10'h3d9;
      expv[45] = 10'h3dd;
      expv[46] = 10'h3dd;
      expv[47] = 10'h3dd;
      expv[48] = 10'h354;
      expv[49] = 10'h354;
      expv[50] = 10'h354;
      expv[51] = 10'h354;
      expv[52] = 10'h354;
      expv[53] = 10'h37c;
      expv[54] = 10'h37c;
      expv[55] = 10'h37c;
      expv[56] = 10'h3d1;
      expv[57] = 10'h3d1;
      expv[58] = 10'h349;
      expv[59] = 10'h349;
      expv[60] = 10'h149;
      expv[61] = 10'h304;
      expv[62] = 10'h304;
      expv[63] = 10'h304;
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
