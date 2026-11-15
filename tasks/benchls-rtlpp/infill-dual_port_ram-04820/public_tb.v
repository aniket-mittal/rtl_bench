// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04820 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0a02d;
    stim[1] = 17'h1f41c;
    stim[2] = 17'h1e438;
    stim[3] = 17'h06ae0;
    stim[4] = 17'h076b9;
    stim[5] = 17'h1b1bb;
    stim[6] = 17'h12c3c;
    stim[7] = 17'h1924c;
    stim[8] = 17'h012ef;
    stim[9] = 17'h0a3e0;
    stim[10] = 17'h0eac0;
    stim[11] = 17'h1b058;
    stim[12] = 17'h19aa8;
    stim[13] = 17'h0cabc;
    stim[14] = 17'h1bf54;
    stim[15] = 17'h0c803;
    stim[16] = 17'h1b3af;
    stim[17] = 17'h0dced;
    stim[18] = 17'h1e684;
    stim[19] = 17'h1ccd6;
    stim[20] = 17'h0bc73;
    stim[21] = 17'h04da9;
    stim[22] = 17'h02b26;
    stim[23] = 17'h1f94e;
    stim[24] = 17'h01772;
    stim[25] = 17'h0557b;
    stim[26] = 17'h1cf4c;
    stim[27] = 17'h1cc3c;
    stim[28] = 17'h06865;
    stim[29] = 17'h075cb;
    stim[30] = 17'h1fdd0;
    stim[31] = 17'h19bb5;
    stim[32] = 17'h0c309;
    stim[33] = 17'h1f805;
    stim[34] = 17'h1113d;
    stim[35] = 17'h10a9b;
    stim[36] = 17'h0b6fd;
    stim[37] = 17'h124b2;
    stim[38] = 17'h021b8;
    stim[39] = 17'h0dd02;
    stim[40] = 17'h1646c;
    stim[41] = 17'h0b43b;
    stim[42] = 17'h04f63;
    stim[43] = 17'h0857a;
    stim[44] = 17'h19179;
    stim[45] = 17'h1b738;
    stim[46] = 17'h1ee23;
    stim[47] = 17'h1d3c5;
    stim[48] = 17'h02692;
    stim[49] = 17'h19f8d;
    stim[50] = 17'h09faa;
    stim[51] = 17'h1e780;
    stim[52] = 17'h06872;
    stim[53] = 17'h1b873;
    stim[54] = 17'h0e019;
    stim[55] = 17'h02526;
    stim[56] = 17'h0c2e9;
    stim[57] = 17'h0bdde;
    stim[58] = 17'h199b2;
    stim[59] = 17'h094cb;
    stim[60] = 17'h07739;
    stim[61] = 17'h19d17;
    stim[62] = 17'h0f770;
    stim[63] = 17'h1c74a;
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
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'h3c;
      expv[9] = 8'h3c;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'h1c;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hd6;
      expv[22] = 8'hxx;
      expv[23] = 8'haf;
      expv[24] = 8'ha8;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'h4e;
      expv[28] = 8'h4c;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'haf;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'h3d;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'h05;
      expv[44] = 8'hxx;
      expv[45] = 8'h3d;
      expv[46] = 8'hxx;
      expv[47] = 8'h84;
      expv[48] = 8'hxx;
      expv[49] = 8'h6c;
      expv[50] = 8'h05;
      expv[51] = 8'h05;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'h9b;
      expv[56] = 8'hxx;
      expv[57] = 8'hb2;
      expv[58] = 8'hc5;
      expv[59] = 8'h8d;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hc5;
      expv[63] = 8'hxx;
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
