// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05692 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h285ca9;
    stim[1] = 22'h290c45;
    stim[2] = 22'h2e4ca5;
    stim[3] = 22'h22dc7b;
    stim[4] = 22'h221e7c;
    stim[5] = 22'h2e6d0c;
    stim[6] = 22'h23cb5b;
    stim[7] = 22'h3a3183;
    stim[8] = 22'h3f00d0;
    stim[9] = 22'h0af854;
    stim[10] = 22'h3eefa8;
    stim[11] = 22'h3aa665;
    stim[12] = 22'h3e01ce;
    stim[13] = 22'h3b6917;
    stim[14] = 22'h2b95d0;
    stim[15] = 22'h3b0fcc;
    stim[16] = 22'h2159eb;
    stim[17] = 22'h2eb5fa;
    stim[18] = 22'h166672;
    stim[19] = 22'h371627;
    stim[20] = 22'h0604cb;
    stim[21] = 22'h3bf6df;
    stim[22] = 22'h0f063e;
    stim[23] = 22'h098160;
    stim[24] = 22'h1a4bbd;
    stim[25] = 22'h145090;
    stim[26] = 22'h26edc3;
    stim[27] = 22'h1bbea1;
    stim[28] = 22'h3eabcc;
    stim[29] = 22'h0a7699;
    stim[30] = 22'h03f99f;
    stim[31] = 22'h1e0a09;
    stim[32] = 22'h071722;
    stim[33] = 22'h0e2675;
    stim[34] = 22'h1afce7;
    stim[35] = 22'h2f192c;
    stim[36] = 22'h1e2ed4;
    stim[37] = 22'h0f71e4;
    stim[38] = 22'h0e79bd;
    stim[39] = 22'h23bfb2;
    stim[40] = 22'h02ea2b;
    stim[41] = 22'h1a1424;
    stim[42] = 22'h223618;
    stim[43] = 22'h33819e;
    stim[44] = 22'h16028f;
    stim[45] = 22'h0ecce8;
    stim[46] = 22'h0bf02d;
    stim[47] = 22'h026f19;
    stim[48] = 22'h02b3fd;
    stim[49] = 22'h2f37db;
    stim[50] = 22'h17854d;
    stim[51] = 22'h03117d;
    stim[52] = 22'h3efebc;
    stim[53] = 22'h3e4863;
    stim[54] = 22'h072431;
    stim[55] = 22'h2ad5f9;
    stim[56] = 22'h33bffa;
    stim[57] = 22'h2acfd5;
    stim[58] = 22'h2686d9;
    stim[59] = 22'h27e372;
    stim[60] = 22'h12ffb3;
    stim[61] = 22'h0a305e;
    stim[62] = 22'h3b9256;
    stim[63] = 22'h0feb16;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0869f;
      expv[5] = 17'h0869f;
      expv[6] = 17'h00001;
      expv[7] = 17'h0869f;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00001;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h086cf;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00001;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00001;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00a09;
      expv[36] = 17'h00001;
      expv[37] = 17'h00a09;
      expv[38] = 17'h00005;
      expv[39] = 17'h00005;
      expv[40] = 17'h0869f;
      expv[41] = 17'h00002;
      expv[42] = 17'h02ed4;
      expv[43] = 17'h0869f;
      expv[44] = 17'h00000;
      expv[45] = 17'h086cf;
      expv[46] = 17'h0000d;
      expv[47] = 17'h00008;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00001;
      expv[51] = 17'h0028f;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00001;
      expv[57] = 17'h00000;
      expv[58] = 17'h00001;
      expv[59] = 17'h0869f;
      expv[60] = 17'h0028f;
      expv[61] = 17'h0028f;
      expv[62] = 17'h00008;
      expv[63] = 17'h00000;
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
