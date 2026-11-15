// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10170 dut (
    .CLK(clk),
    .CE(in_vec[17:17]),
    .process_input(in_vec[16:0]),
    .process_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h13ca2;
    stim[1] = 18'h01c6d;
    stim[2] = 18'h01e05;
    stim[3] = 18'h36558;
    stim[4] = 18'h20106;
    stim[5] = 18'h2f4cc;
    stim[6] = 18'h14105;
    stim[7] = 18'h03adf;
    stim[8] = 18'h1a89c;
    stim[9] = 18'h038aa;
    stim[10] = 18'h3385d;
    stim[11] = 18'h17aac;
    stim[12] = 18'h3577f;
    stim[13] = 18'h310d2;
    stim[14] = 18'h3f1aa;
    stim[15] = 18'h316d9;
    stim[16] = 18'h02f69;
    stim[17] = 18'h1c46c;
    stim[18] = 18'h36515;
    stim[19] = 18'h2f8e2;
    stim[20] = 18'h09785;
    stim[21] = 18'h1c365;
    stim[22] = 18'h2eec3;
    stim[23] = 18'h2c8fd;
    stim[24] = 18'h2f824;
    stim[25] = 18'h3ca17;
    stim[26] = 18'h12a80;
    stim[27] = 18'h3e1fd;
    stim[28] = 18'h0dceb;
    stim[29] = 18'h3811b;
    stim[30] = 18'h2f71a;
    stim[31] = 18'h21d1c;
    stim[32] = 18'h0f49c;
    stim[33] = 18'h0b341;
    stim[34] = 18'h1762f;
    stim[35] = 18'h0b6a2;
    stim[36] = 18'h28468;
    stim[37] = 18'h31503;
    stim[38] = 18'h1c4cd;
    stim[39] = 18'h39040;
    stim[40] = 18'h110b9;
    stim[41] = 18'h1f588;
    stim[42] = 18'h11046;
    stim[43] = 18'h00e83;
    stim[44] = 18'h24518;
    stim[45] = 18'h1265b;
    stim[46] = 18'h3d844;
    stim[47] = 18'h3a2f2;
    stim[48] = 18'h2e58b;
    stim[49] = 18'h0f17b;
    stim[50] = 18'h32448;
    stim[51] = 18'h21807;
    stim[52] = 18'h203df;
    stim[53] = 18'h3df84;
    stim[54] = 18'h1162a;
    stim[55] = 18'h22117;
    stim[56] = 18'h17ac2;
    stim[57] = 18'h3883d;
    stim[58] = 18'h320e3;
    stim[59] = 18'h0819c;
    stim[60] = 18'h1b1c7;
    stim[61] = 18'h26ffa;
    stim[62] = 18'h3bfea;
    stim[63] = 18'h34818;
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
      expv[0] = 16'h3ca3;
      expv[1] = 16'h1c6d;
      expv[2] = 16'h1e05;
      expv[3] = 16'h6559;
      expv[4] = 16'h0106;
      expv[5] = 16'hf4cc;
      expv[6] = 16'h4106;
      expv[7] = 16'h3adf;
      expv[8] = 16'ha89d;
      expv[9] = 16'h38aa;
      expv[10] = 16'h385e;
      expv[11] = 16'h7aad;
      expv[12] = 16'h5780;
      expv[13] = 16'h10d3;
      expv[14] = 16'hf1ab;
      expv[15] = 16'h16da;
      expv[16] = 16'h2f69;
      expv[17] = 16'hc46d;
      expv[18] = 16'h6516;
      expv[19] = 16'hf8e2;
      expv[20] = 16'h9785;
      expv[21] = 16'hc366;
      expv[22] = 16'heec3;
      expv[23] = 16'hc8fd;
      expv[24] = 16'hf824;
      expv[25] = 16'hca18;
      expv[26] = 16'h2a81;
      expv[27] = 16'he1fe;
      expv[28] = 16'hdceb;
      expv[29] = 16'h811c;
      expv[30] = 16'hf71a;
      expv[31] = 16'h1d1c;
      expv[32] = 16'hf49c;
      expv[33] = 16'hb341;
      expv[34] = 16'h7630;
      expv[35] = 16'hb6a2;
      expv[36] = 16'h8468;
      expv[37] = 16'h1504;
      expv[38] = 16'hc4ce;
      expv[39] = 16'h9041;
      expv[40] = 16'h10ba;
      expv[41] = 16'hf589;
      expv[42] = 16'h1047;
      expv[43] = 16'h0e83;
      expv[44] = 16'h4518;
      expv[45] = 16'h265c;
      expv[46] = 16'hd845;
      expv[47] = 16'ha2f3;
      expv[48] = 16'he58b;
      expv[49] = 16'hf17b;
      expv[50] = 16'h2449;
      expv[51] = 16'h1807;
      expv[52] = 16'h03df;
      expv[53] = 16'hdf85;
      expv[54] = 16'h162b;
      expv[55] = 16'h2117;
      expv[56] = 16'h7ac3;
      expv[57] = 16'h883e;
      expv[58] = 16'h20e4;
      expv[59] = 16'h819c;
      expv[60] = 16'hb1c8;
      expv[61] = 16'h6ffa;
      expv[62] = 16'hbfeb;
      expv[63] = 16'h4819;
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
