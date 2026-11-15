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

  gf_mult_by_ab dut (
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
    stim[0] = 8'ha2;
    stim[1] = 8'hd2;
    stim[2] = 8'h15;
    stim[3] = 8'h04;
    stim[4] = 8'hfd;
    stim[5] = 8'hd7;
    stim[6] = 8'hcc;
    stim[7] = 8'h8f;
    stim[8] = 8'h05;
    stim[9] = 8'h7a;
    stim[10] = 8'h9c;
    stim[11] = 8'h5d;
    stim[12] = 8'hb9;
    stim[13] = 8'h6c;
    stim[14] = 8'hbf;
    stim[15] = 8'heb;
    stim[16] = 8'h32;
    stim[17] = 8'hd8;
    stim[18] = 8'h85;
    stim[19] = 8'h2e;
    stim[20] = 8'h46;
    stim[21] = 8'hf8;
    stim[22] = 8'h4a;
    stim[23] = 8'h49;
    stim[24] = 8'h40;
    stim[25] = 8'h4c;
    stim[26] = 8'hbc;
    stim[27] = 8'h45;
    stim[28] = 8'h34;
    stim[29] = 8'h09;
    stim[30] = 8'h4c;
    stim[31] = 8'h2a;
    stim[32] = 8'h90;
    stim[33] = 8'h06;
    stim[34] = 8'hb9;
    stim[35] = 8'h35;
    stim[36] = 8'h97;
    stim[37] = 8'hd2;
    stim[38] = 8'h68;
    stim[39] = 8'hfd;
    stim[40] = 8'h53;
    stim[41] = 8'hd0;
    stim[42] = 8'h49;
    stim[43] = 8'h23;
    stim[44] = 8'h47;
    stim[45] = 8'h9f;
    stim[46] = 8'hd3;
    stim[47] = 8'hc2;
    stim[48] = 8'h51;
    stim[49] = 8'h73;
    stim[50] = 8'h04;
    stim[51] = 8'hf8;
    stim[52] = 8'he2;
    stim[53] = 8'hbc;
    stim[54] = 8'h6d;
    stim[55] = 8'h9c;
    stim[56] = 8'h56;
    stim[57] = 8'h99;
    stim[58] = 8'h02;
    stim[59] = 8'h55;
    stim[60] = 8'h8a;
    stim[61] = 8'h79;
    stim[62] = 8'h25;
    stim[63] = 8'h37;
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
      expv[0] = 8'hb8;
      expv[1] = 8'h8b;
      expv[2] = 8'h5f;
      expv[3] = 8'h96;
      expv[4] = 8'h08;
      expv[5] = 8'hb6;
      expv[6] = 8'h05;
      expv[7] = 8'h70;
      expv[8] = 8'h3d;
      expv[9] = 8'h49;
      expv[10] = 8'hf2;
      expv[11] = 8'hfb;
      expv[12] = 8'h0b;
      expv[13] = 8'hf6;
      expv[14] = 8'hd6;
      expv[15] = 8'hb7;
      expv[16] = 8'hed;
      expv[17] = 8'hf1;
      expv[18] = 8'h0a;
      expv[19] = 8'h28;
      expv[20] = 8'h48;
      expv[21] = 8'h35;
      expv[22] = 8'hef;
      expv[23] = 8'h0f;
      expv[24] = 8'h95;
      expv[25] = 8'h32;
      expv[26] = 8'h36;
      expv[27] = 8'ha8;
      expv[28] = 8'h30;
      expv[29] = 8'h9a;
      expv[30] = 8'h32;
      expv[31] = 8'hbe;
      expv[32] = 8'h55;
      expv[33] = 8'hdd;
      expv[34] = 8'h0b;
      expv[35] = 8'h9b;
      expv[36] = 8'h23;
      expv[37] = 8'h8b;
      expv[38] = 8'h60;
      expv[39] = 8'h08;
      expv[40] = 8'h17;
      expv[41] = 8'hc0;
      expv[42] = 8'h0f;
      expv[43] = 8'h24;
      expv[44] = 8'he3;
      expv[45] = 8'h12;
      expv[46] = 8'h20;
      expv[47] = 8'he9;
      expv[48] = 8'h5c;
      expv[49] = 8'hd3;
      expv[50] = 8'h96;
      expv[51] = 8'h35;
      expv[52] = 8'h2d;
      expv[53] = 8'h36;
      expv[54] = 8'h5d;
      expv[55] = 8'hf2;
      expv[56] = 8'h2a;
      expv[57] = 8'hcf;
      expv[58] = 8'h4b;
      expv[59] = 8'hca;
      expv[60] = 8'h4d;
      expv[61] = 8'ha9;
      expv[62] = 8'hf9;
      expv[63] = 8'hd0;
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
