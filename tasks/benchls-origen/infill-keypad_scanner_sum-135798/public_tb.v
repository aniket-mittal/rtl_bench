// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135798 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .row(in_vec[3:0]),
    .col(out_vec[11:8]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h16;
    stim[1] = 5'h15;
    stim[2] = 5'h0f;
    stim[3] = 5'h0d;
    stim[4] = 5'h08;
    stim[5] = 5'h0f;
    stim[6] = 5'h01;
    stim[7] = 5'h09;
    stim[8] = 5'h06;
    stim[9] = 5'h07;
    stim[10] = 5'h0f;
    stim[11] = 5'h04;
    stim[12] = 5'h08;
    stim[13] = 5'h02;
    stim[14] = 5'h0a;
    stim[15] = 5'h08;
    stim[16] = 5'h07;
    stim[17] = 5'h0d;
    stim[18] = 5'h00;
    stim[19] = 5'h08;
    stim[20] = 5'h09;
    stim[21] = 5'h05;
    stim[22] = 5'h0e;
    stim[23] = 5'h0d;
    stim[24] = 5'h07;
    stim[25] = 5'h0c;
    stim[26] = 5'h04;
    stim[27] = 5'h0e;
    stim[28] = 5'h00;
    stim[29] = 5'h0e;
    stim[30] = 5'h02;
    stim[31] = 5'h04;
    stim[32] = 5'h00;
    stim[33] = 5'h07;
    stim[34] = 5'h0a;
    stim[35] = 5'h03;
    stim[36] = 5'h03;
    stim[37] = 5'h0b;
    stim[38] = 5'h0f;
    stim[39] = 5'h06;
    stim[40] = 5'h0c;
    stim[41] = 5'h04;
    stim[42] = 5'h08;
    stim[43] = 5'h05;
    stim[44] = 5'h05;
    stim[45] = 5'h03;
    stim[46] = 5'h02;
    stim[47] = 5'h02;
    stim[48] = 5'h0e;
    stim[49] = 5'h06;
    stim[50] = 5'h0a;
    stim[51] = 5'h09;
    stim[52] = 5'h04;
    stim[53] = 5'h0c;
    stim[54] = 5'h0a;
    stim[55] = 5'h00;
    stim[56] = 5'h00;
    stim[57] = 5'h0c;
    stim[58] = 5'h08;
    stim[59] = 5'h0a;
    stim[60] = 5'h09;
    stim[61] = 5'h0d;
    stim[62] = 5'h01;
    stim[63] = 5'h09;
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
      expv[0] = 12'he00;
      expv[1] = 12'he00;
      expv[2] = 12'he00;
      expv[3] = 12'he01;
      expv[4] = 12'hd07;
      expv[5] = 12'hb03;
      expv[6] = 12'h704;
      expv[7] = 12'he05;
      expv[8] = 12'hd06;
      expv[9] = 12'hb07;
      expv[10] = 12'h717;
      expv[11] = 12'he18;
      expv[12] = 12'hd0a;
      expv[13] = 12'hb0b;
      expv[14] = 12'h70c;
      expv[15] = 12'he0d;
      expv[16] = 12'hd0e;
      expv[17] = 12'hb1d;
      expv[18] = 12'h707;
      expv[19] = 12'he01;
      expv[20] = 12'hd02;
      expv[21] = 12'hb03;
      expv[22] = 12'h704;
      expv[23] = 12'he09;
      expv[24] = 12'hd0b;
      expv[25] = 12'hb15;
      expv[26] = 12'h708;
      expv[27] = 12'he09;
      expv[28] = 12'hd0b;
      expv[29] = 12'hb0b;
      expv[30] = 12'h70f;
      expv[31] = 12'he0d;
      expv[32] = 12'hd0e;
      expv[33] = 12'hb0f;
      expv[34] = 12'h70f;
      expv[35] = 12'he01;
      expv[36] = 12'hd02;
      expv[37] = 12'hb03;
      expv[38] = 12'h70f;
      expv[39] = 12'he10;
      expv[40] = 12'hd06;
      expv[41] = 12'hb07;
      expv[42] = 12'h708;
      expv[43] = 12'he09;
      expv[44] = 12'hd0a;
      expv[45] = 12'hb0b;
      expv[46] = 12'h70c;
      expv[47] = 12'he0d;
      expv[48] = 12'hd0e;
      expv[49] = 12'hb11;
      expv[50] = 12'h700;
      expv[51] = 12'he01;
      expv[52] = 12'hd02;
      expv[53] = 12'hb03;
      expv[54] = 12'h704;
      expv[55] = 12'he05;
      expv[56] = 12'hd06;
      expv[57] = 12'hb07;
      expv[58] = 12'h708;
      expv[59] = 12'he09;
      expv[60] = 12'hd0a;
      expv[61] = 12'hb0b;
      expv[62] = 12'h713;
      expv[63] = 12'he0d;
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
