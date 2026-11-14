// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h14;
    stim[1] = 8'h8e;
    stim[2] = 8'hc1;
    stim[3] = 8'h81;
    stim[4] = 8'h71;
    stim[5] = 8'hc8;
    stim[6] = 8'h24;
    stim[7] = 8'had;
    stim[8] = 8'ha1;
    stim[9] = 8'h61;
    stim[10] = 8'he8;
    stim[11] = 8'hbc;
    stim[12] = 8'h11;
    stim[13] = 8'h1c;
    stim[14] = 8'h73;
    stim[15] = 8'h6f;
    stim[16] = 8'h7e;
    stim[17] = 8'had;
    stim[18] = 8'h84;
    stim[19] = 8'h58;
    stim[20] = 8'hb2;
    stim[21] = 8'h04;
    stim[22] = 8'h77;
    stim[23] = 8'h2f;
    stim[24] = 8'hd3;
    stim[25] = 8'hc0;
    stim[26] = 8'ha7;
    stim[27] = 8'h88;
    stim[28] = 8'h9e;
    stim[29] = 8'he0;
    stim[30] = 8'h25;
    stim[31] = 8'h23;
    stim[32] = 8'h49;
    stim[33] = 8'hd3;
    stim[34] = 8'ha8;
    stim[35] = 8'h58;
    stim[36] = 8'h75;
    stim[37] = 8'he7;
    stim[38] = 8'h16;
    stim[39] = 8'h83;
    stim[40] = 8'h04;
    stim[41] = 8'hd6;
    stim[42] = 8'h08;
    stim[43] = 8'h24;
    stim[44] = 8'hfb;
    stim[45] = 8'h7a;
    stim[46] = 8'h44;
    stim[47] = 8'hb4;
    stim[48] = 8'h4c;
    stim[49] = 8'h6c;
    stim[50] = 8'hc7;
    stim[51] = 8'hd9;
    stim[52] = 8'h6e;
    stim[53] = 8'h93;
    stim[54] = 8'h7a;
    stim[55] = 8'h32;
    stim[56] = 8'hd4;
    stim[57] = 8'h6f;
    stim[58] = 8'h8b;
    stim[59] = 8'h00;
    stim[60] = 8'h67;
    stim[61] = 8'hfa;
    stim[62] = 8'h5e;
    stim[63] = 8'h0d;
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
      expv[0] = 8'h14;
      expv[1] = 8'h8e;
      expv[2] = 8'hc1;
      expv[3] = 8'h81;
      expv[4] = 8'h71;
      expv[5] = 8'hc8;
      expv[6] = 8'h24;
      expv[7] = 8'had;
      expv[8] = 8'ha1;
      expv[9] = 8'h61;
      expv[10] = 8'he8;
      expv[11] = 8'hbc;
      expv[12] = 8'h11;
      expv[13] = 8'h1c;
      expv[14] = 8'h73;
      expv[15] = 8'h6f;
      expv[16] = 8'h7e;
      expv[17] = 8'had;
      expv[18] = 8'h84;
      expv[19] = 8'h58;
      expv[20] = 8'hb2;
      expv[21] = 8'h04;
      expv[22] = 8'h77;
      expv[23] = 8'h2f;
      expv[24] = 8'hd3;
      expv[25] = 8'hc0;
      expv[26] = 8'ha7;
      expv[27] = 8'h88;
      expv[28] = 8'h9e;
      expv[29] = 8'he0;
      expv[30] = 8'h25;
      expv[31] = 8'h23;
      expv[32] = 8'h49;
      expv[33] = 8'hd3;
      expv[34] = 8'ha8;
      expv[35] = 8'h58;
      expv[36] = 8'h75;
      expv[37] = 8'he7;
      expv[38] = 8'h16;
      expv[39] = 8'h83;
      expv[40] = 8'h04;
      expv[41] = 8'hd6;
      expv[42] = 8'h08;
      expv[43] = 8'h24;
      expv[44] = 8'hfb;
      expv[45] = 8'h7a;
      expv[46] = 8'h44;
      expv[47] = 8'hb4;
      expv[48] = 8'h4c;
      expv[49] = 8'h6c;
      expv[50] = 8'hc7;
      expv[51] = 8'hd9;
      expv[52] = 8'h6e;
      expv[53] = 8'h93;
      expv[54] = 8'h7a;
      expv[55] = 8'h32;
      expv[56] = 8'hd4;
      expv[57] = 8'h6f;
      expv[58] = 8'h8b;
      expv[59] = 8'h00;
      expv[60] = 8'h67;
      expv[61] = 8'hfa;
      expv[62] = 8'h5e;
      expv[63] = 8'h0d;
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
