// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011845 dut (
    .Op_i(in_vec[6:0]),
    .Control_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h24;
    stim[1] = 7'h77;
    stim[2] = 7'h5d;
    stim[3] = 7'h02;
    stim[4] = 7'h6a;
    stim[5] = 7'h78;
    stim[6] = 7'h71;
    stim[7] = 7'h1c;
    stim[8] = 7'h4e;
    stim[9] = 7'h75;
    stim[10] = 7'h4a;
    stim[11] = 7'h13;
    stim[12] = 7'h76;
    stim[13] = 7'h2f;
    stim[14] = 7'h75;
    stim[15] = 7'h54;
    stim[16] = 7'h49;
    stim[17] = 7'h7d;
    stim[18] = 7'h7d;
    stim[19] = 7'h7d;
    stim[20] = 7'h2f;
    stim[21] = 7'h06;
    stim[22] = 7'h7d;
    stim[23] = 7'h5e;
    stim[24] = 7'h72;
    stim[25] = 7'h77;
    stim[26] = 7'h68;
    stim[27] = 7'h77;
    stim[28] = 7'h75;
    stim[29] = 7'h05;
    stim[30] = 7'h4a;
    stim[31] = 7'h03;
    stim[32] = 7'h0e;
    stim[33] = 7'h6b;
    stim[34] = 7'h67;
    stim[35] = 7'h01;
    stim[36] = 7'h01;
    stim[37] = 7'h52;
    stim[38] = 7'h31;
    stim[39] = 7'h04;
    stim[40] = 7'h56;
    stim[41] = 7'h23;
    stim[42] = 7'h18;
    stim[43] = 7'h2e;
    stim[44] = 7'h07;
    stim[45] = 7'h33;
    stim[46] = 7'h23;
    stim[47] = 7'h00;
    stim[48] = 7'h0a;
    stim[49] = 7'h43;
    stim[50] = 7'h1f;
    stim[51] = 7'h31;
    stim[52] = 7'h0b;
    stim[53] = 7'h5d;
    stim[54] = 7'h1f;
    stim[55] = 7'h14;
    stim[56] = 7'h54;
    stim[57] = 7'h69;
    stim[58] = 7'h04;
    stim[59] = 7'h2a;
    stim[60] = 7'h45;
    stim[61] = 7'h3f;
    stim[62] = 7'h1d;
    stim[63] = 7'h26;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h22;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h2b;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h24;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h82;
      expv[46] = 8'h24;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
