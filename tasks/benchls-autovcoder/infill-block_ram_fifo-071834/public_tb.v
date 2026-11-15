// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071834 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h27b9d53826;
    stim[1] = 38'h352d53079c;
    stim[2] = 38'h0fe776890a;
    stim[3] = 38'h0ed5e3bd75;
    stim[4] = 38'h01164fadb6;
    stim[5] = 38'h0a64530243;
    stim[6] = 38'h1eca0cc845;
    stim[7] = 38'h1750a62145;
    stim[8] = 38'h0fdd6b7c2f;
    stim[9] = 38'h11db9b0d50;
    stim[10] = 38'h1effac0d36;
    stim[11] = 38'h088b3ec1fc;
    stim[12] = 38'h1440403a15;
    stim[13] = 38'h0555d10857;
    stim[14] = 38'h1fd9c56b9a;
    stim[15] = 38'h0a3a37747e;
    stim[16] = 38'h0a98307aad;
    stim[17] = 38'h17ae29b0bf;
    stim[18] = 38'h110bc56791;
    stim[19] = 38'h1a0512eaac;
    stim[20] = 38'h07a5e89d3b;
    stim[21] = 38'h13103884db;
    stim[22] = 38'h034b2f2ca8;
    stim[23] = 38'h0e86a4103f;
    stim[24] = 38'h1eedcfa94a;
    stim[25] = 38'h1d9973b0af;
    stim[26] = 38'h048f72c62d;
    stim[27] = 38'h1e2d7886e6;
    stim[28] = 38'h192e22e22b;
    stim[29] = 38'h11fe317810;
    stim[30] = 38'h05090dd74b;
    stim[31] = 38'h1be5af0fa7;
    stim[32] = 38'h122e1f8ca3;
    stim[33] = 38'h117b7ac800;
    stim[34] = 38'h082489b006;
    stim[35] = 38'h2877ce6d3a;
    stim[36] = 38'h00ab433c56;
    stim[37] = 38'h1ea5b535a2;
    stim[38] = 38'h08d57e8ba6;
    stim[39] = 38'h160c8d860c;
    stim[40] = 38'h171d51d3c6;
    stim[41] = 38'h1d991aabe4;
    stim[42] = 38'h049eedbc03;
    stim[43] = 38'h16ac6ba117;
    stim[44] = 38'h0f8949532e;
    stim[45] = 38'h0eacfdb9c6;
    stim[46] = 38'h1198d0ce40;
    stim[47] = 38'h0f3008b24f;
    stim[48] = 38'h12d688e366;
    stim[49] = 38'h043137561b;
    stim[50] = 38'h18f2f59028;
    stim[51] = 38'h1d90398d69;
    stim[52] = 38'h1b37c1e365;
    stim[53] = 38'h184e9408f5;
    stim[54] = 38'h3fed85c267;
    stim[55] = 38'h1861fc7db3;
    stim[56] = 38'h357de2a8f2;
    stim[57] = 38'h17f026e9f0;
    stim[58] = 38'h0d114643f3;
    stim[59] = 38'h07116235fe;
    stim[60] = 38'h041a988dd1;
    stim[61] = 38'h0b13393f85;
    stim[62] = 38'h055e5d78d0;
    stim[63] = 38'h1c79a82d4f;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h3b2833211;
      expv[12] = 34'h3b2833211;
      expv[13] = 34'h3b2833211;
      expv[14] = 34'h3b2833211;
      expv[15] = 34'h3b2833211;
      expv[16] = 34'h3b2833211;
      expv[17] = 34'h3b2833211;
      expv[18] = 34'h3bfeb034d;
      expv[19] = 34'h3bfeb034d;
      expv[20] = 34'h3bfeb034d;
      expv[21] = 34'h3bfeb034d;
      expv[22] = 34'h3xxxxxxxx;
      expv[23] = 34'h3xxxxxxxx;
      expv[24] = 34'h3xxxxxxxx;
      expv[25] = 34'h3xxxxxxxx;
      expv[26] = 34'h3bb73ea52;
      expv[27] = 34'h3bb73ea52;
      expv[28] = 34'h3bb73ea52;
      expv[29] = 34'h3665cec2b;
      expv[30] = 34'h3665cec2b;
      expv[31] = 34'h3665cec2b;
      expv[32] = 34'h3xxxxxxxx;
      expv[33] = 34'h2xxxxxxxx;
      expv[34] = 34'h2xxxxxxxx;
      expv[35] = 34'h2xxxxxxxx;
      expv[36] = 34'h200000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h3a96d4d68;
      expv[42] = 34'h3a96d4d68;
      expv[43] = 34'h3a96d4d68;
      expv[44] = 34'h36646aaf9;
      expv[45] = 34'h36646aaf9;
      expv[46] = 34'h36646aaf9;
      expv[47] = 34'h36646aaf9;
      expv[48] = 34'h36646aaf9;
      expv[49] = 34'h36646aaf9;
      expv[50] = 34'h36646aaf9;
      expv[51] = 34'h36646aaf9;
      expv[52] = 34'h36646aaf9;
      expv[53] = 34'h36646aaf9;
      expv[54] = 34'h36646aaf9;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
