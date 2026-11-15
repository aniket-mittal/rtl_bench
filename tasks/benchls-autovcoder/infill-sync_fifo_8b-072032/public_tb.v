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

  autovcoder_072032 dut (
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
    stim[0] = 12'hbd3;
    stim[1] = 12'hc4d;
    stim[2] = 12'h391;
    stim[3] = 12'h64d;
    stim[4] = 12'h56e;
    stim[5] = 12'h5f6;
    stim[6] = 12'h75a;
    stim[7] = 12'h18b;
    stim[8] = 12'h7c4;
    stim[9] = 12'h74e;
    stim[10] = 12'h1e5;
    stim[11] = 12'h2d2;
    stim[12] = 12'h289;
    stim[13] = 12'h2fc;
    stim[14] = 12'h0b1;
    stim[15] = 12'h5d7;
    stim[16] = 12'h606;
    stim[17] = 12'h54a;
    stim[18] = 12'h26d;
    stim[19] = 12'h753;
    stim[20] = 12'h78a;
    stim[21] = 12'h30d;
    stim[22] = 12'h3f8;
    stim[23] = 12'h34e;
    stim[24] = 12'h7ce;
    stim[25] = 12'h626;
    stim[26] = 12'h2e5;
    stim[27] = 12'h2ba;
    stim[28] = 12'h511;
    stim[29] = 12'h072;
    stim[30] = 12'haa4;
    stim[31] = 12'h23e;
    stim[32] = 12'h501;
    stim[33] = 12'h555;
    stim[34] = 12'h778;
    stim[35] = 12'h767;
    stim[36] = 12'h645;
    stim[37] = 12'h46a;
    stim[38] = 12'h322;
    stim[39] = 12'h147;
    stim[40] = 12'h2f5;
    stim[41] = 12'h1d9;
    stim[42] = 12'h21f;
    stim[43] = 12'h628;
    stim[44] = 12'h41d;
    stim[45] = 12'h77f;
    stim[46] = 12'h716;
    stim[47] = 12'h20b;
    stim[48] = 12'h43c;
    stim[49] = 12'h5e8;
    stim[50] = 12'h057;
    stim[51] = 12'h193;
    stim[52] = 12'h3f1;
    stim[53] = 12'ha3f;
    stim[54] = 12'h057;
    stim[55] = 12'hf0c;
    stim[56] = 12'h1d7;
    stim[57] = 12'h620;
    stim[58] = 12'h1a3;
    stim[59] = 12'h5e7;
    stim[60] = 12'h72c;
    stim[61] = 12'h011;
    stim[62] = 12'h4ee;
    stim[63] = 12'h3ba;
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
      expv[3] = 10'h100;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h36e;
      expv[7] = 10'h3f6;
      expv[8] = 10'h3f6;
      expv[9] = 10'h35a;
      expv[10] = 10'h3c4;
      expv[11] = 10'h3c4;
      expv[12] = 10'h3c4;
      expv[13] = 10'h3c4;
      expv[14] = 10'h3c4;
      expv[15] = 10'h3c4;
      expv[16] = 10'h3c4;
      expv[17] = 10'h34e;
      expv[18] = 10'h34e;
      expv[19] = 10'h34e;
      expv[20] = 10'h3d7;
      expv[21] = 10'h34a;
      expv[22] = 10'h34a;
      expv[23] = 10'h34a;
      expv[24] = 10'h34a;
      expv[25] = 10'h353;
      expv[26] = 10'h38a;
      expv[27] = 10'h38a;
      expv[28] = 10'h38a;
      expv[29] = 10'h38a;
      expv[30] = 10'h38a;
      expv[31] = 10'h100;
      expv[32] = 10'h100;
      expv[33] = 10'h111;
      expv[34] = 10'h301;
      expv[35] = 10'h355;
      expv[36] = 10'h378;
      expv[37] = 10'h367;
      expv[38] = 10'h367;
      expv[39] = 10'h367;
      expv[40] = 10'h367;
      expv[41] = 10'h367;
      expv[42] = 10'h367;
      expv[43] = 10'h367;
      expv[44] = 10'h167;
      expv[45] = 10'h167;
      expv[46] = 10'h167;
      expv[47] = 10'h37f;
      expv[48] = 10'h37f;
      expv[49] = 10'h37f;
      expv[50] = 10'h37f;
      expv[51] = 10'h37f;
      expv[52] = 10'h37f;
      expv[53] = 10'h37f;
      expv[54] = 10'h100;
      expv[55] = 10'h100;
      expv[56] = 10'h100;
      expv[57] = 10'h100;
      expv[58] = 10'h10c;
      expv[59] = 10'h10c;
      expv[60] = 10'h10c;
      expv[61] = 10'h3e7;
      expv[62] = 10'h3e7;
      expv[63] = 10'h3e7;
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
