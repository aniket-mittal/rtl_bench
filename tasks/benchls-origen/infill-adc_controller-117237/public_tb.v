// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117237 dut (
    .adcclk(clk),
    .clkdiv(in_vec[24:23]),
    .adc_anain(in_vec[22:15]),
    .adc_anamux_sel(in_vec[14:12]),
    .adc_en(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .adc_start(in_vec[9:9]),
    .adc_dfx_en(in_vec[8:8]),
    .adc_anaviewsel(in_vec[7:4]),
    .i_adc_spare(in_vec[3:0]),
    .adcout(out_vec[15:6]),
    .adcdone(out_vec[5:5]),
    .adc_anaviewout(out_vec[4:4]),
    .o_adc_spare(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0b42e1f;
    stim[1] = 25'h0a72627;
    stim[2] = 25'h14acbb0;
    stim[3] = 25'h11cea2d;
    stim[4] = 25'h127f0bf;
    stim[5] = 25'h1f96b84;
    stim[6] = 25'h04e2289;
    stim[7] = 25'h018d3c8;
    stim[8] = 25'h05d4bd7;
    stim[9] = 25'h12ba920;
    stim[10] = 25'h1db7046;
    stim[11] = 25'h0dc0222;
    stim[12] = 25'h1923a6a;
    stim[13] = 25'h0ba21f2;
    stim[14] = 25'h0845b06;
    stim[15] = 25'h107e890;
    stim[16] = 25'h182f953;
    stim[17] = 25'h05df25a;
    stim[18] = 25'h084a0bc;
    stim[19] = 25'h1e4535e;
    stim[20] = 25'h1dfd0e6;
    stim[21] = 25'h1b8b379;
    stim[22] = 25'h0574b0d;
    stim[23] = 25'h1cf20b2;
    stim[24] = 25'h0f779e2;
    stim[25] = 25'h1d93045;
    stim[26] = 25'h1de3294;
    stim[27] = 25'h0e5539f;
    stim[28] = 25'h10c2341;
    stim[29] = 25'h150733d;
    stim[30] = 25'h18440bf;
    stim[31] = 25'h1b1509a;
    stim[32] = 25'h0cbe806;
    stim[33] = 25'h18a1394;
    stim[34] = 25'h071f967;
    stim[35] = 25'h1bbe257;
    stim[36] = 25'h14fb8b5;
    stim[37] = 25'h10042a2;
    stim[38] = 25'h0440056;
    stim[39] = 25'h12c73bb;
    stim[40] = 25'h1df3ac9;
    stim[41] = 25'h0b159da;
    stim[42] = 25'h0712001;
    stim[43] = 25'h0bddaff;
    stim[44] = 25'h1249070;
    stim[45] = 25'h1df8b2d;
    stim[46] = 25'h1f069a9;
    stim[47] = 25'h040039f;
    stim[48] = 25'h043ebca;
    stim[49] = 25'h07d48c2;
    stim[50] = 25'h008e26e;
    stim[51] = 25'h18c6171;
    stim[52] = 25'h04ce16a;
    stim[53] = 25'h1cf494a;
    stim[54] = 25'h01cb081;
    stim[55] = 25'h1e51bad;
    stim[56] = 25'h0ecb2fe;
    stim[57] = 25'h14543a2;
    stim[58] = 25'h04441a3;
    stim[59] = 25'h064282d;
    stim[60] = 25'h05df8b0;
    stim[61] = 25'h07872a8;
    stim[62] = 25'h05b401c;
    stim[63] = 25'h193e9c2;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0001;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0001;
      expv[6] = 16'h0000;
      expv[7] = 16'h0001;
      expv[8] = 16'h0001;
      expv[9] = 16'h0001;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0001;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0001;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0001;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0001;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0001;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0001;
      expv[46] = 16'h0001;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0001;
      expv[54] = 16'h0000;
      expv[55] = 16'h0001;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
