// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072182 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
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
    stim[0] = 12'hf5c;
    stim[1] = 12'hbfe;
    stim[2] = 12'h576;
    stim[3] = 12'h449;
    stim[4] = 12'h273;
    stim[5] = 12'h2e5;
    stim[6] = 12'h303;
    stim[7] = 12'h195;
    stim[8] = 12'h540;
    stim[9] = 12'h430;
    stim[10] = 12'h7cb;
    stim[11] = 12'h644;
    stim[12] = 12'h52d;
    stim[13] = 12'h032;
    stim[14] = 12'h7ca;
    stim[15] = 12'h71a;
    stim[16] = 12'h1c1;
    stim[17] = 12'h23c;
    stim[18] = 12'h0a2;
    stim[19] = 12'h1d8;
    stim[20] = 12'h0a8;
    stim[21] = 12'h27e;
    stim[22] = 12'h5b0;
    stim[23] = 12'h33f;
    stim[24] = 12'h25e;
    stim[25] = 12'h0f2;
    stim[26] = 12'h47b;
    stim[27] = 12'h517;
    stim[28] = 12'h532;
    stim[29] = 12'h5b8;
    stim[30] = 12'h0bd;
    stim[31] = 12'h397;
    stim[32] = 12'h545;
    stim[33] = 12'h5eb;
    stim[34] = 12'h3cc;
    stim[35] = 12'h023;
    stim[36] = 12'h582;
    stim[37] = 12'h26e;
    stim[38] = 12'h044;
    stim[39] = 12'h62d;
    stim[40] = 12'h0f2;
    stim[41] = 12'h77f;
    stim[42] = 12'h3f7;
    stim[43] = 12'h6e4;
    stim[44] = 12'h454;
    stim[45] = 12'h5a4;
    stim[46] = 12'h39b;
    stim[47] = 12'h1c5;
    stim[48] = 12'h717;
    stim[49] = 12'h525;
    stim[50] = 12'h1a0;
    stim[51] = 12'h2d6;
    stim[52] = 12'h000;
    stim[53] = 12'h2a9;
    stim[54] = 12'h3ca;
    stim[55] = 12'h0e9;
    stim[56] = 12'h698;
    stim[57] = 12'h174;
    stim[58] = 12'h70e;
    stim[59] = 12'h5fd;
    stim[60] = 12'h7f7;
    stim[61] = 12'h593;
    stim[62] = 12'h4f8;
    stim[63] = 12'h76b;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h376;
      expv[5] = 10'h376;
      expv[6] = 10'h376;
      expv[7] = 10'h376;
      expv[8] = 10'h376;
      expv[9] = 10'h376;
      expv[10] = 10'h376;
      expv[11] = 10'h340;
      expv[12] = 10'h3cb;
      expv[13] = 10'h3cb;
      expv[14] = 10'h3cb;
      expv[15] = 10'h32d;
      expv[16] = 10'h3ca;
      expv[17] = 10'h3ca;
      expv[18] = 10'h3ca;
      expv[19] = 10'h3ca;
      expv[20] = 10'h3ca;
      expv[21] = 10'h3ca;
      expv[22] = 10'h3ca;
      expv[23] = 10'h3ca;
      expv[24] = 10'h3ca;
      expv[25] = 10'h3ca;
      expv[26] = 10'h3ca;
      expv[27] = 10'h3ca;
      expv[28] = 10'h3ca;
      expv[29] = 10'h3ca;
      expv[30] = 10'h3ca;
      expv[31] = 10'h3ca;
      expv[32] = 10'h3ca;
      expv[33] = 10'h3ca;
      expv[34] = 10'h3ca;
      expv[35] = 10'h3ca;
      expv[36] = 10'h3ca;
      expv[37] = 10'h3ca;
      expv[38] = 10'h3ca;
      expv[39] = 10'h3ca;
      expv[40] = 10'h31a;
      expv[41] = 10'h31a;
      expv[42] = 10'h3b0;
      expv[43] = 10'h3b0;
      expv[44] = 10'h317;
      expv[45] = 10'h317;
      expv[46] = 10'h317;
      expv[47] = 10'h317;
      expv[48] = 10'h317;
      expv[49] = 10'h332;
      expv[50] = 10'h332;
      expv[51] = 10'h332;
      expv[52] = 10'h332;
      expv[53] = 10'h332;
      expv[54] = 10'h332;
      expv[55] = 10'h332;
      expv[56] = 10'h332;
      expv[57] = 10'h3b8;
      expv[58] = 10'h3b8;
      expv[59] = 10'h345;
      expv[60] = 10'h345;
      expv[61] = 10'h3eb;
      expv[62] = 10'h3eb;
      expv[63] = 10'h3eb;
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
