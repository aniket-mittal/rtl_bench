// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085034 dut (
    .clk(clk),
    .i_sop(in_vec[3:3]),
    .i_eop(in_vec[2:2]),
    .rst(in_vec[1:1]),
    .i_chblk(in_vec[0:0]),
    .o_we(out_vec[8:5]),
    .o_state(out_vec[4:3]),
    .o_substate(out_vec[2:2]),
    .o_memSelect(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h2;
    stim[1] = 4'h6;
    stim[2] = 4'hc;
    stim[3] = 4'h1;
    stim[4] = 4'h4;
    stim[5] = 4'h1;
    stim[6] = 4'hc;
    stim[7] = 4'h6;
    stim[8] = 4'h8;
    stim[9] = 4'h1;
    stim[10] = 4'h9;
    stim[11] = 4'hd;
    stim[12] = 4'h8;
    stim[13] = 4'h0;
    stim[14] = 4'h8;
    stim[15] = 4'hd;
    stim[16] = 4'hc;
    stim[17] = 4'hd;
    stim[18] = 4'h8;
    stim[19] = 4'h4;
    stim[20] = 4'h0;
    stim[21] = 4'hd;
    stim[22] = 4'h1;
    stim[23] = 4'h4;
    stim[24] = 4'h0;
    stim[25] = 4'h0;
    stim[26] = 4'h0;
    stim[27] = 4'h4;
    stim[28] = 4'h8;
    stim[29] = 4'h1;
    stim[30] = 4'h8;
    stim[31] = 4'hd;
    stim[32] = 4'h5;
    stim[33] = 4'h9;
    stim[34] = 4'h0;
    stim[35] = 4'h8;
    stim[36] = 4'h1;
    stim[37] = 4'hd;
    stim[38] = 4'hc;
    stim[39] = 4'hc;
    stim[40] = 4'hd;
    stim[41] = 4'hd;
    stim[42] = 4'h9;
    stim[43] = 4'hc;
    stim[44] = 4'h9;
    stim[45] = 4'h8;
    stim[46] = 4'h8;
    stim[47] = 4'h9;
    stim[48] = 4'h4;
    stim[49] = 4'h9;
    stim[50] = 4'h1;
    stim[51] = 4'h4;
    stim[52] = 4'h5;
    stim[53] = 4'hd;
    stim[54] = 4'hc;
    stim[55] = 4'h9;
    stim[56] = 4'hc;
    stim[57] = 4'h5;
    stim[58] = 4'h4;
    stim[59] = 4'h8;
    stim[60] = 4'h5;
    stim[61] = 4'h4;
    stim[62] = 4'h8;
    stim[63] = 4'h0;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h010;
      expv[2] = 9'h018;
      expv[3] = 9'h020;
      expv[4] = 9'h010;
      expv[5] = 9'h020;
      expv[6] = 9'h018;
      expv[7] = 9'h010;
      expv[8] = 9'h068;
      expv[9] = 9'h020;
      expv[10] = 9'h068;
      expv[11] = 9'h018;
      expv[12] = 9'h068;
      expv[13] = 9'h020;
      expv[14] = 9'h068;
      expv[15] = 9'h018;
      expv[16] = 9'h018;
      expv[17] = 9'h018;
      expv[18] = 9'h068;
      expv[19] = 9'h010;
      expv[20] = 9'h024;
      expv[21] = 9'h01c;
      expv[22] = 9'h024;
      expv[23] = 9'h014;
      expv[24] = 9'h024;
      expv[25] = 9'h024;
      expv[26] = 9'h024;
      expv[27] = 9'h014;
      expv[28] = 9'h06c;
      expv[29] = 9'h024;
      expv[30] = 9'h06c;
      expv[31] = 9'h01c;
      expv[32] = 9'h014;
      expv[33] = 9'h068;
      expv[34] = 9'h041;
      expv[35] = 9'h068;
      expv[36] = 9'h041;
      expv[37] = 9'h018;
      expv[38] = 9'h018;
      expv[39] = 9'h018;
      expv[40] = 9'h018;
      expv[41] = 9'h018;
      expv[42] = 9'h068;
      expv[43] = 9'h018;
      expv[44] = 9'h068;
      expv[45] = 9'h188;
      expv[46] = 9'h188;
      expv[47] = 9'h188;
      expv[48] = 9'h010;
      expv[49] = 9'h06c;
      expv[50] = 9'h086;
      expv[51] = 9'h014;
      expv[52] = 9'h014;
      expv[53] = 9'h01c;
      expv[54] = 9'h01c;
      expv[55] = 9'h18c;
      expv[56] = 9'h01c;
      expv[57] = 9'h015;
      expv[58] = 9'h011;
      expv[59] = 9'h188;
      expv[60] = 9'h011;
      expv[61] = 9'h012;
      expv[62] = 9'h188;
      expv[63] = 9'h082;
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
