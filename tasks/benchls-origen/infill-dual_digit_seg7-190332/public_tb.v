// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190332 dut (
    .number(in_vec[7:0]),
    .hex0(out_vec[13:7]),
    .hex1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h17;
    stim[1] = 8'h81;
    stim[2] = 8'hf8;
    stim[3] = 8'h19;
    stim[4] = 8'hc6;
    stim[5] = 8'h26;
    stim[6] = 8'hb5;
    stim[7] = 8'h75;
    stim[8] = 8'h0a;
    stim[9] = 8'h41;
    stim[10] = 8'h81;
    stim[11] = 8'he2;
    stim[12] = 8'hf0;
    stim[13] = 8'hd4;
    stim[14] = 8'he3;
    stim[15] = 8'hdc;
    stim[16] = 8'h67;
    stim[17] = 8'hfe;
    stim[18] = 8'haa;
    stim[19] = 8'he9;
    stim[20] = 8'h79;
    stim[21] = 8'h9e;
    stim[22] = 8'h69;
    stim[23] = 8'h39;
    stim[24] = 8'h42;
    stim[25] = 8'h00;
    stim[26] = 8'h48;
    stim[27] = 8'h13;
    stim[28] = 8'h87;
    stim[29] = 8'he7;
    stim[30] = 8'he9;
    stim[31] = 8'he7;
    stim[32] = 8'h37;
    stim[33] = 8'h0e;
    stim[34] = 8'h88;
    stim[35] = 8'h5c;
    stim[36] = 8'hbb;
    stim[37] = 8'h0b;
    stim[38] = 8'h6c;
    stim[39] = 8'hd7;
    stim[40] = 8'h9e;
    stim[41] = 8'h5b;
    stim[42] = 8'ha0;
    stim[43] = 8'hef;
    stim[44] = 8'h62;
    stim[45] = 8'h6b;
    stim[46] = 8'h17;
    stim[47] = 8'h0c;
    stim[48] = 8'h27;
    stim[49] = 8'h94;
    stim[50] = 8'hd3;
    stim[51] = 8'h86;
    stim[52] = 8'hfa;
    stim[53] = 8'hec;
    stim[54] = 8'hf3;
    stim[55] = 8'h36;
    stim[56] = 8'h82;
    stim[57] = 8'hbd;
    stim[58] = 8'h99;
    stim[59] = 8'h9c;
    stim[60] = 8'h05;
    stim[61] = 8'heb;
    stim[62] = 8'h64;
    stim[63] = 8'h8f;
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
      expv[0] = 14'h1824;
      expv[1] = 14'h0840;
      expv[2] = 14'h0040;
      expv[3] = 14'h0924;
      expv[4] = 14'h0040;
      expv[5] = 14'h0030;
      expv[6] = 14'h3cc0;
      expv[7] = 14'h3c40;
      expv[8] = 14'h2079;
      expv[9] = 14'h0902;
      expv[10] = 14'h0840;
      expv[11] = 14'h0140;
      expv[12] = 14'h2040;
      expv[13] = 14'h1240;
      expv[14] = 14'h3c40;
      expv[15] = 14'h2040;
      expv[16] = 14'h1840;
      expv[17] = 14'h0cc0;
      expv[18] = 14'h2040;
      expv[19] = 14'h1840;
      expv[20] = 14'h3cc0;
      expv[21] = 14'h0040;
      expv[22] = 14'h0940;
      expv[23] = 14'h3c12;
      expv[24] = 14'h0102;
      expv[25] = 14'h2040;
      expv[26] = 14'h1278;
      expv[27] = 14'h0879;
      expv[28] = 14'h0940;
      expv[29] = 14'h3cc0;
      expv[30] = 14'h1840;
      expv[31] = 14'h3cc0;
      expv[32] = 14'h0912;
      expv[33] = 14'h0cf9;
      expv[34] = 14'h0140;
      expv[35] = 14'h1210;
      expv[36] = 14'h3c40;
      expv[37] = 14'h3cf9;
      expv[38] = 14'h0040;
      expv[39] = 14'h0940;
      expv[40] = 14'h0040;
      expv[41] = 14'h3c90;
      expv[42] = 14'h2040;
      expv[43] = 14'h0840;
      expv[44] = 14'h0010;
      expv[45] = 14'h3c40;
      expv[46] = 14'h1824;
      expv[47] = 14'h1279;
      expv[48] = 14'h0830;
      expv[49] = 14'h0040;
      expv[50] = 14'h3cc0;
      expv[51] = 14'h0cc0;
      expv[52] = 14'h2040;
      expv[53] = 14'h0140;
      expv[54] = 14'h1840;
      expv[55] = 14'h0c92;
      expv[56] = 14'h2040;
      expv[57] = 14'h0840;
      expv[58] = 14'h1840;
      expv[59] = 14'h0140;
      expv[60] = 14'h0940;
      expv[61] = 14'h0940;
      expv[62] = 14'h2040;
      expv[63] = 14'h1840;
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
