// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002890 dut (
    .clock(clk),
    .resetn(in_vec[2:2]),
    .valid_in(in_vec[1:1]),
    .stall_in(in_vec[0:0]),
    .data_out(out_vec[9:4]),
    .valid_out(out_vec[3:3]),
    .stall_out(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h3;
    stim[1] = 3'h3;
    stim[2] = 3'h5;
    stim[3] = 3'h4;
    stim[4] = 3'h7;
    stim[5] = 3'h7;
    stim[6] = 3'h6;
    stim[7] = 3'h6;
    stim[8] = 3'h4;
    stim[9] = 3'h7;
    stim[10] = 3'h6;
    stim[11] = 3'h5;
    stim[12] = 3'h6;
    stim[13] = 3'h5;
    stim[14] = 3'h4;
    stim[15] = 3'h5;
    stim[16] = 3'h5;
    stim[17] = 3'h4;
    stim[18] = 3'h4;
    stim[19] = 3'h7;
    stim[20] = 3'h7;
    stim[21] = 3'h4;
    stim[22] = 3'h4;
    stim[23] = 3'h6;
    stim[24] = 3'h4;
    stim[25] = 3'h4;
    stim[26] = 3'h5;
    stim[27] = 3'h5;
    stim[28] = 3'h5;
    stim[29] = 3'h7;
    stim[30] = 3'h7;
    stim[31] = 3'h7;
    stim[32] = 3'h4;
    stim[33] = 3'h4;
    stim[34] = 3'h6;
    stim[35] = 3'h7;
    stim[36] = 3'h4;
    stim[37] = 3'h4;
    stim[38] = 3'h6;
    stim[39] = 3'h7;
    stim[40] = 3'h5;
    stim[41] = 3'h4;
    stim[42] = 3'h5;
    stim[43] = 3'h4;
    stim[44] = 3'h5;
    stim[45] = 3'h4;
    stim[46] = 3'h6;
    stim[47] = 3'h4;
    stim[48] = 3'h6;
    stim[49] = 3'h7;
    stim[50] = 3'h5;
    stim[51] = 3'h6;
    stim[52] = 3'h6;
    stim[53] = 3'h4;
    stim[54] = 3'h4;
    stim[55] = 3'h6;
    stim[56] = 3'h6;
    stim[57] = 3'h5;
    stim[58] = 3'h5;
    stim[59] = 3'h6;
    stim[60] = 3'h6;
    stim[61] = 3'h5;
    stim[62] = 3'h4;
    stim[63] = 3'h6;
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
      expv[0] = 10'h00d;
      expv[1] = 10'h00d;
      expv[2] = 10'h00d;
      expv[3] = 10'h00d;
      expv[4] = 10'h018;
      expv[5] = 10'h01d;
      expv[6] = 10'h01d;
      expv[7] = 10'h028;
      expv[8] = 10'h038;
      expv[9] = 10'h048;
      expv[10] = 10'h048;
      expv[11] = 10'h058;
      expv[12] = 10'h058;
      expv[13] = 10'h068;
      expv[14] = 10'h068;
      expv[15] = 10'h078;
      expv[16] = 10'h078;
      expv[17] = 10'h078;
      expv[18] = 10'h088;
      expv[19] = 10'h098;
      expv[20] = 10'h098;
      expv[21] = 10'h098;
      expv[22] = 10'h0a8;
      expv[23] = 10'h0b8;
      expv[24] = 10'h0c8;
      expv[25] = 10'h0d8;
      expv[26] = 10'h0e8;
      expv[27] = 10'h0e8;
      expv[28] = 10'h0e8;
      expv[29] = 10'h0e8;
      expv[30] = 10'h0e8;
      expv[31] = 10'h0e8;
      expv[32] = 10'h0e8;
      expv[33] = 10'h0f8;
      expv[34] = 10'h108;
      expv[35] = 10'h118;
      expv[36] = 10'h118;
      expv[37] = 10'h128;
      expv[38] = 10'h138;
      expv[39] = 10'h148;
      expv[40] = 10'h148;
      expv[41] = 10'h148;
      expv[42] = 10'h158;
      expv[43] = 10'h158;
      expv[44] = 10'h168;
      expv[45] = 10'h168;
      expv[46] = 10'h178;
      expv[47] = 10'h188;
      expv[48] = 10'h198;
      expv[49] = 10'h1a8;
      expv[50] = 10'h1a8;
      expv[51] = 10'h1a8;
      expv[52] = 10'h1b8;
      expv[53] = 10'h1c8;
      expv[54] = 10'h1d8;
      expv[55] = 10'h1e8;
      expv[56] = 10'h1f8;
      expv[57] = 10'h008;
      expv[58] = 10'h008;
      expv[59] = 10'h008;
      expv[60] = 10'h018;
      expv[61] = 10'h028;
      expv[62] = 10'h028;
      expv[63] = 10'h038;
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
