// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00116 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .i_enable(in_vec[26:26]),
    .i_wr_rdy(in_vec[25:24]),
    .i_wr_size(in_vec[23:0]),
    .o_wr_act(out_vec[34:33]),
    .o_wr_stb(out_vec[32:32]),
    .o_wr_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hade1f59;
    stim[1] = 28'h871e44e;
    stim[2] = 28'h6d86f8d;
    stim[3] = 28'h5b31537;
    stim[4] = 28'he35716a;
    stim[5] = 28'h4bf1933;
    stim[6] = 28'h4628ba2;
    stim[7] = 28'h4981605;
    stim[8] = 28'h2457126;
    stim[9] = 28'h2623f4b;
    stim[10] = 28'h3ea98ff;
    stim[11] = 28'h58f973a;
    stim[12] = 28'h3dfa668;
    stim[13] = 28'h22144cb;
    stim[14] = 28'h5ca9dc2;
    stim[15] = 28'h4fc38ab;
    stim[16] = 28'h5f5da65;
    stim[17] = 28'h176db85;
    stim[18] = 28'h7686cba;
    stim[19] = 28'h3d35515;
    stim[20] = 28'ha6fc793;
    stim[21] = 28'h092b8bb;
    stim[22] = 28'h568c7a8;
    stim[23] = 28'h02af4ad;
    stim[24] = 28'h48f05e0;
    stim[25] = 28'h71744d1;
    stim[26] = 28'h51ed380;
    stim[27] = 28'h74b0983;
    stim[28] = 28'h4f3011e;
    stim[29] = 28'h0c442ad;
    stim[30] = 28'h25c86d6;
    stim[31] = 28'h4c72930;
    stim[32] = 28'h2eb7cb8;
    stim[33] = 28'h2947098;
    stim[34] = 28'h2792bbe;
    stim[35] = 28'h3172e1b;
    stim[36] = 28'h18040ab;
    stim[37] = 28'h6eb21f2;
    stim[38] = 28'h550989d;
    stim[39] = 28'h2795dc0;
    stim[40] = 28'h5dad0ff;
    stim[41] = 28'h3750faf;
    stim[42] = 28'h612c42b;
    stim[43] = 28'h28812a2;
    stim[44] = 28'h53fa1ab;
    stim[45] = 28'h155b1f8;
    stim[46] = 28'h6952806;
    stim[47] = 28'h23d6c55;
    stim[48] = 28'h0407d0e;
    stim[49] = 28'h1ad63c9;
    stim[50] = 28'h10beadd;
    stim[51] = 28'h3a07ddb;
    stim[52] = 28'h775087f;
    stim[53] = 28'h0f1a26c;
    stim[54] = 28'h4124732;
    stim[55] = 28'h31786c7;
    stim[56] = 28'h3f8cb6d;
    stim[57] = 28'h2928b8b;
    stim[58] = 28'h7ed92ea;
    stim[59] = 28'h0583039;
    stim[60] = 28'h43f7ebb;
    stim[61] = 28'h024b837;
    stim[62] = 28'h5aa7d8a;
    stim[63] = 28'h48faa14;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h400000000;
      expv[4] = 35'h500000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h200000000;
      expv[13] = 35'h200000000;
      expv[14] = 35'h200000000;
      expv[15] = 35'h300000000;
      expv[16] = 35'h300000001;
      expv[17] = 35'h300000002;
      expv[18] = 35'h200000002;
      expv[19] = 35'h300000003;
      expv[20] = 35'h200000003;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h200000000;
      expv[24] = 35'h200000000;
      expv[25] = 35'h300000000;
      expv[26] = 35'h300000001;
      expv[27] = 35'h300000002;
      expv[28] = 35'h300000003;
      expv[29] = 35'h300000004;
      expv[30] = 35'h200000004;
      expv[31] = 35'h200000004;
      expv[32] = 35'h300000005;
      expv[33] = 35'h200000005;
      expv[34] = 35'h200000005;
      expv[35] = 35'h200000005;
      expv[36] = 35'h200000005;
      expv[37] = 35'h200000005;
      expv[38] = 35'h300000006;
      expv[39] = 35'h300000007;
      expv[40] = 35'h200000007;
      expv[41] = 35'h300000008;
      expv[42] = 35'h200000008;
      expv[43] = 35'h300000009;
      expv[44] = 35'h200000009;
      expv[45] = 35'h30000000a;
      expv[46] = 35'h20000000a;
      expv[47] = 35'h30000000b;
      expv[48] = 35'h20000000b;
      expv[49] = 35'h20000000b;
      expv[50] = 35'h20000000b;
      expv[51] = 35'h20000000b;
      expv[52] = 35'h20000000b;
      expv[53] = 35'h30000000c;
      expv[54] = 35'h20000000c;
      expv[55] = 35'h30000000d;
      expv[56] = 35'h20000000d;
      expv[57] = 35'h20000000d;
      expv[58] = 35'h20000000d;
      expv[59] = 35'h30000000e;
      expv[60] = 35'h20000000e;
      expv[61] = 35'h30000000f;
      expv[62] = 35'h20000000f;
      expv[63] = 35'h300000010;
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
