// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ROM dut (
    .addr(in_vec[7:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h87;
    stim[1] = 8'h03;
    stim[2] = 8'hd1;
    stim[3] = 8'h3d;
    stim[4] = 8'h78;
    stim[5] = 8'h3a;
    stim[6] = 8'h69;
    stim[7] = 8'h68;
    stim[8] = 8'ha8;
    stim[9] = 8'hf9;
    stim[10] = 8'hbb;
    stim[11] = 8'hd2;
    stim[12] = 8'ha4;
    stim[13] = 8'hd6;
    stim[14] = 8'h55;
    stim[15] = 8'hbe;
    stim[16] = 8'h02;
    stim[17] = 8'h1a;
    stim[18] = 8'hec;
    stim[19] = 8'hb8;
    stim[20] = 8'h64;
    stim[21] = 8'hca;
    stim[22] = 8'hea;
    stim[23] = 8'hb6;
    stim[24] = 8'h86;
    stim[25] = 8'h31;
    stim[26] = 8'h23;
    stim[27] = 8'h6c;
    stim[28] = 8'haf;
    stim[29] = 8'h42;
    stim[30] = 8'h92;
    stim[31] = 8'h33;
    stim[32] = 8'he6;
    stim[33] = 8'h31;
    stim[34] = 8'h02;
    stim[35] = 8'h9a;
    stim[36] = 8'hb7;
    stim[37] = 8'h03;
    stim[38] = 8'h33;
    stim[39] = 8'hdf;
    stim[40] = 8'hf5;
    stim[41] = 8'haa;
    stim[42] = 8'h2e;
    stim[43] = 8'h8b;
    stim[44] = 8'h0f;
    stim[45] = 8'he6;
    stim[46] = 8'h48;
    stim[47] = 8'h28;
    stim[48] = 8'he6;
    stim[49] = 8'h95;
    stim[50] = 8'h92;
    stim[51] = 8'h33;
    stim[52] = 8'h92;
    stim[53] = 8'h9e;
    stim[54] = 8'had;
    stim[55] = 8'h29;
    stim[56] = 8'h44;
    stim[57] = 8'h69;
    stim[58] = 8'h72;
    stim[59] = 8'h7a;
    stim[60] = 8'hd6;
    stim[61] = 8'he2;
    stim[62] = 8'hf2;
    stim[63] = 8'h12;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hd3d3;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hc2c2;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hc2c2;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hd3d3;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
