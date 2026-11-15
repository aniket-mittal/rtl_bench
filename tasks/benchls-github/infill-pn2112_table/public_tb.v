// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pn2112_table dut (
    .din(in_vec[6:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h3d;
    stim[1] = 7'h32;
    stim[2] = 7'h1f;
    stim[3] = 7'h0b;
    stim[4] = 7'h6f;
    stim[5] = 7'h1e;
    stim[6] = 7'h29;
    stim[7] = 7'h1f;
    stim[8] = 7'h6c;
    stim[9] = 7'h7e;
    stim[10] = 7'h5c;
    stim[11] = 7'h7c;
    stim[12] = 7'h79;
    stim[13] = 7'h5f;
    stim[14] = 7'h1e;
    stim[15] = 7'h77;
    stim[16] = 7'h11;
    stim[17] = 7'h55;
    stim[18] = 7'h3a;
    stim[19] = 7'h3a;
    stim[20] = 7'h22;
    stim[21] = 7'h03;
    stim[22] = 7'h34;
    stim[23] = 7'h33;
    stim[24] = 7'h11;
    stim[25] = 7'h61;
    stim[26] = 7'h7e;
    stim[27] = 7'h7f;
    stim[28] = 7'h6d;
    stim[29] = 7'h34;
    stim[30] = 7'h3d;
    stim[31] = 7'h79;
    stim[32] = 7'h41;
    stim[33] = 7'h71;
    stim[34] = 7'h02;
    stim[35] = 7'h1a;
    stim[36] = 7'h52;
    stim[37] = 7'h42;
    stim[38] = 7'h59;
    stim[39] = 7'h7a;
    stim[40] = 7'h07;
    stim[41] = 7'h7b;
    stim[42] = 7'h0e;
    stim[43] = 7'h1a;
    stim[44] = 7'h0b;
    stim[45] = 7'h6b;
    stim[46] = 7'h40;
    stim[47] = 7'h3a;
    stim[48] = 7'h41;
    stim[49] = 7'h65;
    stim[50] = 7'h53;
    stim[51] = 7'h20;
    stim[52] = 7'h0d;
    stim[53] = 7'h32;
    stim[54] = 7'h3f;
    stim[55] = 7'h07;
    stim[56] = 7'h1f;
    stim[57] = 7'h07;
    stim[58] = 7'h45;
    stim[59] = 7'h07;
    stim[60] = 7'h40;
    stim[61] = 7'h38;
    stim[62] = 7'h2d;
    stim[63] = 7'h3f;
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
      expv[0] = 32'hffe02aaa;
      expv[1] = 32'h075755d5;
      expv[2] = 32'hffd02aa8;
      expv[3] = 32'haaa8aaaa;
      expv[4] = 32'h00000000;
      expv[5] = 32'ha8004aff;
      expv[6] = 32'h7fd57885;
      expv[7] = 32'hffd02aa8;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'ha8004aff;
      expv[15] = 32'h00000000;
      expv[16] = 32'hfffffffd;
      expv[17] = 32'h00000000;
      expv[18] = 32'hd5558fff;
      expv[19] = 32'hd5558fff;
      expv[20] = 32'hffd57ff0;
      expv[21] = 32'h554aaaaa;
      expv[22] = 32'haaa2b554;
      expv[23] = 32'hffd57fd0;
      expv[24] = 32'hfffffffd;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'haaa2b554;
      expv[30] = 32'hffe02aaa;
      expv[31] = 32'h00000000;
      expv[32] = 32'hfdfaa880;
      expv[33] = 32'h00000000;
      expv[34] = 32'haaaa8000;
      expv[35] = 32'ha8afffd5;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h55555755;
      expv[41] = 32'h00000000;
      expv[42] = 32'hfff0aaaa;
      expv[43] = 32'ha8afffd5;
      expv[44] = 32'haaa8aaaa;
      expv[45] = 32'h00000000;
      expv[46] = 32'haa854aaf;
      expv[47] = 32'hd5558fff;
      expv[48] = 32'hfdfaa880;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h4ab5557f;
      expv[52] = 32'h00001fff;
      expv[53] = 32'h075755d5;
      expv[54] = 32'hd7ffdad5;
      expv[55] = 32'h55555755;
      expv[56] = 32'hffd02aa8;
      expv[57] = 32'h55555755;
      expv[58] = 32'h00000000;
      expv[59] = 32'h55555755;
      expv[60] = 32'haa854aaf;
      expv[61] = 32'haaaaaa82;
      expv[62] = 32'h2a8082af;
      expv[63] = 32'hd7ffdad5;
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
