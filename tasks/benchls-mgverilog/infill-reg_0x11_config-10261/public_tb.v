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

  mg_10261 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .wenb(in_vec[8:8]),
    .in_data(in_vec[7:0]),
    .reg_0x11(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h23b;
    stim[1] = 10'h3d5;
    stim[2] = 10'h04e;
    stim[3] = 10'h04a;
    stim[4] = 10'h177;
    stim[5] = 10'h00b;
    stim[6] = 10'h079;
    stim[7] = 10'h04e;
    stim[8] = 10'h0ee;
    stim[9] = 10'h191;
    stim[10] = 10'h002;
    stim[11] = 10'h163;
    stim[12] = 10'h084;
    stim[13] = 10'h147;
    stim[14] = 10'h0f5;
    stim[15] = 10'h1d6;
    stim[16] = 10'h1b2;
    stim[17] = 10'h082;
    stim[18] = 10'h054;
    stim[19] = 10'h1d7;
    stim[20] = 10'h029;
    stim[21] = 10'h1ba;
    stim[22] = 10'h0dd;
    stim[23] = 10'h1ee;
    stim[24] = 10'h026;
    stim[25] = 10'h0e5;
    stim[26] = 10'h14a;
    stim[27] = 10'h11d;
    stim[28] = 10'h119;
    stim[29] = 10'h059;
    stim[30] = 10'h11e;
    stim[31] = 10'h122;
    stim[32] = 10'h1d6;
    stim[33] = 10'h1f1;
    stim[34] = 10'h0f3;
    stim[35] = 10'h139;
    stim[36] = 10'h0ed;
    stim[37] = 10'h0a0;
    stim[38] = 10'h0c4;
    stim[39] = 10'h08a;
    stim[40] = 10'h0fe;
    stim[41] = 10'h0f7;
    stim[42] = 10'h113;
    stim[43] = 10'h1fb;
    stim[44] = 10'h1b9;
    stim[45] = 10'h0dc;
    stim[46] = 10'h1d8;
    stim[47] = 10'h0a2;
    stim[48] = 10'h092;
    stim[49] = 10'h13a;
    stim[50] = 10'h0fd;
    stim[51] = 10'h01f;
    stim[52] = 10'h1a9;
    stim[53] = 10'h1d3;
    stim[54] = 10'h161;
    stim[55] = 10'h0a9;
    stim[56] = 10'h08d;
    stim[57] = 10'h15f;
    stim[58] = 10'h105;
    stim[59] = 10'h055;
    stim[60] = 10'h16e;
    stim[61] = 10'h07e;
    stim[62] = 10'h018;
    stim[63] = 10'h1b5;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h4e;
      expv[4] = 8'h4a;
      expv[5] = 8'h4a;
      expv[6] = 8'h0b;
      expv[7] = 8'h79;
      expv[8] = 8'h4e;
      expv[9] = 8'hee;
      expv[10] = 8'hee;
      expv[11] = 8'h02;
      expv[12] = 8'h02;
      expv[13] = 8'h84;
      expv[14] = 8'h84;
      expv[15] = 8'hf5;
      expv[16] = 8'hf5;
      expv[17] = 8'hf5;
      expv[18] = 8'h82;
      expv[19] = 8'h54;
      expv[20] = 8'h54;
      expv[21] = 8'h29;
      expv[22] = 8'h29;
      expv[23] = 8'hdd;
      expv[24] = 8'hdd;
      expv[25] = 8'h26;
      expv[26] = 8'he5;
      expv[27] = 8'he5;
      expv[28] = 8'he5;
      expv[29] = 8'he5;
      expv[30] = 8'h59;
      expv[31] = 8'h59;
      expv[32] = 8'h59;
      expv[33] = 8'h59;
      expv[34] = 8'h59;
      expv[35] = 8'hf3;
      expv[36] = 8'hf3;
      expv[37] = 8'hed;
      expv[38] = 8'ha0;
      expv[39] = 8'hc4;
      expv[40] = 8'h8a;
      expv[41] = 8'hfe;
      expv[42] = 8'hf7;
      expv[43] = 8'hf7;
      expv[44] = 8'hf7;
      expv[45] = 8'hf7;
      expv[46] = 8'hdc;
      expv[47] = 8'hdc;
      expv[48] = 8'ha2;
      expv[49] = 8'h92;
      expv[50] = 8'h92;
      expv[51] = 8'hfd;
      expv[52] = 8'h1f;
      expv[53] = 8'h1f;
      expv[54] = 8'h1f;
      expv[55] = 8'h1f;
      expv[56] = 8'ha9;
      expv[57] = 8'h8d;
      expv[58] = 8'h8d;
      expv[59] = 8'h8d;
      expv[60] = 8'h55;
      expv[61] = 8'h55;
      expv[62] = 8'h7e;
      expv[63] = 8'h18;
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
