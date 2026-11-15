// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_021155 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .buy(in_vec[10:10]),
    .product(in_vec[9:8]),
    .credit(in_vec[7:0]),
    .apple(out_vec[4:4]),
    .banana(out_vec[3:3]),
    .carrot(out_vec[2:2]),
    .date(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he21;
    stim[1] = 12'hed2;
    stim[2] = 12'h502;
    stim[3] = 12'h76c;
    stim[4] = 12'h31f;
    stim[5] = 12'h091;
    stim[6] = 12'h73c;
    stim[7] = 12'h143;
    stim[8] = 12'h381;
    stim[9] = 12'h4f8;
    stim[10] = 12'h272;
    stim[11] = 12'h4f0;
    stim[12] = 12'h4aa;
    stim[13] = 12'h427;
    stim[14] = 12'h49b;
    stim[15] = 12'h6f1;
    stim[16] = 12'h5e5;
    stim[17] = 12'h161;
    stim[18] = 12'h673;
    stim[19] = 12'h3d2;
    stim[20] = 12'h45a;
    stim[21] = 12'h0f9;
    stim[22] = 12'h080;
    stim[23] = 12'h653;
    stim[24] = 12'h7f8;
    stim[25] = 12'h19a;
    stim[26] = 12'h501;
    stim[27] = 12'h5bf;
    stim[28] = 12'h5f8;
    stim[29] = 12'h276;
    stim[30] = 12'h0c3;
    stim[31] = 12'h5e4;
    stim[32] = 12'h5de;
    stim[33] = 12'hb06;
    stim[34] = 12'h514;
    stim[35] = 12'h776;
    stim[36] = 12'h778;
    stim[37] = 12'h7c9;
    stim[38] = 12'h10e;
    stim[39] = 12'h12b;
    stim[40] = 12'h0e7;
    stim[41] = 12'h396;
    stim[42] = 12'h7a1;
    stim[43] = 12'h612;
    stim[44] = 12'h0ac;
    stim[45] = 12'h573;
    stim[46] = 12'h07c;
    stim[47] = 12'h1ca;
    stim[48] = 12'h454;
    stim[49] = 12'h090;
    stim[50] = 12'h6f4;
    stim[51] = 12'h56c;
    stim[52] = 12'h474;
    stim[53] = 12'h2a4;
    stim[54] = 12'h430;
    stim[55] = 12'h6c5;
    stim[56] = 12'h64f;
    stim[57] = 12'h5c0;
    stim[58] = 12'h617;
    stim[59] = 12'h514;
    stim[60] = 12'h773;
    stim[61] = 12'h794;
    stim[62] = 12'h073;
    stim[63] = 12'h538;
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
      expv[0] = 5'h00;
      expv[1] = 5'h04;
      expv[2] = 5'h04;
      expv[3] = 5'h01;
      expv[4] = 5'h02;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h02;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h10;
      expv[11] = 5'h00;
      expv[12] = 5'h10;
      expv[13] = 5'h10;
      expv[14] = 5'h01;
      expv[15] = 5'h10;
      expv[16] = 5'h04;
      expv[17] = 5'h08;
      expv[18] = 5'h00;
      expv[19] = 5'h04;
      expv[20] = 5'h00;
      expv[21] = 5'h10;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h04;
      expv[25] = 5'h02;
      expv[26] = 5'h00;
      expv[27] = 5'h01;
      expv[28] = 5'h08;
      expv[29] = 5'h08;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h08;
      expv[33] = 5'h08;
      expv[34] = 5'h00;
      expv[35] = 5'h08;
      expv[36] = 5'h02;
      expv[37] = 5'h02;
      expv[38] = 5'h02;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h02;
      expv[44] = 5'h01;
      expv[45] = 5'h00;
      expv[46] = 5'h08;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h10;
      expv[50] = 5'h00;
      expv[51] = 5'h04;
      expv[52] = 5'h08;
      expv[53] = 5'h10;
      expv[54] = 5'h00;
      expv[55] = 5'h01;
      expv[56] = 5'h04;
      expv[57] = 5'h04;
      expv[58] = 5'h08;
      expv[59] = 5'h01;
      expv[60] = 5'h08;
      expv[61] = 5'h02;
      expv[62] = 5'h02;
      expv[63] = 5'h00;
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
