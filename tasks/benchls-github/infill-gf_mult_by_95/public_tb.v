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

  gf_mult_by_95 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h4e;
    stim[1] = 8'h8d;
    stim[2] = 8'h22;
    stim[3] = 8'h46;
    stim[4] = 8'hf4;
    stim[5] = 8'h88;
    stim[6] = 8'hd1;
    stim[7] = 8'hc1;
    stim[8] = 8'h88;
    stim[9] = 8'h59;
    stim[10] = 8'hf8;
    stim[11] = 8'hb9;
    stim[12] = 8'hfd;
    stim[13] = 8'h3a;
    stim[14] = 8'hda;
    stim[15] = 8'h5b;
    stim[16] = 8'h7a;
    stim[17] = 8'h65;
    stim[18] = 8'he1;
    stim[19] = 8'h7a;
    stim[20] = 8'hb0;
    stim[21] = 8'h10;
    stim[22] = 8'he9;
    stim[23] = 8'hd9;
    stim[24] = 8'hf6;
    stim[25] = 8'h93;
    stim[26] = 8'h2a;
    stim[27] = 8'he7;
    stim[28] = 8'hc4;
    stim[29] = 8'hc6;
    stim[30] = 8'h7d;
    stim[31] = 8'he1;
    stim[32] = 8'he6;
    stim[33] = 8'h07;
    stim[34] = 8'h52;
    stim[35] = 8'h25;
    stim[36] = 8'h3e;
    stim[37] = 8'haf;
    stim[38] = 8'he8;
    stim[39] = 8'h70;
    stim[40] = 8'h26;
    stim[41] = 8'hc6;
    stim[42] = 8'h13;
    stim[43] = 8'h14;
    stim[44] = 8'hc4;
    stim[45] = 8'he0;
    stim[46] = 8'h2a;
    stim[47] = 8'h95;
    stim[48] = 8'h4c;
    stim[49] = 8'he3;
    stim[50] = 8'h3f;
    stim[51] = 8'hb8;
    stim[52] = 8'h39;
    stim[53] = 8'h18;
    stim[54] = 8'h68;
    stim[55] = 8'hd8;
    stim[56] = 8'h30;
    stim[57] = 8'hc4;
    stim[58] = 8'h2b;
    stim[59] = 8'h03;
    stim[60] = 8'h27;
    stim[61] = 8'hcf;
    stim[62] = 8'h8f;
    stim[63] = 8'h5e;
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
      expv[0] = 8'h2b;
      expv[1] = 8'h66;
      expv[2] = 8'h60;
      expv[3] = 8'hf7;
      expv[4] = 8'h73;
      expv[5] = 8'h9d;
      expv[6] = 8'hdf;
      expv[7] = 8'h7a;
      expv[8] = 8'h9d;
      expv[9] = 8'h42;
      expv[10] = 8'hc1;
      expv[11] = 8'hfa;
      expv[12] = 8'h3a;
      expv[13] = 8'h19;
      expv[14] = 8'ha1;
      expv[15] = 8'h75;
      expv[16] = 8'hb7;
      expv[17] = 8'h02;
      expv[18] = 8'h2d;
      expv[19] = 8'hb7;
      expv[20] = 8'hb3;
      expv[21] = 8'ha5;
      expv[22] = 8'hf1;
      expv[23] = 8'h03;
      expv[24] = 8'h44;
      expv[25] = 8'h46;
      expv[26] = 8'hbc;
      expv[27] = 8'h74;
      expv[28] = 8'h81;
      expv[29] = 8'hb6;
      expv[30] = 8'h7b;
      expv[31] = 8'h2d;
      expv[32] = 8'he1;
      expv[33] = 8'hcc;
      expv[34] = 8'h3c;
      expv[35] = 8'hac;
      expv[36] = 8'h77;
      expv[37] = 8'h06;
      expv[38] = 8'h64;
      expv[39] = 8'h5c;
      expv[40] = 8'h0e;
      expv[41] = 8'hb6;
      expv[42] = 8'h07;
      expv[43] = 8'hcb;
      expv[44] = 8'h81;
      expv[45] = 8'hb8;
      expv[46] = 8'hbc;
      expv[47] = 8'h1f;
      expv[48] = 8'h1c;
      expv[49] = 8'h1a;
      expv[50] = 8'he2;
      expv[51] = 8'h6f;
      expv[52] = 8'hbb;
      expv[53] = 8'h79;
      expv[54] = 8'h25;
      expv[55] = 8'h96;
      expv[56] = 8'hf2;
      expv[57] = 8'h81;
      expv[58] = 8'h29;
      expv[59] = 8'ha2;
      expv[60] = 8'h9b;
      expv[61] = 8'hff;
      expv[62] = 8'h51;
      expv[63] = 8'h8e;
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
