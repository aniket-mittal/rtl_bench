// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  single_port_ram dut (
    .clk(clk),
    .data(in_vec[14:7]),
    .addr(in_vec[6:1]),
    .we(in_vec[0:0]),
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
    stim[0] = 15'h7648;
    stim[1] = 15'h3fad;
    stim[2] = 15'h2523;
    stim[3] = 15'h2095;
    stim[4] = 15'h4a90;
    stim[5] = 15'h7c68;
    stim[6] = 15'h516f;
    stim[7] = 15'h1abe;
    stim[8] = 15'h2fde;
    stim[9] = 15'h739f;
    stim[10] = 15'h586a;
    stim[11] = 15'h04fc;
    stim[12] = 15'h2106;
    stim[13] = 15'h4863;
    stim[14] = 15'h00ac;
    stim[15] = 15'h2be3;
    stim[16] = 15'h494b;
    stim[17] = 15'h308c;
    stim[18] = 15'h1e06;
    stim[19] = 15'h192f;
    stim[20] = 15'h29f7;
    stim[21] = 15'h57bf;
    stim[22] = 15'h24b2;
    stim[23] = 15'h36a9;
    stim[24] = 15'h765a;
    stim[25] = 15'h5d8f;
    stim[26] = 15'h6228;
    stim[27] = 15'h3528;
    stim[28] = 15'h6f8f;
    stim[29] = 15'h71fa;
    stim[30] = 15'h2810;
    stim[31] = 15'h5ded;
    stim[32] = 15'h1486;
    stim[33] = 15'h3715;
    stim[34] = 15'h25d9;
    stim[35] = 15'h329e;
    stim[36] = 15'h5ddc;
    stim[37] = 15'h74fc;
    stim[38] = 15'h3e6c;
    stim[39] = 15'h6a41;
    stim[40] = 15'h658d;
    stim[41] = 15'h4032;
    stim[42] = 15'h4f8b;
    stim[43] = 15'h0799;
    stim[44] = 15'h3a89;
    stim[45] = 15'h246a;
    stim[46] = 15'h1845;
    stim[47] = 15'h05ae;
    stim[48] = 15'h06e9;
    stim[49] = 15'h1f6e;
    stim[50] = 15'h184f;
    stim[51] = 15'h0667;
    stim[52] = 15'h26f3;
    stim[53] = 15'h573a;
    stim[54] = 15'h1d5d;
    stim[55] = 15'h7dd6;
    stim[56] = 15'h6ce3;
    stim[57] = 15'h1104;
    stim[58] = 15'h7ed2;
    stim[59] = 15'h71cf;
    stim[60] = 15'h550d;
    stim[61] = 15'h3e35;
    stim[62] = 15'h65b2;
    stim[63] = 15'h0c2c;
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
      expv[2] = 8'h7f;
      expv[3] = 8'h4a;
      expv[4] = 8'h41;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'ha2;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'he7;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'h90;
      expv[15] = 8'h7f;
      expv[16] = 8'h57;
      expv[17] = 8'h92;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'h32;
      expv[21] = 8'h53;
      expv[22] = 8'haf;
      expv[23] = 8'hxx;
      expv[24] = 8'h6d;
      expv[25] = 8'hxx;
      expv[26] = 8'hbb;
      expv[27] = 8'h6d;
      expv[28] = 8'h6d;
      expv[29] = 8'hdf;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hbb;
      expv[33] = 8'hxx;
      expv[34] = 8'h6e;
      expv[35] = 8'h4b;
      expv[36] = 8'he7;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hbb;
      expv[40] = 8'hd4;
      expv[41] = 8'hcb;
      expv[42] = 8'hxx;
      expv[43] = 8'h9f;
      expv[44] = 8'h0f;
      expv[45] = 8'h75;
      expv[46] = 8'hxx;
      expv[47] = 8'h30;
      expv[48] = 8'h32;
      expv[49] = 8'h0d;
      expv[50] = 8'ha2;
      expv[51] = 8'h30;
      expv[52] = 8'h0c;
      expv[53] = 8'h4d;
      expv[54] = 8'hxx;
      expv[55] = 8'h3a;
      expv[56] = 8'hxx;
      expv[57] = 8'hd9;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'he3;
      expv[61] = 8'haa;
      expv[62] = 8'h7c;
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
