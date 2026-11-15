// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02886 dut (
    .rx_clk(clk),
    .rx_sof(in_vec[43:40]),
    .rx_eof(in_vec[39:36]),
    .rx_ferr(in_vec[35:32]),
    .rx_fdata(in_vec[31:0]),
    .rx_err(out_vec[32:32]),
    .rx_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h2c73ca65ca2;
    stim[1] = 44'hcaccb84123d;
    stim[2] = 44'h2a914b261da;
    stim[3] = 44'h7fbdfc74e8d;
    stim[4] = 44'h349e7e64d8b;
    stim[5] = 44'hbd8f0b89c9e;
    stim[6] = 44'hb8be1092e44;
    stim[7] = 44'hd2bcbbee09a;
    stim[8] = 44'hfd81fc2a974;
    stim[9] = 44'h41f86ad2ef4;
    stim[10] = 44'h22bfc381f6e;
    stim[11] = 44'h420ff3e9520;
    stim[12] = 44'hfdde9243b3c;
    stim[13] = 44'h1d992e18d1c;
    stim[14] = 44'h4aedd53fe0d;
    stim[15] = 44'h10c2cee6e98;
    stim[16] = 44'h9c2700a19f9;
    stim[17] = 44'h88dad07b14b;
    stim[18] = 44'he78afc827b3;
    stim[19] = 44'ha12f79bf412;
    stim[20] = 44'hd5d95253476;
    stim[21] = 44'ha9637e7aea9;
    stim[22] = 44'hb7f08b30719;
    stim[23] = 44'hde62dbc2d2b;
    stim[24] = 44'hd7b4af98f2e;
    stim[25] = 44'h8f2003933f3;
    stim[26] = 44'he809d1a5343;
    stim[27] = 44'h9a074a95766;
    stim[28] = 44'he69984ef1d9;
    stim[29] = 44'h0e33d7cde64;
    stim[30] = 44'h4613eeada57;
    stim[31] = 44'h5ce453793df;
    stim[32] = 44'hf378aa1bfb0;
    stim[33] = 44'hea8b1ecdd24;
    stim[34] = 44'h6b2b0e80692;
    stim[35] = 44'h1f384f75e81;
    stim[36] = 44'h5876231d96d;
    stim[37] = 44'h1bd1dcdc2d2;
    stim[38] = 44'ha830c200f8f;
    stim[39] = 44'hc64c3954b8f;
    stim[40] = 44'hc43e39b8f86;
    stim[41] = 44'h7f412aa43e5;
    stim[42] = 44'hfb805a1e17f;
    stim[43] = 44'h4fdd53f9994;
    stim[44] = 44'h0b3be49e6d4;
    stim[45] = 44'h08af160f64e;
    stim[46] = 44'h0377c8c9dec;
    stim[47] = 44'hf58eac39178;
    stim[48] = 44'h6017f51ec5f;
    stim[49] = 44'h63eda8bc8ce;
    stim[50] = 44'hafc5b52bafe;
    stim[51] = 44'h5da3fadf609;
    stim[52] = 44'hf77edbfe7f4;
    stim[53] = 44'h517f1f65f85;
    stim[54] = 44'h0bb595dc996;
    stim[55] = 44'hfb6446b9a82;
    stim[56] = 44'h78caa37f9c4;
    stim[57] = 44'hf6b7fae47a9;
    stim[58] = 44'h46722a3cec4;
    stim[59] = 44'hb1eb50baf4a;
    stim[60] = 44'h823e48089fb;
    stim[61] = 44'h7aeeaa77827;
    stim[62] = 44'h8cf88e88d2d;
    stim[63] = 44'h511675b7091;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h10000ffff;
      expv[2] = 33'h10000ffff;
      expv[3] = 33'h10000ffff;
      expv[4] = 33'h10000ffff;
      expv[5] = 33'h10000ffff;
      expv[6] = 33'h10000ffff;
      expv[7] = 33'h10000ffff;
      expv[8] = 33'h10000ffff;
      expv[9] = 33'h11fc2a974;
      expv[10] = 33'h10000ffff;
      expv[11] = 33'h10000ffff;
      expv[12] = 33'h10000ffff;
      expv[13] = 33'h1e9243b3c;
      expv[14] = 33'h10000ffff;
      expv[15] = 33'h10000ffff;
      expv[16] = 33'h10000ffff;
      expv[17] = 33'h10000ffff;
      expv[18] = 33'h10000ffff;
      expv[19] = 33'h10000ffff;
      expv[20] = 33'h10000ffff;
      expv[21] = 33'h10000ffff;
      expv[22] = 33'h10000ffff;
      expv[23] = 33'h10000ffff;
      expv[24] = 33'h10000ffff;
      expv[25] = 33'h10000ffff;
      expv[26] = 33'h10000ffff;
      expv[27] = 33'h10000ffff;
      expv[28] = 33'h10000ffff;
      expv[29] = 33'h10000ffff;
      expv[30] = 33'h10000ffff;
      expv[31] = 33'h10000ffff;
      expv[32] = 33'h10000ffff;
      expv[33] = 33'h18aa1bfb0;
      expv[34] = 33'h10000ffff;
      expv[35] = 33'h10000ffff;
      expv[36] = 33'h10000ffff;
      expv[37] = 33'h10000ffff;
      expv[38] = 33'h10000ffff;
      expv[39] = 33'h10000ffff;
      expv[40] = 33'h10000ffff;
      expv[41] = 33'h10000ffff;
      expv[42] = 33'h10000ffff;
      expv[43] = 33'h105a1e17f;
      expv[44] = 33'h10000ffff;
      expv[45] = 33'h10000ffff;
      expv[46] = 33'h10000ffff;
      expv[47] = 33'h10000ffff;
      expv[48] = 33'h1eac39178;
      expv[49] = 33'h10000ffff;
      expv[50] = 33'h10000ffff;
      expv[51] = 33'h10000ffff;
      expv[52] = 33'h10000ffff;
      expv[53] = 33'h1edbfe7f4;
      expv[54] = 33'h10000ffff;
      expv[55] = 33'h10000ffff;
      expv[56] = 33'h1446b9a82;
      expv[57] = 33'h10000ffff;
      expv[58] = 33'h17fae47a9;
      expv[59] = 33'h10000ffff;
      expv[60] = 33'h10000ffff;
      expv[61] = 33'h10000ffff;
      expv[62] = 33'h10000ffff;
      expv[63] = 33'h10000ffff;
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
