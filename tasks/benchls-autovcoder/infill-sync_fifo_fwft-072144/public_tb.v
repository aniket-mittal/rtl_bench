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

  autovcoder_072144 dut (
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
    stim[0] = 12'he28;
    stim[1] = 12'ha0e;
    stim[2] = 12'h4dc;
    stim[3] = 12'h014;
    stim[4] = 12'h156;
    stim[5] = 12'h6b8;
    stim[6] = 12'h6d6;
    stim[7] = 12'h511;
    stim[8] = 12'h049;
    stim[9] = 12'h692;
    stim[10] = 12'h408;
    stim[11] = 12'h02e;
    stim[12] = 12'h223;
    stim[13] = 12'h730;
    stim[14] = 12'h47c;
    stim[15] = 12'h4ad;
    stim[16] = 12'ha9c;
    stim[17] = 12'h76f;
    stim[18] = 12'h53d;
    stim[19] = 12'h69b;
    stim[20] = 12'h2b0;
    stim[21] = 12'h6ee;
    stim[22] = 12'h777;
    stim[23] = 12'h07a;
    stim[24] = 12'h578;
    stim[25] = 12'h5f7;
    stim[26] = 12'h3cc;
    stim[27] = 12'h278;
    stim[28] = 12'h186;
    stim[29] = 12'h34c;
    stim[30] = 12'h2ff;
    stim[31] = 12'h255;
    stim[32] = 12'h4a5;
    stim[33] = 12'h487;
    stim[34] = 12'h360;
    stim[35] = 12'h445;
    stim[36] = 12'h47e;
    stim[37] = 12'h7c7;
    stim[38] = 12'h64b;
    stim[39] = 12'h7e3;
    stim[40] = 12'h627;
    stim[41] = 12'h5a3;
    stim[42] = 12'h3b3;
    stim[43] = 12'h7a9;
    stim[44] = 12'h66a;
    stim[45] = 12'h03e;
    stim[46] = 12'h079;
    stim[47] = 12'h075;
    stim[48] = 12'h036;
    stim[49] = 12'h415;
    stim[50] = 12'h09f;
    stim[51] = 12'h2b7;
    stim[52] = 12'h2b1;
    stim[53] = 12'h246;
    stim[54] = 12'h041;
    stim[55] = 12'h45b;
    stim[56] = 12'h2ce;
    stim[57] = 12'h0bf;
    stim[58] = 12'h576;
    stim[59] = 12'h78f;
    stim[60] = 12'h2e6;
    stim[61] = 12'h385;
    stim[62] = 12'h460;
    stim[63] = 12'h34c;
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
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h311;
      expv[11] = 10'h311;
      expv[12] = 10'h311;
      expv[13] = 10'h311;
      expv[14] = 10'h111;
      expv[15] = 10'h330;
      expv[16] = 10'h330;
      expv[17] = 10'h100;
      expv[18] = 10'h130;
      expv[19] = 10'h36f;
      expv[20] = 10'h33d;
      expv[21] = 10'h33d;
      expv[22] = 10'h13d;
      expv[23] = 10'h13d;
      expv[24] = 10'h13d;
      expv[25] = 10'h377;
      expv[26] = 10'h377;
      expv[27] = 10'h377;
      expv[28] = 10'h377;
      expv[29] = 10'h377;
      expv[30] = 10'h377;
      expv[31] = 10'h377;
      expv[32] = 10'h377;
      expv[33] = 10'h377;
      expv[34] = 10'h377;
      expv[35] = 10'h377;
      expv[36] = 10'h377;
      expv[37] = 10'h377;
      expv[38] = 10'h378;
      expv[39] = 10'h3f7;
      expv[40] = 10'h3c7;
      expv[41] = 10'h3e3;
      expv[42] = 10'h3e3;
      expv[43] = 10'h3e3;
      expv[44] = 10'h3a3;
      expv[45] = 10'h3a9;
      expv[46] = 10'h3a9;
      expv[47] = 10'h3a9;
      expv[48] = 10'h3a9;
      expv[49] = 10'h3a9;
      expv[50] = 10'h3a9;
      expv[51] = 10'h3a9;
      expv[52] = 10'h3a9;
      expv[53] = 10'h3a9;
      expv[54] = 10'h3a9;
      expv[55] = 10'h3a9;
      expv[56] = 10'h3a9;
      expv[57] = 10'h3a9;
      expv[58] = 10'h3a9;
      expv[59] = 10'h3a9;
      expv[60] = 10'h376;
      expv[61] = 10'h376;
      expv[62] = 10'h376;
      expv[63] = 10'h376;
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
