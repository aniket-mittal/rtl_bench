// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07358 dut (
    .In0(in_vec[6:6]),
    .In1(in_vec[5:5]),
    .In2(in_vec[4:4]),
    .In3(in_vec[3:3]),
    .In4(in_vec[2:2]),
    .In5(in_vec[1:1]),
    .In6(in_vec[0:0]),
    .dout(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h00;
    stim[1] = 7'h27;
    stim[2] = 7'h58;
    stim[3] = 7'h43;
    stim[4] = 7'h28;
    stim[5] = 7'h1d;
    stim[6] = 7'h29;
    stim[7] = 7'h04;
    stim[8] = 7'h36;
    stim[9] = 7'h6a;
    stim[10] = 7'h6b;
    stim[11] = 7'h66;
    stim[12] = 7'h45;
    stim[13] = 7'h14;
    stim[14] = 7'h12;
    stim[15] = 7'h6e;
    stim[16] = 7'h50;
    stim[17] = 7'h65;
    stim[18] = 7'h42;
    stim[19] = 7'h71;
    stim[20] = 7'h53;
    stim[21] = 7'h32;
    stim[22] = 7'h5e;
    stim[23] = 7'h3e;
    stim[24] = 7'h20;
    stim[25] = 7'h29;
    stim[26] = 7'h0d;
    stim[27] = 7'h1e;
    stim[28] = 7'h27;
    stim[29] = 7'h4e;
    stim[30] = 7'h5d;
    stim[31] = 7'h0e;
    stim[32] = 7'h4c;
    stim[33] = 7'h53;
    stim[34] = 7'h40;
    stim[35] = 7'h74;
    stim[36] = 7'h16;
    stim[37] = 7'h39;
    stim[38] = 7'h5d;
    stim[39] = 7'h4e;
    stim[40] = 7'h70;
    stim[41] = 7'h7b;
    stim[42] = 7'h53;
    stim[43] = 7'h13;
    stim[44] = 7'h1d;
    stim[45] = 7'h19;
    stim[46] = 7'h6a;
    stim[47] = 7'h63;
    stim[48] = 7'h74;
    stim[49] = 7'h02;
    stim[50] = 7'h3d;
    stim[51] = 7'h11;
    stim[52] = 7'h2c;
    stim[53] = 7'h2c;
    stim[54] = 7'h47;
    stim[55] = 7'h70;
    stim[56] = 7'h53;
    stim[57] = 7'h54;
    stim[58] = 7'h43;
    stim[59] = 7'h74;
    stim[60] = 7'h64;
    stim[61] = 7'h12;
    stim[62] = 7'h13;
    stim[63] = 7'h09;
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
      expv[0] = 7'h00;
      expv[1] = 7'h72;
      expv[2] = 7'h0d;
      expv[3] = 7'h61;
      expv[4] = 7'h0a;
      expv[5] = 7'h5c;
      expv[6] = 7'h4a;
      expv[7] = 7'h10;
      expv[8] = 7'h36;
      expv[9] = 7'h2b;
      expv[10] = 7'h6b;
      expv[11] = 7'h33;
      expv[12] = 7'h51;
      expv[13] = 7'h14;
      expv[14] = 7'h24;
      expv[15] = 7'h3b;
      expv[16] = 7'h05;
      expv[17] = 7'h53;
      expv[18] = 7'h21;
      expv[19] = 7'h47;
      expv[20] = 7'h65;
      expv[21] = 7'h26;
      expv[22] = 7'h3d;
      expv[23] = 7'h3e;
      expv[24] = 7'h02;
      expv[25] = 7'h4a;
      expv[26] = 7'h58;
      expv[27] = 7'h3c;
      expv[28] = 7'h72;
      expv[29] = 7'h39;
      expv[30] = 7'h5d;
      expv[31] = 7'h38;
      expv[32] = 7'h19;
      expv[33] = 7'h65;
      expv[34] = 7'h01;
      expv[35] = 7'h17;
      expv[36] = 7'h34;
      expv[37] = 7'h4e;
      expv[38] = 7'h5d;
      expv[39] = 7'h39;
      expv[40] = 7'h07;
      expv[41] = 7'h6f;
      expv[42] = 7'h65;
      expv[43] = 7'h64;
      expv[44] = 7'h5c;
      expv[45] = 7'h4c;
      expv[46] = 7'h2b;
      expv[47] = 7'h63;
      expv[48] = 7'h17;
      expv[49] = 7'h20;
      expv[50] = 7'h5e;
      expv[51] = 7'h44;
      expv[52] = 7'h1a;
      expv[53] = 7'h1a;
      expv[54] = 7'h71;
      expv[55] = 7'h07;
      expv[56] = 7'h65;
      expv[57] = 7'h15;
      expv[58] = 7'h61;
      expv[59] = 7'h17;
      expv[60] = 7'h13;
      expv[61] = 7'h24;
      expv[62] = 7'h64;
      expv[63] = 7'h48;
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
