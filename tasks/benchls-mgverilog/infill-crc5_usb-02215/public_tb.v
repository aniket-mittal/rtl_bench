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

  mg_02215 dut (
    .crc_in(in_vec[15:11]),
    .din(in_vec[10:0]),
    .crc_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hd4eb;
    stim[1] = 16'hc978;
    stim[2] = 16'h8671;
    stim[3] = 16'h944d;
    stim[4] = 16'h2a22;
    stim[5] = 16'h626b;
    stim[6] = 16'hd3b9;
    stim[7] = 16'h1fd3;
    stim[8] = 16'h4f92;
    stim[9] = 16'he507;
    stim[10] = 16'ha510;
    stim[11] = 16'h4667;
    stim[12] = 16'h30bc;
    stim[13] = 16'h31ed;
    stim[14] = 16'h52c5;
    stim[15] = 16'h833d;
    stim[16] = 16'hcf17;
    stim[17] = 16'h624e;
    stim[18] = 16'h4084;
    stim[19] = 16'h887b;
    stim[20] = 16'hf931;
    stim[21] = 16'h8bed;
    stim[22] = 16'h2fc9;
    stim[23] = 16'h6047;
    stim[24] = 16'h12fd;
    stim[25] = 16'h5d0e;
    stim[26] = 16'h52bd;
    stim[27] = 16'h9fda;
    stim[28] = 16'h40b0;
    stim[29] = 16'hdcd7;
    stim[30] = 16'h5aeb;
    stim[31] = 16'hf39d;
    stim[32] = 16'h5802;
    stim[33] = 16'h53e4;
    stim[34] = 16'h3c76;
    stim[35] = 16'h9a04;
    stim[36] = 16'hed74;
    stim[37] = 16'hacfa;
    stim[38] = 16'haf96;
    stim[39] = 16'h3b4f;
    stim[40] = 16'h594c;
    stim[41] = 16'hd61e;
    stim[42] = 16'hb723;
    stim[43] = 16'hc131;
    stim[44] = 16'hc6c9;
    stim[45] = 16'h256a;
    stim[46] = 16'h64ad;
    stim[47] = 16'h047b;
    stim[48] = 16'hfa63;
    stim[49] = 16'hea10;
    stim[50] = 16'h195c;
    stim[51] = 16'h0108;
    stim[52] = 16'h0e52;
    stim[53] = 16'h3746;
    stim[54] = 16'h7062;
    stim[55] = 16'h8d6a;
    stim[56] = 16'h62a2;
    stim[57] = 16'h3014;
    stim[58] = 16'hb0d7;
    stim[59] = 16'h01ce;
    stim[60] = 16'hf7ea;
    stim[61] = 16'hecf0;
    stim[62] = 16'haaf1;
    stim[63] = 16'h6f88;
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
      expv[0] = 5'h09;
      expv[1] = 5'h18;
      expv[2] = 5'h14;
      expv[3] = 5'h15;
      expv[4] = 5'h1d;
      expv[5] = 5'h08;
      expv[6] = 5'h00;
      expv[7] = 5'h0b;
      expv[8] = 5'h1a;
      expv[9] = 5'h06;
      expv[10] = 5'h1a;
      expv[11] = 5'h12;
      expv[12] = 5'h0e;
      expv[13] = 5'h0a;
      expv[14] = 5'h16;
      expv[15] = 5'h09;
      expv[16] = 5'h1a;
      expv[17] = 5'h08;
      expv[18] = 5'h07;
      expv[19] = 5'h16;
      expv[20] = 5'h05;
      expv[21] = 5'h1d;
      expv[22] = 5'h04;
      expv[23] = 5'h1d;
      expv[24] = 5'h0d;
      expv[25] = 5'h04;
      expv[26] = 5'h17;
      expv[27] = 5'h1c;
      expv[28] = 5'h18;
      expv[29] = 5'h1c;
      expv[30] = 5'h13;
      expv[31] = 5'h19;
      expv[32] = 5'h1e;
      expv[33] = 5'h1e;
      expv[34] = 5'h18;
      expv[35] = 5'h1f;
      expv[36] = 5'h02;
      expv[37] = 5'h1e;
      expv[38] = 5'h10;
      expv[39] = 5'h05;
      expv[40] = 5'h16;
      expv[41] = 5'h07;
      expv[42] = 5'h0d;
      expv[43] = 5'h10;
      expv[44] = 5'h01;
      expv[45] = 5'h0e;
      expv[46] = 5'h1d;
      expv[47] = 5'h11;
      expv[48] = 5'h13;
      expv[49] = 5'h1e;
      expv[50] = 5'h11;
      expv[51] = 5'h11;
      expv[52] = 5'h12;
      expv[53] = 5'h15;
      expv[54] = 5'h13;
      expv[55] = 5'h0a;
      expv[56] = 5'h09;
      expv[57] = 5'h1c;
      expv[58] = 5'h05;
      expv[59] = 5'h06;
      expv[60] = 5'h11;
      expv[61] = 5'h04;
      expv[62] = 5'h1e;
      expv[63] = 5'h1b;
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
