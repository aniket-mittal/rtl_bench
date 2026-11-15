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

  gf_mult_by_97 dut (
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
    stim[0] = 8'haf;
    stim[1] = 8'h6c;
    stim[2] = 8'h8e;
    stim[3] = 8'hbc;
    stim[4] = 8'hbc;
    stim[5] = 8'h47;
    stim[6] = 8'hb9;
    stim[7] = 8'h9d;
    stim[8] = 8'had;
    stim[9] = 8'hfd;
    stim[10] = 8'h00;
    stim[11] = 8'h4d;
    stim[12] = 8'h5d;
    stim[13] = 8'h9d;
    stim[14] = 8'h51;
    stim[15] = 8'hee;
    stim[16] = 8'h9d;
    stim[17] = 8'h3a;
    stim[18] = 8'h21;
    stim[19] = 8'ha4;
    stim[20] = 8'hc0;
    stim[21] = 8'h4d;
    stim[22] = 8'hcb;
    stim[23] = 8'h15;
    stim[24] = 8'h47;
    stim[25] = 8'hfb;
    stim[26] = 8'h39;
    stim[27] = 8'hfa;
    stim[28] = 8'he7;
    stim[29] = 8'h3a;
    stim[30] = 8'hff;
    stim[31] = 8'h0c;
    stim[32] = 8'h6f;
    stim[33] = 8'h79;
    stim[34] = 8'h28;
    stim[35] = 8'hd7;
    stim[36] = 8'h95;
    stim[37] = 8'h7e;
    stim[38] = 8'hee;
    stim[39] = 8'h0c;
    stim[40] = 8'h4e;
    stim[41] = 8'h19;
    stim[42] = 8'h7c;
    stim[43] = 8'hab;
    stim[44] = 8'h05;
    stim[45] = 8'h96;
    stim[46] = 8'hd9;
    stim[47] = 8'h59;
    stim[48] = 8'h6c;
    stim[49] = 8'he1;
    stim[50] = 8'h09;
    stim[51] = 8'h59;
    stim[52] = 8'h79;
    stim[53] = 8'h80;
    stim[54] = 8'h53;
    stim[55] = 8'he6;
    stim[56] = 8'h16;
    stim[57] = 8'h50;
    stim[58] = 8'h1a;
    stim[59] = 8'h56;
    stim[60] = 8'hc4;
    stim[61] = 8'h9b;
    stim[62] = 8'hcb;
    stim[63] = 8'ha9;
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
      expv[0] = 8'h45;
      expv[1] = 8'h93;
      expv[2] = 8'hc5;
      expv[3] = 8'h64;
      expv[4] = 8'h64;
      expv[5] = 8'hec;
      expv[6] = 8'h95;
      expv[7] = 8'he4;
      expv[8] = 8'h76;
      expv[9] = 8'hdd;
      expv[10] = 8'h00;
      expv[11] = 8'h13;
      expv[12] = 8'h96;
      expv[13] = 8'he4;
      expv[14] = 8'h3c;
      expv[15] = 8'hfc;
      expv[16] = 8'he4;
      expv[17] = 8'h6d;
      expv[18] = 8'h80;
      expv[19] = 8'h2d;
      expv[20] = 8'h72;
      expv[21] = 8'h13;
      expv[22] = 8'h1a;
      expv[23] = 8'h74;
      expv[24] = 8'hec;
      expv[25] = 8'h88;
      expv[26] = 8'hc9;
      expv[27] = 8'h1f;
      expv[28] = 8'ha7;
      expv[29] = 8'h6d;
      expv[30] = 8'hee;
      expv[31] = 8'haa;
      expv[32] = 8'h37;
      expv[33] = 8'he7;
      expv[34] = 8'hdb;
      expv[35] = 8'h35;
      expv[36] = 8'h28;
      expv[37] = 8'h25;
      expv[38] = 8'hfc;
      expv[39] = 8'haa;
      expv[40] = 8'hb7;
      expv[41] = 8'hde;
      expv[42] = 8'h16;
      expv[43] = 8'h23;
      expv[44] = 8'hf1;
      expv[45] = 8'h8c;
      expv[46] = 8'hac;
      expv[47] = 8'hf0;
      expv[48] = 8'h93;
      expv[49] = 8'hf2;
      expv[50] = 8'h5b;
      expv[51] = 8'hf0;
      expv[52] = 8'he7;
      expv[53] = 8'h5c;
      expv[54] = 8'h0f;
      expv[55] = 8'h30;
      expv[56] = 8'hd0;
      expv[57] = 8'hab;
      expv[58] = 8'h7a;
      expv[59] = 8'hfe;
      expv[60] = 8'h14;
      expv[61] = 8'hb1;
      expv[62] = 8'h1a;
      expv[63] = 8'h10;
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
