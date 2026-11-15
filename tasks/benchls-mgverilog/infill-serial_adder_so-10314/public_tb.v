// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10314 dut (
    .clk(clk),
    .a(in_vec[2:2]),
    .b(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .sum(out_vec[9:9]),
    .carry(out_vec[8:8]),
    .cout(out_vec[7:7]),
    .count(out_vec[6:4]),
    .so(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h1;
    stim[1] = 3'h7;
    stim[2] = 3'h2;
    stim[3] = 3'h2;
    stim[4] = 3'h0;
    stim[5] = 3'h6;
    stim[6] = 3'h2;
    stim[7] = 3'h6;
    stim[8] = 3'h6;
    stim[9] = 3'h6;
    stim[10] = 3'h6;
    stim[11] = 3'h2;
    stim[12] = 3'h0;
    stim[13] = 3'h0;
    stim[14] = 3'h0;
    stim[15] = 3'h2;
    stim[16] = 3'h6;
    stim[17] = 3'h2;
    stim[18] = 3'h6;
    stim[19] = 3'h0;
    stim[20] = 3'h2;
    stim[21] = 3'h6;
    stim[22] = 3'h2;
    stim[23] = 3'h4;
    stim[24] = 3'h6;
    stim[25] = 3'h4;
    stim[26] = 3'h4;
    stim[27] = 3'h6;
    stim[28] = 3'h4;
    stim[29] = 3'h2;
    stim[30] = 3'h2;
    stim[31] = 3'h6;
    stim[32] = 3'h6;
    stim[33] = 3'h0;
    stim[34] = 3'h2;
    stim[35] = 3'h4;
    stim[36] = 3'h4;
    stim[37] = 3'h2;
    stim[38] = 3'h4;
    stim[39] = 3'h0;
    stim[40] = 3'h6;
    stim[41] = 3'h4;
    stim[42] = 3'h2;
    stim[43] = 3'h6;
    stim[44] = 3'h0;
    stim[45] = 3'h6;
    stim[46] = 3'h0;
    stim[47] = 3'h0;
    stim[48] = 3'h0;
    stim[49] = 3'h4;
    stim[50] = 3'h4;
    stim[51] = 3'h6;
    stim[52] = 3'h0;
    stim[53] = 3'h2;
    stim[54] = 3'h4;
    stim[55] = 3'h0;
    stim[56] = 3'h2;
    stim[57] = 3'h6;
    stim[58] = 3'h4;
    stim[59] = 3'h2;
    stim[60] = 3'h6;
    stim[61] = 3'h0;
    stim[62] = 3'h4;
    stim[63] = 3'h6;
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
      expv[2] = 10'h200;
      expv[3] = 10'h208;
      expv[4] = 10'h01c;
      expv[5] = 10'h106;
      expv[6] = 10'h113;
      expv[7] = 10'h311;
      expv[8] = 10'h328;
      expv[9] = 10'h31c;
      expv[10] = 10'h32e;
      expv[11] = 10'h11f;
      expv[12] = 10'h227;
      expv[13] = 10'h00b;
      expv[14] = 10'h015;
      expv[15] = 10'h202;
      expv[16] = 10'h119;
      expv[17] = 10'h114;
      expv[18] = 10'h322;
      expv[19] = 10'h219;
      expv[20] = 10'h22c;
      expv[21] = 10'h10e;
      expv[22] = 10'h117;
      expv[23] = 10'h113;
      expv[24] = 10'h321;
      expv[25] = 10'h118;
      expv[26] = 10'h124;
      expv[27] = 10'h312;
      expv[28] = 10'h129;
      expv[29] = 10'h114;
      expv[30] = 10'h122;
      expv[31] = 10'h311;
      expv[32] = 10'h328;
      expv[33] = 10'h21c;
      expv[34] = 10'h22e;
      expv[35] = 10'h20f;
      expv[36] = 10'h21f;
      expv[37] = 10'h20f;
      expv[38] = 10'h21f;
      expv[39] = 10'h00f;
      expv[40] = 10'h117;
      expv[41] = 10'h113;
      expv[42] = 10'h121;
      expv[43] = 10'h310;
      expv[44] = 10'h228;
      expv[45] = 10'h10c;
      expv[46] = 10'h216;
      expv[47] = 10'h00b;
      expv[48] = 10'h015;
      expv[49] = 10'h202;
      expv[50] = 10'h219;
      expv[51] = 10'h10c;
      expv[52] = 10'h216;
      expv[53] = 10'h20b;
      expv[54] = 10'h21d;
      expv[55] = 10'h00e;
      expv[56] = 10'h217;
      expv[57] = 10'h10b;
      expv[58] = 10'h115;
      expv[59] = 10'h112;
      expv[60] = 10'h321;
      expv[61] = 10'h218;
      expv[62] = 10'h22c;
      expv[63] = 10'h10e;
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
