// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10287 dut (
    .clk(clk),
    .data(in_vec[10:3]),
    .ce(in_vec[2:2]),
    .a(in_vec[1:0]),
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
    stim[0] = 11'h56e;
    stim[1] = 11'h53c;
    stim[2] = 11'h13c;
    stim[3] = 11'h127;
    stim[4] = 11'h063;
    stim[5] = 11'h7ed;
    stim[6] = 11'h7b3;
    stim[7] = 11'h363;
    stim[8] = 11'h138;
    stim[9] = 11'h5a8;
    stim[10] = 11'h64b;
    stim[11] = 11'h202;
    stim[12] = 11'h1d7;
    stim[13] = 11'h0d9;
    stim[14] = 11'h1b8;
    stim[15] = 11'h58b;
    stim[16] = 11'h289;
    stim[17] = 11'h40b;
    stim[18] = 11'h5cc;
    stim[19] = 11'h0e0;
    stim[20] = 11'h2a6;
    stim[21] = 11'h2ec;
    stim[22] = 11'h607;
    stim[23] = 11'h7b8;
    stim[24] = 11'h38d;
    stim[25] = 11'h289;
    stim[26] = 11'h75f;
    stim[27] = 11'h669;
    stim[28] = 11'h2e1;
    stim[29] = 11'h022;
    stim[30] = 11'h086;
    stim[31] = 11'h61f;
    stim[32] = 11'h72a;
    stim[33] = 11'h4af;
    stim[34] = 11'h721;
    stim[35] = 11'h5cf;
    stim[36] = 11'h306;
    stim[37] = 11'h002;
    stim[38] = 11'h3bd;
    stim[39] = 11'h0dc;
    stim[40] = 11'h2f6;
    stim[41] = 11'h115;
    stim[42] = 11'h177;
    stim[43] = 11'h7bb;
    stim[44] = 11'h69f;
    stim[45] = 11'h316;
    stim[46] = 11'h724;
    stim[47] = 11'h5f4;
    stim[48] = 11'h342;
    stim[49] = 11'h31f;
    stim[50] = 11'h76f;
    stim[51] = 11'h776;
    stim[52] = 11'h5c9;
    stim[53] = 11'h16e;
    stim[54] = 11'h24c;
    stim[55] = 11'h236;
    stim[56] = 11'h140;
    stim[57] = 11'h1a7;
    stim[58] = 11'h36b;
    stim[59] = 11'h316;
    stim[60] = 11'h657;
    stim[61] = 11'h3d7;
    stim[62] = 11'h1f6;
    stim[63] = 11'h0e1;
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
      expv[1] = 8'had;
      expv[2] = 8'ha7;
      expv[3] = 8'hxx;
      expv[4] = 8'had;
      expv[5] = 8'h27;
      expv[6] = 8'ha7;
      expv[7] = 8'ha7;
      expv[8] = 8'hfd;
      expv[9] = 8'hfd;
      expv[10] = 8'ha7;
      expv[11] = 8'h27;
      expv[12] = 8'ha7;
      expv[13] = 8'hfd;
      expv[14] = 8'h3a;
      expv[15] = 8'h27;
      expv[16] = 8'hfd;
      expv[17] = 8'h27;
      expv[18] = 8'h3a;
      expv[19] = 8'hb9;
      expv[20] = 8'hfd;
      expv[21] = 8'h54;
      expv[22] = 8'h3a;
      expv[23] = 8'hc0;
      expv[24] = 8'h5d;
      expv[25] = 8'hc0;
      expv[26] = 8'h54;
      expv[27] = 8'h71;
      expv[28] = 8'h71;
      expv[29] = 8'hc0;
      expv[30] = 8'hc0;
      expv[31] = 8'hc0;
      expv[32] = 8'heb;
      expv[33] = 8'h71;
      expv[34] = 8'hc3;
      expv[35] = 8'heb;
      expv[36] = 8'hc3;
      expv[37] = 8'h95;
      expv[38] = 8'hb9;
      expv[39] = 8'h77;
      expv[40] = 8'h60;
      expv[41] = 8'h1b;
      expv[42] = 8'h77;
      expv[43] = 8'h1b;
      expv[44] = 8'h1b;
      expv[45] = 8'h22;
      expv[46] = 8'h62;
      expv[47] = 8'he4;
      expv[48] = 8'h62;
      expv[49] = 8'hd3;
      expv[50] = 8'h62;
      expv[51] = 8'hbe;
      expv[52] = 8'hed;
      expv[53] = 8'h63;
      expv[54] = 8'h2d;
      expv[55] = 8'hee;
      expv[56] = 8'h46;
      expv[57] = 8'hee;
      expv[58] = 8'h2d;
      expv[59] = 8'h49;
      expv[60] = 8'h49;
      expv[61] = 8'h46;
      expv[62] = 8'h62;
      expv[63] = 8'h7a;
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
