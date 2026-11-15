// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  f_adder dut (
    .SW(in_vec[7:0]),
    .LEDR(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h99;
    stim[1] = 8'h5c;
    stim[2] = 8'h9e;
    stim[3] = 8'h50;
    stim[4] = 8'h16;
    stim[5] = 8'hff;
    stim[6] = 8'hc5;
    stim[7] = 8'h28;
    stim[8] = 8'hd2;
    stim[9] = 8'h77;
    stim[10] = 8'hc9;
    stim[11] = 8'h1d;
    stim[12] = 8'ha4;
    stim[13] = 8'hc2;
    stim[14] = 8'h24;
    stim[15] = 8'hc3;
    stim[16] = 8'h56;
    stim[17] = 8'h4f;
    stim[18] = 8'h98;
    stim[19] = 8'h6e;
    stim[20] = 8'h67;
    stim[21] = 8'hb2;
    stim[22] = 8'h82;
    stim[23] = 8'h2c;
    stim[24] = 8'hbd;
    stim[25] = 8'hd9;
    stim[26] = 8'hf9;
    stim[27] = 8'hcb;
    stim[28] = 8'h77;
    stim[29] = 8'h32;
    stim[30] = 8'h17;
    stim[31] = 8'h29;
    stim[32] = 8'h1e;
    stim[33] = 8'h81;
    stim[34] = 8'h90;
    stim[35] = 8'h20;
    stim[36] = 8'h7b;
    stim[37] = 8'ha6;
    stim[38] = 8'h23;
    stim[39] = 8'h4f;
    stim[40] = 8'h3f;
    stim[41] = 8'h2b;
    stim[42] = 8'h0a;
    stim[43] = 8'h84;
    stim[44] = 8'h03;
    stim[45] = 8'had;
    stim[46] = 8'had;
    stim[47] = 8'h4e;
    stim[48] = 8'h32;
    stim[49] = 8'h0a;
    stim[50] = 8'hef;
    stim[51] = 8'h6b;
    stim[52] = 8'h27;
    stim[53] = 8'hd8;
    stim[54] = 8'h3f;
    stim[55] = 8'h18;
    stim[56] = 8'hb7;
    stim[57] = 8'hc6;
    stim[58] = 8'h25;
    stim[59] = 8'h1d;
    stim[60] = 8'hb9;
    stim[61] = 8'h9a;
    stim[62] = 8'hb8;
    stim[63] = 8'hd1;
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
      expv[0] = 5'h12;
      expv[1] = 5'h11;
      expv[2] = 5'h17;
      expv[3] = 5'h05;
      expv[4] = 5'h07;
      expv[5] = 5'h1e;
      expv[6] = 5'h11;
      expv[7] = 5'h0a;
      expv[8] = 5'h0f;
      expv[9] = 5'h0e;
      expv[10] = 5'h15;
      expv[11] = 5'h0e;
      expv[12] = 5'h0e;
      expv[13] = 5'h0e;
      expv[14] = 5'h06;
      expv[15] = 5'h0f;
      expv[16] = 5'h0b;
      expv[17] = 5'h13;
      expv[18] = 5'h11;
      expv[19] = 5'h14;
      expv[20] = 5'h0d;
      expv[21] = 5'h0d;
      expv[22] = 5'h0a;
      expv[23] = 5'h0e;
      expv[24] = 5'h18;
      expv[25] = 5'h16;
      expv[26] = 5'h18;
      expv[27] = 5'h17;
      expv[28] = 5'h0e;
      expv[29] = 5'h05;
      expv[30] = 5'h08;
      expv[31] = 5'h0b;
      expv[32] = 5'h0f;
      expv[33] = 5'h09;
      expv[34] = 5'h09;
      expv[35] = 5'h02;
      expv[36] = 5'h12;
      expv[37] = 5'h10;
      expv[38] = 5'h05;
      expv[39] = 5'h13;
      expv[40] = 5'h12;
      expv[41] = 5'h0d;
      expv[42] = 5'h0a;
      expv[43] = 5'h0c;
      expv[44] = 5'h03;
      expv[45] = 5'h17;
      expv[46] = 5'h17;
      expv[47] = 5'h12;
      expv[48] = 5'h05;
      expv[49] = 5'h0a;
      expv[50] = 5'h1d;
      expv[51] = 5'h11;
      expv[52] = 5'h09;
      expv[53] = 5'h15;
      expv[54] = 5'h12;
      expv[55] = 5'h09;
      expv[56] = 5'h12;
      expv[57] = 5'h12;
      expv[58] = 5'h07;
      expv[59] = 5'h0e;
      expv[60] = 5'h14;
      expv[61] = 5'h13;
      expv[62] = 5'h13;
      expv[63] = 5'h0e;
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
