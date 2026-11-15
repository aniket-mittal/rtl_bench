// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005332 dut (
    .i_clk(clk),
    .i_rst(in_vec[0:0]),
    .o_hs(out_vec[46:46]),
    .o_vs(out_vec[45:45]),
    .dp_en(out_vec[44:44]),
    .line_count(out_vec[43:33]),
    .pixel_count(out_vec[32:22]),
    .px(out_vec[21:11]),
    .py(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 47'h600000000000;
      expv[1] = 47'h600000000000;
      expv[2] = 47'h600000000000;
      expv[3] = 47'h700000400000;
      expv[4] = 47'h700000800000;
      expv[5] = 47'h700000c00800;
      expv[6] = 47'h700001000800;
      expv[7] = 47'h700001400800;
      expv[8] = 47'h700001800800;
      expv[9] = 47'h700001c01000;
      expv[10] = 47'h700002001000;
      expv[11] = 47'h700002401000;
      expv[12] = 47'h700002801000;
      expv[13] = 47'h700002c01800;
      expv[14] = 47'h700003001800;
      expv[15] = 47'h700003401800;
      expv[16] = 47'h700003801800;
      expv[17] = 47'h700003c02000;
      expv[18] = 47'h700004002000;
      expv[19] = 47'h700004402000;
      expv[20] = 47'h700004802000;
      expv[21] = 47'h700004c02800;
      expv[22] = 47'h700005002800;
      expv[23] = 47'h700005402800;
      expv[24] = 47'h700005802800;
      expv[25] = 47'h700005c03000;
      expv[26] = 47'h700006003000;
      expv[27] = 47'h700006403000;
      expv[28] = 47'h700006803000;
      expv[29] = 47'h700006c03800;
      expv[30] = 47'h700007003800;
      expv[31] = 47'h700007403800;
      expv[32] = 47'h700007803800;
      expv[33] = 47'h700007c04000;
      expv[34] = 47'h700008004000;
      expv[35] = 47'h700008404000;
      expv[36] = 47'h700008804000;
      expv[37] = 47'h700008c04800;
      expv[38] = 47'h700009004800;
      expv[39] = 47'h700009404800;
      expv[40] = 47'h700009804800;
      expv[41] = 47'h700009c05000;
      expv[42] = 47'h70000a005000;
      expv[43] = 47'h70000a405000;
      expv[44] = 47'h70000a805000;
      expv[45] = 47'h70000ac05800;
      expv[46] = 47'h70000b005800;
      expv[47] = 47'h70000b405800;
      expv[48] = 47'h70000b805800;
      expv[49] = 47'h70000bc06000;
      expv[50] = 47'h70000c006000;
      expv[51] = 47'h70000c406000;
      expv[52] = 47'h70000c806000;
      expv[53] = 47'h70000cc06800;
      expv[54] = 47'h70000d006800;
      expv[55] = 47'h70000d406800;
      expv[56] = 47'h70000d806800;
      expv[57] = 47'h70000dc07000;
      expv[58] = 47'h70000e007000;
      expv[59] = 47'h70000e407000;
      expv[60] = 47'h70000e807000;
      expv[61] = 47'h70000ec07800;
      expv[62] = 47'h70000f007800;
      expv[63] = 47'h70000f407800;
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
