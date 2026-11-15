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

  gf_mult_by_de dut (
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
    stim[0] = 8'hf5;
    stim[1] = 8'h59;
    stim[2] = 8'haa;
    stim[3] = 8'h73;
    stim[4] = 8'h7f;
    stim[5] = 8'hb2;
    stim[6] = 8'h58;
    stim[7] = 8'h88;
    stim[8] = 8'hdd;
    stim[9] = 8'h27;
    stim[10] = 8'hfa;
    stim[11] = 8'h0f;
    stim[12] = 8'h63;
    stim[13] = 8'hd1;
    stim[14] = 8'h0c;
    stim[15] = 8'hb0;
    stim[16] = 8'h72;
    stim[17] = 8'h8e;
    stim[18] = 8'h9b;
    stim[19] = 8'h99;
    stim[20] = 8'h18;
    stim[21] = 8'h3c;
    stim[22] = 8'h60;
    stim[23] = 8'hd5;
    stim[24] = 8'h93;
    stim[25] = 8'h27;
    stim[26] = 8'h5e;
    stim[27] = 8'hac;
    stim[28] = 8'h73;
    stim[29] = 8'ha9;
    stim[30] = 8'ha0;
    stim[31] = 8'hd0;
    stim[32] = 8'h0d;
    stim[33] = 8'h27;
    stim[34] = 8'hf0;
    stim[35] = 8'h8e;
    stim[36] = 8'h16;
    stim[37] = 8'h3a;
    stim[38] = 8'h23;
    stim[39] = 8'ha2;
    stim[40] = 8'h30;
    stim[41] = 8'hfb;
    stim[42] = 8'h81;
    stim[43] = 8'h3e;
    stim[44] = 8'hac;
    stim[45] = 8'h40;
    stim[46] = 8'h1f;
    stim[47] = 8'ha4;
    stim[48] = 8'h8b;
    stim[49] = 8'h10;
    stim[50] = 8'hae;
    stim[51] = 8'h35;
    stim[52] = 8'h88;
    stim[53] = 8'ha2;
    stim[54] = 8'h77;
    stim[55] = 8'h96;
    stim[56] = 8'h14;
    stim[57] = 8'hc8;
    stim[58] = 8'h5a;
    stim[59] = 8'h68;
    stim[60] = 8'h22;
    stim[61] = 8'h59;
    stim[62] = 8'h07;
    stim[63] = 8'h51;
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
      expv[0] = 8'h94;
      expv[1] = 8'h98;
      expv[2] = 8'hf2;
      expv[3] = 8'h45;
      expv[4] = 8'ha4;
      expv[5] = 8'h2d;
      expv[6] = 8'h46;
      expv[7] = 8'h91;
      expv[8] = 8'he8;
      expv[9] = 8'he2;
      expv[10] = 8'h0a;
      expv[11] = 8'h9e;
      expv[12] = 8'h24;
      expv[13] = 8'h09;
      expv[14] = 8'he1;
      expv[15] = 8'h8c;
      expv[16] = 8'h9b;
      expv[17] = 8'h6f;
      expv[18] = 8'h8f;
      expv[19] = 8'h2e;
      expv[20] = 8'hdf;
      expv[21] = 8'h42;
      expv[22] = 8'h5b;
      expv[23] = 8'h56;
      expv[24] = 8'h31;
      expv[25] = 8'he2;
      expv[26] = 8'hb8;
      expv[27] = 8'h0c;
      expv[28] = 8'h45;
      expv[29] = 8'h8d;
      expv[30] = 8'hed;
      expv[31] = 8'hd7;
      expv[32] = 8'h3f;
      expv[33] = 8'he2;
      expv[34] = 8'h15;
      expv[35] = 8'h6f;
      expv[36] = 8'h9f;
      expv[37] = 8'hbc;
      expv[38] = 8'hbd;
      expv[39] = 8'h4c;
      expv[40] = 8'ha3;
      expv[41] = 8'hd4;
      expv[42] = 8'hf1;
      expv[43] = 8'he3;
      expv[44] = 8'h0c;
      expv[45] = 8'h99;
      expv[46] = 8'hff;
      expv[47] = 8'hb2;
      expv[48] = 8'hee;
      expv[49] = 8'h61;
      expv[50] = 8'had;
      expv[51] = 8'h22;
      expv[52] = 8'h91;
      expv[53] = 8'h4c;
      expv[54] = 8'h1a;
      expv[55] = 8'hb0;
      expv[56] = 8'h3e;
      expv[57] = 8'h08;
      expv[58] = 8'he7;
      expv[59] = 8'he5;
      expv[60] = 8'h63;
      expv[61] = 8'h98;
      expv[62] = 8'h20;
      expv[63] = 8'h26;
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
