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

  gf_mult_by_01 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hf7;
    stim[1] = 8'ha7;
    stim[2] = 8'h84;
    stim[3] = 8'h6b;
    stim[4] = 8'h6b;
    stim[5] = 8'hb1;
    stim[6] = 8'h2a;
    stim[7] = 8'hfd;
    stim[8] = 8'h56;
    stim[9] = 8'hcc;
    stim[10] = 8'h34;
    stim[11] = 8'h53;
    stim[12] = 8'h99;
    stim[13] = 8'h22;
    stim[14] = 8'h6a;
    stim[15] = 8'hd6;
    stim[16] = 8'h4a;
    stim[17] = 8'h5a;
    stim[18] = 8'hf0;
    stim[19] = 8'h01;
    stim[20] = 8'h42;
    stim[21] = 8'ha8;
    stim[22] = 8'h40;
    stim[23] = 8'hca;
    stim[24] = 8'hea;
    stim[25] = 8'h1d;
    stim[26] = 8'h76;
    stim[27] = 8'hb1;
    stim[28] = 8'h99;
    stim[29] = 8'h17;
    stim[30] = 8'hbc;
    stim[31] = 8'hd3;
    stim[32] = 8'h42;
    stim[33] = 8'h53;
    stim[34] = 8'h19;
    stim[35] = 8'hdd;
    stim[36] = 8'h03;
    stim[37] = 8'hb2;
    stim[38] = 8'h54;
    stim[39] = 8'h92;
    stim[40] = 8'h0c;
    stim[41] = 8'h89;
    stim[42] = 8'hd1;
    stim[43] = 8'h8a;
    stim[44] = 8'hf5;
    stim[45] = 8'hf9;
    stim[46] = 8'h11;
    stim[47] = 8'h25;
    stim[48] = 8'h77;
    stim[49] = 8'hae;
    stim[50] = 8'h2e;
    stim[51] = 8'h46;
    stim[52] = 8'h80;
    stim[53] = 8'he1;
    stim[54] = 8'h41;
    stim[55] = 8'h05;
    stim[56] = 8'h77;
    stim[57] = 8'h79;
    stim[58] = 8'h8c;
    stim[59] = 8'h68;
    stim[60] = 8'h9c;
    stim[61] = 8'h68;
    stim[62] = 8'hce;
    stim[63] = 8'h43;
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
      expv[0] = 8'hf7;
      expv[1] = 8'ha7;
      expv[2] = 8'h84;
      expv[3] = 8'h6b;
      expv[4] = 8'h6b;
      expv[5] = 8'hb1;
      expv[6] = 8'h2a;
      expv[7] = 8'hfd;
      expv[8] = 8'h56;
      expv[9] = 8'hcc;
      expv[10] = 8'h34;
      expv[11] = 8'h53;
      expv[12] = 8'h99;
      expv[13] = 8'h22;
      expv[14] = 8'h6a;
      expv[15] = 8'hd6;
      expv[16] = 8'h4a;
      expv[17] = 8'h5a;
      expv[18] = 8'hf0;
      expv[19] = 8'h01;
      expv[20] = 8'h42;
      expv[21] = 8'ha8;
      expv[22] = 8'h40;
      expv[23] = 8'hca;
      expv[24] = 8'hea;
      expv[25] = 8'h1d;
      expv[26] = 8'h76;
      expv[27] = 8'hb1;
      expv[28] = 8'h99;
      expv[29] = 8'h17;
      expv[30] = 8'hbc;
      expv[31] = 8'hd3;
      expv[32] = 8'h42;
      expv[33] = 8'h53;
      expv[34] = 8'h19;
      expv[35] = 8'hdd;
      expv[36] = 8'h03;
      expv[37] = 8'hb2;
      expv[38] = 8'h54;
      expv[39] = 8'h92;
      expv[40] = 8'h0c;
      expv[41] = 8'h89;
      expv[42] = 8'hd1;
      expv[43] = 8'h8a;
      expv[44] = 8'hf5;
      expv[45] = 8'hf9;
      expv[46] = 8'h11;
      expv[47] = 8'h25;
      expv[48] = 8'h77;
      expv[49] = 8'hae;
      expv[50] = 8'h2e;
      expv[51] = 8'h46;
      expv[52] = 8'h80;
      expv[53] = 8'he1;
      expv[54] = 8'h41;
      expv[55] = 8'h05;
      expv[56] = 8'h77;
      expv[57] = 8'h79;
      expv[58] = 8'h8c;
      expv[59] = 8'h68;
      expv[60] = 8'h9c;
      expv[61] = 8'h68;
      expv[62] = 8'hce;
      expv[63] = 8'h43;
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
