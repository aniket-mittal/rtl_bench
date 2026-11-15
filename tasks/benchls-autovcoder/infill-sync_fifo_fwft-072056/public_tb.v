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

  autovcoder_072056 dut (
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
    stim[0] = 12'hdb2;
    stim[1] = 12'hfd0;
    stim[2] = 12'h531;
    stim[3] = 12'h0d4;
    stim[4] = 12'h117;
    stim[5] = 12'h6b3;
    stim[6] = 12'h6c6;
    stim[7] = 12'h2b9;
    stim[8] = 12'h368;
    stim[9] = 12'h11c;
    stim[10] = 12'h67f;
    stim[11] = 12'h1e3;
    stim[12] = 12'h7e5;
    stim[13] = 12'h354;
    stim[14] = 12'h43f;
    stim[15] = 12'h7ab;
    stim[16] = 12'h217;
    stim[17] = 12'h5dd;
    stim[18] = 12'h6d7;
    stim[19] = 12'h699;
    stim[20] = 12'h418;
    stim[21] = 12'h15d;
    stim[22] = 12'h259;
    stim[23] = 12'h24f;
    stim[24] = 12'h2c4;
    stim[25] = 12'h67b;
    stim[26] = 12'h561;
    stim[27] = 12'h28a;
    stim[28] = 12'h20b;
    stim[29] = 12'h043;
    stim[30] = 12'h443;
    stim[31] = 12'h299;
    stim[32] = 12'h3b5;
    stim[33] = 12'h1bc;
    stim[34] = 12'h3e1;
    stim[35] = 12'h7d2;
    stim[36] = 12'h1e8;
    stim[37] = 12'h3af;
    stim[38] = 12'h515;
    stim[39] = 12'h5ff;
    stim[40] = 12'h007;
    stim[41] = 12'h438;
    stim[42] = 12'h70a;
    stim[43] = 12'h58a;
    stim[44] = 12'h313;
    stim[45] = 12'h140;
    stim[46] = 12'h70b;
    stim[47] = 12'h6b8;
    stim[48] = 12'h307;
    stim[49] = 12'h38e;
    stim[50] = 12'h5c0;
    stim[51] = 12'h2ed;
    stim[52] = 12'h6e2;
    stim[53] = 12'h2fe;
    stim[54] = 12'h1ed;
    stim[55] = 12'h312;
    stim[56] = 12'h407;
    stim[57] = 12'h28d;
    stim[58] = 12'h6cc;
    stim[59] = 12'h079;
    stim[60] = 12'h5c0;
    stim[61] = 12'h47c;
    stim[62] = 12'h2f3;
    stim[63] = 12'h4f5;
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
      expv[3] = 10'h1d0;
      expv[4] = 10'h1d0;
      expv[5] = 10'h1d0;
      expv[6] = 10'h331;
      expv[7] = 10'h131;
      expv[8] = 10'h131;
      expv[9] = 10'h131;
      expv[10] = 10'h131;
      expv[11] = 10'h131;
      expv[12] = 10'h131;
      expv[13] = 10'h131;
      expv[14] = 10'h131;
      expv[15] = 10'h3e5;
      expv[16] = 10'h1e5;
      expv[17] = 10'h1e5;
      expv[18] = 10'h3ab;
      expv[19] = 10'h3dd;
      expv[20] = 10'h1dd;
      expv[21] = 10'h1dd;
      expv[22] = 10'h1dd;
      expv[23] = 10'h1dd;
      expv[24] = 10'h1dd;
      expv[25] = 10'h1dd;
      expv[26] = 10'h1dd;
      expv[27] = 10'h1dd;
      expv[28] = 10'h1dd;
      expv[29] = 10'h1dd;
      expv[30] = 10'h1dd;
      expv[31] = 10'h361;
      expv[32] = 10'h361;
      expv[33] = 10'h361;
      expv[34] = 10'h361;
      expv[35] = 10'h361;
      expv[36] = 10'h161;
      expv[37] = 10'h161;
      expv[38] = 10'h161;
      expv[39] = 10'h3d2;
      expv[40] = 10'h3d2;
      expv[41] = 10'h3d2;
      expv[42] = 10'h3d2;
      expv[43] = 10'h315;
      expv[44] = 10'h315;
      expv[45] = 10'h315;
      expv[46] = 10'h315;
      expv[47] = 10'h3ff;
      expv[48] = 10'h30a;
      expv[49] = 10'h30a;
      expv[50] = 10'h30a;
      expv[51] = 10'h30a;
      expv[52] = 10'h30a;
      expv[53] = 10'h38a;
      expv[54] = 10'h38a;
      expv[55] = 10'h38a;
      expv[56] = 10'h38a;
      expv[57] = 10'h38a;
      expv[58] = 10'h38a;
      expv[59] = 10'h30b;
      expv[60] = 10'h30b;
      expv[61] = 10'h30b;
      expv[62] = 10'h30b;
      expv[63] = 10'h30b;
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
