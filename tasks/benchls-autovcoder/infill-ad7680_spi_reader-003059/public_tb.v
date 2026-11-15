// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003059 dut (
    .dataclk(clk),
    .reset(in_vec[39:39]),
    .main_state(in_vec[38:7]),
    .channel(in_vec[6:1]),
    .ADC_DOUT(in_vec[0:0]),
    .ADC_CS(out_vec[17:17]),
    .ADC_SCLK(out_vec[16:16]),
    .ADC_register(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hf3da900008;
    stim[1] = 40'ha3a20fe9d0;
    stim[2] = 40'h550a315fa0;
    stim[3] = 40'h2eebdda4ef;
    stim[4] = 40'h6e99b9916d;
    stim[5] = 40'h08507f0c46;
    stim[6] = 40'h72511de25f;
    stim[7] = 40'h38f02ddfa6;
    stim[8] = 40'h1e5adbaf68;
    stim[9] = 40'h71b1d51e7d;
    stim[10] = 40'h67153be8e9;
    stim[11] = 40'h182809ee7d;
    stim[12] = 40'h38af3d7c72;
    stim[13] = 40'h0a735b3191;
    stim[14] = 40'h06424a5446;
    stim[15] = 40'h63f6f3ca20;
    stim[16] = 40'h01cf661442;
    stim[17] = 40'h3f22c052ca;
    stim[18] = 40'h5e4be9e9ee;
    stim[19] = 40'h3b209808d2;
    stim[20] = 40'h40f049a4c9;
    stim[21] = 40'h2801fb9689;
    stim[22] = 40'hbf862f483d;
    stim[23] = 40'h731e6fb9bc;
    stim[24] = 40'h48d964d25a;
    stim[25] = 40'h68797965c9;
    stim[26] = 40'h6a3331ba4b;
    stim[27] = 40'h1b27aa6e00;
    stim[28] = 40'h021fe41f5c;
    stim[29] = 40'h52cc722a34;
    stim[30] = 40'h36dfb747e7;
    stim[31] = 40'h6b2e1a015b;
    stim[32] = 40'h4f9ec22cb6;
    stim[33] = 40'h5a9e68110d;
    stim[34] = 40'h14dc08606a;
    stim[35] = 40'h69537d8ece;
    stim[36] = 40'h0288e1a107;
    stim[37] = 40'h5cc21d5769;
    stim[38] = 40'h3d26c28b6a;
    stim[39] = 40'h1750b3a56a;
    stim[40] = 40'h629f2fda1c;
    stim[41] = 40'h1f7168b865;
    stim[42] = 40'h223ea8a35c;
    stim[43] = 40'h1b6362e7f3;
    stim[44] = 40'h65a37980b0;
    stim[45] = 40'h7ffc616411;
    stim[46] = 40'h19bd746af5;
    stim[47] = 40'h2f26ac9448;
    stim[48] = 40'h7c412acccf;
    stim[49] = 40'h6aac498903;
    stim[50] = 40'h7b1ddde1fc;
    stim[51] = 40'h458e4a43bf;
    stim[52] = 40'h6f733d43e9;
    stim[53] = 40'h34839895de;
    stim[54] = 40'h05d06c95ed;
    stim[55] = 40'h49e4042024;
    stim[56] = 40'h52ef502bc6;
    stim[57] = 40'h621909461b;
    stim[58] = 40'h2293d0dc1f;
    stim[59] = 40'h16e7824d13;
    stim[60] = 40'h73c3749469;
    stim[61] = 40'h1fb42b6866;
    stim[62] = 40'h1497eb0b6e;
    stim[63] = 40'h4b9c3f844d;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h3xxxx;
      expv[2] = 18'h3xxxx;
      expv[3] = 18'h3xxxx;
      expv[4] = 18'h3xxxx;
      expv[5] = 18'h3xxxx;
      expv[6] = 18'h3xxxx;
      expv[7] = 18'h3xxxx;
      expv[8] = 18'h3xxxx;
      expv[9] = 18'h3xxxx;
      expv[10] = 18'h3xxxx;
      expv[11] = 18'h3xxxx;
      expv[12] = 18'h3xxxx;
      expv[13] = 18'h3xxxx;
      expv[14] = 18'h3xxxx;
      expv[15] = 18'h3xxxx;
      expv[16] = 18'h3xxxx;
      expv[17] = 18'h3xxxx;
      expv[18] = 18'h3xxxx;
      expv[19] = 18'h3xxxx;
      expv[20] = 18'h3xxxx;
      expv[21] = 18'h3xxxx;
      expv[22] = 18'h3xxxx;
      expv[23] = 18'h3xxxx;
      expv[24] = 18'h3xxxx;
      expv[25] = 18'h3xxxx;
      expv[26] = 18'h3xxxx;
      expv[27] = 18'h3xxxx;
      expv[28] = 18'h3xxxx;
      expv[29] = 18'h3xxxx;
      expv[30] = 18'h3xxxx;
      expv[31] = 18'h3xxxx;
      expv[32] = 18'h3xxxx;
      expv[33] = 18'h3xxxx;
      expv[34] = 18'h3xxxx;
      expv[35] = 18'h3xxxx;
      expv[36] = 18'h3xxxx;
      expv[37] = 18'h3xxxx;
      expv[38] = 18'h3xxxx;
      expv[39] = 18'h3xxxx;
      expv[40] = 18'h3xxxx;
      expv[41] = 18'h3xxxx;
      expv[42] = 18'h3xxxx;
      expv[43] = 18'h3xxxx;
      expv[44] = 18'h3xxxx;
      expv[45] = 18'h3xxxx;
      expv[46] = 18'h3xxxx;
      expv[47] = 18'h3xxxx;
      expv[48] = 18'h3xxxx;
      expv[49] = 18'h3xxxx;
      expv[50] = 18'h3xxxx;
      expv[51] = 18'h3xxxx;
      expv[52] = 18'h3xxxx;
      expv[53] = 18'h3xxxx;
      expv[54] = 18'h3xxxx;
      expv[55] = 18'h3xxxx;
      expv[56] = 18'h3xxxx;
      expv[57] = 18'h3xxxx;
      expv[58] = 18'h3xxxx;
      expv[59] = 18'h3xxxx;
      expv[60] = 18'h3xxxx;
      expv[61] = 18'h3xxxx;
      expv[62] = 18'h3xxxx;
      expv[63] = 18'h3xxxx;
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
