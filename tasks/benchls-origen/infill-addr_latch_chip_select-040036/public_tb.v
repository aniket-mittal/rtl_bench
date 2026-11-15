// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_040036 dut (
    .NADV(clk),
    .A18(in_vec[18:18]),
    .A17(in_vec[17:17]),
    .A16(in_vec[16:16]),
    .AD_IN(in_vec[15:0]),
    .ADDR(out_vec[18:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5d913;
    stim[1] = 19'h6c377;
    stim[2] = 19'h413d8;
    stim[3] = 19'h5bb78;
    stim[4] = 19'h37ec0;
    stim[5] = 19'h29cf1;
    stim[6] = 19'h6f7d2;
    stim[7] = 19'h0458e;
    stim[8] = 19'h01d99;
    stim[9] = 19'h40edf;
    stim[10] = 19'h6a771;
    stim[11] = 19'h5b499;
    stim[12] = 19'h4b7f7;
    stim[13] = 19'h2e10d;
    stim[14] = 19'h0d87e;
    stim[15] = 19'h386c9;
    stim[16] = 19'h56a39;
    stim[17] = 19'h7f83e;
    stim[18] = 19'h510df;
    stim[19] = 19'h19b95;
    stim[20] = 19'h54b3e;
    stim[21] = 19'h5f656;
    stim[22] = 19'h7fead;
    stim[23] = 19'h5ebee;
    stim[24] = 19'h76c82;
    stim[25] = 19'h5bc15;
    stim[26] = 19'h2379b;
    stim[27] = 19'h025b7;
    stim[28] = 19'h5ffb5;
    stim[29] = 19'h4dac9;
    stim[30] = 19'h6f939;
    stim[31] = 19'h0ab43;
    stim[32] = 19'h7aa26;
    stim[33] = 19'h78c7c;
    stim[34] = 19'h57f12;
    stim[35] = 19'h03ca5;
    stim[36] = 19'h0fff5;
    stim[37] = 19'h03ae9;
    stim[38] = 19'h278d2;
    stim[39] = 19'h5aed7;
    stim[40] = 19'h6d41c;
    stim[41] = 19'h12c65;
    stim[42] = 19'h30620;
    stim[43] = 19'h4ed81;
    stim[44] = 19'h0e1fe;
    stim[45] = 19'h6b087;
    stim[46] = 19'h13c71;
    stim[47] = 19'h127b5;
    stim[48] = 19'h0cb2c;
    stim[49] = 19'h5cc1b;
    stim[50] = 19'h60cb7;
    stim[51] = 19'h3a688;
    stim[52] = 19'h5dafd;
    stim[53] = 19'h3843a;
    stim[54] = 19'h1c2d4;
    stim[55] = 19'h192e1;
    stim[56] = 19'h24edf;
    stim[57] = 19'h56981;
    stim[58] = 19'h34e23;
    stim[59] = 19'h63422;
    stim[60] = 19'h1612f;
    stim[61] = 19'h1713a;
    stim[62] = 19'h6844e;
    stim[63] = 19'h58127;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'h5d913;
      expv[2] = 19'h6c377;
      expv[3] = 19'h413d8;
      expv[4] = 19'h5bb78;
      expv[5] = 19'h37ec0;
      expv[6] = 19'h29cf1;
      expv[7] = 19'h6f7d2;
      expv[8] = 19'h0458e;
      expv[9] = 19'h01d99;
      expv[10] = 19'h40edf;
      expv[11] = 19'h6a771;
      expv[12] = 19'h5b499;
      expv[13] = 19'h4b7f7;
      expv[14] = 19'h2e10d;
      expv[15] = 19'h0d87e;
      expv[16] = 19'h386c9;
      expv[17] = 19'h56a39;
      expv[18] = 19'h7f83e;
      expv[19] = 19'h510df;
      expv[20] = 19'h19b95;
      expv[21] = 19'h54b3e;
      expv[22] = 19'h5f656;
      expv[23] = 19'h7fead;
      expv[24] = 19'h5ebee;
      expv[25] = 19'h76c82;
      expv[26] = 19'h5bc15;
      expv[27] = 19'h2379b;
      expv[28] = 19'h025b7;
      expv[29] = 19'h5ffb5;
      expv[30] = 19'h4dac9;
      expv[31] = 19'h6f939;
      expv[32] = 19'h0ab43;
      expv[33] = 19'h7aa26;
      expv[34] = 19'h78c7c;
      expv[35] = 19'h57f12;
      expv[36] = 19'h03ca5;
      expv[37] = 19'h0fff5;
      expv[38] = 19'h03ae9;
      expv[39] = 19'h278d2;
      expv[40] = 19'h5aed7;
      expv[41] = 19'h6d41c;
      expv[42] = 19'h12c65;
      expv[43] = 19'h30620;
      expv[44] = 19'h4ed81;
      expv[45] = 19'h0e1fe;
      expv[46] = 19'h6b087;
      expv[47] = 19'h13c71;
      expv[48] = 19'h127b5;
      expv[49] = 19'h0cb2c;
      expv[50] = 19'h5cc1b;
      expv[51] = 19'h60cb7;
      expv[52] = 19'h3a688;
      expv[53] = 19'h5dafd;
      expv[54] = 19'h3843a;
      expv[55] = 19'h1c2d4;
      expv[56] = 19'h192e1;
      expv[57] = 19'h24edf;
      expv[58] = 19'h56981;
      expv[59] = 19'h34e23;
      expv[60] = 19'h63422;
      expv[61] = 19'h1612f;
      expv[62] = 19'h1713a;
      expv[63] = 19'h6844e;
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
