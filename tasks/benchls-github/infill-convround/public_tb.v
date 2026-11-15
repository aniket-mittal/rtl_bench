// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  convround dut (
    .i_clk(clk),
    .i_ce(in_vec[16:16]),
    .i_val(in_vec[15:0]),
    .o_val(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h01187;
    stim[1] = 17'h073d2;
    stim[2] = 17'h0083c;
    stim[3] = 17'h1e06c;
    stim[4] = 17'h00f76;
    stim[5] = 17'h0f572;
    stim[6] = 17'h16f5d;
    stim[7] = 17'h0820e;
    stim[8] = 17'h1f261;
    stim[9] = 17'h1a354;
    stim[10] = 17'h0f502;
    stim[11] = 17'h17535;
    stim[12] = 17'h0a246;
    stim[13] = 17'h0bb93;
    stim[14] = 17'h1e73d;
    stim[15] = 17'h04f43;
    stim[16] = 17'h18b84;
    stim[17] = 17'h1cac2;
    stim[18] = 17'h0fb90;
    stim[19] = 17'h02865;
    stim[20] = 17'h15915;
    stim[21] = 17'h09cfc;
    stim[22] = 17'h15618;
    stim[23] = 17'h184cb;
    stim[24] = 17'h0b594;
    stim[25] = 17'h05960;
    stim[26] = 17'h14bf6;
    stim[27] = 17'h1671e;
    stim[28] = 17'h0400d;
    stim[29] = 17'h0f60d;
    stim[30] = 17'h1c07d;
    stim[31] = 17'h1f39a;
    stim[32] = 17'h04e6b;
    stim[33] = 17'h12a72;
    stim[34] = 17'h0aaa8;
    stim[35] = 17'h1f941;
    stim[36] = 17'h10c70;
    stim[37] = 17'h14b5f;
    stim[38] = 17'h1d60a;
    stim[39] = 17'h1059d;
    stim[40] = 17'h15352;
    stim[41] = 17'h1a355;
    stim[42] = 17'h12e33;
    stim[43] = 17'h1230a;
    stim[44] = 17'h0ed52;
    stim[45] = 17'h1a67b;
    stim[46] = 17'h05dd5;
    stim[47] = 17'h18069;
    stim[48] = 17'h19e34;
    stim[49] = 17'h0b48f;
    stim[50] = 17'h1ec06;
    stim[51] = 17'h12289;
    stim[52] = 17'h0da1b;
    stim[53] = 17'h13699;
    stim[54] = 17'h1e00d;
    stim[55] = 17'h1c83c;
    stim[56] = 17'h1d8dc;
    stim[57] = 17'h12e26;
    stim[58] = 17'h13aea;
    stim[59] = 17'h05be9;
    stim[60] = 17'h0a2c7;
    stim[61] = 17'h048cf;
    stim[62] = 17'h0aaa1;
    stim[63] = 17'h136b1;
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
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'he0;
      expv[5] = 8'he0;
      expv[6] = 8'he0;
      expv[7] = 8'h6f;
      expv[8] = 8'h6f;
      expv[9] = 8'hf2;
      expv[10] = 8'ha3;
      expv[11] = 8'ha3;
      expv[12] = 8'h75;
      expv[13] = 8'h75;
      expv[14] = 8'h75;
      expv[15] = 8'he7;
      expv[16] = 8'he7;
      expv[17] = 8'h8c;
      expv[18] = 8'hcb;
      expv[19] = 8'hcb;
      expv[20] = 8'hcb;
      expv[21] = 8'h59;
      expv[22] = 8'h59;
      expv[23] = 8'h56;
      expv[24] = 8'h85;
      expv[25] = 8'h85;
      expv[26] = 8'h85;
      expv[27] = 8'h4c;
      expv[28] = 8'h67;
      expv[29] = 8'h67;
      expv[30] = 8'h67;
      expv[31] = 8'hc0;
      expv[32] = 8'hf4;
      expv[33] = 8'hf4;
      expv[34] = 8'h2a;
      expv[35] = 8'h2a;
      expv[36] = 8'hf9;
      expv[37] = 8'h0c;
      expv[38] = 8'h4b;
      expv[39] = 8'hd6;
      expv[40] = 8'h06;
      expv[41] = 8'h53;
      expv[42] = 8'ha3;
      expv[43] = 8'h2e;
      expv[44] = 8'h23;
      expv[45] = 8'h23;
      expv[46] = 8'ha6;
      expv[47] = 8'ha6;
      expv[48] = 8'h80;
      expv[49] = 8'h9e;
      expv[50] = 8'h9e;
      expv[51] = 8'hec;
      expv[52] = 8'h23;
      expv[53] = 8'h23;
      expv[54] = 8'h37;
      expv[55] = 8'he0;
      expv[56] = 8'hc8;
      expv[57] = 8'hd9;
      expv[58] = 8'h2e;
      expv[59] = 8'h3b;
      expv[60] = 8'h3b;
      expv[61] = 8'h3b;
      expv[62] = 8'h3b;
      expv[63] = 8'h3b;
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
