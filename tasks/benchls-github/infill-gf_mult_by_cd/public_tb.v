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

  gf_mult_by_cd dut (
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
    stim[0] = 8'h8f;
    stim[1] = 8'h84;
    stim[2] = 8'he9;
    stim[3] = 8'hdf;
    stim[4] = 8'h70;
    stim[5] = 8'h10;
    stim[6] = 8'h30;
    stim[7] = 8'hf6;
    stim[8] = 8'hc8;
    stim[9] = 8'hda;
    stim[10] = 8'h15;
    stim[11] = 8'hb6;
    stim[12] = 8'hd3;
    stim[13] = 8'h6d;
    stim[14] = 8'hc5;
    stim[15] = 8'hb9;
    stim[16] = 8'hf7;
    stim[17] = 8'he3;
    stim[18] = 8'he4;
    stim[19] = 8'hc9;
    stim[20] = 8'hd6;
    stim[21] = 8'ha6;
    stim[22] = 8'h00;
    stim[23] = 8'hcd;
    stim[24] = 8'h6e;
    stim[25] = 8'hee;
    stim[26] = 8'hcf;
    stim[27] = 8'had;
    stim[28] = 8'he7;
    stim[29] = 8'hd7;
    stim[30] = 8'h05;
    stim[31] = 8'ha6;
    stim[32] = 8'haf;
    stim[33] = 8'h05;
    stim[34] = 8'h50;
    stim[35] = 8'hcc;
    stim[36] = 8'hff;
    stim[37] = 8'he8;
    stim[38] = 8'h32;
    stim[39] = 8'h0c;
    stim[40] = 8'h69;
    stim[41] = 8'h54;
    stim[42] = 8'hf5;
    stim[43] = 8'hb6;
    stim[44] = 8'hf3;
    stim[45] = 8'hf0;
    stim[46] = 8'hfc;
    stim[47] = 8'he5;
    stim[48] = 8'h70;
    stim[49] = 8'hf3;
    stim[50] = 8'h7a;
    stim[51] = 8'h45;
    stim[52] = 8'h61;
    stim[53] = 8'hca;
    stim[54] = 8'h2b;
    stim[55] = 8'h5e;
    stim[56] = 8'h02;
    stim[57] = 8'he9;
    stim[58] = 8'h05;
    stim[59] = 8'hff;
    stim[60] = 8'h94;
    stim[61] = 8'h24;
    stim[62] = 8'ha0;
    stim[63] = 8'ha2;
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
      expv[0] = 8'h25;
      expv[1] = 8'h49;
      expv[2] = 8'h04;
      expv[3] = 8'h44;
      expv[4] = 8'hf9;
      expv[5] = 8'h4c;
      expv[6] = 8'hd4;
      expv[7] = 8'h37;
      expv[8] = 8'h51;
      expv[9] = 8'h9a;
      expv[10] = 8'h92;
      expv[11] = 8'h1a;
      expv[12] = 8'h71;
      expv[13] = 8'h4d;
      expv[14] = 8'ha9;
      expv[15] = 8'h65;
      expv[16] = 8'hfa;
      expv[17] = 8'ha5;
      expv[18] = 8'hfc;
      expv[19] = 8'h9c;
      expv[20] = 8'haf;
      expv[21] = 8'h56;
      expv[22] = 8'h00;
      expv[23] = 8'h8f;
      expv[24] = 8'h07;
      expv[25] = 8'h5d;
      expv[26] = 8'h08;
      expv[27] = 8'h3a;
      expv[28] = 8'hb6;
      expv[29] = 8'h62;
      expv[30] = 8'hde;
      expv[31] = 8'h56;
      expv[32] = 8'hbd;
      expv[33] = 8'hde;
      expv[34] = 8'h61;
      expv[35] = 8'h42;
      expv[36] = 8'hdc;
      expv[37] = 8'hc9;
      expv[38] = 8'h53;
      expv[39] = 8'h35;
      expv[40] = 8'h5e;
      expv[41] = 8'h72;
      expv[42] = 8'h7d;
      expv[43] = 8'h1a;
      expv[44] = 8'he9;
      expv[45] = 8'ha3;
      expv[46] = 8'h96;
      expv[47] = 8'h31;
      expv[48] = 8'hf9;
      expv[49] = 8'he9;
      expv[50] = 8'h58;
      expv[51] = 8'hf3;
      expv[52] = 8'h78;
      expv[53] = 8'hd6;
      expv[54] = 8'hf4;
      expv[55] = 8'hd3;
      expv[56] = 8'h87;
      expv[57] = 8'h04;
      expv[58] = 8'hde;
      expv[59] = 8'hdc;
      expv[60] = 8'h05;
      expv[61] = 8'h8b;
      expv[62] = 8'hc2;
      expv[63] = 8'h45;
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
