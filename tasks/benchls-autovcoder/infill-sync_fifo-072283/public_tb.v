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

  autovcoder_072283 dut (
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
    stim[0] = 12'hfdf;
    stim[1] = 12'h868;
    stim[2] = 12'h7af;
    stim[3] = 12'h28b;
    stim[4] = 12'h0af;
    stim[5] = 12'h788;
    stim[6] = 12'h7f1;
    stim[7] = 12'h2a2;
    stim[8] = 12'h72a;
    stim[9] = 12'h662;
    stim[10] = 12'h000;
    stim[11] = 12'h0df;
    stim[12] = 12'h497;
    stim[13] = 12'h67e;
    stim[14] = 12'h194;
    stim[15] = 12'h612;
    stim[16] = 12'hdd6;
    stim[17] = 12'h228;
    stim[18] = 12'h1a7;
    stim[19] = 12'h18b;
    stim[20] = 12'h249;
    stim[21] = 12'h3f0;
    stim[22] = 12'h076;
    stim[23] = 12'h6ba;
    stim[24] = 12'h1ba;
    stim[25] = 12'h3ea;
    stim[26] = 12'h137;
    stim[27] = 12'h7cf;
    stim[28] = 12'h791;
    stim[29] = 12'h740;
    stim[30] = 12'h5c2;
    stim[31] = 12'h567;
    stim[32] = 12'h433;
    stim[33] = 12'h433;
    stim[34] = 12'h14a;
    stim[35] = 12'h70b;
    stim[36] = 12'h545;
    stim[37] = 12'h70f;
    stim[38] = 12'h4db;
    stim[39] = 12'h194;
    stim[40] = 12'h124;
    stim[41] = 12'h482;
    stim[42] = 12'h63f;
    stim[43] = 12'h30c;
    stim[44] = 12'h2d9;
    stim[45] = 12'h752;
    stim[46] = 12'h36b;
    stim[47] = 12'h211;
    stim[48] = 12'h625;
    stim[49] = 12'h582;
    stim[50] = 12'h3db;
    stim[51] = 12'h072;
    stim[52] = 12'h5ae;
    stim[53] = 12'h031;
    stim[54] = 12'h648;
    stim[55] = 12'h3a6;
    stim[56] = 12'h06e;
    stim[57] = 12'h717;
    stim[58] = 12'h5aa;
    stim[59] = 12'h775;
    stim[60] = 12'h102;
    stim[61] = 12'h30a;
    stim[62] = 12'h0e0;
    stim[63] = 12'h789;
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
      expv[6] = 10'h3af;
      expv[7] = 10'h388;
      expv[8] = 10'h388;
      expv[9] = 10'h3f1;
      expv[10] = 10'h32a;
      expv[11] = 10'h32a;
      expv[12] = 10'h32a;
      expv[13] = 10'h32a;
      expv[14] = 10'h12a;
      expv[15] = 10'h12a;
      expv[16] = 10'h12a;
      expv[17] = 10'h100;
      expv[18] = 10'h100;
      expv[19] = 10'h100;
      expv[20] = 10'h100;
      expv[21] = 10'h100;
      expv[22] = 10'h100;
      expv[23] = 10'h100;
      expv[24] = 10'h1d6;
      expv[25] = 10'h1d6;
      expv[26] = 10'h1d6;
      expv[27] = 10'h1d6;
      expv[28] = 10'h1d6;
      expv[29] = 10'h3cf;
      expv[30] = 10'h391;
      expv[31] = 10'h391;
      expv[32] = 10'h391;
      expv[33] = 10'h391;
      expv[34] = 10'h391;
      expv[35] = 10'h391;
      expv[36] = 10'h340;
      expv[37] = 10'h340;
      expv[38] = 10'h3c2;
      expv[39] = 10'h3c2;
      expv[40] = 10'h3c2;
      expv[41] = 10'h3c2;
      expv[42] = 10'h3c2;
      expv[43] = 10'h367;
      expv[44] = 10'h367;
      expv[45] = 10'h367;
      expv[46] = 10'h30b;
      expv[47] = 10'h30b;
      expv[48] = 10'h30b;
      expv[49] = 10'h345;
      expv[50] = 10'h345;
      expv[51] = 10'h345;
      expv[52] = 10'h345;
      expv[53] = 10'h345;
      expv[54] = 10'h345;
      expv[55] = 10'h30f;
      expv[56] = 10'h30f;
      expv[57] = 10'h30f;
      expv[58] = 10'h352;
      expv[59] = 10'h352;
      expv[60] = 10'h382;
      expv[61] = 10'h382;
      expv[62] = 10'h382;
      expv[63] = 10'h382;
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
