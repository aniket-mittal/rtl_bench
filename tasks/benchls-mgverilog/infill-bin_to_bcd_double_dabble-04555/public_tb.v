// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04555 dut (
    .clk(clk),
    .trigger(in_vec[32:32]),
    .in(in_vec[31:0]),
    .idle(out_vec[32:32]),
    .bcd(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0305b9111;
    stim[1] = 33'h06d976d8e;
    stim[2] = 33'h000905ead;
    stim[3] = 33'h1e86c839b;
    stim[4] = 33'h0aa228552;
    stim[5] = 33'h1c603975f;
    stim[6] = 33'h1570aa659;
    stim[7] = 33'h13bd562af;
    stim[8] = 33'h036cc8746;
    stim[9] = 33'h1bc000d85;
    stim[10] = 33'h0b4321d36;
    stim[11] = 33'h01d16e1ac;
    stim[12] = 33'h0e52afacf;
    stim[13] = 33'h0991bf0a2;
    stim[14] = 33'h1d7e63921;
    stim[15] = 33'h04d0e12e3;
    stim[16] = 33'h0bdbc0371;
    stim[17] = 33'h180a057d0;
    stim[18] = 33'h004d87bb2;
    stim[19] = 33'h0fe8babc0;
    stim[20] = 33'h1a4671b97;
    stim[21] = 33'h0909b932b;
    stim[22] = 33'h0796d4f1d;
    stim[23] = 33'h1e861e3b8;
    stim[24] = 33'h0405bb950;
    stim[25] = 33'h11c4d85ea;
    stim[26] = 33'h131bbdce7;
    stim[27] = 33'h0a694f311;
    stim[28] = 33'h03e885c5c;
    stim[29] = 33'h1c6016a4e;
    stim[30] = 33'h1076908f4;
    stim[31] = 33'h16bcf8331;
    stim[32] = 33'h09b1e3328;
    stim[33] = 33'h0d31cd5ba;
    stim[34] = 33'h05af7d2fe;
    stim[35] = 33'h01a64ba17;
    stim[36] = 33'h15a4f84a8;
    stim[37] = 33'h11e2af984;
    stim[38] = 33'h1e3f54098;
    stim[39] = 33'h0bba6dfa1;
    stim[40] = 33'h00a5fbcb2;
    stim[41] = 33'h04afc5403;
    stim[42] = 33'h0d13d5e5a;
    stim[43] = 33'h1d4ff3242;
    stim[44] = 33'h176bb1a22;
    stim[45] = 33'h08fb944f5;
    stim[46] = 33'h076a9265c;
    stim[47] = 33'h1e025b044;
    stim[48] = 33'h00c58eda9;
    stim[49] = 33'h0901da7cf;
    stim[50] = 33'h011c8e25d;
    stim[51] = 33'h0a382599f;
    stim[52] = 33'h0e8998fc9;
    stim[53] = 33'h066fbe677;
    stim[54] = 33'h03ab092bb;
    stim[55] = 33'h1e510ddde;
    stim[56] = 33'h136ced7d5;
    stim[57] = 33'h17e11f954;
    stim[58] = 33'h15d9d3edc;
    stim[59] = 33'h0ee0f2d12;
    stim[60] = 33'h0ef49b9c8;
    stim[61] = 33'h1c1adff30;
    stim[62] = 33'h1c145c3b7;
    stim[63] = 33'h0c5f6bebe;
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
      expv[0] = 33'h0xxxxxxxx;
      expv[1] = 33'h1xxxxxxxx;
      expv[2] = 33'h1xxxxxxxx;
      expv[3] = 33'h1xxxxxxxx;
      expv[4] = 33'h0xxxxxxxx;
      expv[5] = 33'h0xxxxxxxx;
      expv[6] = 33'h0xxxxxxxx;
      expv[7] = 33'h0xxxxxxxx;
      expv[8] = 33'h0xxxxxxxx;
      expv[9] = 33'h0xxxxxxxx;
      expv[10] = 33'h0xxxxxxxx;
      expv[11] = 33'h0xxxxxxxx;
      expv[12] = 33'h0xxxxxxxx;
      expv[13] = 33'h0xxxxxxxx;
      expv[14] = 33'h0xxxxxxxx;
      expv[15] = 33'h0xxxxxxxx;
      expv[16] = 33'h0xxxxxxxx;
      expv[17] = 33'h0xxxxxxxx;
      expv[18] = 33'h0xxxxxxxx;
      expv[19] = 33'h0xxxxxxxx;
      expv[20] = 33'h0xxxxxxxx;
      expv[21] = 33'h0xxxxxxxx;
      expv[22] = 33'h0xxxxxxxx;
      expv[23] = 33'h0xxxxxxxx;
      expv[24] = 33'h0xxxxxxxx;
      expv[25] = 33'h0xxxxxxxx;
      expv[26] = 33'h0xxxxxxxx;
      expv[27] = 33'h0xxxxxxxx;
      expv[28] = 33'h0xxxxxxxx;
      expv[29] = 33'h0xxxxxxxx;
      expv[30] = 33'h0xxxxxxxx;
      expv[31] = 33'h0xxxxxxxx;
      expv[32] = 33'h0xxxxxxxx;
      expv[33] = 33'h0xxxxxxxx;
      expv[34] = 33'h0xxxxxxxx;
      expv[35] = 33'h0xxxxxxxx;
      expv[36] = 33'h0xxxxxxxx;
      expv[37] = 33'h0xxxxxxxx;
      expv[38] = 33'h0xxxxxxxx;
      expv[39] = 33'h0xxxxxxxx;
      expv[40] = 33'h0xxxxxxxx;
      expv[41] = 33'h0xxxxxxxx;
      expv[42] = 33'h0xxxxxxxx;
      expv[43] = 33'h0xxxxxxxx;
      expv[44] = 33'h0xxxxxxxx;
      expv[45] = 33'h0xxxxxxxx;
      expv[46] = 33'h0xxxxxxxx;
      expv[47] = 33'h0xxxxxxxx;
      expv[48] = 33'h0xxxxxxxx;
      expv[49] = 33'h0xxxxxxxx;
      expv[50] = 33'h0xxxxxxxx;
      expv[51] = 33'h0xxxxxxxx;
      expv[52] = 33'h0xxxxxxxx;
      expv[53] = 33'h0xxxxxxxx;
      expv[54] = 33'h0xxxxxxxx;
      expv[55] = 33'h0xxxxxxxx;
      expv[56] = 33'h0xxxxxxxx;
      expv[57] = 33'h0xxxxxxxx;
      expv[58] = 33'h0xxxxxxxx;
      expv[59] = 33'h0xxxxxxxx;
      expv[60] = 33'h0xxxxxxxx;
      expv[61] = 33'h0xxxxxxxx;
      expv[62] = 33'h0xxxxxxxx;
      expv[63] = 33'h0xxxxxxxx;
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
