// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02700 dut (
    .Clk(clk),
    .rdEn(in_vec[17:17]),
    .wrEn(in_vec[16:16]),
    .addr(in_vec[15:8]),
    .wrData(in_vec[7:0]),
    .Data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h03a41;
    stim[1] = 18'h36024;
    stim[2] = 18'h178ea;
    stim[3] = 18'h0115e;
    stim[4] = 18'h12057;
    stim[5] = 18'h05836;
    stim[6] = 18'h179cc;
    stim[7] = 18'h1c1da;
    stim[8] = 18'h0db72;
    stim[9] = 18'h306f7;
    stim[10] = 18'h0ed09;
    stim[11] = 18'h3b014;
    stim[12] = 18'h2975c;
    stim[13] = 18'h0f89e;
    stim[14] = 18'h38d3e;
    stim[15] = 18'h097c6;
    stim[16] = 18'h3621a;
    stim[17] = 18'h07183;
    stim[18] = 18'h28084;
    stim[19] = 18'h056ed;
    stim[20] = 18'h0a428;
    stim[21] = 18'h2ed8c;
    stim[22] = 18'h029ea;
    stim[23] = 18'h1e6b3;
    stim[24] = 18'h2198b;
    stim[25] = 18'h1ebf9;
    stim[26] = 18'h00084;
    stim[27] = 18'h08fbf;
    stim[28] = 18'h08930;
    stim[29] = 18'h1e48e;
    stim[30] = 18'h1814a;
    stim[31] = 18'h26b15;
    stim[32] = 18'h16ab1;
    stim[33] = 18'h10f1a;
    stim[34] = 18'h1fc47;
    stim[35] = 18'h072d3;
    stim[36] = 18'h174ed;
    stim[37] = 18'h06f1f;
    stim[38] = 18'h07747;
    stim[39] = 18'h18006;
    stim[40] = 18'h037b3;
    stim[41] = 18'h2ebe0;
    stim[42] = 18'h2f5cb;
    stim[43] = 18'h03cc5;
    stim[44] = 18'h3f5f3;
    stim[45] = 18'h30eb9;
    stim[46] = 18'h2537a;
    stim[47] = 18'h1e578;
    stim[48] = 18'h2c65b;
    stim[49] = 18'h2ecc9;
    stim[50] = 18'h2c2df;
    stim[51] = 18'h0cd4d;
    stim[52] = 18'h1ac50;
    stim[53] = 18'h0ac19;
    stim[54] = 18'h33c2b;
    stim[55] = 18'h1cf8a;
    stim[56] = 18'h29fa4;
    stim[57] = 18'h1ab8b;
    stim[58] = 18'h0dce5;
    stim[59] = 18'h367f5;
    stim[60] = 18'h0b672;
    stim[61] = 18'h227e2;
    stim[62] = 18'h3711f;
    stim[63] = 18'h297be;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hf9;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
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
