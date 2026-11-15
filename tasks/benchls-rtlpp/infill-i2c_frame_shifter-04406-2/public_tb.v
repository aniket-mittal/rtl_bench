// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04406 dut (
    .clk(clk),
    .data(in_vec[17:6]),
    .load_data(in_vec[5:5]),
    .RSTn(in_vec[4:4]),
    .load_start(in_vec[3:3]),
    .load_stop(in_vec[2:2]),
    .load_ack(in_vec[1:1]),
    .load_nack(in_vec[0:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h312cc;
    stim[1] = 18'h2774c;
    stim[2] = 18'h23ab3;
    stim[3] = 18'h0ac76;
    stim[4] = 18'h2d635;
    stim[5] = 18'h1d679;
    stim[6] = 18'h39e55;
    stim[7] = 18'h06ef9;
    stim[8] = 18'h31853;
    stim[9] = 18'h0897f;
    stim[10] = 18'h3b2fd;
    stim[11] = 18'h05a58;
    stim[12] = 18'h29e56;
    stim[13] = 18'h20cf4;
    stim[14] = 18'h18910;
    stim[15] = 18'h27fde;
    stim[16] = 18'h1bb9f;
    stim[17] = 18'h0ec1c;
    stim[18] = 18'h229bd;
    stim[19] = 18'h399dc;
    stim[20] = 18'h229f7;
    stim[21] = 18'h2db9c;
    stim[22] = 18'h0bb1a;
    stim[23] = 18'h18b59;
    stim[24] = 18'h29997;
    stim[25] = 18'h0d419;
    stim[26] = 18'h094f5;
    stim[27] = 18'h2c65e;
    stim[28] = 18'h2dfde;
    stim[29] = 18'h2c313;
    stim[30] = 18'h29e53;
    stim[31] = 18'h244bf;
    stim[32] = 18'h3c892;
    stim[33] = 18'h06854;
    stim[34] = 18'h02b35;
    stim[35] = 18'h050d4;
    stim[36] = 18'h2587b;
    stim[37] = 18'h39c95;
    stim[38] = 18'h2346c;
    stim[39] = 18'h02f7c;
    stim[40] = 18'h11d97;
    stim[41] = 18'h35e30;
    stim[42] = 18'h3683d;
    stim[43] = 18'h2b0dd;
    stim[44] = 18'h188da;
    stim[45] = 18'h1439a;
    stim[46] = 18'h0bf7f;
    stim[47] = 18'h00ef1;
    stim[48] = 18'h16478;
    stim[49] = 18'h0f155;
    stim[50] = 18'h276e0;
    stim[51] = 18'h111b0;
    stim[52] = 18'h3e498;
    stim[53] = 18'h0a9dc;
    stim[54] = 18'h07cdd;
    stim[55] = 18'h119f8;
    stim[56] = 18'h2f47d;
    stim[57] = 18'h3bc1b;
    stim[58] = 18'h21670;
    stim[59] = 18'h228fa;
    stim[60] = 18'h292f3;
    stim[61] = 18'h0459e;
    stim[62] = 18'h1ad52;
    stim[63] = 18'h260ba;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
