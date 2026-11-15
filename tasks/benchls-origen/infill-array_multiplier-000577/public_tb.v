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

  origen_000577 dut (
    .in1(in_vec[7:4]),
    .in2(in_vec[3:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h5a;
    stim[1] = 8'h74;
    stim[2] = 8'hc9;
    stim[3] = 8'h54;
    stim[4] = 8'h06;
    stim[5] = 8'h48;
    stim[6] = 8'h1f;
    stim[7] = 8'h3e;
    stim[8] = 8'h6a;
    stim[9] = 8'hcc;
    stim[10] = 8'h55;
    stim[11] = 8'h33;
    stim[12] = 8'hcc;
    stim[13] = 8'h7d;
    stim[14] = 8'h7b;
    stim[15] = 8'h82;
    stim[16] = 8'h7b;
    stim[17] = 8'h4e;
    stim[18] = 8'h21;
    stim[19] = 8'hc1;
    stim[20] = 8'hb4;
    stim[21] = 8'h39;
    stim[22] = 8'h31;
    stim[23] = 8'h73;
    stim[24] = 8'hf7;
    stim[25] = 8'h60;
    stim[26] = 8'h09;
    stim[27] = 8'h0a;
    stim[28] = 8'h40;
    stim[29] = 8'h05;
    stim[30] = 8'hf6;
    stim[31] = 8'hfc;
    stim[32] = 8'hfe;
    stim[33] = 8'hed;
    stim[34] = 8'hdf;
    stim[35] = 8'h31;
    stim[36] = 8'h08;
    stim[37] = 8'hc9;
    stim[38] = 8'h2d;
    stim[39] = 8'h13;
    stim[40] = 8'h61;
    stim[41] = 8'ha9;
    stim[42] = 8'h48;
    stim[43] = 8'hd6;
    stim[44] = 8'hd2;
    stim[45] = 8'h5d;
    stim[46] = 8'h94;
    stim[47] = 8'h4c;
    stim[48] = 8'hf2;
    stim[49] = 8'he8;
    stim[50] = 8'h2d;
    stim[51] = 8'h2c;
    stim[52] = 8'h71;
    stim[53] = 8'h97;
    stim[54] = 8'hfb;
    stim[55] = 8'h4b;
    stim[56] = 8'h03;
    stim[57] = 8'h06;
    stim[58] = 8'h7e;
    stim[59] = 8'h1f;
    stim[60] = 8'hac;
    stim[61] = 8'h6c;
    stim[62] = 8'hb8;
    stim[63] = 8'he8;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'h0x;
      expv[5] = 8'hxx;
      expv[6] = 8'h0x;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'h0x;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'h0x;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'h0x;
      expv[19] = 8'h0x;
      expv[20] = 8'h0x;
      expv[21] = 8'hxx;
      expv[22] = 8'h0x;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'h0x;
      expv[26] = 8'h0x;
      expv[27] = 8'h0x;
      expv[28] = 8'h0x;
      expv[29] = 8'h0x;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'h0x;
      expv[36] = 8'h0x;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'h0x;
      expv[40] = 8'h0x;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'h0x;
      expv[45] = 8'hxx;
      expv[46] = 8'h0x;
      expv[47] = 8'hxx;
      expv[48] = 8'h0x;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'h0x;
      expv[53] = 8'h0x;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'h0x;
      expv[57] = 8'h0x;
      expv[58] = 8'hxx;
      expv[59] = 8'h0x;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
