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

  gf_mult_by_df dut (
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
    stim[0] = 8'h96;
    stim[1] = 8'ha7;
    stim[2] = 8'hc6;
    stim[3] = 8'heb;
    stim[4] = 8'h96;
    stim[5] = 8'h60;
    stim[6] = 8'hc1;
    stim[7] = 8'h7f;
    stim[8] = 8'hfc;
    stim[9] = 8'ha5;
    stim[10] = 8'h64;
    stim[11] = 8'h0e;
    stim[12] = 8'h7f;
    stim[13] = 8'he5;
    stim[14] = 8'h87;
    stim[15] = 8'h9b;
    stim[16] = 8'h57;
    stim[17] = 8'h96;
    stim[18] = 8'h6d;
    stim[19] = 8'h1b;
    stim[20] = 8'he6;
    stim[21] = 8'h73;
    stim[22] = 8'hda;
    stim[23] = 8'hde;
    stim[24] = 8'h0d;
    stim[25] = 8'haa;
    stim[26] = 8'ha4;
    stim[27] = 8'hca;
    stim[28] = 8'h42;
    stim[29] = 8'h2d;
    stim[30] = 8'h87;
    stim[31] = 8'hca;
    stim[32] = 8'hd7;
    stim[33] = 8'h71;
    stim[34] = 8'heb;
    stim[35] = 8'h46;
    stim[36] = 8'h01;
    stim[37] = 8'h20;
    stim[38] = 8'h66;
    stim[39] = 8'h9d;
    stim[40] = 8'h65;
    stim[41] = 8'h5d;
    stim[42] = 8'h7d;
    stim[43] = 8'hd8;
    stim[44] = 8'h30;
    stim[45] = 8'ha7;
    stim[46] = 8'h1a;
    stim[47] = 8'h4a;
    stim[48] = 8'h11;
    stim[49] = 8'h0e;
    stim[50] = 8'hf7;
    stim[51] = 8'hb4;
    stim[52] = 8'h66;
    stim[53] = 8'hf6;
    stim[54] = 8'hdf;
    stim[55] = 8'had;
    stim[56] = 8'h1d;
    stim[57] = 8'h75;
    stim[58] = 8'h57;
    stim[59] = 8'h60;
    stim[60] = 8'h4a;
    stim[61] = 8'h42;
    stim[62] = 8'hee;
    stim[63] = 8'h47;
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
      expv[0] = 8'h26;
      expv[1] = 8'h6a;
      expv[2] = 8'h8e;
      expv[3] = 8'h5e;
      expv[4] = 8'h26;
      expv[5] = 8'h3b;
      expv[6] = 8'ha9;
      expv[7] = 8'hdb;
      expv[8] = 8'h08;
      expv[9] = 8'hc9;
      expv[10] = 8'h60;
      expv[11] = 8'h4e;
      expv[12] = 8'hdb;
      expv[13] = 8'h10;
      expv[14] = 8'h88;
      expv[15] = 8'h14;
      expv[16] = 8'h8f;
      expv[17] = 8'h26;
      expv[18] = 8'h09;
      expv[19] = 8'hbb;
      expv[20] = 8'h6c;
      expv[21] = 8'h36;
      expv[22] = 8'h12;
      expv[23] = 8'h49;
      expv[24] = 8'h32;
      expv[25] = 8'h58;
      expv[26] = 8'h16;
      expv[27] = 8'h63;
      expv[28] = 8'h7a;
      expv[29] = 8'hd0;
      expv[30] = 8'h88;
      expv[31] = 8'h63;
      expv[32] = 8'h20;
      expv[33] = 8'h95;
      expv[34] = 8'h5e;
      expv[35] = 8'h21;
      expv[36] = 8'hdf;
      expv[37] = 8'he2;
      expv[38] = 8'hc3;
      expv[39] = 8'hec;
      expv[40] = 8'hbf;
      expv[41] = 8'h9a;
      expv[42] = 8'h78;
      expv[43] = 8'hb1;
      expv[44] = 8'h93;
      expv[45] = 8'h6a;
      expv[46] = 8'h64;
      expv[47] = 8'hcc;
      expv[48] = 8'hae;
      expv[49] = 8'h4e;
      expv[50] = 8'hc2;
      expv[51] = 8'h67;
      expv[52] = 8'hc3;
      expv[53] = 8'h1d;
      expv[54] = 8'h96;
      expv[55] = 8'h7f;
      expv[56] = 8'h43;
      expv[57] = 8'hce;
      expv[58] = 8'h8f;
      expv[59] = 8'h3b;
      expv[60] = 8'hcc;
      expv[61] = 8'h7a;
      expv[62] = 8'hda;
      expv[63] = 8'hfe;
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
