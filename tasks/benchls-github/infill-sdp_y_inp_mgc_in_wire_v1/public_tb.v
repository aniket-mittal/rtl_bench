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

  SDP_Y_INP_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hf1;
    stim[1] = 8'h9c;
    stim[2] = 8'hb1;
    stim[3] = 8'hc9;
    stim[4] = 8'h92;
    stim[5] = 8'he1;
    stim[6] = 8'hb5;
    stim[7] = 8'h05;
    stim[8] = 8'hf1;
    stim[9] = 8'hff;
    stim[10] = 8'hbc;
    stim[11] = 8'hf7;
    stim[12] = 8'h16;
    stim[13] = 8'h65;
    stim[14] = 8'h94;
    stim[15] = 8'hc5;
    stim[16] = 8'h5d;
    stim[17] = 8'h6f;
    stim[18] = 8'h59;
    stim[19] = 8'h03;
    stim[20] = 8'h26;
    stim[21] = 8'h10;
    stim[22] = 8'hb6;
    stim[23] = 8'h11;
    stim[24] = 8'hb1;
    stim[25] = 8'h8a;
    stim[26] = 8'hc0;
    stim[27] = 8'he3;
    stim[28] = 8'h3e;
    stim[29] = 8'h20;
    stim[30] = 8'h9d;
    stim[31] = 8'h85;
    stim[32] = 8'hd8;
    stim[33] = 8'hbf;
    stim[34] = 8'hc5;
    stim[35] = 8'h3d;
    stim[36] = 8'hf2;
    stim[37] = 8'h06;
    stim[38] = 8'h4b;
    stim[39] = 8'he6;
    stim[40] = 8'ha9;
    stim[41] = 8'h2c;
    stim[42] = 8'h61;
    stim[43] = 8'hfe;
    stim[44] = 8'h4d;
    stim[45] = 8'h03;
    stim[46] = 8'h27;
    stim[47] = 8'h6a;
    stim[48] = 8'h2b;
    stim[49] = 8'hd9;
    stim[50] = 8'h34;
    stim[51] = 8'h6b;
    stim[52] = 8'h48;
    stim[53] = 8'h7a;
    stim[54] = 8'hd1;
    stim[55] = 8'ha3;
    stim[56] = 8'h82;
    stim[57] = 8'h49;
    stim[58] = 8'h07;
    stim[59] = 8'hb4;
    stim[60] = 8'h63;
    stim[61] = 8'hc7;
    stim[62] = 8'hb7;
    stim[63] = 8'h83;
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
      expv[0] = 8'hf1;
      expv[1] = 8'h9c;
      expv[2] = 8'hb1;
      expv[3] = 8'hc9;
      expv[4] = 8'h92;
      expv[5] = 8'he1;
      expv[6] = 8'hb5;
      expv[7] = 8'h05;
      expv[8] = 8'hf1;
      expv[9] = 8'hff;
      expv[10] = 8'hbc;
      expv[11] = 8'hf7;
      expv[12] = 8'h16;
      expv[13] = 8'h65;
      expv[14] = 8'h94;
      expv[15] = 8'hc5;
      expv[16] = 8'h5d;
      expv[17] = 8'h6f;
      expv[18] = 8'h59;
      expv[19] = 8'h03;
      expv[20] = 8'h26;
      expv[21] = 8'h10;
      expv[22] = 8'hb6;
      expv[23] = 8'h11;
      expv[24] = 8'hb1;
      expv[25] = 8'h8a;
      expv[26] = 8'hc0;
      expv[27] = 8'he3;
      expv[28] = 8'h3e;
      expv[29] = 8'h20;
      expv[30] = 8'h9d;
      expv[31] = 8'h85;
      expv[32] = 8'hd8;
      expv[33] = 8'hbf;
      expv[34] = 8'hc5;
      expv[35] = 8'h3d;
      expv[36] = 8'hf2;
      expv[37] = 8'h06;
      expv[38] = 8'h4b;
      expv[39] = 8'he6;
      expv[40] = 8'ha9;
      expv[41] = 8'h2c;
      expv[42] = 8'h61;
      expv[43] = 8'hfe;
      expv[44] = 8'h4d;
      expv[45] = 8'h03;
      expv[46] = 8'h27;
      expv[47] = 8'h6a;
      expv[48] = 8'h2b;
      expv[49] = 8'hd9;
      expv[50] = 8'h34;
      expv[51] = 8'h6b;
      expv[52] = 8'h48;
      expv[53] = 8'h7a;
      expv[54] = 8'hd1;
      expv[55] = 8'ha3;
      expv[56] = 8'h82;
      expv[57] = 8'h49;
      expv[58] = 8'h07;
      expv[59] = 8'hb4;
      expv[60] = 8'h63;
      expv[61] = 8'hc7;
      expv[62] = 8'hb7;
      expv[63] = 8'h83;
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
