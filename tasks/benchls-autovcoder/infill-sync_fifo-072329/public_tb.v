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

  autovcoder_072329 dut (
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
    stim[0] = 12'ha27;
    stim[1] = 12'hc77;
    stim[2] = 12'h021;
    stim[3] = 12'h075;
    stim[4] = 12'h16e;
    stim[5] = 12'h798;
    stim[6] = 12'h3a7;
    stim[7] = 12'h453;
    stim[8] = 12'h730;
    stim[9] = 12'h202;
    stim[10] = 12'h35c;
    stim[11] = 12'h186;
    stim[12] = 12'h37f;
    stim[13] = 12'h62c;
    stim[14] = 12'h678;
    stim[15] = 12'h371;
    stim[16] = 12'h228;
    stim[17] = 12'h406;
    stim[18] = 12'h547;
    stim[19] = 12'h204;
    stim[20] = 12'h05c;
    stim[21] = 12'h73f;
    stim[22] = 12'h457;
    stim[23] = 12'h3a8;
    stim[24] = 12'h1d6;
    stim[25] = 12'h015;
    stim[26] = 12'h2a5;
    stim[27] = 12'h4cf;
    stim[28] = 12'h0e7;
    stim[29] = 12'h790;
    stim[30] = 12'h109;
    stim[31] = 12'h74e;
    stim[32] = 12'h093;
    stim[33] = 12'h01a;
    stim[34] = 12'h04d;
    stim[35] = 12'h3a4;
    stim[36] = 12'h200;
    stim[37] = 12'h39c;
    stim[38] = 12'h7f8;
    stim[39] = 12'h571;
    stim[40] = 12'h5c2;
    stim[41] = 12'h57f;
    stim[42] = 12'h38e;
    stim[43] = 12'h6a2;
    stim[44] = 12'h211;
    stim[45] = 12'h364;
    stim[46] = 12'h3d8;
    stim[47] = 12'h799;
    stim[48] = 12'h739;
    stim[49] = 12'h2be;
    stim[50] = 12'h549;
    stim[51] = 12'h0fd;
    stim[52] = 12'h7a5;
    stim[53] = 12'h6d8;
    stim[54] = 12'h5fe;
    stim[55] = 12'h343;
    stim[56] = 12'h06c;
    stim[57] = 12'h6bc;
    stim[58] = 12'h70b;
    stim[59] = 12'h34d;
    stim[60] = 12'h2d2;
    stim[61] = 12'h157;
    stim[62] = 12'h277;
    stim[63] = 12'h499;
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
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h398;
      expv[9] = 10'h198;
      expv[10] = 10'h198;
      expv[11] = 10'h198;
      expv[12] = 10'h198;
      expv[13] = 10'h198;
      expv[14] = 10'h330;
      expv[15] = 10'h130;
      expv[16] = 10'h130;
      expv[17] = 10'h130;
      expv[18] = 10'h130;
      expv[19] = 10'h130;
      expv[20] = 10'h130;
      expv[21] = 10'h130;
      expv[22] = 10'h347;
      expv[23] = 10'h347;
      expv[24] = 10'h347;
      expv[25] = 10'h347;
      expv[26] = 10'h347;
      expv[27] = 10'h347;
      expv[28] = 10'h347;
      expv[29] = 10'h347;
      expv[30] = 10'h33f;
      expv[31] = 10'h33f;
      expv[32] = 10'h390;
      expv[33] = 10'h390;
      expv[34] = 10'h390;
      expv[35] = 10'h390;
      expv[36] = 10'h390;
      expv[37] = 10'h390;
      expv[38] = 10'h390;
      expv[39] = 10'h34e;
      expv[40] = 10'h34e;
      expv[41] = 10'h34e;
      expv[42] = 10'h34e;
      expv[43] = 10'h34e;
      expv[44] = 10'h3f8;
      expv[45] = 10'h3f8;
      expv[46] = 10'h3f8;
      expv[47] = 10'h3f8;
      expv[48] = 10'h371;
      expv[49] = 10'h3c2;
      expv[50] = 10'h3c2;
      expv[51] = 10'h3c2;
      expv[52] = 10'h3c2;
      expv[53] = 10'h37f;
      expv[54] = 10'h399;
      expv[55] = 10'h399;
      expv[56] = 10'h399;
      expv[57] = 10'h399;
      expv[58] = 10'h339;
      expv[59] = 10'h349;
      expv[60] = 10'h349;
      expv[61] = 10'h349;
      expv[62] = 10'h349;
      expv[63] = 10'h349;
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
