// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08162 dut (
    .clock(clk),
    .reset(in_vec[23:23]),
    .enable(in_vec[22:22]),
    .strobe_cic(in_vec[21:21]),
    .strobe_if(in_vec[20:20]),
    .log2_rate(in_vec[19:16]),
    .data_in(in_vec[15:0]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h909bca;
    stim[1] = 24'hd4020d;
    stim[2] = 24'h3c19e9;
    stim[3] = 24'h5017cf;
    stim[4] = 24'h5b0f4d;
    stim[5] = 24'h115b01;
    stim[6] = 24'h2d966a;
    stim[7] = 24'h1c9b1f;
    stim[8] = 24'h3975f5;
    stim[9] = 24'h7cdeaf;
    stim[10] = 24'h6f9760;
    stim[11] = 24'h11357c;
    stim[12] = 24'h756ad6;
    stim[13] = 24'h6f04df;
    stim[14] = 24'h707d67;
    stim[15] = 24'h5d8be6;
    stim[16] = 24'h28c6d9;
    stim[17] = 24'h55d1a9;
    stim[18] = 24'h443395;
    stim[19] = 24'h0a8054;
    stim[20] = 24'h448453;
    stim[21] = 24'h5c0e8c;
    stim[22] = 24'h063dc6;
    stim[23] = 24'h730754;
    stim[24] = 24'h3a067b;
    stim[25] = 24'h6ed673;
    stim[26] = 24'h77bff8;
    stim[27] = 24'h1ba232;
    stim[28] = 24'h5fe2af;
    stim[29] = 24'h0eb337;
    stim[30] = 24'h66a317;
    stim[31] = 24'h1ad156;
    stim[32] = 24'h5b2519;
    stim[33] = 24'h05a907;
    stim[34] = 24'h665deb;
    stim[35] = 24'h7d8b27;
    stim[36] = 24'h34d636;
    stim[37] = 24'h343384;
    stim[38] = 24'h1b1a50;
    stim[39] = 24'h7a577f;
    stim[40] = 24'h4c42d2;
    stim[41] = 24'h2c2ff7;
    stim[42] = 24'h1278aa;
    stim[43] = 24'h68233a;
    stim[44] = 24'h7b7484;
    stim[45] = 24'h6cafe3;
    stim[46] = 24'h43db2a;
    stim[47] = 24'h2c8460;
    stim[48] = 24'h07a62d;
    stim[49] = 24'h166f06;
    stim[50] = 24'h42620d;
    stim[51] = 24'h41ed8e;
    stim[52] = 24'h6f4704;
    stim[53] = 24'h42344e;
    stim[54] = 24'h38e77c;
    stim[55] = 24'h5b659e;
    stim[56] = 24'h099b8a;
    stim[57] = 24'h4cd46b;
    stim[58] = 24'h26f134;
    stim[59] = 24'h1c8481;
    stim[60] = 24'h784c7a;
    stim[61] = 24'h7ae942;
    stim[62] = 24'h33547f;
    stim[63] = 24'h6d9294;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
