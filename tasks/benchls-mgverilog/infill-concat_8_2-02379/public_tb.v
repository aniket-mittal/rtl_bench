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

  mg_02379 dut (
    .clk(clk),
    .in0(in_vec[11:4]),
    .in1(in_vec[3:2]),
    .ce(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h371;
    stim[1] = 12'h89c;
    stim[2] = 12'h0e9;
    stim[3] = 12'h797;
    stim[4] = 12'h3fe;
    stim[5] = 12'h72a;
    stim[6] = 12'hc0d;
    stim[7] = 12'hcd2;
    stim[8] = 12'h407;
    stim[9] = 12'hc7b;
    stim[10] = 12'h292;
    stim[11] = 12'h25e;
    stim[12] = 12'hf07;
    stim[13] = 12'hca7;
    stim[14] = 12'h7e7;
    stim[15] = 12'h166;
    stim[16] = 12'had5;
    stim[17] = 12'hc43;
    stim[18] = 12'h0db;
    stim[19] = 12'h668;
    stim[20] = 12'h75f;
    stim[21] = 12'h63c;
    stim[22] = 12'h50e;
    stim[23] = 12'h15e;
    stim[24] = 12'he79;
    stim[25] = 12'h2c5;
    stim[26] = 12'hdbc;
    stim[27] = 12'h0bc;
    stim[28] = 12'hdaa;
    stim[29] = 12'hfba;
    stim[30] = 12'h870;
    stim[31] = 12'hc01;
    stim[32] = 12'h475;
    stim[33] = 12'h690;
    stim[34] = 12'hf6e;
    stim[35] = 12'h85c;
    stim[36] = 12'h212;
    stim[37] = 12'h208;
    stim[38] = 12'h697;
    stim[39] = 12'h6d3;
    stim[40] = 12'hfcf;
    stim[41] = 12'h088;
    stim[42] = 12'h522;
    stim[43] = 12'h775;
    stim[44] = 12'h9d8;
    stim[45] = 12'h424;
    stim[46] = 12'h7f3;
    stim[47] = 12'h9b0;
    stim[48] = 12'hbdc;
    stim[49] = 12'h04a;
    stim[50] = 12'ha21;
    stim[51] = 12'h327;
    stim[52] = 12'hda9;
    stim[53] = 12'h2c6;
    stim[54] = 12'h527;
    stim[55] = 12'heae;
    stim[56] = 12'hba3;
    stim[57] = 12'h68a;
    stim[58] = 12'hc16;
    stim[59] = 12'h171;
    stim[60] = 12'h954;
    stim[61] = 12'hf64;
    stim[62] = 12'hc89;
    stim[63] = 12'h5fe;
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
      expv[0] = 10'h0dc;
      expv[1] = 10'h227;
      expv[2] = 10'h03a;
      expv[3] = 10'h1e5;
      expv[4] = 10'h0ff;
      expv[5] = 10'h1ca;
      expv[6] = 10'h303;
      expv[7] = 10'h334;
      expv[8] = 10'h101;
      expv[9] = 10'h31e;
      expv[10] = 10'h0a4;
      expv[11] = 10'h097;
      expv[12] = 10'h3c1;
      expv[13] = 10'h329;
      expv[14] = 10'h1f9;
      expv[15] = 10'h059;
      expv[16] = 10'h2b5;
      expv[17] = 10'h310;
      expv[18] = 10'h036;
      expv[19] = 10'h19a;
      expv[20] = 10'h1d7;
      expv[21] = 10'h18f;
      expv[22] = 10'h143;
      expv[23] = 10'h057;
      expv[24] = 10'h39e;
      expv[25] = 10'h0b1;
      expv[26] = 10'h36f;
      expv[27] = 10'h02f;
      expv[28] = 10'h36a;
      expv[29] = 10'h3ee;
      expv[30] = 10'h21c;
      expv[31] = 10'h300;
      expv[32] = 10'h11d;
      expv[33] = 10'h1a4;
      expv[34] = 10'h3db;
      expv[35] = 10'h217;
      expv[36] = 10'h084;
      expv[37] = 10'h082;
      expv[38] = 10'h1a5;
      expv[39] = 10'h1b4;
      expv[40] = 10'h3f3;
      expv[41] = 10'h022;
      expv[42] = 10'h148;
      expv[43] = 10'h1dd;
      expv[44] = 10'h276;
      expv[45] = 10'h109;
      expv[46] = 10'h1fc;
      expv[47] = 10'h26c;
      expv[48] = 10'h2f7;
      expv[49] = 10'h012;
      expv[50] = 10'h288;
      expv[51] = 10'h0c9;
      expv[52] = 10'h36a;
      expv[53] = 10'h0b1;
      expv[54] = 10'h149;
      expv[55] = 10'h3ab;
      expv[56] = 10'h2e8;
      expv[57] = 10'h1a2;
      expv[58] = 10'h305;
      expv[59] = 10'h05c;
      expv[60] = 10'h255;
      expv[61] = 10'h3d9;
      expv[62] = 10'h322;
      expv[63] = 10'h17f;
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
