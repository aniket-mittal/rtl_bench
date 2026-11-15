// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061592 dut (
    .total(in_vec[15:0]),
    .thosent(out_vec[15:12]),
    .hundred(out_vec[11:8]),
    .tens(out_vec[7:4]),
    .ones(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h3e90;
    stim[1] = 16'hba69;
    stim[2] = 16'h4c94;
    stim[3] = 16'h6268;
    stim[4] = 16'he8b8;
    stim[5] = 16'he93d;
    stim[6] = 16'h38b0;
    stim[7] = 16'ha5c1;
    stim[8] = 16'h8514;
    stim[9] = 16'hf6ee;
    stim[10] = 16'h8b94;
    stim[11] = 16'h5c74;
    stim[12] = 16'hfdc6;
    stim[13] = 16'hde4c;
    stim[14] = 16'h517f;
    stim[15] = 16'ha48e;
    stim[16] = 16'h2428;
    stim[17] = 16'h14fe;
    stim[18] = 16'hcff5;
    stim[19] = 16'hfd9d;
    stim[20] = 16'h1610;
    stim[21] = 16'h3cdc;
    stim[22] = 16'h8e3a;
    stim[23] = 16'h2ff3;
    stim[24] = 16'h290d;
    stim[25] = 16'he9d0;
    stim[26] = 16'hca18;
    stim[27] = 16'h4904;
    stim[28] = 16'h7dd1;
    stim[29] = 16'h54fb;
    stim[30] = 16'h0555;
    stim[31] = 16'h9802;
    stim[32] = 16'haf0a;
    stim[33] = 16'h2826;
    stim[34] = 16'h5581;
    stim[35] = 16'hba14;
    stim[36] = 16'h8eec;
    stim[37] = 16'he930;
    stim[38] = 16'h3d7a;
    stim[39] = 16'h53e2;
    stim[40] = 16'ha07d;
    stim[41] = 16'h8fc4;
    stim[42] = 16'h34a5;
    stim[43] = 16'h6ebd;
    stim[44] = 16'h3864;
    stim[45] = 16'h77d3;
    stim[46] = 16'h86a5;
    stim[47] = 16'h43cd;
    stim[48] = 16'h2787;
    stim[49] = 16'hfa8f;
    stim[50] = 16'hb1ae;
    stim[51] = 16'h0092;
    stim[52] = 16'h6230;
    stim[53] = 16'h078f;
    stim[54] = 16'hf28a;
    stim[55] = 16'h8eab;
    stim[56] = 16'ha981;
    stim[57] = 16'h840f;
    stim[58] = 16'h0ee8;
    stim[59] = 16'hc206;
    stim[60] = 16'h3ad3;
    stim[61] = 16'h53af;
    stim[62] = 16'h869d;
    stim[63] = 16'h27cf;
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
      expv[0] = 16'h999a;
      expv[1] = 16'h9993;
      expv[2] = 16'h999e;
      expv[3] = 16'h9992;
      expv[4] = 16'h9992;
      expv[5] = 16'h9997;
      expv[6] = 16'h999a;
      expv[7] = 16'h999b;
      expv[8] = 16'h999e;
      expv[9] = 16'h9998;
      expv[10] = 16'h999e;
      expv[11] = 16'h999e;
      expv[12] = 16'h9990;
      expv[13] = 16'h9996;
      expv[14] = 16'h9999;
      expv[15] = 16'h9998;
      expv[16] = 16'h9256;
      expv[17] = 16'h5374;
      expv[18] = 16'h999f;
      expv[19] = 16'h9997;
      expv[20] = 16'h5648;
      expv[21] = 16'h9996;
      expv[22] = 16'h9994;
      expv[23] = 16'h999d;
      expv[24] = 16'h9997;
      expv[25] = 16'h999a;
      expv[26] = 16'h9992;
      expv[27] = 16'h999e;
      expv[28] = 16'h999b;
      expv[29] = 16'h9995;
      expv[30] = 16'h1365;
      expv[31] = 16'h999c;
      expv[32] = 16'h9994;
      expv[33] = 16'h9990;
      expv[34] = 16'h999b;
      expv[35] = 16'h999e;
      expv[36] = 16'h9996;
      expv[37] = 16'h999a;
      expv[38] = 16'h9994;
      expv[39] = 16'h999c;
      expv[40] = 16'h9997;
      expv[41] = 16'h999e;
      expv[42] = 16'h999f;
      expv[43] = 16'h9997;
      expv[44] = 16'h999e;
      expv[45] = 16'h999d;
      expv[46] = 16'h999f;
      expv[47] = 16'h9997;
      expv[48] = 16'h9991;
      expv[49] = 16'h9999;
      expv[50] = 16'h9998;
      expv[51] = 16'h0146;
      expv[52] = 16'h999a;
      expv[53] = 16'h1935;
      expv[54] = 16'h9994;
      expv[55] = 16'h9995;
      expv[56] = 16'h999b;
      expv[57] = 16'h9999;
      expv[58] = 16'h3816;
      expv[59] = 16'h9990;
      expv[60] = 16'h999d;
      expv[61] = 16'h9999;
      expv[62] = 16'h9997;
      expv[63] = 16'h9999;
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
