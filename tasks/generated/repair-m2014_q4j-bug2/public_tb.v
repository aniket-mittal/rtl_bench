// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .x(in_vec[7:4]),
    .y(in_vec[3:0]),
    .sum(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h45;
    stim[1] = 8'hd5;
    stim[2] = 8'he4;
    stim[3] = 8'h6a;
    stim[4] = 8'hf6;
    stim[5] = 8'h95;
    stim[6] = 8'h06;
    stim[7] = 8'hdc;
    stim[8] = 8'h87;
    stim[9] = 8'h93;
    stim[10] = 8'hba;
    stim[11] = 8'h56;
    stim[12] = 8'h6a;
    stim[13] = 8'h9c;
    stim[14] = 8'h79;
    stim[15] = 8'h7e;
    stim[16] = 8'h73;
    stim[17] = 8'h48;
    stim[18] = 8'h07;
    stim[19] = 8'h46;
    stim[20] = 8'h89;
    stim[21] = 8'hbe;
    stim[22] = 8'h34;
    stim[23] = 8'h5b;
    stim[24] = 8'h3d;
    stim[25] = 8'hcd;
    stim[26] = 8'h05;
    stim[27] = 8'hf5;
    stim[28] = 8'h1f;
    stim[29] = 8'he7;
    stim[30] = 8'h37;
    stim[31] = 8'h42;
    stim[32] = 8'hb7;
    stim[33] = 8'h7b;
    stim[34] = 8'h7c;
    stim[35] = 8'h56;
    stim[36] = 8'he6;
    stim[37] = 8'h9f;
    stim[38] = 8'h6f;
    stim[39] = 8'h5e;
    stim[40] = 8'ha5;
    stim[41] = 8'h5e;
    stim[42] = 8'h86;
    stim[43] = 8'h2d;
    stim[44] = 8'he9;
    stim[45] = 8'h6b;
    stim[46] = 8'hd4;
    stim[47] = 8'h45;
    stim[48] = 8'hf1;
    stim[49] = 8'hc3;
    stim[50] = 8'h47;
    stim[51] = 8'h3e;
    stim[52] = 8'h67;
    stim[53] = 8'ha9;
    stim[54] = 8'h0c;
    stim[55] = 8'he3;
    stim[56] = 8'hf9;
    stim[57] = 8'hf8;
    stim[58] = 8'h33;
    stim[59] = 8'h76;
    stim[60] = 8'h0f;
    stim[61] = 8'h24;
    stim[62] = 8'hd4;
    stim[63] = 8'h07;
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
      expv[0] = 5'h09;
      expv[1] = 5'h02;
      expv[2] = 5'h02;
      expv[3] = 5'h00;
      expv[4] = 5'h05;
      expv[5] = 5'h0e;
      expv[6] = 5'h06;
      expv[7] = 5'h09;
      expv[8] = 5'h0f;
      expv[9] = 5'h0c;
      expv[10] = 5'h05;
      expv[11] = 5'h0b;
      expv[12] = 5'h00;
      expv[13] = 5'h05;
      expv[14] = 5'h00;
      expv[15] = 5'h05;
      expv[16] = 5'h0a;
      expv[17] = 5'h0c;
      expv[18] = 5'h07;
      expv[19] = 5'h0a;
      expv[20] = 5'h01;
      expv[21] = 5'h09;
      expv[22] = 5'h07;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h09;
      expv[26] = 5'h05;
      expv[27] = 5'h04;
      expv[28] = 5'h00;
      expv[29] = 5'h05;
      expv[30] = 5'h0a;
      expv[31] = 5'h06;
      expv[32] = 5'h02;
      expv[33] = 5'h02;
      expv[34] = 5'h03;
      expv[35] = 5'h0b;
      expv[36] = 5'h04;
      expv[37] = 5'h08;
      expv[38] = 5'h05;
      expv[39] = 5'h03;
      expv[40] = 5'h0f;
      expv[41] = 5'h03;
      expv[42] = 5'h0e;
      expv[43] = 5'h0f;
      expv[44] = 5'h07;
      expv[45] = 5'h01;
      expv[46] = 5'h01;
      expv[47] = 5'h09;
      expv[48] = 5'h00;
      expv[49] = 5'h0f;
      expv[50] = 5'h0b;
      expv[51] = 5'h01;
      expv[52] = 5'h0d;
      expv[53] = 5'h03;
      expv[54] = 5'h0c;
      expv[55] = 5'h01;
      expv[56] = 5'h08;
      expv[57] = 5'h07;
      expv[58] = 5'h06;
      expv[59] = 5'h0d;
      expv[60] = 5'h0f;
      expv[61] = 5'h06;
      expv[62] = 5'h01;
      expv[63] = 5'h07;
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
