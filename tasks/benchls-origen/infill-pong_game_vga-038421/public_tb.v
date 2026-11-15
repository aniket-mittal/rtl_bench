// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_038421 dut (
    .clk(clk),
    .bright(in_vec[21:21]),
    .button(in_vec[20:20]),
    .hCount(in_vec[19:10]),
    .vCount(in_vec[9:0]),
    .rgb(out_vec[27:16]),
    .score(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h01abac;
    stim[1] = 22'h39e45e;
    stim[2] = 22'h2274e5;
    stim[3] = 22'h1b59fe;
    stim[4] = 22'h27cee3;
    stim[5] = 22'h0afd95;
    stim[6] = 22'h3af9a0;
    stim[7] = 22'h108aee;
    stim[8] = 22'h0c29eb;
    stim[9] = 22'h38010c;
    stim[10] = 22'h3ddc3c;
    stim[11] = 22'h283c87;
    stim[12] = 22'h00649e;
    stim[13] = 22'h0ccafd;
    stim[14] = 22'h3cfae4;
    stim[15] = 22'h14d9ea;
    stim[16] = 22'h37beca;
    stim[17] = 22'h32897a;
    stim[18] = 22'h382253;
    stim[19] = 22'h3ad8f5;
    stim[20] = 22'h04f354;
    stim[21] = 22'h0fb412;
    stim[22] = 22'h2461c1;
    stim[23] = 22'h0b9551;
    stim[24] = 22'h1cc920;
    stim[25] = 22'h3703a5;
    stim[26] = 22'h13377a;
    stim[27] = 22'h17a8a6;
    stim[28] = 22'h33bffa;
    stim[29] = 22'h2aa084;
    stim[30] = 22'h2e1602;
    stim[31] = 22'h06d69f;
    stim[32] = 22'h0af41c;
    stim[33] = 22'h32faf1;
    stim[34] = 22'h32f3ad;
    stim[35] = 22'h18aada;
    stim[36] = 22'h269356;
    stim[37] = 22'h20e7df;
    stim[38] = 22'h3682db;
    stim[39] = 22'h175b44;
    stim[40] = 22'h0ceb73;
    stim[41] = 22'h37ef5f;
    stim[42] = 22'h165651;
    stim[43] = 22'h3ca424;
    stim[44] = 22'h3b643e;
    stim[45] = 22'h35c446;
    stim[46] = 22'h212f60;
    stim[47] = 22'h1dc593;
    stim[48] = 22'h2ffd4e;
    stim[49] = 22'h1d5e84;
    stim[50] = 22'h096c61;
    stim[51] = 22'h32f635;
    stim[52] = 22'h294a3a;
    stim[53] = 22'h00034a;
    stim[54] = 22'h352d81;
    stim[55] = 22'h0ddc50;
    stim[56] = 22'h31e826;
    stim[57] = 22'h0273a4;
    stim[58] = 22'h3ac78d;
    stim[59] = 22'h12d463;
    stim[60] = 22'h1c48e9;
    stim[61] = 22'h34c37f;
    stim[62] = 22'h0ff30e;
    stim[63] = 22'h26cae1;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'h000xxxx;
      expv[2] = 28'hf00xxxx;
      expv[3] = 28'hf00xxxx;
      expv[4] = 28'h000xxxx;
      expv[5] = 28'hf00xxxx;
      expv[6] = 28'h000xxxx;
      expv[7] = 28'hf00xxxx;
      expv[8] = 28'h000xxxx;
      expv[9] = 28'h000xxxx;
      expv[10] = 28'hf00xxxx;
      expv[11] = 28'hf00xxxx;
      expv[12] = 28'hf00xxxx;
      expv[13] = 28'h000xxxx;
      expv[14] = 28'h000xxxx;
      expv[15] = 28'hf00xxxx;
      expv[16] = 28'h000xxxx;
      expv[17] = 28'hf00xxxx;
      expv[18] = 28'hf00xxxx;
      expv[19] = 28'hf00xxxx;
      expv[20] = 28'hf00xxxx;
      expv[21] = 28'h000xxxx;
      expv[22] = 28'h000xxxx;
      expv[23] = 28'hf00xxxx;
      expv[24] = 28'h000xxxx;
      expv[25] = 28'h000xxxx;
      expv[26] = 28'hf00xxxx;
      expv[27] = 28'h000xxxx;
      expv[28] = 28'h000xxxx;
      expv[29] = 28'hf00xxxx;
      expv[30] = 28'hf00xxxx;
      expv[31] = 28'hf00xxxx;
      expv[32] = 28'h000xxxx;
      expv[33] = 28'h000xxxx;
      expv[34] = 28'hf00xxxx;
      expv[35] = 28'hf00xxxx;
      expv[36] = 28'h000xxxx;
      expv[37] = 28'hf00xxxx;
      expv[38] = 28'hf00xxxx;
      expv[39] = 28'hf00xxxx;
      expv[40] = 28'h000xxxx;
      expv[41] = 28'h000xxxx;
      expv[42] = 28'hf00xxxx;
      expv[43] = 28'h000xxxx;
      expv[44] = 28'hf00xxxx;
      expv[45] = 28'hf00xxxx;
      expv[46] = 28'hf00xxxx;
      expv[47] = 28'hf00xxxx;
      expv[48] = 28'h000xxxx;
      expv[49] = 28'hf00xxxx;
      expv[50] = 28'h000xxxx;
      expv[51] = 28'h000xxxx;
      expv[52] = 28'hf00xxxx;
      expv[53] = 28'hf00xxxx;
      expv[54] = 28'h000xxxx;
      expv[55] = 28'hf00xxxx;
      expv[56] = 28'h000xxxx;
      expv[57] = 28'hf00xxxx;
      expv[58] = 28'h000xxxx;
      expv[59] = 28'hf00xxxx;
      expv[60] = 28'h000xxxx;
      expv[61] = 28'h000xxxx;
      expv[62] = 28'hf00xxxx;
      expv[63] = 28'h000xxxx;
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
