// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08269 dut (
    .clk(clk),
    .reset(in_vec[6:6]),
    .stream_in_data(in_vec[5:5]),
    .stream_in_startofpacket(in_vec[4:4]),
    .stream_in_endofpacket(in_vec[3:3]),
    .stream_in_empty(in_vec[2:2]),
    .stream_in_valid(in_vec[1:1]),
    .stream_out_ready(in_vec[0:0]),
    .stream_in_ready(out_vec[45:45]),
    .stream_out_data(out_vec[44:5]),
    .stream_out_startofpacket(out_vec[4:4]),
    .stream_out_endofpacket(out_vec[3:3]),
    .stream_out_empty(out_vec[2:1]),
    .stream_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h76;
    stim[1] = 7'h67;
    stim[2] = 7'h31;
    stim[3] = 7'h25;
    stim[4] = 7'h1c;
    stim[5] = 7'h0b;
    stim[6] = 7'h2c;
    stim[7] = 7'h3e;
    stim[8] = 7'h28;
    stim[9] = 7'h0d;
    stim[10] = 7'h10;
    stim[11] = 7'h27;
    stim[12] = 7'h1c;
    stim[13] = 7'h02;
    stim[14] = 7'h07;
    stim[15] = 7'h38;
    stim[16] = 7'h33;
    stim[17] = 7'h15;
    stim[18] = 7'h78;
    stim[19] = 7'h33;
    stim[20] = 7'h1c;
    stim[21] = 7'h22;
    stim[22] = 7'h3b;
    stim[23] = 7'h3b;
    stim[24] = 7'h16;
    stim[25] = 7'h15;
    stim[26] = 7'h2d;
    stim[27] = 7'h30;
    stim[28] = 7'h04;
    stim[29] = 7'h1c;
    stim[30] = 7'h1c;
    stim[31] = 7'h16;
    stim[32] = 7'h29;
    stim[33] = 7'h1d;
    stim[34] = 7'h2c;
    stim[35] = 7'h08;
    stim[36] = 7'h04;
    stim[37] = 7'h1a;
    stim[38] = 7'h20;
    stim[39] = 7'h07;
    stim[40] = 7'h37;
    stim[41] = 7'h1d;
    stim[42] = 7'h0c;
    stim[43] = 7'h08;
    stim[44] = 7'h04;
    stim[45] = 7'h22;
    stim[46] = 7'h11;
    stim[47] = 7'h14;
    stim[48] = 7'h36;
    stim[49] = 7'h1a;
    stim[50] = 7'h10;
    stim[51] = 7'h35;
    stim[52] = 7'h0f;
    stim[53] = 7'h35;
    stim[54] = 7'h11;
    stim[55] = 7'h26;
    stim[56] = 7'h09;
    stim[57] = 7'h23;
    stim[58] = 7'h3f;
    stim[59] = 7'h37;
    stim[60] = 7'h08;
    stim[61] = 7'h36;
    stim[62] = 7'h07;
    stim[63] = 7'h03;
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
      expv[0] = 46'hxxxxxxxxxxxx;
      expv[1] = 46'h200000000000;
      expv[2] = 46'h200000000000;
      expv[3] = 46'h3ffffffffff0;
      expv[4] = 46'h3fffffffffe2;
      expv[5] = 46'h3ff80000001a;
      expv[6] = 46'h1ff800000009;
      expv[7] = 46'h1ff800000009;
      expv[8] = 46'h1ff800000009;
      expv[9] = 46'h3ff800000009;
      expv[10] = 46'h3ff80000000a;
      expv[11] = 46'h3ff800000010;
      expv[12] = 46'h1fffffffffe3;
      expv[13] = 46'h1fffffffffe3;
      expv[14] = 46'h3fffffffffe3;
      expv[15] = 46'h1ff800000003;
      expv[16] = 46'h3ff800000003;
      expv[17] = 46'h3ffffffffff1;
      expv[18] = 46'h3ff800000012;
      expv[19] = 46'h200000000000;
      expv[20] = 46'h1ffffffffff1;
      expv[21] = 46'h1ffffffffff1;
      expv[22] = 46'h3ffffffffff1;
      expv[23] = 46'h3ffffffffff9;
      expv[24] = 46'h1ffffffffff9;
      expv[25] = 46'h3ffffffffff9;
      expv[26] = 46'h3ff800000012;
      expv[27] = 46'h3fffffffffea;
      expv[28] = 46'h3ffffffffff0;
      expv[29] = 46'h3ff800000002;
      expv[30] = 46'h3ff80000001a;
      expv[31] = 46'h3ff80000001a;
      expv[32] = 46'h3ff800000013;
      expv[33] = 46'h3fffffffffe8;
      expv[34] = 46'h3ff80000001a;
      expv[35] = 46'h3fffffffffea;
      expv[36] = 46'h3ff800000008;
      expv[37] = 46'h3ff800000002;
      expv[38] = 46'h1ff800000019;
      expv[39] = 46'h3ff800000019;
      expv[40] = 46'h3ff800000003;
      expv[41] = 46'h3ffffffffff3;
      expv[42] = 46'h3ff80000001a;
      expv[43] = 46'h3ff80000000a;
      expv[44] = 46'h3ff800000008;
      expv[45] = 46'h3ff800000002;
      expv[46] = 46'h3fffffffffe1;
      expv[47] = 46'h3ff800000010;
      expv[48] = 46'h3ff800000012;
      expv[49] = 46'h1ffffffffff3;
      expv[50] = 46'h1ffffffffff3;
      expv[51] = 46'h3ffffffffff3;
      expv[52] = 46'h3ffffffffff2;
      expv[53] = 46'h3ff80000000b;
      expv[54] = 46'h3ffffffffff2;
      expv[55] = 46'h3ff800000010;
      expv[56] = 46'h3fffffffffe3;
      expv[57] = 46'h3ff800000008;
      expv[58] = 46'h3fffffffffe1;
      expv[59] = 46'h3ffffffffffb;
      expv[60] = 46'h1ffffffffff3;
      expv[61] = 46'h1ffffffffff3;
      expv[62] = 46'h3ffffffffff3;
      expv[63] = 46'h3ff800000003;
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
