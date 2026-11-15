// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_134125 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .page_number(in_vec[8:7]),
    .frame_number(in_vec[6:3]),
    .valid(in_vec[2:2]),
    .dirty(in_vec[1:1]),
    .read_write(in_vec[0:0]),
    .memory_out(out_vec[4:1]),
    .page_fault(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h29a;
    stim[1] = 10'h269;
    stim[2] = 10'h343;
    stim[3] = 10'h1a6;
    stim[4] = 10'h004;
    stim[5] = 10'h09d;
    stim[6] = 10'h128;
    stim[7] = 10'h082;
    stim[8] = 10'h0f7;
    stim[9] = 10'h0c5;
    stim[10] = 10'h065;
    stim[11] = 10'h128;
    stim[12] = 10'h14f;
    stim[13] = 10'h00f;
    stim[14] = 10'h0e9;
    stim[15] = 10'h194;
    stim[16] = 10'h025;
    stim[17] = 10'h156;
    stim[18] = 10'h0df;
    stim[19] = 10'h15e;
    stim[20] = 10'h06f;
    stim[21] = 10'h040;
    stim[22] = 10'h0af;
    stim[23] = 10'h117;
    stim[24] = 10'h04f;
    stim[25] = 10'h06b;
    stim[26] = 10'h165;
    stim[27] = 10'h035;
    stim[28] = 10'h074;
    stim[29] = 10'h03a;
    stim[30] = 10'h07b;
    stim[31] = 10'h017;
    stim[32] = 10'h0c2;
    stim[33] = 10'h1a9;
    stim[34] = 10'h0f0;
    stim[35] = 10'h026;
    stim[36] = 10'h09a;
    stim[37] = 10'h041;
    stim[38] = 10'h0a8;
    stim[39] = 10'h053;
    stim[40] = 10'h02e;
    stim[41] = 10'h1d9;
    stim[42] = 10'h043;
    stim[43] = 10'h1df;
    stim[44] = 10'h1dd;
    stim[45] = 10'h044;
    stim[46] = 10'h012;
    stim[47] = 10'h004;
    stim[48] = 10'h0b8;
    stim[49] = 10'h1a6;
    stim[50] = 10'h1a9;
    stim[51] = 10'h10b;
    stim[52] = 10'h0f7;
    stim[53] = 10'h11b;
    stim[54] = 10'h143;
    stim[55] = 10'h026;
    stim[56] = 10'h06c;
    stim[57] = 10'h00a;
    stim[58] = 10'h0dc;
    stim[59] = 10'h180;
    stim[60] = 10'h1f2;
    stim[61] = 10'h1c2;
    stim[62] = 10'h12e;
    stim[63] = 10'h0c3;
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
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h09;
      expv[5] = 5'h01;
      expv[6] = 5'h07;
      expv[7] = 5'h0b;
      expv[8] = 5'h07;
      expv[9] = 5'h1d;
      expv[10] = 5'h11;
      expv[11] = 5'h19;
      expv[12] = 5'h0b;
      expv[13] = 5'h13;
      expv[14] = 5'h03;
      expv[15] = 5'h1b;
      expv[16] = 5'h09;
      expv[17] = 5'h09;
      expv[18] = 5'h13;
      expv[19] = 5'h17;
      expv[20] = 5'h13;
      expv[21] = 5'h1b;
      expv[22] = 5'h01;
      expv[23] = 5'h0b;
      expv[24] = 5'h05;
      expv[25] = 5'h13;
      expv[26] = 5'h1b;
      expv[27] = 5'h19;
      expv[28] = 5'h0d;
      expv[29] = 5'h01;
      expv[30] = 5'h01;
      expv[31] = 5'h1f;
      expv[32] = 5'h05;
      expv[33] = 5'h07;
      expv[34] = 5'h0b;
      expv[35] = 5'h07;
      expv[36] = 5'h01;
      expv[37] = 5'h07;
      expv[38] = 5'h11;
      expv[39] = 5'h07;
      expv[40] = 5'h15;
      expv[41] = 5'h01;
      expv[42] = 5'h17;
      expv[43] = 5'h11;
      expv[44] = 5'h17;
      expv[45] = 5'h17;
      expv[46] = 5'h01;
      expv[47] = 5'h01;
      expv[48] = 5'h01;
      expv[49] = 5'h07;
      expv[50] = 5'h09;
      expv[51] = 5'h0b;
      expv[52] = 5'h03;
      expv[53] = 5'h1d;
      expv[54] = 5'h07;
      expv[55] = 5'h11;
      expv[56] = 5'h01;
      expv[57] = 5'h01;
      expv[58] = 5'h01;
      expv[59] = 5'h07;
      expv[60] = 5'h09;
      expv[61] = 5'h09;
      expv[62] = 5'h09;
      expv[63] = 5'h13;
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
