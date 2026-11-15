// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023498 dut (
    .i_clk(clk),
    .i_rst(in_vec[11:11]),
    .i_data(in_vec[10:3]),
    .i_valid(in_vec[2:2]),
    .i_ready(in_vec[1:1]),
    .i_esc_ready(in_vec[0:0]),
    .o_ready(out_vec[18:18]),
    .o_data(out_vec[17:10]),
    .o_valid(out_vec[9:9]),
    .o_esc_data(out_vec[8:1]),
    .o_esc_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbf3;
    stim[1] = 12'hdc2;
    stim[2] = 12'h475;
    stim[3] = 12'h432;
    stim[4] = 12'h6ed;
    stim[5] = 12'h496;
    stim[6] = 12'h732;
    stim[7] = 12'h5b6;
    stim[8] = 12'h6c7;
    stim[9] = 12'h25a;
    stim[10] = 12'h73e;
    stim[11] = 12'h657;
    stim[12] = 12'h672;
    stim[13] = 12'h45d;
    stim[14] = 12'h057;
    stim[15] = 12'h19d;
    stim[16] = 12'h34c;
    stim[17] = 12'h2b2;
    stim[18] = 12'h4ff;
    stim[19] = 12'h1ae;
    stim[20] = 12'h343;
    stim[21] = 12'h03d;
    stim[22] = 12'h68c;
    stim[23] = 12'h1b8;
    stim[24] = 12'h71d;
    stim[25] = 12'h164;
    stim[26] = 12'h090;
    stim[27] = 12'h47c;
    stim[28] = 12'h4f8;
    stim[29] = 12'h407;
    stim[30] = 12'h560;
    stim[31] = 12'h234;
    stim[32] = 12'h4f0;
    stim[33] = 12'h114;
    stim[34] = 12'h5c1;
    stim[35] = 12'h77e;
    stim[36] = 12'h4f6;
    stim[37] = 12'h51f;
    stim[38] = 12'h175;
    stim[39] = 12'h5f4;
    stim[40] = 12'h7b8;
    stim[41] = 12'h158;
    stim[42] = 12'h18a;
    stim[43] = 12'h675;
    stim[44] = 12'h2d3;
    stim[45] = 12'h360;
    stim[46] = 12'h110;
    stim[47] = 12'h14c;
    stim[48] = 12'h437;
    stim[49] = 12'h24b;
    stim[50] = 12'h504;
    stim[51] = 12'h186;
    stim[52] = 12'h7a3;
    stim[53] = 12'h1fe;
    stim[54] = 12'h096;
    stim[55] = 12'h773;
    stim[56] = 12'h4ef;
    stim[57] = 12'h167;
    stim[58] = 12'h072;
    stim[59] = 12'h180;
    stim[60] = 12'h2fc;
    stim[61] = 12'h2dc;
    stim[62] = 12'h5f8;
    stim[63] = 12'h110;
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
      expv[0] = 19'h40000;
      expv[1] = 19'h40000;
      expv[2] = 19'h40000;
      expv[3] = 19'h63b1c;
      expv[4] = 19'h6391c;
      expv[5] = 19'h777ba;
      expv[6] = 19'h64b24;
      expv[7] = 19'h64924;
      expv[8] = 19'h6db6c;
      expv[9] = 19'h763b0;
      expv[10] = 19'h761b0;
      expv[11] = 19'h79fce;
      expv[12] = 19'h72b94;
      expv[13] = 19'h72994;
      expv[14] = 19'h62f16;
      expv[15] = 19'h02a14;
      expv[16] = 19'h02a14;
      expv[17] = 19'h42a14;
      expv[18] = 19'h42814;
      expv[19] = 19'h67f3e;
      expv[20] = 19'h4d66a;
      expv[21] = 19'h4d46a;
      expv[22] = 19'h01e0e;
      expv[23] = 19'h01e0e;
      expv[24] = 19'h01e0e;
      expv[25] = 19'h01e0e;
      expv[26] = 19'h01e0e;
      expv[27] = 19'h01e0e;
      expv[28] = 19'h01e0e;
      expv[29] = 19'h41e0e;
      expv[30] = 19'h20300;
      expv[31] = 19'h20300;
      expv[32] = 19'h20300;
      expv[33] = 19'h20300;
      expv[34] = 19'h20300;
      expv[35] = 19'h60300;
      expv[36] = 19'h7bfde;
      expv[37] = 19'h67b3c;
      expv[38] = 19'h28f46;
      expv[39] = 19'h28f46;
      expv[40] = 19'h28f46;
      expv[41] = 19'h28f46;
      expv[42] = 19'h68f46;
      expv[43] = 19'h68d46;
      expv[44] = 19'h73b9c;
      expv[45] = 19'h7399c;
      expv[46] = 19'h7399c;
      expv[47] = 19'h7399c;
      expv[48] = 19'h4a652;
      expv[49] = 19'h61b0c;
      expv[50] = 19'h6190c;
      expv[51] = 19'h68340;
      expv[52] = 19'h4c260;
      expv[53] = 19'h4c060;
      expv[54] = 19'h4fe7e;
      expv[55] = 19'h44a24;
      expv[56] = 19'h44824;
      expv[57] = 19'h6773a;
      expv[58] = 19'h4b258;
      expv[59] = 19'h4b058;
      expv[60] = 19'h4b058;
      expv[61] = 19'h17ebe;
      expv[62] = 19'h17ebe;
      expv[63] = 19'h17ebe;
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
