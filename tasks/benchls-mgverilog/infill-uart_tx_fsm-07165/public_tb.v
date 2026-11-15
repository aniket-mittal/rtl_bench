// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07165 dut (
    .clk_in(clk),
    .enable(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .din(in_vec[7:0]),
    .busy(out_vec[2:2]),
    .done(out_vec[1:1]),
    .tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h31c;
    stim[1] = 10'h3f9;
    stim[2] = 10'h2fb;
    stim[3] = 10'h0b9;
    stim[4] = 10'h0e4;
    stim[5] = 10'h0f8;
    stim[6] = 10'h0f8;
    stim[7] = 10'h20a;
    stim[8] = 10'h26f;
    stim[9] = 10'h260;
    stim[10] = 10'h04d;
    stim[11] = 10'h272;
    stim[12] = 10'h0bd;
    stim[13] = 10'h0f0;
    stim[14] = 10'h2ad;
    stim[15] = 10'h072;
    stim[16] = 10'h213;
    stim[17] = 10'h24c;
    stim[18] = 10'h2cb;
    stim[19] = 10'h0e1;
    stim[20] = 10'h393;
    stim[21] = 10'h22e;
    stim[22] = 10'h2f7;
    stim[23] = 10'h0eb;
    stim[24] = 10'h273;
    stim[25] = 10'h0f8;
    stim[26] = 10'h26c;
    stim[27] = 10'h21e;
    stim[28] = 10'h217;
    stim[29] = 10'h28c;
    stim[30] = 10'h20d;
    stim[31] = 10'h091;
    stim[32] = 10'h0ea;
    stim[33] = 10'h08a;
    stim[34] = 10'h2fd;
    stim[35] = 10'h088;
    stim[36] = 10'h25b;
    stim[37] = 10'h0c3;
    stim[38] = 10'h001;
    stim[39] = 10'h2b6;
    stim[40] = 10'h21a;
    stim[41] = 10'h26b;
    stim[42] = 10'h230;
    stim[43] = 10'h0d6;
    stim[44] = 10'h087;
    stim[45] = 10'h0f1;
    stim[46] = 10'h2f5;
    stim[47] = 10'h09d;
    stim[48] = 10'h271;
    stim[49] = 10'h292;
    stim[50] = 10'h289;
    stim[51] = 10'h2e9;
    stim[52] = 10'h2dd;
    stim[53] = 10'h29e;
    stim[54] = 10'h2d9;
    stim[55] = 10'h0a4;
    stim[56] = 10'h237;
    stim[57] = 10'h242;
    stim[58] = 10'h0da;
    stim[59] = 10'h065;
    stim[60] = 10'h0f4;
    stim[61] = 10'h2c8;
    stim[62] = 10'h023;
    stim[63] = 10'h230;
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
      expv[0] = 3'h1;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h5;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h5;
      expv[22] = 3'h5;
      expv[23] = 3'h5;
      expv[24] = 3'h5;
      expv[25] = 3'h5;
      expv[26] = 3'h5;
      expv[27] = 3'h5;
      expv[28] = 3'h5;
      expv[29] = 3'h5;
      expv[30] = 3'h5;
      expv[31] = 3'h5;
      expv[32] = 3'h5;
      expv[33] = 3'h5;
      expv[34] = 3'h5;
      expv[35] = 3'h5;
      expv[36] = 3'h5;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h5;
      expv[40] = 3'h5;
      expv[41] = 3'h5;
      expv[42] = 3'h5;
      expv[43] = 3'h5;
      expv[44] = 3'h5;
      expv[45] = 3'h5;
      expv[46] = 3'h5;
      expv[47] = 3'h5;
      expv[48] = 3'h5;
      expv[49] = 3'h5;
      expv[50] = 3'h5;
      expv[51] = 3'h5;
      expv[52] = 3'h5;
      expv[53] = 3'h5;
      expv[54] = 3'h5;
      expv[55] = 3'h5;
      expv[56] = 3'h5;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h5;
      expv[60] = 3'h5;
      expv[61] = 3'h5;
      expv[62] = 3'h5;
      expv[63] = 3'h5;
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
