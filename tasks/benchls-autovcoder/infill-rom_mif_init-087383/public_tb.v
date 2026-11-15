// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087383 dut (
    .clock(clk),
    .read_addr(in_vec[7:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h46;
    stim[1] = 8'h3e;
    stim[2] = 8'h14;
    stim[3] = 8'h56;
    stim[4] = 8'h31;
    stim[5] = 8'h26;
    stim[6] = 8'h89;
    stim[7] = 8'he2;
    stim[8] = 8'h43;
    stim[9] = 8'h40;
    stim[10] = 8'h4d;
    stim[11] = 8'h65;
    stim[12] = 8'hda;
    stim[13] = 8'hc2;
    stim[14] = 8'h12;
    stim[15] = 8'h49;
    stim[16] = 8'h09;
    stim[17] = 8'hc0;
    stim[18] = 8'h74;
    stim[19] = 8'h75;
    stim[20] = 8'h8a;
    stim[21] = 8'h45;
    stim[22] = 8'h88;
    stim[23] = 8'h84;
    stim[24] = 8'hd3;
    stim[25] = 8'h4d;
    stim[26] = 8'hb4;
    stim[27] = 8'he1;
    stim[28] = 8'hbd;
    stim[29] = 8'h76;
    stim[30] = 8'h79;
    stim[31] = 8'h56;
    stim[32] = 8'h03;
    stim[33] = 8'h3a;
    stim[34] = 8'hb7;
    stim[35] = 8'h73;
    stim[36] = 8'hc5;
    stim[37] = 8'hd5;
    stim[38] = 8'hee;
    stim[39] = 8'h6b;
    stim[40] = 8'hb7;
    stim[41] = 8'h18;
    stim[42] = 8'hd9;
    stim[43] = 8'hf3;
    stim[44] = 8'h8f;
    stim[45] = 8'h06;
    stim[46] = 8'h8c;
    stim[47] = 8'ha9;
    stim[48] = 8'h5b;
    stim[49] = 8'h37;
    stim[50] = 8'ha0;
    stim[51] = 8'h77;
    stim[52] = 8'hbe;
    stim[53] = 8'hc0;
    stim[54] = 8'hd8;
    stim[55] = 8'hab;
    stim[56] = 8'hbc;
    stim[57] = 8'h86;
    stim[58] = 8'h16;
    stim[59] = 8'h2c;
    stim[60] = 8'h34;
    stim[61] = 8'h92;
    stim[62] = 8'hba;
    stim[63] = 8'haf;
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
      expv[0] = 16'h0000;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
