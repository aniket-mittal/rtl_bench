// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  lab3_2 dut (
    .x(in_vec[7:4]),
    .y(in_vec[3:0]),
    .xlty(out_vec[2:2]),
    .xeqy(out_vec[1:1]),
    .xgty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hf3;
    stim[1] = 8'h64;
    stim[2] = 8'h9c;
    stim[3] = 8'h21;
    stim[4] = 8'h80;
    stim[5] = 8'h3e;
    stim[6] = 8'h71;
    stim[7] = 8'h55;
    stim[8] = 8'h20;
    stim[9] = 8'h8c;
    stim[10] = 8'ha6;
    stim[11] = 8'ha4;
    stim[12] = 8'h94;
    stim[13] = 8'hbd;
    stim[14] = 8'h71;
    stim[15] = 8'h27;
    stim[16] = 8'h6c;
    stim[17] = 8'h48;
    stim[18] = 8'h5f;
    stim[19] = 8'hd5;
    stim[20] = 8'h7f;
    stim[21] = 8'h70;
    stim[22] = 8'hec;
    stim[23] = 8'h87;
    stim[24] = 8'h71;
    stim[25] = 8'h2d;
    stim[26] = 8'h34;
    stim[27] = 8'hb9;
    stim[28] = 8'hb4;
    stim[29] = 8'h93;
    stim[30] = 8'h4a;
    stim[31] = 8'hb6;
    stim[32] = 8'h28;
    stim[33] = 8'h0f;
    stim[34] = 8'hd2;
    stim[35] = 8'hb9;
    stim[36] = 8'h4c;
    stim[37] = 8'h58;
    stim[38] = 8'h17;
    stim[39] = 8'h7b;
    stim[40] = 8'hf8;
    stim[41] = 8'hfe;
    stim[42] = 8'h29;
    stim[43] = 8'ha1;
    stim[44] = 8'h72;
    stim[45] = 8'h05;
    stim[46] = 8'h5e;
    stim[47] = 8'hde;
    stim[48] = 8'h11;
    stim[49] = 8'h2c;
    stim[50] = 8'hf6;
    stim[51] = 8'h32;
    stim[52] = 8'he4;
    stim[53] = 8'hd1;
    stim[54] = 8'h5b;
    stim[55] = 8'hee;
    stim[56] = 8'hfa;
    stim[57] = 8'ha1;
    stim[58] = 8'h71;
    stim[59] = 8'h79;
    stim[60] = 8'he0;
    stim[61] = 8'h35;
    stim[62] = 8'h18;
    stim[63] = 8'h62;
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
      expv[0] = 3'h1;
      expv[1] = 3'h1;
      expv[2] = 3'h4;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h4;
      expv[6] = 3'h1;
      expv[7] = 3'h2;
      expv[8] = 3'h1;
      expv[9] = 3'h4;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h4;
      expv[14] = 3'h1;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h1;
      expv[20] = 3'h4;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h1;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h1;
      expv[28] = 3'h1;
      expv[29] = 3'h1;
      expv[30] = 3'h4;
      expv[31] = 3'h1;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h4;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h2;
      expv[49] = 3'h4;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h4;
      expv[55] = 3'h2;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h4;
      expv[60] = 3'h1;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h1;
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
