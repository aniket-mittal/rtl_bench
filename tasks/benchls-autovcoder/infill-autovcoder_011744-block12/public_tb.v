// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011744 dut (
    .a_clk(clk),
    .reset_n(in_vec[6:6]),
    .b_clk(in_vec[5:5]),
    .a_data_in(in_vec[4:1]),
    .a_ld_pls(in_vec[0:0]),
    .b_data_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h1b;
    stim[1] = 7'h27;
    stim[2] = 7'h65;
    stim[3] = 7'h78;
    stim[4] = 7'h5c;
    stim[5] = 7'h73;
    stim[6] = 7'h40;
    stim[7] = 7'h59;
    stim[8] = 7'h66;
    stim[9] = 7'h60;
    stim[10] = 7'h59;
    stim[11] = 7'h53;
    stim[12] = 7'h6b;
    stim[13] = 7'h7f;
    stim[14] = 7'h7a;
    stim[15] = 7'h4e;
    stim[16] = 7'h68;
    stim[17] = 7'h73;
    stim[18] = 7'h66;
    stim[19] = 7'h77;
    stim[20] = 7'h45;
    stim[21] = 7'h76;
    stim[22] = 7'h4c;
    stim[23] = 7'h6a;
    stim[24] = 7'h5c;
    stim[25] = 7'h74;
    stim[26] = 7'h56;
    stim[27] = 7'h70;
    stim[28] = 7'h6f;
    stim[29] = 7'h61;
    stim[30] = 7'h79;
    stim[31] = 7'h4f;
    stim[32] = 7'h77;
    stim[33] = 7'h74;
    stim[34] = 7'h70;
    stim[35] = 7'h7b;
    stim[36] = 7'h64;
    stim[37] = 7'h7b;
    stim[38] = 7'h5d;
    stim[39] = 7'h54;
    stim[40] = 7'h57;
    stim[41] = 7'h5c;
    stim[42] = 7'h57;
    stim[43] = 7'h48;
    stim[44] = 7'h44;
    stim[45] = 7'h40;
    stim[46] = 7'h5f;
    stim[47] = 7'h48;
    stim[48] = 7'h42;
    stim[49] = 7'h72;
    stim[50] = 7'h7e;
    stim[51] = 7'h66;
    stim[52] = 7'h6f;
    stim[53] = 7'h72;
    stim[54] = 7'h63;
    stim[55] = 7'h7e;
    stim[56] = 7'h57;
    stim[57] = 7'h7c;
    stim[58] = 7'h72;
    stim[59] = 7'h55;
    stim[60] = 7'h42;
    stim[61] = 7'h63;
    stim[62] = 7'h6c;
    stim[63] = 7'h6f;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
