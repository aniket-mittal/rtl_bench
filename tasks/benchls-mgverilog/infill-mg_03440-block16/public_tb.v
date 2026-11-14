// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03440 dut (
    .clk(clk),
    .addr(in_vec[3:0]),
    .data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hd;
    stim[1] = 4'h9;
    stim[2] = 4'h9;
    stim[3] = 4'ha;
    stim[4] = 4'h1;
    stim[5] = 4'h0;
    stim[6] = 4'h4;
    stim[7] = 4'hd;
    stim[8] = 4'ha;
    stim[9] = 4'h2;
    stim[10] = 4'h4;
    stim[11] = 4'he;
    stim[12] = 4'h5;
    stim[13] = 4'hf;
    stim[14] = 4'hb;
    stim[15] = 4'hd;
    stim[16] = 4'h9;
    stim[17] = 4'h8;
    stim[18] = 4'hf;
    stim[19] = 4'h0;
    stim[20] = 4'h4;
    stim[21] = 4'h2;
    stim[22] = 4'h7;
    stim[23] = 4'h9;
    stim[24] = 4'h6;
    stim[25] = 4'h8;
    stim[26] = 4'h1;
    stim[27] = 4'hc;
    stim[28] = 4'h1;
    stim[29] = 4'h8;
    stim[30] = 4'he;
    stim[31] = 4'h0;
    stim[32] = 4'h3;
    stim[33] = 4'h5;
    stim[34] = 4'h7;
    stim[35] = 4'hc;
    stim[36] = 4'h3;
    stim[37] = 4'hf;
    stim[38] = 4'h0;
    stim[39] = 4'hd;
    stim[40] = 4'h2;
    stim[41] = 4'h8;
    stim[42] = 4'hb;
    stim[43] = 4'h1;
    stim[44] = 4'h8;
    stim[45] = 4'hf;
    stim[46] = 4'h0;
    stim[47] = 4'h1;
    stim[48] = 4'hb;
    stim[49] = 4'h7;
    stim[50] = 4'hb;
    stim[51] = 4'he;
    stim[52] = 4'hf;
    stim[53] = 4'hd;
    stim[54] = 4'h8;
    stim[55] = 4'h5;
    stim[56] = 4'ha;
    stim[57] = 4'hc;
    stim[58] = 4'h6;
    stim[59] = 4'h0;
    stim[60] = 4'hf;
    stim[61] = 4'h3;
    stim[62] = 4'ha;
    stim[63] = 4'h4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h72;
      expv[2] = 8'h6c;
      expv[3] = 8'h6c;
      expv[4] = 8'h64;
      expv[5] = 8'h65;
      expv[6] = 8'h48;
      expv[7] = 8'h6f;
      expv[8] = 8'h72;
      expv[9] = 8'h64;
      expv[10] = 8'h6c;
      expv[11] = 8'h6f;
      expv[12] = 8'h20;
      expv[13] = 8'h20;
      expv[14] = 8'h20;
      expv[15] = 8'h21;
      expv[16] = 8'h72;
      expv[17] = 8'h6c;
      expv[18] = 8'h72;
      expv[19] = 8'h20;
      expv[20] = 8'h48;
      expv[21] = 8'h6f;
      expv[22] = 8'h6c;
      expv[23] = 8'h6f;
      expv[24] = 8'h6c;
      expv[25] = 8'h57;
      expv[26] = 8'h72;
      expv[27] = 8'h65;
      expv[28] = 8'h0a;
      expv[29] = 8'h65;
      expv[30] = 8'h72;
      expv[31] = 8'h20;
      expv[32] = 8'h48;
      expv[33] = 8'h6c;
      expv[34] = 8'h20;
      expv[35] = 8'h6f;
      expv[36] = 8'h0a;
      expv[37] = 8'h6c;
      expv[38] = 8'h20;
      expv[39] = 8'h48;
      expv[40] = 8'h72;
      expv[41] = 8'h6c;
      expv[42] = 8'h72;
      expv[43] = 8'h21;
      expv[44] = 8'h65;
      expv[45] = 8'h72;
      expv[46] = 8'h20;
      expv[47] = 8'h48;
      expv[48] = 8'h65;
      expv[49] = 8'h21;
      expv[50] = 8'h6f;
      expv[51] = 8'h21;
      expv[52] = 8'h20;
      expv[53] = 8'h20;
      expv[54] = 8'h72;
      expv[55] = 8'h72;
      expv[56] = 8'h20;
      expv[57] = 8'h64;
      expv[58] = 8'h0a;
      expv[59] = 8'h57;
      expv[60] = 8'h48;
      expv[61] = 8'h20;
      expv[62] = 8'h6c;
      expv[63] = 8'h64;
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
