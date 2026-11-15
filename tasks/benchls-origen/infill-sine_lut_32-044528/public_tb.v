// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_044528 dut (
    .clk(clk),
    .reset_n(in_vec[5:5]),
    .address(in_vec[4:0]),
    .dataout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h18;
    stim[1] = 6'h1f;
    stim[2] = 6'h3f;
    stim[3] = 6'h33;
    stim[4] = 6'h24;
    stim[5] = 6'h32;
    stim[6] = 6'h2d;
    stim[7] = 6'h2f;
    stim[8] = 6'h35;
    stim[9] = 6'h3e;
    stim[10] = 6'h30;
    stim[11] = 6'h3e;
    stim[12] = 6'h37;
    stim[13] = 6'h24;
    stim[14] = 6'h2e;
    stim[15] = 6'h29;
    stim[16] = 6'h37;
    stim[17] = 6'h34;
    stim[18] = 6'h30;
    stim[19] = 6'h35;
    stim[20] = 6'h2c;
    stim[21] = 6'h2c;
    stim[22] = 6'h3e;
    stim[23] = 6'h20;
    stim[24] = 6'h2d;
    stim[25] = 6'h3d;
    stim[26] = 6'h3d;
    stim[27] = 6'h30;
    stim[28] = 6'h30;
    stim[29] = 6'h3b;
    stim[30] = 6'h28;
    stim[31] = 6'h2f;
    stim[32] = 6'h24;
    stim[33] = 6'h28;
    stim[34] = 6'h3d;
    stim[35] = 6'h34;
    stim[36] = 6'h24;
    stim[37] = 6'h33;
    stim[38] = 6'h2a;
    stim[39] = 6'h2e;
    stim[40] = 6'h2a;
    stim[41] = 6'h2d;
    stim[42] = 6'h2b;
    stim[43] = 6'h2e;
    stim[44] = 6'h2b;
    stim[45] = 6'h28;
    stim[46] = 6'h34;
    stim[47] = 6'h38;
    stim[48] = 6'h35;
    stim[49] = 6'h33;
    stim[50] = 6'h28;
    stim[51] = 6'h26;
    stim[52] = 6'h35;
    stim[53] = 6'h3d;
    stim[54] = 6'h23;
    stim[55] = 6'h27;
    stim[56] = 6'h2d;
    stim[57] = 6'h32;
    stim[58] = 6'h23;
    stim[59] = 6'h2b;
    stim[60] = 6'h20;
    stim[61] = 6'h3c;
    stim[62] = 6'h30;
    stim[63] = 6'h23;
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
      expv[1] = 8'hd0;
      expv[2] = 8'h80;
      expv[3] = 8'h80;
      expv[4] = 8'hf0;
      expv[5] = 8'hb0;
      expv[6] = 8'hf2;
      expv[7] = 8'hf2;
      expv[8] = 8'hf4;
      expv[9] = 8'he7;
      expv[10] = 8'h8c;
      expv[11] = 8'hf4;
      expv[12] = 8'h8c;
      expv[13] = 8'hd9;
      expv[14] = 8'hb0;
      expv[15] = 8'hf4;
      expv[16] = 8'he0;
      expv[17] = 8'hd9;
      expv[18] = 8'hec;
      expv[19] = 8'hf4;
      expv[20] = 8'he7;
      expv[21] = 8'hf0;
      expv[22] = 8'hf0;
      expv[23] = 8'h8c;
      expv[24] = 8'h80;
      expv[25] = 8'hf2;
      expv[26] = 8'h98;
      expv[27] = 8'h98;
      expv[28] = 8'hf4;
      expv[29] = 8'hf4;
      expv[30] = 8'hb0;
      expv[31] = 8'hd9;
      expv[32] = 8'hf4;
      expv[33] = 8'hb0;
      expv[34] = 8'hd9;
      expv[35] = 8'h98;
      expv[36] = 8'hec;
      expv[37] = 8'hb0;
      expv[38] = 8'hf0;
      expv[39] = 8'he7;
      expv[40] = 8'hf4;
      expv[41] = 8'he7;
      expv[42] = 8'hf2;
      expv[43] = 8'hec;
      expv[44] = 8'hf4;
      expv[45] = 8'hec;
      expv[46] = 8'hd9;
      expv[47] = 8'hec;
      expv[48] = 8'hd0;
      expv[49] = 8'he7;
      expv[50] = 8'hf0;
      expv[51] = 8'hd9;
      expv[52] = 8'hc6;
      expv[53] = 8'he7;
      expv[54] = 8'h98;
      expv[55] = 8'ha5;
      expv[56] = 8'hd0;
      expv[57] = 8'hf2;
      expv[58] = 8'hf2;
      expv[59] = 8'ha5;
      expv[60] = 8'hec;
      expv[61] = 8'h80;
      expv[62] = 8'ha5;
      expv[63] = 8'hf4;
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
