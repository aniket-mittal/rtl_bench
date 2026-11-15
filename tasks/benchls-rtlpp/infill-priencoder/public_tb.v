// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  priencoder dut (
    .w(in_vec[15:0]),
    .z(out_vec[4:4]),
    .y(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h01c6;
    stim[1] = 16'h100b;
    stim[2] = 16'h6654;
    stim[3] = 16'h2a6a;
    stim[4] = 16'h3e1e;
    stim[5] = 16'habac;
    stim[6] = 16'hd2aa;
    stim[7] = 16'h7c56;
    stim[8] = 16'hb877;
    stim[9] = 16'h3e2f;
    stim[10] = 16'h5738;
    stim[11] = 16'h6f18;
    stim[12] = 16'h30e7;
    stim[13] = 16'h4842;
    stim[14] = 16'h0006;
    stim[15] = 16'h696a;
    stim[16] = 16'hb34e;
    stim[17] = 16'h98c9;
    stim[18] = 16'h0e1a;
    stim[19] = 16'h3afe;
    stim[20] = 16'h257c;
    stim[21] = 16'h1514;
    stim[22] = 16'hb4d0;
    stim[23] = 16'h2890;
    stim[24] = 16'h9f16;
    stim[25] = 16'h9968;
    stim[26] = 16'h1d72;
    stim[27] = 16'hdecc;
    stim[28] = 16'h40d0;
    stim[29] = 16'h8db0;
    stim[30] = 16'h3bfd;
    stim[31] = 16'h8c15;
    stim[32] = 16'h62e9;
    stim[33] = 16'hcd14;
    stim[34] = 16'h6feb;
    stim[35] = 16'h7be1;
    stim[36] = 16'h4d5a;
    stim[37] = 16'h0fc2;
    stim[38] = 16'hbca2;
    stim[39] = 16'h1ed3;
    stim[40] = 16'h57db;
    stim[41] = 16'h95f0;
    stim[42] = 16'hf68e;
    stim[43] = 16'h19d0;
    stim[44] = 16'hfffc;
    stim[45] = 16'h543d;
    stim[46] = 16'hefc8;
    stim[47] = 16'ha5d6;
    stim[48] = 16'ha918;
    stim[49] = 16'hc11a;
    stim[50] = 16'hd105;
    stim[51] = 16'h91dc;
    stim[52] = 16'h5acd;
    stim[53] = 16'h538a;
    stim[54] = 16'h39de;
    stim[55] = 16'h8726;
    stim[56] = 16'h4524;
    stim[57] = 16'h3ff1;
    stim[58] = 16'h535b;
    stim[59] = 16'hc835;
    stim[60] = 16'hc353;
    stim[61] = 16'h46c5;
    stim[62] = 16'h1d14;
    stim[63] = 16'h8254;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h18;
      expv[1] = 5'h1c;
      expv[2] = 5'h1e;
      expv[3] = 5'h1d;
      expv[4] = 5'h1d;
      expv[5] = 5'h1f;
      expv[6] = 5'h1f;
      expv[7] = 5'h1e;
      expv[8] = 5'h1f;
      expv[9] = 5'h1d;
      expv[10] = 5'h1e;
      expv[11] = 5'h1e;
      expv[12] = 5'h1d;
      expv[13] = 5'h1e;
      expv[14] = 5'h12;
      expv[15] = 5'h1e;
      expv[16] = 5'h1f;
      expv[17] = 5'h1f;
      expv[18] = 5'h1b;
      expv[19] = 5'h1d;
      expv[20] = 5'h1d;
      expv[21] = 5'h1c;
      expv[22] = 5'h1f;
      expv[23] = 5'h1d;
      expv[24] = 5'h1f;
      expv[25] = 5'h1f;
      expv[26] = 5'h1c;
      expv[27] = 5'h1f;
      expv[28] = 5'h1e;
      expv[29] = 5'h1f;
      expv[30] = 5'h1d;
      expv[31] = 5'h1f;
      expv[32] = 5'h1e;
      expv[33] = 5'h1f;
      expv[34] = 5'h1e;
      expv[35] = 5'h1e;
      expv[36] = 5'h1e;
      expv[37] = 5'h1b;
      expv[38] = 5'h1f;
      expv[39] = 5'h1c;
      expv[40] = 5'h1e;
      expv[41] = 5'h1f;
      expv[42] = 5'h1f;
      expv[43] = 5'h1c;
      expv[44] = 5'h1f;
      expv[45] = 5'h1e;
      expv[46] = 5'h1f;
      expv[47] = 5'h1f;
      expv[48] = 5'h1f;
      expv[49] = 5'h1f;
      expv[50] = 5'h1f;
      expv[51] = 5'h1f;
      expv[52] = 5'h1e;
      expv[53] = 5'h1e;
      expv[54] = 5'h1d;
      expv[55] = 5'h1f;
      expv[56] = 5'h1e;
      expv[57] = 5'h1d;
      expv[58] = 5'h1e;
      expv[59] = 5'h1f;
      expv[60] = 5'h1f;
      expv[61] = 5'h1e;
      expv[62] = 5'h1c;
      expv[63] = 5'h1f;
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
