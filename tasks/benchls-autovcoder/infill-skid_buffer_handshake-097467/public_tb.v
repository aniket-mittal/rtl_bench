// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097467 dut (
    .clk(clk),
    .reset(in_vec[34:34]),
    .ready_downward(in_vec[33:33]),
    .val_in(in_vec[32:32]),
    .din(in_vec[31:0]),
    .val_out(out_vec[33:33]),
    .ready_upward(out_vec[32:32]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6031d870a;
    stim[1] = 35'h7c6a1058d;
    stim[2] = 35'h0cb6f479e;
    stim[3] = 35'h3cf63d144;
    stim[4] = 35'h062035eee;
    stim[5] = 35'h1f9df68f5;
    stim[6] = 35'h205876044;
    stim[7] = 35'h107545a2a;
    stim[8] = 35'h210c0d6ee;
    stim[9] = 35'h1fddd07c5;
    stim[10] = 35'h0dcc3048f;
    stim[11] = 35'h1a14520fa;
    stim[12] = 35'h730dc5546;
    stim[13] = 35'h39a922a61;
    stim[14] = 35'h11299cf0b;
    stim[15] = 35'h0da8b656c;
    stim[16] = 35'h0c2ea8989;
    stim[17] = 35'h05cb0ca8a;
    stim[18] = 35'h1540b3ecf;
    stim[19] = 35'h0b636da81;
    stim[20] = 35'h0c441d0df;
    stim[21] = 35'h3fadd4d86;
    stim[22] = 35'h18c0af569;
    stim[23] = 35'h2e303ad9d;
    stim[24] = 35'h3d0f58e6b;
    stim[25] = 35'h01bee30d3;
    stim[26] = 35'h3a52e4519;
    stim[27] = 35'h36cddcf48;
    stim[28] = 35'h27d913988;
    stim[29] = 35'h01dc4906a;
    stim[30] = 35'h0a09a00f6;
    stim[31] = 35'h2286dbb9e;
    stim[32] = 35'h384522641;
    stim[33] = 35'h2c42a76ea;
    stim[34] = 35'h3fd921853;
    stim[35] = 35'h25896f3de;
    stim[36] = 35'h2bd4e81c5;
    stim[37] = 35'h0fd059859;
    stim[38] = 35'h1331b05da;
    stim[39] = 35'h37a0f841a;
    stim[40] = 35'h1eaae6ec0;
    stim[41] = 35'h36c28a86d;
    stim[42] = 35'h372a4acc0;
    stim[43] = 35'h3adfb39d6;
    stim[44] = 35'h355c1707d;
    stim[45] = 35'h0dfc5cf7f;
    stim[46] = 35'h50c60ee3d;
    stim[47] = 35'h1268a1c41;
    stim[48] = 35'h28735801d;
    stim[49] = 35'h3a0240c4e;
    stim[50] = 35'h030131f1b;
    stim[51] = 35'h144911d38;
    stim[52] = 35'h028b0f645;
    stim[53] = 35'h143658b36;
    stim[54] = 35'h26d1934da;
    stim[55] = 35'h01ff59aef;
    stim[56] = 35'h052605e07;
    stim[57] = 35'h0a474cfb5;
    stim[58] = 35'h2e73e5504;
    stim[59] = 35'h04533caca;
    stim[60] = 35'h34be30a52;
    stim[61] = 35'h1bdf3612f;
    stim[62] = 35'h07e3e18d8;
    stim[63] = 35'h3106c8214;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h100000000;
      expv[2] = 34'h100000000;
      expv[3] = 34'h100000000;
      expv[4] = 34'h100000000;
      expv[5] = 34'h100000000;
      expv[6] = 34'h2cf63d144;
      expv[7] = 34'h1cf63d144;
      expv[8] = 34'h2f9df68f5;
      expv[9] = 34'h1f9df68f5;
      expv[10] = 34'h007545a2a;
      expv[11] = 34'h007545a2a;
      expv[12] = 34'h207545a2a;
      expv[13] = 34'h100000000;
      expv[14] = 34'h100000000;
      expv[15] = 34'h09a922a61;
      expv[16] = 34'h09a922a61;
      expv[17] = 34'h09a922a61;
      expv[18] = 34'h09a922a61;
      expv[19] = 34'h09a922a61;
      expv[20] = 34'h09a922a61;
      expv[21] = 34'h29a922a61;
      expv[22] = 34'h19a922a61;
      expv[23] = 34'h21299cf0b;
      expv[24] = 34'h38c0af569;
      expv[25] = 34'h11299cf0b;
      expv[26] = 34'h3d0f58e6b;
      expv[27] = 34'h3a52e4519;
      expv[28] = 34'h36cddcf48;
      expv[29] = 34'h11299cf0b;
      expv[30] = 34'h11299cf0b;
      expv[31] = 34'h11299cf0b;
      expv[32] = 34'h11299cf0b;
      expv[33] = 34'h384522641;
      expv[34] = 34'h11299cf0b;
      expv[35] = 34'h3fd921853;
      expv[36] = 34'h11299cf0b;
      expv[37] = 34'h11299cf0b;
      expv[38] = 34'h11299cf0b;
      expv[39] = 34'h3331b05da;
      expv[40] = 34'h11299cf0b;
      expv[41] = 34'h27a0f841a;
      expv[42] = 34'h3eaae6ec0;
      expv[43] = 34'h372a4acc0;
      expv[44] = 34'h3adfb39d6;
      expv[45] = 34'h17a0f841a;
      expv[46] = 34'h17a0f841a;
      expv[47] = 34'h100000000;
      expv[48] = 34'h3268a1c41;
      expv[49] = 34'h100000000;
      expv[50] = 34'h100000000;
      expv[51] = 34'h100000000;
      expv[52] = 34'h0a0240c4e;
      expv[53] = 34'h0a0240c4e;
      expv[54] = 34'h2a0240c4e;
      expv[55] = 34'h1a0240c4e;
      expv[56] = 34'h1a0240c4e;
      expv[57] = 34'h1a0240c4e;
      expv[58] = 34'h344911d38;
      expv[59] = 34'h1a0240c4e;
      expv[60] = 34'h1a0240c4e;
      expv[61] = 34'h1a0240c4e;
      expv[62] = 34'h04be30a52;
      expv[63] = 34'h24be30a52;
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
