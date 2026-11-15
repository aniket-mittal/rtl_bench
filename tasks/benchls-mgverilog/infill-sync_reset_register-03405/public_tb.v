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

  mg_03405 dut (
    .clk(clk),
    .data_in(in_vec[9:2]),
    .we(in_vec[1:1]),
    .rst_sync(in_vec[0:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h12b;
    stim[1] = 10'h2f9;
    stim[2] = 10'h03e;
    stim[3] = 10'h08e;
    stim[4] = 10'h1e6;
    stim[5] = 10'h222;
    stim[6] = 10'h0ee;
    stim[7] = 10'h200;
    stim[8] = 10'h2e0;
    stim[9] = 10'h198;
    stim[10] = 10'h18a;
    stim[11] = 10'h3cc;
    stim[12] = 10'h14e;
    stim[13] = 10'h0fa;
    stim[14] = 10'h092;
    stim[15] = 10'h3da;
    stim[16] = 10'h226;
    stim[17] = 10'h04c;
    stim[18] = 10'h3c2;
    stim[19] = 10'h0ca;
    stim[20] = 10'h03c;
    stim[21] = 10'h1c0;
    stim[22] = 10'h2bc;
    stim[23] = 10'h170;
    stim[24] = 10'h1b0;
    stim[25] = 10'h1a2;
    stim[26] = 10'h0ba;
    stim[27] = 10'h17e;
    stim[28] = 10'h05a;
    stim[29] = 10'h1f6;
    stim[30] = 10'h21c;
    stim[31] = 10'h054;
    stim[32] = 10'h32e;
    stim[33] = 10'h370;
    stim[34] = 10'h276;
    stim[35] = 10'h172;
    stim[36] = 10'h0e6;
    stim[37] = 10'h138;
    stim[38] = 10'h0c4;
    stim[39] = 10'h3d6;
    stim[40] = 10'h394;
    stim[41] = 10'h1c0;
    stim[42] = 10'h28a;
    stim[43] = 10'h057;
    stim[44] = 10'h322;
    stim[45] = 10'h102;
    stim[46] = 10'h272;
    stim[47] = 10'h330;
    stim[48] = 10'h24a;
    stim[49] = 10'h124;
    stim[50] = 10'h3ec;
    stim[51] = 10'h176;
    stim[52] = 10'h0b4;
    stim[53] = 10'h2d6;
    stim[54] = 10'h07c;
    stim[55] = 10'h10c;
    stim[56] = 10'h16c;
    stim[57] = 10'h376;
    stim[58] = 10'h1da;
    stim[59] = 10'h09e;
    stim[60] = 10'h3cc;
    stim[61] = 10'h3d0;
    stim[62] = 10'h070;
    stim[63] = 10'h174;
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
      expv[3] = 8'h0f;
      expv[4] = 8'h23;
      expv[5] = 8'h79;
      expv[6] = 8'h88;
      expv[7] = 8'h3b;
      expv[8] = 8'h3b;
      expv[9] = 8'h3b;
      expv[10] = 8'h3b;
      expv[11] = 8'h62;
      expv[12] = 8'h62;
      expv[13] = 8'h53;
      expv[14] = 8'h3e;
      expv[15] = 8'h24;
      expv[16] = 8'hf6;
      expv[17] = 8'h89;
      expv[18] = 8'h89;
      expv[19] = 8'hf0;
      expv[20] = 8'h32;
      expv[21] = 8'h32;
      expv[22] = 8'h32;
      expv[23] = 8'h32;
      expv[24] = 8'h32;
      expv[25] = 8'h32;
      expv[26] = 8'h68;
      expv[27] = 8'h2e;
      expv[28] = 8'h5f;
      expv[29] = 8'h16;
      expv[30] = 8'h7d;
      expv[31] = 8'h7d;
      expv[32] = 8'h7d;
      expv[33] = 8'hcb;
      expv[34] = 8'hcb;
      expv[35] = 8'h9d;
      expv[36] = 8'h5c;
      expv[37] = 8'h39;
      expv[38] = 8'h39;
      expv[39] = 8'h39;
      expv[40] = 8'hf5;
      expv[41] = 8'hf5;
      expv[42] = 8'hf5;
      expv[43] = 8'ha2;
      expv[44] = 8'h00;
      expv[45] = 8'hc8;
      expv[46] = 8'h40;
      expv[47] = 8'h9c;
      expv[48] = 8'h9c;
      expv[49] = 8'h92;
      expv[50] = 8'h92;
      expv[51] = 8'h92;
      expv[52] = 8'h5d;
      expv[53] = 8'h5d;
      expv[54] = 8'hb5;
      expv[55] = 8'hb5;
      expv[56] = 8'hb5;
      expv[57] = 8'hb5;
      expv[58] = 8'hdd;
      expv[59] = 8'h76;
      expv[60] = 8'h27;
      expv[61] = 8'h27;
      expv[62] = 8'h27;
      expv[63] = 8'h27;
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
