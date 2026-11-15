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

  gf_mult_by_fd dut (
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
    stim[0] = 8'h1a;
    stim[1] = 8'h32;
    stim[2] = 8'hfb;
    stim[3] = 8'ha8;
    stim[4] = 8'h6c;
    stim[5] = 8'h34;
    stim[6] = 8'h93;
    stim[7] = 8'he6;
    stim[8] = 8'he7;
    stim[9] = 8'h53;
    stim[10] = 8'h83;
    stim[11] = 8'h0a;
    stim[12] = 8'h47;
    stim[13] = 8'h0d;
    stim[14] = 8'h05;
    stim[15] = 8'h50;
    stim[16] = 8'h1f;
    stim[17] = 8'h92;
    stim[18] = 8'hee;
    stim[19] = 8'h39;
    stim[20] = 8'hc7;
    stim[21] = 8'h64;
    stim[22] = 8'hc5;
    stim[23] = 8'hf5;
    stim[24] = 8'ha4;
    stim[25] = 8'h4d;
    stim[26] = 8'hd8;
    stim[27] = 8'hc7;
    stim[28] = 8'h83;
    stim[29] = 8'hb2;
    stim[30] = 8'h56;
    stim[31] = 8'h81;
    stim[32] = 8'h3e;
    stim[33] = 8'h7b;
    stim[34] = 8'h0b;
    stim[35] = 8'hf0;
    stim[36] = 8'h64;
    stim[37] = 8'hdd;
    stim[38] = 8'h71;
    stim[39] = 8'hd3;
    stim[40] = 8'hb6;
    stim[41] = 8'hf6;
    stim[42] = 8'hfc;
    stim[43] = 8'h96;
    stim[44] = 8'h84;
    stim[45] = 8'hdb;
    stim[46] = 8'h51;
    stim[47] = 8'hfc;
    stim[48] = 8'h2d;
    stim[49] = 8'hde;
    stim[50] = 8'h37;
    stim[51] = 8'h43;
    stim[52] = 8'h0b;
    stim[53] = 8'he8;
    stim[54] = 8'h61;
    stim[55] = 8'h59;
    stim[56] = 8'h5c;
    stim[57] = 8'h3d;
    stim[58] = 8'h73;
    stim[59] = 8'hd3;
    stim[60] = 8'h7d;
    stim[61] = 8'hc5;
    stim[62] = 8'hd3;
    stim[63] = 8'ha4;
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
      expv[0] = 8'h37;
      expv[1] = 8'h5a;
      expv[2] = 8'hd2;
      expv[3] = 8'h12;
      expv[4] = 8'h0f;
      expv[5] = 8'h6e;
      expv[6] = 8'h0e;
      expv[7] = 8'h2c;
      expv[8] = 8'hd1;
      expv[9] = 8'hc0;
      expv[10] = 8'h65;
      expv[11] = 8'h5c;
      expv[12] = 8'h78;
      expv[13] = 8'h95;
      expv[14] = 8'h2e;
      expv[15] = 8'hda;
      expv[16] = 8'h19;
      expv[17] = 8'hf3;
      expv[18] = 8'h97;
      expv[19] = 8'hfb;
      expv[20] = 8'h07;
      expv[21] = 8'hb4;
      expv[22] = 8'he0;
      expv[23] = 8'h5d;
      expv[24] = 8'h7a;
      expv[25] = 8'h24;
      expv[26] = 8'h1e;
      expv[27] = 8'h07;
      expv[28] = 8'h65;
      expv[29] = 8'h25;
      expv[30] = 8'hee;
      expv[31] = 8'h82;
      expv[32] = 8'h32;
      expv[33] = 8'had;
      expv[34] = 8'ha1;
      expv[35] = 8'h73;
      expv[36] = 8'hb4;
      expv[37] = 8'h30;
      expv[38] = 8'hf1;
      expv[39] = 8'hbf;
      expv[40] = 8'hf6;
      expv[41] = 8'h47;
      expv[42] = 8'h1b;
      expv[43] = 8'h20;
      expv[44] = 8'hac;
      expv[45] = 8'h04;
      expv[46] = 8'h27;
      expv[47] = 8'h1b;
      expv[48] = 8'h43;
      expv[49] = 8'h2a;
      expv[50] = 8'h74;
      expv[51] = 8'hab;
      expv[52] = 8'ha1;
      expv[53] = 8'ha3;
      expv[54] = 8'h9a;
      expv[55] = 8'h9c;
      expv[56] = 8'hb2;
      expv[57] = 8'h28;
      expv[58] = 8'h16;
      expv[59] = 8'hbf;
      expv[60] = 8'h99;
      expv[61] = 8'he0;
      expv[62] = 8'hbf;
      expv[63] = 8'h7a;
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
