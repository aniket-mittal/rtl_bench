// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131974 dut (
    .clkA(clk),
    .clkB(in_vec[11:11]),
    .rst(in_vec[10:10]),
    .wrEnable(in_vec[9:9]),
    .rdEnable(in_vec[8:8]),
    .inputData(in_vec[7:0]),
    .outputData(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h66f;
    stim[1] = 12'he90;
    stim[2] = 12'h2a5;
    stim[3] = 12'h971;
    stim[4] = 12'ha9d;
    stim[5] = 12'h33d;
    stim[6] = 12'h9c5;
    stim[7] = 12'h87d;
    stim[8] = 12'ha32;
    stim[9] = 12'ha99;
    stim[10] = 12'hb81;
    stim[11] = 12'h090;
    stim[12] = 12'h8be;
    stim[13] = 12'h145;
    stim[14] = 12'h14f;
    stim[15] = 12'h952;
    stim[16] = 12'h10e;
    stim[17] = 12'h30f;
    stim[18] = 12'h1cd;
    stim[19] = 12'h144;
    stim[20] = 12'h269;
    stim[21] = 12'h286;
    stim[22] = 12'h3b0;
    stim[23] = 12'h23d;
    stim[24] = 12'h95c;
    stim[25] = 12'h1dd;
    stim[26] = 12'hb56;
    stim[27] = 12'h1d4;
    stim[28] = 12'hbe1;
    stim[29] = 12'h15c;
    stim[30] = 12'h0a5;
    stim[31] = 12'h169;
    stim[32] = 12'h920;
    stim[33] = 12'h9a9;
    stim[34] = 12'h075;
    stim[35] = 12'ha86;
    stim[36] = 12'h8d7;
    stim[37] = 12'h34f;
    stim[38] = 12'h26d;
    stim[39] = 12'h02d;
    stim[40] = 12'h0b9;
    stim[41] = 12'h374;
    stim[42] = 12'ha00;
    stim[43] = 12'h1ca;
    stim[44] = 12'h970;
    stim[45] = 12'had5;
    stim[46] = 12'h146;
    stim[47] = 12'h21a;
    stim[48] = 12'h1d4;
    stim[49] = 12'ha99;
    stim[50] = 12'h17d;
    stim[51] = 12'haad;
    stim[52] = 12'h0ae;
    stim[53] = 12'hb18;
    stim[54] = 12'hb0f;
    stim[55] = 12'ha02;
    stim[56] = 12'hadd;
    stim[57] = 12'h9e2;
    stim[58] = 12'h3ad;
    stim[59] = 12'h267;
    stim[60] = 12'h33a;
    stim[61] = 12'h135;
    stim[62] = 12'h85d;
    stim[63] = 12'hfb7;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'ha5;
      expv[16] = 8'ha5;
      expv[17] = 8'ha5;
      expv[18] = 8'ha5;
      expv[19] = 8'ha5;
      expv[20] = 8'ha5;
      expv[21] = 8'ha5;
      expv[22] = 8'ha5;
      expv[23] = 8'ha5;
      expv[24] = 8'h9d;
      expv[25] = 8'h9d;
      expv[26] = 8'h3d;
      expv[27] = 8'h3d;
      expv[28] = 8'h32;
      expv[29] = 8'h32;
      expv[30] = 8'h32;
      expv[31] = 8'h32;
      expv[32] = 8'h0f;
      expv[33] = 8'h0f;
      expv[34] = 8'h0f;
      expv[35] = 8'h0f;
      expv[36] = 8'h0f;
      expv[37] = 8'h0f;
      expv[38] = 8'h0f;
      expv[39] = 8'h0f;
      expv[40] = 8'h0f;
      expv[41] = 8'h0f;
      expv[42] = 8'h0f;
      expv[43] = 8'h0f;
      expv[44] = 8'h56;
      expv[45] = 8'h56;
      expv[46] = 8'h56;
      expv[47] = 8'h56;
      expv[48] = 8'h56;
      expv[49] = 8'h56;
      expv[50] = 8'h56;
      expv[51] = 8'h56;
      expv[52] = 8'h56;
      expv[53] = 8'h86;
      expv[54] = 8'h86;
      expv[55] = 8'h86;
      expv[56] = 8'h86;
      expv[57] = 8'h86;
      expv[58] = 8'h86;
      expv[59] = 8'h86;
      expv[60] = 8'h86;
      expv[61] = 8'h86;
      expv[62] = 8'h86;
      expv[63] = 8'h00;
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
