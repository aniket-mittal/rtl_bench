// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_173298 dut (
    .CLK(clk),
    .ENB(in_vec[8:8]),
    .DIR(in_vec[7:7]),
    .S_IN(in_vec[6:6]),
    .MODO(in_vec[5:4]),
    .D(in_vec[3:0]),
    .Q(out_vec[4:1]),
    .S_OUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h151;
    stim[1] = 9'h123;
    stim[2] = 9'h1d8;
    stim[3] = 9'h057;
    stim[4] = 9'h174;
    stim[5] = 9'h168;
    stim[6] = 9'h164;
    stim[7] = 9'h120;
    stim[8] = 9'h1e5;
    stim[9] = 9'h17c;
    stim[10] = 9'h02c;
    stim[11] = 9'h060;
    stim[12] = 9'h1a9;
    stim[13] = 9'h0cc;
    stim[14] = 9'h0f6;
    stim[15] = 9'h1f4;
    stim[16] = 9'h0ea;
    stim[17] = 9'h18c;
    stim[18] = 9'h1d9;
    stim[19] = 9'h04e;
    stim[20] = 9'h063;
    stim[21] = 9'h0b1;
    stim[22] = 9'h08a;
    stim[23] = 9'h00d;
    stim[24] = 9'h0ff;
    stim[25] = 9'h156;
    stim[26] = 9'h037;
    stim[27] = 9'h08a;
    stim[28] = 9'h170;
    stim[29] = 9'h114;
    stim[30] = 9'h1a1;
    stim[31] = 9'h090;
    stim[32] = 9'h0db;
    stim[33] = 9'h1e1;
    stim[34] = 9'h124;
    stim[35] = 9'h1f0;
    stim[36] = 9'h0d3;
    stim[37] = 9'h0a1;
    stim[38] = 9'h00e;
    stim[39] = 9'h07f;
    stim[40] = 9'h0cb;
    stim[41] = 9'h194;
    stim[42] = 9'h0d7;
    stim[43] = 9'h01d;
    stim[44] = 9'h1eb;
    stim[45] = 9'h001;
    stim[46] = 9'h088;
    stim[47] = 9'h1b6;
    stim[48] = 9'h13f;
    stim[49] = 9'h148;
    stim[50] = 9'h122;
    stim[51] = 9'h14b;
    stim[52] = 9'h1f6;
    stim[53] = 9'h176;
    stim[54] = 9'h086;
    stim[55] = 9'h1d7;
    stim[56] = 9'h1f8;
    stim[57] = 9'h02e;
    stim[58] = 9'h1e8;
    stim[59] = 9'h124;
    stim[60] = 9'h1d6;
    stim[61] = 9'h156;
    stim[62] = 9'h0a3;
    stim[63] = 9'h186;
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
      expv[0] = 5'h0x;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h10;
      expv[4] = 5'h02;
      expv[5] = 5'h05;
      expv[6] = 5'h04;
      expv[7] = 5'h08;
      expv[8] = 5'h00;
      expv[9] = 5'h0a;
      expv[10] = 5'h18;
      expv[11] = 5'h18;
      expv[12] = 5'h18;
      expv[13] = 5'h18;
      expv[14] = 5'h18;
      expv[15] = 5'h0c;
      expv[16] = 5'h08;
      expv[17] = 5'h08;
      expv[18] = 5'h08;
      expv[19] = 5'h14;
      expv[20] = 5'h0a;
      expv[21] = 5'h15;
      expv[22] = 5'h0a;
      expv[23] = 5'h15;
      expv[24] = 5'h0a;
      expv[25] = 5'h15;
      expv[26] = 5'h0a;
      expv[27] = 5'h15;
      expv[28] = 5'h0a;
      expv[29] = 5'h15;
      expv[30] = 5'h14;
      expv[31] = 5'h0a;
      expv[32] = 5'h00;
      expv[33] = 5'h16;
      expv[34] = 5'h02;
      expv[35] = 5'h08;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h02;
      expv[47] = 5'h10;
      expv[48] = 5'h0c;
      expv[49] = 5'h0c;
      expv[50] = 5'h0c;
      expv[51] = 5'h18;
      expv[52] = 5'h16;
      expv[53] = 5'h1b;
      expv[54] = 5'h1a;
      expv[55] = 5'h1a;
      expv[56] = 5'h1a;
      expv[57] = 5'h1d;
      expv[58] = 5'h1c;
      expv[59] = 5'h1c;
      expv[60] = 5'h08;
      expv[61] = 5'h0c;
      expv[62] = 5'h18;
      expv[63] = 5'h0c;
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
