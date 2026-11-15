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

  autovcoder_072520 dut (
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
    stim[0] = 12'hfc7;
    stim[1] = 12'hf60;
    stim[2] = 12'h355;
    stim[3] = 12'h715;
    stim[4] = 12'h5c0;
    stim[5] = 12'h244;
    stim[6] = 12'h22d;
    stim[7] = 12'h75d;
    stim[8] = 12'h2a9;
    stim[9] = 12'h105;
    stim[10] = 12'h6da;
    stim[11] = 12'h06e;
    stim[12] = 12'h019;
    stim[13] = 12'h10b;
    stim[14] = 12'h37d;
    stim[15] = 12'h2ec;
    stim[16] = 12'h434;
    stim[17] = 12'h639;
    stim[18] = 12'h433;
    stim[19] = 12'h4d5;
    stim[20] = 12'h553;
    stim[21] = 12'h2cb;
    stim[22] = 12'h432;
    stim[23] = 12'h2f2;
    stim[24] = 12'h1b7;
    stim[25] = 12'h695;
    stim[26] = 12'h26c;
    stim[27] = 12'h6cb;
    stim[28] = 12'h02c;
    stim[29] = 12'h7c9;
    stim[30] = 12'h0ec;
    stim[31] = 12'h63e;
    stim[32] = 12'h0a9;
    stim[33] = 12'h7fb;
    stim[34] = 12'h65d;
    stim[35] = 12'h7c6;
    stim[36] = 12'h246;
    stim[37] = 12'h55c;
    stim[38] = 12'h49a;
    stim[39] = 12'h5c7;
    stim[40] = 12'h009;
    stim[41] = 12'h4e5;
    stim[42] = 12'h0ff;
    stim[43] = 12'h5aa;
    stim[44] = 12'h18a;
    stim[45] = 12'h212;
    stim[46] = 12'h724;
    stim[47] = 12'h6eb;
    stim[48] = 12'h210;
    stim[49] = 12'h697;
    stim[50] = 12'h13c;
    stim[51] = 12'h246;
    stim[52] = 12'h0bf;
    stim[53] = 12'h039;
    stim[54] = 12'h4bf;
    stim[55] = 12'h4ba;
    stim[56] = 12'h089;
    stim[57] = 12'h079;
    stim[58] = 12'h084;
    stim[59] = 12'h71e;
    stim[60] = 12'h338;
    stim[61] = 12'h4fc;
    stim[62] = 12'h0ff;
    stim[63] = 12'h4f1;
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
      expv[4] = 10'h160;
      expv[5] = 10'h315;
      expv[6] = 10'h315;
      expv[7] = 10'h315;
      expv[8] = 10'h3c0;
      expv[9] = 10'h3c0;
      expv[10] = 10'h3c0;
      expv[11] = 10'h35d;
      expv[12] = 10'h35d;
      expv[13] = 10'h35d;
      expv[14] = 10'h35d;
      expv[15] = 10'h35d;
      expv[16] = 10'h35d;
      expv[17] = 10'h35d;
      expv[18] = 10'h15d;
      expv[19] = 10'h15d;
      expv[20] = 10'h15d;
      expv[21] = 10'h15d;
      expv[22] = 10'h15d;
      expv[23] = 10'h353;
      expv[24] = 10'h353;
      expv[25] = 10'h353;
      expv[26] = 10'h153;
      expv[27] = 10'h153;
      expv[28] = 10'h153;
      expv[29] = 10'h153;
      expv[30] = 10'h153;
      expv[31] = 10'h153;
      expv[32] = 10'h3c9;
      expv[33] = 10'h3c9;
      expv[34] = 10'h1c9;
      expv[35] = 10'h3fb;
      expv[36] = 10'h1fb;
      expv[37] = 10'h1fb;
      expv[38] = 10'h3c6;
      expv[39] = 10'h3c6;
      expv[40] = 10'h3c6;
      expv[41] = 10'h3c6;
      expv[42] = 10'h3c6;
      expv[43] = 10'h3c6;
      expv[44] = 10'h3c6;
      expv[45] = 10'h3c6;
      expv[46] = 10'h3c6;
      expv[47] = 10'h35c;
      expv[48] = 10'h3c7;
      expv[49] = 10'h3c7;
      expv[50] = 10'h3aa;
      expv[51] = 10'h3aa;
      expv[52] = 10'h3aa;
      expv[53] = 10'h3aa;
      expv[54] = 10'h3aa;
      expv[55] = 10'h3aa;
      expv[56] = 10'h3aa;
      expv[57] = 10'h3aa;
      expv[58] = 10'h3aa;
      expv[59] = 10'h3aa;
      expv[60] = 10'h324;
      expv[61] = 10'h324;
      expv[62] = 10'h324;
      expv[63] = 10'h324;
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
