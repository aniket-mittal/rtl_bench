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

  dut dut (
    .clk(clk),
    .d(in_vec[7:0]),
    .q(out_vec[7:0])
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
    stim[1] = 8'h17;
    stim[2] = 8'hfa;
    stim[3] = 8'hac;
    stim[4] = 8'h4e;
    stim[5] = 8'h43;
    stim[6] = 8'h8c;
    stim[7] = 8'ha9;
    stim[8] = 8'hef;
    stim[9] = 8'h63;
    stim[10] = 8'hd3;
    stim[11] = 8'h91;
    stim[12] = 8'h1d;
    stim[13] = 8'h55;
    stim[14] = 8'h3a;
    stim[15] = 8'h46;
    stim[16] = 8'h77;
    stim[17] = 8'h09;
    stim[18] = 8'hc5;
    stim[19] = 8'h32;
    stim[20] = 8'h52;
    stim[21] = 8'h0b;
    stim[22] = 8'h78;
    stim[23] = 8'h16;
    stim[24] = 8'h5e;
    stim[25] = 8'h66;
    stim[26] = 8'hb1;
    stim[27] = 8'h50;
    stim[28] = 8'h3c;
    stim[29] = 8'ha3;
    stim[30] = 8'he9;
    stim[31] = 8'h8f;
    stim[32] = 8'h3e;
    stim[33] = 8'h43;
    stim[34] = 8'h67;
    stim[35] = 8'hc2;
    stim[36] = 8'hef;
    stim[37] = 8'h68;
    stim[38] = 8'h5d;
    stim[39] = 8'h40;
    stim[40] = 8'h3b;
    stim[41] = 8'h6d;
    stim[42] = 8'h3a;
    stim[43] = 8'h1f;
    stim[44] = 8'hbf;
    stim[45] = 8'h0e;
    stim[46] = 8'h38;
    stim[47] = 8'h21;
    stim[48] = 8'h61;
    stim[49] = 8'h85;
    stim[50] = 8'hee;
    stim[51] = 8'h31;
    stim[52] = 8'h6f;
    stim[53] = 8'h9b;
    stim[54] = 8'h22;
    stim[55] = 8'h65;
    stim[56] = 8'h02;
    stim[57] = 8'h8a;
    stim[58] = 8'h6e;
    stim[59] = 8'h38;
    stim[60] = 8'hc3;
    stim[61] = 8'h20;
    stim[62] = 8'h6e;
    stim[63] = 8'hce;
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
      expv[0] = 8'h00;
      expv[1] = 8'h69;
      expv[2] = 8'he8;
      expv[3] = 8'h05;
      expv[4] = 8'h53;
      expv[5] = 8'hb1;
      expv[6] = 8'hbc;
      expv[7] = 8'h73;
      expv[8] = 8'h56;
      expv[9] = 8'h10;
      expv[10] = 8'h9c;
      expv[11] = 8'h2c;
      expv[12] = 8'h6e;
      expv[13] = 8'he2;
      expv[14] = 8'haa;
      expv[15] = 8'hc5;
      expv[16] = 8'hb9;
      expv[17] = 8'h88;
      expv[18] = 8'hf6;
      expv[19] = 8'h3a;
      expv[20] = 8'hcd;
      expv[21] = 8'had;
      expv[22] = 8'hf4;
      expv[23] = 8'h87;
      expv[24] = 8'he9;
      expv[25] = 8'ha1;
      expv[26] = 8'h99;
      expv[27] = 8'h4e;
      expv[28] = 8'haf;
      expv[29] = 8'hc3;
      expv[30] = 8'h5c;
      expv[31] = 8'h16;
      expv[32] = 8'h70;
      expv[33] = 8'hc1;
      expv[34] = 8'hbc;
      expv[35] = 8'h98;
      expv[36] = 8'h3d;
      expv[37] = 8'h10;
      expv[38] = 8'h97;
      expv[39] = 8'ha2;
      expv[40] = 8'hbf;
      expv[41] = 8'hc4;
      expv[42] = 8'h92;
      expv[43] = 8'hc5;
      expv[44] = 8'he0;
      expv[45] = 8'h40;
      expv[46] = 8'hf1;
      expv[47] = 8'hc7;
      expv[48] = 8'hde;
      expv[49] = 8'h9e;
      expv[50] = 8'h7a;
      expv[51] = 8'h11;
      expv[52] = 8'hce;
      expv[53] = 8'h90;
      expv[54] = 8'h64;
      expv[55] = 8'hdd;
      expv[56] = 8'h9a;
      expv[57] = 8'hfd;
      expv[58] = 8'h75;
      expv[59] = 8'h91;
      expv[60] = 8'hc7;
      expv[61] = 8'h3c;
      expv[62] = 8'hdf;
      expv[63] = 8'h91;
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
