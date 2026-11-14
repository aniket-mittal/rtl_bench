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
    stim[0] = 8'h77;
    stim[1] = 8'h2f;
    stim[2] = 8'hdd;
    stim[3] = 8'h69;
    stim[4] = 8'h92;
    stim[5] = 8'h37;
    stim[6] = 8'h95;
    stim[7] = 8'hbd;
    stim[8] = 8'hb3;
    stim[9] = 8'ha0;
    stim[10] = 8'h18;
    stim[11] = 8'hde;
    stim[12] = 8'h61;
    stim[13] = 8'h34;
    stim[14] = 8'h27;
    stim[15] = 8'h3c;
    stim[16] = 8'hd4;
    stim[17] = 8'h73;
    stim[18] = 8'h12;
    stim[19] = 8'hc7;
    stim[20] = 8'hdd;
    stim[21] = 8'h0a;
    stim[22] = 8'h72;
    stim[23] = 8'h1d;
    stim[24] = 8'ha1;
    stim[25] = 8'hb7;
    stim[26] = 8'hf7;
    stim[27] = 8'h44;
    stim[28] = 8'h72;
    stim[29] = 8'h72;
    stim[30] = 8'h7d;
    stim[31] = 8'h1f;
    stim[32] = 8'h97;
    stim[33] = 8'hf4;
    stim[34] = 8'h0e;
    stim[35] = 8'h1b;
    stim[36] = 8'haa;
    stim[37] = 8'h32;
    stim[38] = 8'hbe;
    stim[39] = 8'h42;
    stim[40] = 8'hb5;
    stim[41] = 8'hca;
    stim[42] = 8'h12;
    stim[43] = 8'hdf;
    stim[44] = 8'hc3;
    stim[45] = 8'hc8;
    stim[46] = 8'h1e;
    stim[47] = 8'h25;
    stim[48] = 8'hc3;
    stim[49] = 8'hc9;
    stim[50] = 8'h8a;
    stim[51] = 8'he5;
    stim[52] = 8'hd1;
    stim[53] = 8'h5f;
    stim[54] = 8'hbb;
    stim[55] = 8'h7c;
    stim[56] = 8'h7b;
    stim[57] = 8'hfe;
    stim[58] = 8'h1c;
    stim[59] = 8'h48;
    stim[60] = 8'h8a;
    stim[61] = 8'hec;
    stim[62] = 8'h33;
    stim[63] = 8'hf8;
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
      expv[1] = 8'h77;
      expv[2] = 8'h2f;
      expv[3] = 8'h5d;
      expv[4] = 8'h69;
      expv[5] = 8'h12;
      expv[6] = 8'h37;
      expv[7] = 8'h15;
      expv[8] = 8'h3d;
      expv[9] = 8'h33;
      expv[10] = 8'h20;
      expv[11] = 8'h18;
      expv[12] = 8'h5e;
      expv[13] = 8'h61;
      expv[14] = 8'h34;
      expv[15] = 8'h27;
      expv[16] = 8'h3c;
      expv[17] = 8'h54;
      expv[18] = 8'h73;
      expv[19] = 8'h12;
      expv[20] = 8'h47;
      expv[21] = 8'h5d;
      expv[22] = 8'h0a;
      expv[23] = 8'h72;
      expv[24] = 8'h1d;
      expv[25] = 8'h21;
      expv[26] = 8'h37;
      expv[27] = 8'h77;
      expv[28] = 8'h44;
      expv[29] = 8'h72;
      expv[30] = 8'h72;
      expv[31] = 8'h7d;
      expv[32] = 8'h1f;
      expv[33] = 8'h17;
      expv[34] = 8'h74;
      expv[35] = 8'h0e;
      expv[36] = 8'h1b;
      expv[37] = 8'h2a;
      expv[38] = 8'h32;
      expv[39] = 8'h3e;
      expv[40] = 8'h42;
      expv[41] = 8'h35;
      expv[42] = 8'h4a;
      expv[43] = 8'h12;
      expv[44] = 8'h5f;
      expv[45] = 8'h43;
      expv[46] = 8'h48;
      expv[47] = 8'h1e;
      expv[48] = 8'h25;
      expv[49] = 8'h43;
      expv[50] = 8'h49;
      expv[51] = 8'h0a;
      expv[52] = 8'h65;
      expv[53] = 8'h51;
      expv[54] = 8'h5f;
      expv[55] = 8'h3b;
      expv[56] = 8'h7c;
      expv[57] = 8'h7b;
      expv[58] = 8'h7e;
      expv[59] = 8'h1c;
      expv[60] = 8'h48;
      expv[61] = 8'h0a;
      expv[62] = 8'h6c;
      expv[63] = 8'h33;
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
