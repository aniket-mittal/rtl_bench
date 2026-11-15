// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_136938 dut (
    .clk(clk),
    .reset(in_vec[5:5]),
    .data_in(in_vec[4:1]),
    .send(in_vec[0:0]),
    .ack(out_vec[4:4]),
    .data_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h23;
    stim[1] = 6'h2d;
    stim[2] = 6'h0d;
    stim[3] = 6'h11;
    stim[4] = 6'h1b;
    stim[5] = 6'h09;
    stim[6] = 6'h08;
    stim[7] = 6'h17;
    stim[8] = 6'h16;
    stim[9] = 6'h23;
    stim[10] = 6'h1e;
    stim[11] = 6'h05;
    stim[12] = 6'h12;
    stim[13] = 6'h05;
    stim[14] = 6'h0a;
    stim[15] = 6'h13;
    stim[16] = 6'h09;
    stim[17] = 6'h01;
    stim[18] = 6'h14;
    stim[19] = 6'h01;
    stim[20] = 6'h1d;
    stim[21] = 6'h13;
    stim[22] = 6'h02;
    stim[23] = 6'h10;
    stim[24] = 6'h19;
    stim[25] = 6'h0e;
    stim[26] = 6'h02;
    stim[27] = 6'h08;
    stim[28] = 6'h0a;
    stim[29] = 6'h13;
    stim[30] = 6'h18;
    stim[31] = 6'h11;
    stim[32] = 6'h12;
    stim[33] = 6'h12;
    stim[34] = 6'h18;
    stim[35] = 6'h03;
    stim[36] = 6'h1b;
    stim[37] = 6'h09;
    stim[38] = 6'h08;
    stim[39] = 6'h09;
    stim[40] = 6'h14;
    stim[41] = 6'h01;
    stim[42] = 6'h1d;
    stim[43] = 6'h09;
    stim[44] = 6'h14;
    stim[45] = 6'h10;
    stim[46] = 6'h2f;
    stim[47] = 6'h10;
    stim[48] = 6'h1d;
    stim[49] = 6'h23;
    stim[50] = 6'h14;
    stim[51] = 6'h32;
    stim[52] = 6'h01;
    stim[53] = 6'h39;
    stim[54] = 6'h1c;
    stim[55] = 6'h00;
    stim[56] = 6'h0e;
    stim[57] = 6'h0d;
    stim[58] = 6'h04;
    stim[59] = 6'h07;
    stim[60] = 6'h01;
    stim[61] = 6'h04;
    stim[62] = 6'h09;
    stim[63] = 6'h1a;
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
      expv[1] = 5'h0x;
      expv[2] = 5'h0x;
      expv[3] = 5'h06;
      expv[4] = 5'h06;
      expv[5] = 5'h16;
      expv[6] = 5'h06;
      expv[7] = 5'h06;
      expv[8] = 5'h0b;
      expv[9] = 5'h0b;
      expv[10] = 5'h0b;
      expv[11] = 5'h0b;
      expv[12] = 5'h09;
      expv[13] = 5'h09;
      expv[14] = 5'h19;
      expv[15] = 5'h09;
      expv[16] = 5'h09;
      expv[17] = 5'h09;
      expv[18] = 5'h19;
      expv[19] = 5'h09;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h10;
      expv[23] = 5'h10;
      expv[24] = 5'h00;
      expv[25] = 5'h07;
      expv[26] = 5'h07;
      expv[27] = 5'h17;
      expv[28] = 5'h17;
      expv[29] = 5'h07;
      expv[30] = 5'h0c;
      expv[31] = 5'h0c;
      expv[32] = 5'h1c;
      expv[33] = 5'h1c;
      expv[34] = 5'h1c;
      expv[35] = 5'h0c;
      expv[36] = 5'h01;
      expv[37] = 5'h01;
      expv[38] = 5'h11;
      expv[39] = 5'h01;
      expv[40] = 5'h0a;
      expv[41] = 5'h0a;
      expv[42] = 5'h1a;
      expv[43] = 5'h0a;
      expv[44] = 5'h0a;
      expv[45] = 5'h0a;
      expv[46] = 5'h0a;
      expv[47] = 5'h0a;
      expv[48] = 5'h0a;
      expv[49] = 5'h0e;
      expv[50] = 5'h0e;
      expv[51] = 5'h0e;
      expv[52] = 5'h0e;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h02;
      expv[59] = 5'h02;
      expv[60] = 5'h12;
      expv[61] = 5'h02;
      expv[62] = 5'h02;
      expv[63] = 5'h0d;
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
