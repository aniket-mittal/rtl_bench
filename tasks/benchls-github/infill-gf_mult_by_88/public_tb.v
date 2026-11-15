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

  gf_mult_by_88 dut (
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
    stim[0] = 8'h25;
    stim[1] = 8'h79;
    stim[2] = 8'h41;
    stim[3] = 8'h48;
    stim[4] = 8'hd0;
    stim[5] = 8'h7e;
    stim[6] = 8'h9b;
    stim[7] = 8'h64;
    stim[8] = 8'h75;
    stim[9] = 8'h0f;
    stim[10] = 8'h15;
    stim[11] = 8'h41;
    stim[12] = 8'hea;
    stim[13] = 8'hba;
    stim[14] = 8'h00;
    stim[15] = 8'hff;
    stim[16] = 8'h01;
    stim[17] = 8'h34;
    stim[18] = 8'h0a;
    stim[19] = 8'hfc;
    stim[20] = 8'h79;
    stim[21] = 8'h82;
    stim[22] = 8'ha7;
    stim[23] = 8'hf8;
    stim[24] = 8'h37;
    stim[25] = 8'h7b;
    stim[26] = 8'h5b;
    stim[27] = 8'h55;
    stim[28] = 8'hc2;
    stim[29] = 8'h96;
    stim[30] = 8'ha1;
    stim[31] = 8'h52;
    stim[32] = 8'hab;
    stim[33] = 8'hc6;
    stim[34] = 8'h23;
    stim[35] = 8'h77;
    stim[36] = 8'hfd;
    stim[37] = 8'hdd;
    stim[38] = 8'h9d;
    stim[39] = 8'hdb;
    stim[40] = 8'h89;
    stim[41] = 8'h66;
    stim[42] = 8'h10;
    stim[43] = 8'ha3;
    stim[44] = 8'hb6;
    stim[45] = 8'h16;
    stim[46] = 8'h13;
    stim[47] = 8'he6;
    stim[48] = 8'hc6;
    stim[49] = 8'h35;
    stim[50] = 8'h38;
    stim[51] = 8'hed;
    stim[52] = 8'h34;
    stim[53] = 8'h89;
    stim[54] = 8'hd4;
    stim[55] = 8'hee;
    stim[56] = 8'h68;
    stim[57] = 8'hd6;
    stim[58] = 8'hc6;
    stim[59] = 8'hbd;
    stim[60] = 8'hd4;
    stim[61] = 8'he2;
    stim[62] = 8'ha9;
    stim[63] = 8'h2e;
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
      expv[0] = 8'h42;
      expv[1] = 8'hb9;
      expv[2] = 8'h35;
      expv[3] = 8'h89;
      expv[4] = 8'hb2;
      expv[5] = 8'h26;
      expv[6] = 8'hbe;
      expv[7] = 8'h77;
      expv[8] = 8'h97;
      expv[9] = 8'hab;
      expv[10] = 8'hfa;
      expv[11] = 8'h35;
      expv[12] = 8'h33;
      expv[13] = 8'he6;
      expv[14] = 8'h00;
      expv[15] = 8'hc9;
      expv[16] = 8'h88;
      expv[17] = 8'ha2;
      expv[18] = 8'h39;
      expv[19] = 8'h4c;
      expv[20] = 8'hb9;
      expv[21] = 8'h6a;
      expv[22] = 8'h28;
      expv[23] = 8'h56;
      expv[24] = 8'h27;
      expv[25] = 8'hb4;
      expv[26] = 8'h64;
      expv[27] = 8'h47;
      expv[28] = 8'hd7;
      expv[29] = 8'h18;
      expv[30] = 8'h3f;
      expv[31] = 8'hd8;
      expv[32] = 8'h06;
      expv[33] = 8'hcd;
      expv[34] = 8'h55;
      expv[35] = 8'h9a;
      expv[36] = 8'hc4;
      expv[37] = 8'h14;
      expv[38] = 8'ha9;
      expv[39] = 8'h03;
      expv[40] = 8'hdb;
      expv[41] = 8'h7a;
      expv[42] = 8'h68;
      expv[43] = 8'h32;
      expv[44] = 8'hc8;
      expv[45] = 8'h7f;
      expv[46] = 8'hed;
      expv[47] = 8'h1d;
      expv[48] = 8'hcd;
      expv[49] = 8'h2a;
      expv[50] = 8'h8c;
      expv[51] = 8'hac;
      expv[52] = 8'ha2;
      expv[53] = 8'hdb;
      expv[54] = 8'ha8;
      expv[55] = 8'h29;
      expv[56] = 8'h59;
      expv[57] = 8'ha5;
      expv[58] = 8'hcd;
      expv[59] = 8'h79;
      expv[60] = 8'ha8;
      expv[61] = 8'h07;
      expv[62] = 8'h0b;
      expv[63] = 8'hf3;
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
