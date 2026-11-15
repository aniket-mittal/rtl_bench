// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02007 dut (
    .clk(clk),
    .clk_enable(in_vec[18:18]),
    .reset(in_vec[17:17]),
    .filter_in(in_vec[16:0]),
    .filter_out(out_vec[16:1]),
    .ce_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h3386c;
    stim[1] = 19'h771f7;
    stim[2] = 19'h02228;
    stim[3] = 19'h5e319;
    stim[4] = 19'h5ea72;
    stim[5] = 19'h4d7fb;
    stim[6] = 19'h50948;
    stim[7] = 19'h5cd3f;
    stim[8] = 19'h55361;
    stim[9] = 19'h5958e;
    stim[10] = 19'h17ac2;
    stim[11] = 19'h1573f;
    stim[12] = 19'h4290a;
    stim[13] = 19'h56953;
    stim[14] = 19'h0df24;
    stim[15] = 19'h0c450;
    stim[16] = 19'h1f4a0;
    stim[17] = 19'h0ffcd;
    stim[18] = 19'h0e21c;
    stim[19] = 19'h034be;
    stim[20] = 19'h0f874;
    stim[21] = 19'h48831;
    stim[22] = 19'h5d5b3;
    stim[23] = 19'h085f5;
    stim[24] = 19'h0bec4;
    stim[25] = 19'h1c4ad;
    stim[26] = 19'h5123d;
    stim[27] = 19'h1f47f;
    stim[28] = 19'h1c757;
    stim[29] = 19'h5d50e;
    stim[30] = 19'h0d0cd;
    stim[31] = 19'h4ce67;
    stim[32] = 19'h057c0;
    stim[33] = 19'h4a8c4;
    stim[34] = 19'h1a5dd;
    stim[35] = 19'h51a54;
    stim[36] = 19'h5e894;
    stim[37] = 19'h47ebd;
    stim[38] = 19'h45365;
    stim[39] = 19'h12728;
    stim[40] = 19'h1ebbe;
    stim[41] = 19'h0cfe9;
    stim[42] = 19'h1c77d;
    stim[43] = 19'h522dd;
    stim[44] = 19'h14a8c;
    stim[45] = 19'h147e1;
    stim[46] = 19'h4b0eb;
    stim[47] = 19'h46bc5;
    stim[48] = 19'h51d8c;
    stim[49] = 19'h5929d;
    stim[50] = 19'h57133;
    stim[51] = 19'h449b7;
    stim[52] = 19'h50137;
    stim[53] = 19'h17c96;
    stim[54] = 19'h4c2ca;
    stim[55] = 19'h04771;
    stim[56] = 19'h1f629;
    stim[57] = 19'h54715;
    stim[58] = 19'h1a607;
    stim[59] = 19'h07c17;
    stim[60] = 19'h1e52b;
    stim[61] = 19'h5a95b;
    stim[62] = 19'h06efb;
    stim[63] = 19'h4cd28;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00001;
      expv[5] = 17'h00000;
      expv[6] = 17'h00667;
      expv[7] = 17'h1ce7e;
      expv[8] = 17'h017b3;
      expv[9] = 17'h10000;
      expv[10] = 17'h10000;
      expv[11] = 17'h10000;
      expv[12] = 17'h10001;
      expv[13] = 17'h10000;
      expv[14] = 17'h10000;
      expv[15] = 17'h10000;
      expv[16] = 17'h10000;
      expv[17] = 17'h10000;
      expv[18] = 17'h10000;
      expv[19] = 17'h10000;
      expv[20] = 17'h10000;
      expv[21] = 17'h10001;
      expv[22] = 17'h09178;
      expv[23] = 17'h035d8;
      expv[24] = 17'h035d8;
      expv[25] = 17'h035d8;
      expv[26] = 17'h035d9;
      expv[27] = 17'h0fffe;
      expv[28] = 17'h0fffe;
      expv[29] = 17'h0fffe;
      expv[30] = 17'h0fffe;
      expv[31] = 17'h0ffff;
      expv[32] = 17'h10000;
      expv[33] = 17'h10000;
      expv[34] = 17'h10000;
      expv[35] = 17'h10001;
      expv[36] = 17'h0fffe;
      expv[37] = 17'h0ffff;
      expv[38] = 17'h10000;
      expv[39] = 17'h10000;
      expv[40] = 17'h10000;
      expv[41] = 17'h10000;
      expv[42] = 17'h10000;
      expv[43] = 17'h10001;
      expv[44] = 17'h0fffe;
      expv[45] = 17'h0fffe;
      expv[46] = 17'h0fffe;
      expv[47] = 17'h0ffff;
      expv[48] = 17'h10000;
      expv[49] = 17'h10001;
      expv[50] = 17'h0fffe;
      expv[51] = 17'h0ffff;
      expv[52] = 17'h10000;
      expv[53] = 17'h10000;
      expv[54] = 17'h10001;
      expv[55] = 17'h0c9c2;
      expv[56] = 17'h0c9c2;
      expv[57] = 17'h0c9c2;
      expv[58] = 17'h06f82;
      expv[59] = 17'h06f82;
      expv[60] = 17'h06f82;
      expv[61] = 17'h06f83;
      expv[62] = 17'h0fffe;
      expv[63] = 17'h0fffe;
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
