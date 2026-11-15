// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174509 dut (
    .clk(clk),
    .REGA(in_vec[17:2]),
    .rst(in_vec[1:1]),
    .en(in_vec[0:0]),
    .REGC(out_vec[36:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2dda7;
    stim[1] = 18'h3123f;
    stim[2] = 18'h32264;
    stim[3] = 18'h2cc4d;
    stim[4] = 18'h28ef4;
    stim[5] = 18'h3d5a4;
    stim[6] = 18'h36728;
    stim[7] = 18'h150b1;
    stim[8] = 18'h03b7c;
    stim[9] = 18'h1cc25;
    stim[10] = 18'h18d58;
    stim[11] = 18'h23ff8;
    stim[12] = 18'h3b8f8;
    stim[13] = 18'h05b3c;
    stim[14] = 18'h04b6c;
    stim[15] = 18'h31d5c;
    stim[16] = 18'h33f88;
    stim[17] = 18'h0837d;
    stim[18] = 18'h1479c;
    stim[19] = 18'h12d9d;
    stim[20] = 18'h07da5;
    stim[21] = 18'h1d3e4;
    stim[22] = 18'h0d4bc;
    stim[23] = 18'h096bd;
    stim[24] = 18'h3c321;
    stim[25] = 18'h02eb5;
    stim[26] = 18'h0778d;
    stim[27] = 18'h30811;
    stim[28] = 18'h180a0;
    stim[29] = 18'h206fd;
    stim[30] = 18'h3cc70;
    stim[31] = 18'h22c4d;
    stim[32] = 18'h21dd4;
    stim[33] = 18'h1ace5;
    stim[34] = 18'h3929c;
    stim[35] = 18'h238f9;
    stim[36] = 18'h38ed1;
    stim[37] = 18'h14194;
    stim[38] = 18'h3eb84;
    stim[39] = 18'h3a3d4;
    stim[40] = 18'h30e95;
    stim[41] = 18'h1e03c;
    stim[42] = 18'h2a5a0;
    stim[43] = 18'h196b4;
    stim[44] = 18'h32d68;
    stim[45] = 18'h2395d;
    stim[46] = 18'h0d591;
    stim[47] = 18'h2d8a0;
    stim[48] = 18'h341fc;
    stim[49] = 18'h02c45;
    stim[50] = 18'h35f19;
    stim[51] = 18'h0fdb4;
    stim[52] = 18'h00da4;
    stim[53] = 18'h15560;
    stim[54] = 18'h2172d;
    stim[55] = 18'h26659;
    stim[56] = 18'h21c04;
    stim[57] = 18'h28ef8;
    stim[58] = 18'h270c0;
    stim[59] = 18'h18a3c;
    stim[60] = 18'h2550c;
    stim[61] = 18'h0adf5;
    stim[62] = 18'h042a9;
    stim[63] = 18'h0b159;
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
      expv[0] = 37'h0000000000;
      expv[1] = 37'h0000000000;
      expv[2] = 37'h0000000000;
      expv[3] = 37'h0000000000;
      expv[4] = 37'h0000000000;
      expv[5] = 37'h0000000000;
      expv[6] = 37'h0000000000;
      expv[7] = 37'h0000000000;
      expv[8] = 37'h0000000000;
      expv[9] = 37'h0000000000;
      expv[10] = 37'h0000000000;
      expv[11] = 37'h0000000000;
      expv[12] = 37'h0000000000;
      expv[13] = 37'h0000000000;
      expv[14] = 37'h0000000000;
      expv[15] = 37'h0000000000;
      expv[16] = 37'h0000000000;
      expv[17] = 37'h0000000000;
      expv[18] = 37'h0000000000;
      expv[19] = 37'h0000000000;
      expv[20] = 37'h0000000000;
      expv[21] = 37'h0000000000;
      expv[22] = 37'h0000000000;
      expv[23] = 37'h0000000000;
      expv[24] = 37'h0000000000;
      expv[25] = 37'h0000000000;
      expv[26] = 37'h0000000000;
      expv[27] = 37'h0000000000;
      expv[28] = 37'h0000000000;
      expv[29] = 37'h0000000000;
      expv[30] = 37'h0000000000;
      expv[31] = 37'h0000000000;
      expv[32] = 37'h0000000000;
      expv[33] = 37'h0000000000;
      expv[34] = 37'h0000000000;
      expv[35] = 37'h0000000000;
      expv[36] = 37'h0000000000;
      expv[37] = 37'h0000000000;
      expv[38] = 37'h0000000000;
      expv[39] = 37'h0000000000;
      expv[40] = 37'h0000000000;
      expv[41] = 37'h0000000000;
      expv[42] = 37'h0000000000;
      expv[43] = 37'h0000000000;
      expv[44] = 37'h0000000000;
      expv[45] = 37'h0000000000;
      expv[46] = 37'h0000000000;
      expv[47] = 37'h0000000000;
      expv[48] = 37'h0000000000;
      expv[49] = 37'h0000000000;
      expv[50] = 37'h0000000000;
      expv[51] = 37'h0000000000;
      expv[52] = 37'h0000000000;
      expv[53] = 37'h0000000000;
      expv[54] = 37'h0000000000;
      expv[55] = 37'h0000000000;
      expv[56] = 37'h0000000000;
      expv[57] = 37'h0000000000;
      expv[58] = 37'h0000000000;
      expv[59] = 37'h0000000000;
      expv[60] = 37'h0000000000;
      expv[61] = 37'h0000000000;
      expv[62] = 37'h0000000000;
      expv[63] = 37'h0000000000;
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
