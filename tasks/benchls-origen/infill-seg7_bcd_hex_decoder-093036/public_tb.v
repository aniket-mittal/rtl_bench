// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093036 dut (
    .num_in(in_vec[6:3]),
    .control(in_vec[2:1]),
    .display_sel(in_vec[0:0]),
    .seg_out(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h27;
    stim[1] = 7'h6c;
    stim[2] = 7'h30;
    stim[3] = 7'h2b;
    stim[4] = 7'h2c;
    stim[5] = 7'h1f;
    stim[6] = 7'h26;
    stim[7] = 7'h5d;
    stim[8] = 7'h17;
    stim[9] = 7'h31;
    stim[10] = 7'h6d;
    stim[11] = 7'h7f;
    stim[12] = 7'h4e;
    stim[13] = 7'h38;
    stim[14] = 7'h62;
    stim[15] = 7'h7a;
    stim[16] = 7'h3c;
    stim[17] = 7'h0b;
    stim[18] = 7'h0f;
    stim[19] = 7'h22;
    stim[20] = 7'h05;
    stim[21] = 7'h58;
    stim[22] = 7'h17;
    stim[23] = 7'h63;
    stim[24] = 7'h61;
    stim[25] = 7'h6c;
    stim[26] = 7'h47;
    stim[27] = 7'h20;
    stim[28] = 7'h4d;
    stim[29] = 7'h57;
    stim[30] = 7'h19;
    stim[31] = 7'h0b;
    stim[32] = 7'h20;
    stim[33] = 7'h0c;
    stim[34] = 7'h48;
    stim[35] = 7'h1e;
    stim[36] = 7'h41;
    stim[37] = 7'h0d;
    stim[38] = 7'h3b;
    stim[39] = 7'h7f;
    stim[40] = 7'h7a;
    stim[41] = 7'h60;
    stim[42] = 7'h47;
    stim[43] = 7'h08;
    stim[44] = 7'h61;
    stim[45] = 7'h2d;
    stim[46] = 7'h37;
    stim[47] = 7'h1c;
    stim[48] = 7'h27;
    stim[49] = 7'h2d;
    stim[50] = 7'h32;
    stim[51] = 7'h24;
    stim[52] = 7'h71;
    stim[53] = 7'h3c;
    stim[54] = 7'h70;
    stim[55] = 7'h01;
    stim[56] = 7'h64;
    stim[57] = 7'h4c;
    stim[58] = 7'h77;
    stim[59] = 7'h4d;
    stim[60] = 7'h41;
    stim[61] = 7'h43;
    stim[62] = 7'h0d;
    stim[63] = 7'h66;
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
      expv[0] = 7'h19;
      expv[1] = 7'h21;
      expv[2] = 7'h02;
      expv[3] = 7'h12;
      expv[4] = 7'h12;
      expv[5] = 7'h30;
      expv[6] = 7'h09;
      expv[7] = 7'h3f;
      expv[8] = 7'h24;
      expv[9] = 7'h02;
      expv[10] = 7'h77;
      expv[11] = 7'h77;
      expv[12] = 7'h09;
      expv[13] = 7'h78;
      expv[14] = 7'h46;
      expv[15] = 7'h0e;
      expv[16] = 7'h78;
      expv[17] = 7'h79;
      expv[18] = 7'h79;
      expv[19] = 7'h19;
      expv[20] = 7'h40;
      expv[21] = 7'h03;
      expv[22] = 7'h24;
      expv[23] = 7'h77;
      expv[24] = 7'h77;
      expv[25] = 7'h21;
      expv[26] = 7'h00;
      expv[27] = 7'h19;
      expv[28] = 7'h10;
      expv[29] = 7'h3f;
      expv[30] = 7'h30;
      expv[31] = 7'h79;
      expv[32] = 7'h19;
      expv[33] = 7'h79;
      expv[34] = 7'h10;
      expv[35] = 7'h09;
      expv[36] = 7'h00;
      expv[37] = 7'h79;
      expv[38] = 7'h78;
      expv[39] = 7'h77;
      expv[40] = 7'h0e;
      expv[41] = 7'h46;
      expv[42] = 7'h00;
      expv[43] = 7'h79;
      expv[44] = 7'h77;
      expv[45] = 7'h12;
      expv[46] = 7'h02;
      expv[47] = 7'h30;
      expv[48] = 7'h19;
      expv[49] = 7'h12;
      expv[50] = 7'h02;
      expv[51] = 7'h19;
      expv[52] = 7'h77;
      expv[53] = 7'h78;
      expv[54] = 7'h06;
      expv[55] = 7'h40;
      expv[56] = 7'h46;
      expv[57] = 7'h10;
      expv[58] = 7'h77;
      expv[59] = 7'h10;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h79;
      expv[63] = 7'h09;
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
