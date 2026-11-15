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

  gf_mult_by_a7 dut (
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
    stim[0] = 8'he7;
    stim[1] = 8'h41;
    stim[2] = 8'hbc;
    stim[3] = 8'h88;
    stim[4] = 8'h53;
    stim[5] = 8'h98;
    stim[6] = 8'hbf;
    stim[7] = 8'h05;
    stim[8] = 8'he9;
    stim[9] = 8'h49;
    stim[10] = 8'hcc;
    stim[11] = 8'h73;
    stim[12] = 8'he9;
    stim[13] = 8'hf5;
    stim[14] = 8'h38;
    stim[15] = 8'h23;
    stim[16] = 8'h7c;
    stim[17] = 8'hc9;
    stim[18] = 8'h72;
    stim[19] = 8'h5e;
    stim[20] = 8'hfd;
    stim[21] = 8'ha7;
    stim[22] = 8'hac;
    stim[23] = 8'h3e;
    stim[24] = 8'h0c;
    stim[25] = 8'h28;
    stim[26] = 8'hc3;
    stim[27] = 8'h6c;
    stim[28] = 8'h76;
    stim[29] = 8'hd6;
    stim[30] = 8'hf4;
    stim[31] = 8'h7e;
    stim[32] = 8'h01;
    stim[33] = 8'hc4;
    stim[34] = 8'hcf;
    stim[35] = 8'h51;
    stim[36] = 8'h0c;
    stim[37] = 8'h8c;
    stim[38] = 8'hbd;
    stim[39] = 8'h93;
    stim[40] = 8'h85;
    stim[41] = 8'hbd;
    stim[42] = 8'hdf;
    stim[43] = 8'hd0;
    stim[44] = 8'hf4;
    stim[45] = 8'h13;
    stim[46] = 8'h71;
    stim[47] = 8'hb0;
    stim[48] = 8'hfd;
    stim[49] = 8'h8c;
    stim[50] = 8'h87;
    stim[51] = 8'h99;
    stim[52] = 8'h9f;
    stim[53] = 8'h5d;
    stim[54] = 8'h64;
    stim[55] = 8'ha5;
    stim[56] = 8'h54;
    stim[57] = 8'hd7;
    stim[58] = 8'h57;
    stim[59] = 8'h32;
    stim[60] = 8'he7;
    stim[61] = 8'h61;
    stim[62] = 8'hfb;
    stim[63] = 8'ha1;
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
      expv[0] = 8'hc0;
      expv[1] = 8'h15;
      expv[2] = 8'h75;
      expv[3] = 8'h28;
      expv[4] = 8'he4;
      expv[5] = 8'h8a;
      expv[6] = 8'h81;
      expv[7] = 8'h01;
      expv[8] = 8'h64;
      expv[9] = 8'h44;
      expv[10] = 8'h3c;
      expv[11] = 8'hbd;
      expv[12] = 8'h64;
      expv[13] = 8'h31;
      expv[14] = 8'haa;
      expv[15] = 8'had;
      expv[16] = 8'hbe;
      expv[17] = 8'h3d;
      expv[18] = 8'h1a;
      expv[19] = 8'hb4;
      expv[20] = 8'h60;
      expv[21] = 8'h72;
      expv[22] = 8'hd7;
      expv[23] = 8'h5f;
      expv[24] = 8'hf7;
      expv[25] = 8'h08;
      expv[26] = 8'h3f;
      expv[27] = 8'h1c;
      expv[28] = 8'hbc;
      expv[29] = 8'h9c;
      expv[30] = 8'h96;
      expv[31] = 8'hed;
      expv[32] = 8'ha7;
      expv[33] = 8'h6d;
      expv[34] = 8'hc8;
      expv[35] = 8'hb7;
      expv[36] = 8'hf7;
      expv[37] = 8'h8e;
      expv[38] = 8'hd2;
      expv[39] = 8'h2f;
      expv[40] = 8'h78;
      expv[41] = 8'hd2;
      expv[42] = 8'h6a;
      expv[43] = 8'h69;
      expv[44] = 8'h96;
      expv[45] = 8'h56;
      expv[46] = 8'hee;
      expv[47] = 8'h82;
      expv[48] = 8'h60;
      expv[49] = 8'h8e;
      expv[50] = 8'h2b;
      expv[51] = 8'h2d;
      expv[52] = 8'hd8;
      expv[53] = 8'h40;
      expv[54] = 8'h4d;
      expv[55] = 8'h21;
      expv[56] = 8'hb6;
      expv[57] = 8'h3b;
      expv[58] = 8'h42;
      expv[59] = 8'ha8;
      expv[60] = 8'hc0;
      expv[61] = 8'h4c;
      expv[62] = 8'h95;
      expv[63] = 8'h87;
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
