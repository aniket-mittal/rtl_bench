// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04639 dut (
    .i(in_vec[7:0]),
    .o1(out_vec[7:4]),
    .o0(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hdf;
    stim[1] = 8'h18;
    stim[2] = 8'h30;
    stim[3] = 8'h67;
    stim[4] = 8'h2b;
    stim[5] = 8'he6;
    stim[6] = 8'hd8;
    stim[7] = 8'hd9;
    stim[8] = 8'hd7;
    stim[9] = 8'hd0;
    stim[10] = 8'h83;
    stim[11] = 8'he0;
    stim[12] = 8'hc9;
    stim[13] = 8'h7a;
    stim[14] = 8'hdd;
    stim[15] = 8'h22;
    stim[16] = 8'h58;
    stim[17] = 8'h42;
    stim[18] = 8'h26;
    stim[19] = 8'h60;
    stim[20] = 8'h83;
    stim[21] = 8'h80;
    stim[22] = 8'h91;
    stim[23] = 8'h7a;
    stim[24] = 8'hae;
    stim[25] = 8'ha1;
    stim[26] = 8'hc4;
    stim[27] = 8'hac;
    stim[28] = 8'h25;
    stim[29] = 8'h02;
    stim[30] = 8'ha6;
    stim[31] = 8'ha8;
    stim[32] = 8'h81;
    stim[33] = 8'h3c;
    stim[34] = 8'ha3;
    stim[35] = 8'h1a;
    stim[36] = 8'hf6;
    stim[37] = 8'hf6;
    stim[38] = 8'h58;
    stim[39] = 8'h24;
    stim[40] = 8'h89;
    stim[41] = 8'hac;
    stim[42] = 8'hb6;
    stim[43] = 8'h34;
    stim[44] = 8'h36;
    stim[45] = 8'h51;
    stim[46] = 8'h6c;
    stim[47] = 8'h3e;
    stim[48] = 8'hd7;
    stim[49] = 8'h19;
    stim[50] = 8'h62;
    stim[51] = 8'h57;
    stim[52] = 8'h1f;
    stim[53] = 8'h2c;
    stim[54] = 8'h7e;
    stim[55] = 8'h24;
    stim[56] = 8'ha3;
    stim[57] = 8'h6b;
    stim[58] = 8'h85;
    stim[59] = 8'h48;
    stim[60] = 8'hde;
    stim[61] = 8'h4f;
    stim[62] = 8'h7c;
    stim[63] = 8'h51;
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
      expv[0] = 8'hdf;
      expv[1] = 8'h18;
      expv[2] = 8'h30;
      expv[3] = 8'h67;
      expv[4] = 8'h2b;
      expv[5] = 8'he6;
      expv[6] = 8'hd8;
      expv[7] = 8'hd9;
      expv[8] = 8'hd7;
      expv[9] = 8'hd0;
      expv[10] = 8'h83;
      expv[11] = 8'he0;
      expv[12] = 8'hc9;
      expv[13] = 8'h7a;
      expv[14] = 8'hdd;
      expv[15] = 8'h22;
      expv[16] = 8'h58;
      expv[17] = 8'h42;
      expv[18] = 8'h26;
      expv[19] = 8'h60;
      expv[20] = 8'h83;
      expv[21] = 8'h80;
      expv[22] = 8'h91;
      expv[23] = 8'h7a;
      expv[24] = 8'hae;
      expv[25] = 8'ha1;
      expv[26] = 8'hc4;
      expv[27] = 8'hac;
      expv[28] = 8'h25;
      expv[29] = 8'h02;
      expv[30] = 8'ha6;
      expv[31] = 8'ha8;
      expv[32] = 8'h81;
      expv[33] = 8'h3c;
      expv[34] = 8'ha3;
      expv[35] = 8'h1a;
      expv[36] = 8'hf6;
      expv[37] = 8'hf6;
      expv[38] = 8'h58;
      expv[39] = 8'h24;
      expv[40] = 8'h89;
      expv[41] = 8'hac;
      expv[42] = 8'hb6;
      expv[43] = 8'h34;
      expv[44] = 8'h36;
      expv[45] = 8'h51;
      expv[46] = 8'h6c;
      expv[47] = 8'h3e;
      expv[48] = 8'hd7;
      expv[49] = 8'h19;
      expv[50] = 8'h62;
      expv[51] = 8'h57;
      expv[52] = 8'h1f;
      expv[53] = 8'h2c;
      expv[54] = 8'h7e;
      expv[55] = 8'h24;
      expv[56] = 8'ha3;
      expv[57] = 8'h6b;
      expv[58] = 8'h85;
      expv[59] = 8'h48;
      expv[60] = 8'hde;
      expv[61] = 8'h4f;
      expv[62] = 8'h7c;
      expv[63] = 8'h51;
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
