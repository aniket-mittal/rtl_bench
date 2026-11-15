// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034946 dut (
    .clk(clk),
    .rst_n(in_vec[0:0]),
    .c1(out_vec[41:34]),
    .x(out_vec[33:26]),
    .y(out_vec[25:18]),
    .act1(out_vec[17:10]),
    .act2(out_vec[9:2]),
    .i(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00428040404;
      expv[4] = 42'h00828080408;
      expv[5] = 42'h00c280c040c;
      expv[6] = 42'h01028100410;
      expv[7] = 42'h01428140414;
      expv[8] = 42'h01828180418;
      expv[9] = 42'h01c281c041c;
      expv[10] = 42'h02028200420;
      expv[11] = 42'h02428240424;
      expv[12] = 42'h02828280428;
      expv[13] = 42'h02c502c082c;
      expv[14] = 42'h03050300830;
      expv[15] = 42'h03450340834;
      expv[16] = 42'h03850380838;
      expv[17] = 42'h03c503c083c;
      expv[18] = 42'h04050400840;
      expv[19] = 42'h04450440844;
      expv[20] = 42'h04850480848;
      expv[21] = 42'h04c504c084c;
      expv[22] = 42'h05050500850;
      expv[23] = 42'h05478540c54;
      expv[24] = 42'h05878580c58;
      expv[25] = 42'h05c785c0c5c;
      expv[26] = 42'h06078600c60;
      expv[27] = 42'h06478640c64;
      expv[28] = 42'h06878680c68;
      expv[29] = 42'h06c786c0c6c;
      expv[30] = 42'h07078700c70;
      expv[31] = 42'h07478740c74;
      expv[32] = 42'h07878780c78;
      expv[33] = 42'h07ca07c107c;
      expv[34] = 42'h080a0801080;
      expv[35] = 42'h084a0841084;
      expv[36] = 42'h088a0881088;
      expv[37] = 42'h08ca08c108c;
      expv[38] = 42'h090a0901090;
      expv[39] = 42'h094a0941094;
      expv[40] = 42'h098a0981098;
      expv[41] = 42'h09ca09c109c;
      expv[42] = 42'h0a0a0a010a0;
      expv[43] = 42'h0a4c8a414a4;
      expv[44] = 42'h0a8c8a814a8;
      expv[45] = 42'h0acc8ac14ac;
      expv[46] = 42'h0b0c8b014b0;
      expv[47] = 42'h0b4c8b414b4;
      expv[48] = 42'h0b8c8b814b8;
      expv[49] = 42'h0bcc8bc14bc;
      expv[50] = 42'h0c0c8c014c0;
      expv[51] = 42'h0c4c8c414c4;
      expv[52] = 42'h0c8c8c814c8;
      expv[53] = 42'h0ccf0cc18cc;
      expv[54] = 42'h0d0f0d018d0;
      expv[55] = 42'h0d4f0d418d4;
      expv[56] = 42'h0d8f0d818d8;
      expv[57] = 42'h0dcf0dc18dc;
      expv[58] = 42'h0e0f0e018e0;
      expv[59] = 42'h0e4f0e418e4;
      expv[60] = 42'h0e8f0e818e8;
      expv[61] = 42'h0ecf0ec18ec;
      expv[62] = 42'h0f0f0f018f0;
      expv[63] = 42'h0f518f41cf4;
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
