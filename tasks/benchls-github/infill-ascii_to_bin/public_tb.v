// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ascii_to_bin dut (
    .in(in_vec[7:0]),
    .out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb8;
    stim[1] = 8'h07;
    stim[2] = 8'he7;
    stim[3] = 8'h48;
    stim[4] = 8'h99;
    stim[5] = 8'h1a;
    stim[6] = 8'hd9;
    stim[7] = 8'h1d;
    stim[8] = 8'hf2;
    stim[9] = 8'hcb;
    stim[10] = 8'h0a;
    stim[11] = 8'he6;
    stim[12] = 8'h41;
    stim[13] = 8'h29;
    stim[14] = 8'h26;
    stim[15] = 8'he4;
    stim[16] = 8'h18;
    stim[17] = 8'hb4;
    stim[18] = 8'h0a;
    stim[19] = 8'hcd;
    stim[20] = 8'ha2;
    stim[21] = 8'hc3;
    stim[22] = 8'h46;
    stim[23] = 8'h94;
    stim[24] = 8'h0c;
    stim[25] = 8'h4e;
    stim[26] = 8'hd7;
    stim[27] = 8'he4;
    stim[28] = 8'h64;
    stim[29] = 8'h4b;
    stim[30] = 8'h0e;
    stim[31] = 8'ha8;
    stim[32] = 8'h84;
    stim[33] = 8'ha4;
    stim[34] = 8'h3c;
    stim[35] = 8'h20;
    stim[36] = 8'hb5;
    stim[37] = 8'h73;
    stim[38] = 8'hb9;
    stim[39] = 8'h0f;
    stim[40] = 8'hd2;
    stim[41] = 8'h25;
    stim[42] = 8'h7d;
    stim[43] = 8'h0a;
    stim[44] = 8'hc1;
    stim[45] = 8'hd2;
    stim[46] = 8'hc7;
    stim[47] = 8'h19;
    stim[48] = 8'ha6;
    stim[49] = 8'hd4;
    stim[50] = 8'he4;
    stim[51] = 8'h5b;
    stim[52] = 8'hb2;
    stim[53] = 8'h54;
    stim[54] = 8'hdf;
    stim[55] = 8'h7c;
    stim[56] = 8'ha1;
    stim[57] = 8'h01;
    stim[58] = 8'h6c;
    stim[59] = 8'hf4;
    stim[60] = 8'h49;
    stim[61] = 8'hff;
    stim[62] = 8'hae;
    stim[63] = 8'h0e;
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
      expv[0] = 6'h3d;
      expv[1] = 6'h19;
      expv[2] = 6'h2c;
      expv[3] = 6'h13;
      expv[4] = 6'h1e;
      expv[5] = 6'h2c;
      expv[6] = 6'h1e;
      expv[7] = 6'h2f;
      expv[8] = 6'h37;
      expv[9] = 6'h10;
      expv[10] = 6'h1c;
      expv[11] = 6'h2b;
      expv[12] = 6'h0c;
      expv[13] = 6'h3b;
      expv[14] = 6'h38;
      expv[15] = 6'h29;
      expv[16] = 6'h2a;
      expv[17] = 6'h39;
      expv[18] = 6'h1c;
      expv[19] = 6'h12;
      expv[20] = 6'h27;
      expv[21] = 6'h08;
      expv[22] = 6'h11;
      expv[23] = 6'h19;
      expv[24] = 6'h1e;
      expv[25] = 6'h19;
      expv[26] = 6'h1c;
      expv[27] = 6'h29;
      expv[28] = 6'h29;
      expv[29] = 6'h16;
      expv[30] = 6'h20;
      expv[31] = 6'h2d;
      expv[32] = 6'h09;
      expv[33] = 6'h29;
      expv[34] = 6'h0e;
      expv[35] = 6'h32;
      expv[36] = 6'h3a;
      expv[37] = 6'h38;
      expv[38] = 6'h3e;
      expv[39] = 6'h21;
      expv[40] = 6'h17;
      expv[41] = 6'h37;
      expv[42] = 6'h02;
      expv[43] = 6'h1c;
      expv[44] = 6'h06;
      expv[45] = 6'h17;
      expv[46] = 6'h0c;
      expv[47] = 6'h2b;
      expv[48] = 6'h2b;
      expv[49] = 6'h19;
      expv[50] = 6'h29;
      expv[51] = 6'h26;
      expv[52] = 6'h37;
      expv[53] = 6'h1f;
      expv[54] = 6'h24;
      expv[55] = 6'h01;
      expv[56] = 6'h26;
      expv[57] = 6'h13;
      expv[58] = 6'h31;
      expv[59] = 6'h39;
      expv[60] = 6'h14;
      expv[61] = 6'h04;
      expv[62] = 6'h33;
      expv[63] = 6'h20;
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
