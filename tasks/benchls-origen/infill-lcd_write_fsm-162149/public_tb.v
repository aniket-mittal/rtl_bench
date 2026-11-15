// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162149 dut (
    .clkFSM(clk),
    .resetFSM(in_vec[7:7]),
    .initDone(in_vec[6:6]),
    .writeDone(in_vec[5:5]),
    .input_data(in_vec[4:1]),
    .update(in_vec[0:0]),
    .data(out_vec[9:2]),
    .writeStart(out_vec[1:1]),
    .lcd_clear(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'he6;
    stim[1] = 8'hff;
    stim[2] = 8'h19;
    stim[3] = 8'h2f;
    stim[4] = 8'h6f;
    stim[5] = 8'h37;
    stim[6] = 8'h74;
    stim[7] = 8'h52;
    stim[8] = 8'h07;
    stim[9] = 8'h4a;
    stim[10] = 8'h5f;
    stim[11] = 8'h58;
    stim[12] = 8'h24;
    stim[13] = 8'h7a;
    stim[14] = 8'h1d;
    stim[15] = 8'h63;
    stim[16] = 8'h64;
    stim[17] = 8'h01;
    stim[18] = 8'h6e;
    stim[19] = 8'h6f;
    stim[20] = 8'h02;
    stim[21] = 8'h8d;
    stim[22] = 8'h60;
    stim[23] = 8'h59;
    stim[24] = 8'h65;
    stim[25] = 8'h4e;
    stim[26] = 8'h75;
    stim[27] = 8'h4f;
    stim[28] = 8'h0b;
    stim[29] = 8'h41;
    stim[30] = 8'h50;
    stim[31] = 8'h72;
    stim[32] = 8'h4e;
    stim[33] = 8'h37;
    stim[34] = 8'h63;
    stim[35] = 8'h1e;
    stim[36] = 8'h16;
    stim[37] = 8'h50;
    stim[38] = 8'h75;
    stim[39] = 8'h40;
    stim[40] = 8'h69;
    stim[41] = 8'h13;
    stim[42] = 8'h26;
    stim[43] = 8'h4b;
    stim[44] = 8'h0f;
    stim[45] = 8'h62;
    stim[46] = 8'h06;
    stim[47] = 8'h60;
    stim[48] = 8'h1e;
    stim[49] = 8'h4a;
    stim[50] = 8'h2c;
    stim[51] = 8'h50;
    stim[52] = 8'h3a;
    stim[53] = 8'h4b;
    stim[54] = 8'h02;
    stim[55] = 8'h2e;
    stim[56] = 8'h15;
    stim[57] = 8'h3f;
    stim[58] = 8'h47;
    stim[59] = 8'h0d;
    stim[60] = 8'h0e;
    stim[61] = 8'h24;
    stim[62] = 8'h6c;
    stim[63] = 8'h01;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'h0xx;
      expv[7] = 10'h0xx;
      expv[8] = 10'h0xx;
      expv[9] = 10'h0xx;
      expv[10] = 10'h0xx;
      expv[11] = 10'h0xx;
      expv[12] = 10'h0xx;
      expv[13] = 10'h0xx;
      expv[14] = 10'h0xx;
      expv[15] = 10'h0xx;
      expv[16] = 10'h0xx;
      expv[17] = 10'h0xx;
      expv[18] = 10'h0xx;
      expv[19] = 10'h0xx;
      expv[20] = 10'h02e;
      expv[21] = 10'h02c;
      expv[22] = 10'h02c;
      expv[23] = 10'h02c;
      expv[24] = 10'h01e;
      expv[25] = 10'h01c;
      expv[26] = 10'h026;
      expv[27] = 10'h024;
      expv[28] = 10'h025;
      expv[29] = 10'h025;
      expv[30] = 10'h025;
      expv[31] = 10'h025;
      expv[32] = 10'h025;
      expv[33] = 10'h024;
      expv[34] = 10'h024;
      expv[35] = 10'h032;
      expv[36] = 10'h030;
      expv[37] = 10'h030;
      expv[38] = 10'h030;
      expv[39] = 10'h030;
      expv[40] = 10'h01e;
      expv[41] = 10'h01c;
      expv[42] = 10'h01d;
      expv[43] = 10'h01d;
      expv[44] = 10'h01c;
      expv[45] = 10'h01d;
      expv[46] = 10'h01c;
      expv[47] = 10'h01c;
      expv[48] = 10'h01c;
      expv[49] = 10'h006;
      expv[50] = 10'h004;
      expv[51] = 10'h004;
      expv[52] = 10'h002;
      expv[53] = 10'h000;
      expv[54] = 10'h001;
      expv[55] = 10'h001;
      expv[56] = 10'h001;
      expv[57] = 10'h000;
      expv[58] = 10'h001;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
