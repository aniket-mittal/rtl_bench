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

  gf_mult_by_ac dut (
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
    stim[0] = 8'hdc;
    stim[1] = 8'h49;
    stim[2] = 8'hdc;
    stim[3] = 8'hc5;
    stim[4] = 8'h48;
    stim[5] = 8'h52;
    stim[6] = 8'h6e;
    stim[7] = 8'h49;
    stim[8] = 8'ha5;
    stim[9] = 8'hcf;
    stim[10] = 8'h8d;
    stim[11] = 8'hb2;
    stim[12] = 8'h86;
    stim[13] = 8'h4e;
    stim[14] = 8'h83;
    stim[15] = 8'he3;
    stim[16] = 8'h87;
    stim[17] = 8'hd2;
    stim[18] = 8'he0;
    stim[19] = 8'h03;
    stim[20] = 8'hfd;
    stim[21] = 8'hee;
    stim[22] = 8'h33;
    stim[23] = 8'h4a;
    stim[24] = 8'hf6;
    stim[25] = 8'h61;
    stim[26] = 8'hb6;
    stim[27] = 8'hea;
    stim[28] = 8'h4d;
    stim[29] = 8'h11;
    stim[30] = 8'h17;
    stim[31] = 8'h8d;
    stim[32] = 8'hf8;
    stim[33] = 8'h49;
    stim[34] = 8'h26;
    stim[35] = 8'had;
    stim[36] = 8'h9c;
    stim[37] = 8'h30;
    stim[38] = 8'h1f;
    stim[39] = 8'hfb;
    stim[40] = 8'h50;
    stim[41] = 8'hf4;
    stim[42] = 8'hb1;
    stim[43] = 8'h21;
    stim[44] = 8'h82;
    stim[45] = 8'hf1;
    stim[46] = 8'hc6;
    stim[47] = 8'h46;
    stim[48] = 8'hc2;
    stim[49] = 8'h9d;
    stim[50] = 8'hf5;
    stim[51] = 8'h68;
    stim[52] = 8'hbc;
    stim[53] = 8'hcb;
    stim[54] = 8'h9b;
    stim[55] = 8'h74;
    stim[56] = 8'h2d;
    stim[57] = 8'h04;
    stim[58] = 8'h27;
    stim[59] = 8'he4;
    stim[60] = 8'h4a;
    stim[61] = 8'he3;
    stim[62] = 8'h46;
    stim[63] = 8'h44;
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
      expv[0] = 8'h49;
      expv[1] = 8'hed;
      expv[2] = 8'h49;
      expv[3] = 8'hfe;
      expv[4] = 8'h41;
      expv[5] = 8'h1f;
      expv[6] = 8'haa;
      expv[7] = 8'hed;
      expv[8] = 8'h92;
      expv[9] = 8'hb2;
      expv[10] = 8'hbf;
      expv[11] = 8'he3;
      expv[12] = 8'h5f;
      expv[13] = 8'h8e;
      expv[14] = 8'h79;
      expv[15] = 8'h15;
      expv[16] = 8'hf3;
      expv[17] = 8'h8f;
      expv[18] = 8'hfc;
      expv[19] = 8'he9;
      expv[20] = 8'hc1;
      expv[21] = 8'h3a;
      expv[22] = 8'hdf;
      expv[23] = 8'h04;
      expv[24] = 8'h21;
      expv[25] = 8'hc0;
      expv[26] = 8'h69;
      expv[27] = 8'hb0;
      expv[28] = 8'h67;
      expv[29] = 8'hbe;
      expv[30] = 8'h71;
      expv[31] = 8'hbf;
      expv[32] = 8'he7;
      expv[33] = 8'hed;
      expv[34] = 8'heb;
      expv[35] = 8'h9b;
      expv[36] = 8'h01;
      expv[37] = 8'h36;
      expv[38] = 8'h78;
      expv[39] = 8'h0e;
      expv[40] = 8'h5a;
      expv[41] = 8'h64;
      expv[42] = 8'h0a;
      expv[43] = 8'h88;
      expv[44] = 8'hd5;
      expv[45] = 8'h42;
      expv[46] = 8'h17;
      expv[47] = 8'h87;
      expv[48] = 8'h9d;
      expv[49] = 8'had;
      expv[50] = 8'hc8;
      expv[51] = 8'h65;
      expv[52] = 8'h25;
      expv[53] = 8'h38;
      expv[54] = 8'h62;
      expv[55] = 8'hf4;
      expv[56] = 8'h0b;
      expv[57] = 8'h8a;
      expv[58] = 8'h47;
      expv[59] = 8'h76;
      expv[60] = 8'h04;
      expv[61] = 8'h15;
      expv[62] = 8'h87;
      expv[63] = 8'hc2;
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
