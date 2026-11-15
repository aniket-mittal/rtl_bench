// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074105 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .ld(in_vec[8:8]),
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h245;
    stim[1] = 10'h27a;
    stim[2] = 10'h08c;
    stim[3] = 10'h063;
    stim[4] = 10'h10a;
    stim[5] = 10'h0fb;
    stim[6] = 10'h389;
    stim[7] = 10'h17e;
    stim[8] = 10'h174;
    stim[9] = 10'h008;
    stim[10] = 10'h0d6;
    stim[11] = 10'h1c8;
    stim[12] = 10'h15b;
    stim[13] = 10'h146;
    stim[14] = 10'h2d3;
    stim[15] = 10'h12b;
    stim[16] = 10'h0dd;
    stim[17] = 10'h078;
    stim[18] = 10'h0a2;
    stim[19] = 10'h0ab;
    stim[20] = 10'h1dd;
    stim[21] = 10'h12f;
    stim[22] = 10'h195;
    stim[23] = 10'h1ff;
    stim[24] = 10'h03a;
    stim[25] = 10'h115;
    stim[26] = 10'h1a5;
    stim[27] = 10'h180;
    stim[28] = 10'h1ae;
    stim[29] = 10'h041;
    stim[30] = 10'h19a;
    stim[31] = 10'h102;
    stim[32] = 10'h190;
    stim[33] = 10'h033;
    stim[34] = 10'h0b0;
    stim[35] = 10'h09d;
    stim[36] = 10'h030;
    stim[37] = 10'h155;
    stim[38] = 10'h1aa;
    stim[39] = 10'h0df;
    stim[40] = 10'h1c8;
    stim[41] = 10'h008;
    stim[42] = 10'h1d6;
    stim[43] = 10'h0c1;
    stim[44] = 10'h054;
    stim[45] = 10'h0d0;
    stim[46] = 10'h09e;
    stim[47] = 10'h01e;
    stim[48] = 10'h1bc;
    stim[49] = 10'h12a;
    stim[50] = 10'h052;
    stim[51] = 10'h107;
    stim[52] = 10'h071;
    stim[53] = 10'h163;
    stim[54] = 10'h09e;
    stim[55] = 10'h196;
    stim[56] = 10'h010;
    stim[57] = 10'h17d;
    stim[58] = 10'h0c6;
    stim[59] = 10'h009;
    stim[60] = 10'h1fe;
    stim[61] = 10'h144;
    stim[62] = 10'h08d;
    stim[63] = 10'h14f;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h0a;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h7e;
      expv[9] = 8'h74;
      expv[10] = 8'h74;
      expv[11] = 8'h74;
      expv[12] = 8'hc8;
      expv[13] = 8'h5b;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h2b;
      expv[17] = 8'h2b;
      expv[18] = 8'h2b;
      expv[19] = 8'h2b;
      expv[20] = 8'h2b;
      expv[21] = 8'hdd;
      expv[22] = 8'h2f;
      expv[23] = 8'h95;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'h15;
      expv[27] = 8'ha5;
      expv[28] = 8'h80;
      expv[29] = 8'hae;
      expv[30] = 8'hae;
      expv[31] = 8'h9a;
      expv[32] = 8'h02;
      expv[33] = 8'h90;
      expv[34] = 8'h90;
      expv[35] = 8'h90;
      expv[36] = 8'h90;
      expv[37] = 8'h90;
      expv[38] = 8'h55;
      expv[39] = 8'haa;
      expv[40] = 8'haa;
      expv[41] = 8'hc8;
      expv[42] = 8'hc8;
      expv[43] = 8'hd6;
      expv[44] = 8'hd6;
      expv[45] = 8'hd6;
      expv[46] = 8'hd6;
      expv[47] = 8'hd6;
      expv[48] = 8'hd6;
      expv[49] = 8'hbc;
      expv[50] = 8'h2a;
      expv[51] = 8'h2a;
      expv[52] = 8'h07;
      expv[53] = 8'h07;
      expv[54] = 8'h63;
      expv[55] = 8'h63;
      expv[56] = 8'h96;
      expv[57] = 8'h96;
      expv[58] = 8'h7d;
      expv[59] = 8'h7d;
      expv[60] = 8'h7d;
      expv[61] = 8'hfe;
      expv[62] = 8'h44;
      expv[63] = 8'h44;
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
