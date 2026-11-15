// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dpram dut (
    .clock(clk),
    .reset(in_vec[27:27]),
    .enable_a(in_vec[26:26]),
    .write_enable(in_vec[25:25]),
    .write_address(in_vec[24:17]),
    .write_data(in_vec[16:9]),
    .enable_b(in_vec[8:8]),
    .read_address(in_vec[7:0]),
    .read_data_a(out_vec[15:8]),
    .read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h9c7629d;
    stim[1] = 28'hd8dabc0;
    stim[2] = 28'h5d0d3b4;
    stim[3] = 28'h068579d;
    stim[4] = 28'h48f8422;
    stim[5] = 28'h7616648;
    stim[6] = 28'h0e140df;
    stim[7] = 28'h10260dd;
    stim[8] = 28'h77e684b;
    stim[9] = 28'h72a295a;
    stim[10] = 28'h7cbb10a;
    stim[11] = 28'h09cd4f8;
    stim[12] = 28'h7e3dfb4;
    stim[13] = 28'h1aafc84;
    stim[14] = 28'h03486a1;
    stim[15] = 28'h528d48f;
    stim[16] = 28'h28056b0;
    stim[17] = 28'h1d45716;
    stim[18] = 28'h5db50c6;
    stim[19] = 28'h5e93fe8;
    stim[20] = 28'h259af17;
    stim[21] = 28'h26905c2;
    stim[22] = 28'h4334475;
    stim[23] = 28'h0f2303b;
    stim[24] = 28'h1b502f2;
    stim[25] = 28'h158fb07;
    stim[26] = 28'h236f4cd;
    stim[27] = 28'h0b74c82;
    stim[28] = 28'h13a89f7;
    stim[29] = 28'h78545d9;
    stim[30] = 28'h3368a3b;
    stim[31] = 28'h3eaa0d4;
    stim[32] = 28'h7ee79e4;
    stim[33] = 28'h41e951d;
    stim[34] = 28'h4a719ae;
    stim[35] = 28'h7ab2636;
    stim[36] = 28'h3a6bc1b;
    stim[37] = 28'h0a83262;
    stim[38] = 28'h03f46a8;
    stim[39] = 28'h0cc5bb9;
    stim[40] = 28'h1ba5600;
    stim[41] = 28'h249f712;
    stim[42] = 28'hfdbb372;
    stim[43] = 28'h34fffb0;
    stim[44] = 28'h7aa864f;
    stim[45] = 28'ha6f652a;
    stim[46] = 28'h0969513;
    stim[47] = 28'h5358626;
    stim[48] = 28'h3275c68;
    stim[49] = 28'h0a99ddc;
    stim[50] = 28'h6916041;
    stim[51] = 28'h0f5c40e;
    stim[52] = 28'h4caf9a6;
    stim[53] = 28'h29d0107;
    stim[54] = 28'haa51463;
    stim[55] = 28'h660fa10;
    stim[56] = 28'h37a0a21;
    stim[57] = 28'h6de9e91;
    stim[58] = 28'h5f6a25a;
    stim[59] = 28'h438de4a;
    stim[60] = 28'h42c4464;
    stim[61] = 28'h48116ce;
    stim[62] = 28'h4d27775;
    stim[63] = 28'h1675ab1;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'h0000;
      expv[44] = 16'h00b3;
      expv[45] = 16'h93b3;
      expv[46] = 16'h0000;
      expv[47] = 16'h00xx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'h0000;
      expv[56] = 16'hxx00;
      expv[57] = 16'hxx00;
      expv[58] = 16'hxx00;
      expv[59] = 16'hxx00;
      expv[60] = 16'hxx00;
      expv[61] = 16'hxx00;
      expv[62] = 16'hxx00;
      expv[63] = 16'hxxxx;
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
