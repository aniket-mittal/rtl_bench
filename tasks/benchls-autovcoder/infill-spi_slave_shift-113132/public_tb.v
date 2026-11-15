// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113132 dut (
    .i_clk(clk),
    .i_reset_n(in_vec[11:11]),
    .i_spi_cs_n(in_vec[10:10]),
    .i_spi_sck(in_vec[9:9]),
    .i_spi_si(in_vec[8:8]),
    .i_wr_data(in_vec[7:0]),
    .o_spi_so(out_vec[9:9]),
    .o_rd_data(out_vec[8:1]),
    .o_last_bit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h419;
    stim[1] = 12'h1b8;
    stim[2] = 12'hd9b;
    stim[3] = 12'ha1e;
    stim[4] = 12'h89f;
    stim[5] = 12'h930;
    stim[6] = 12'hd02;
    stim[7] = 12'hbaa;
    stim[8] = 12'h25d;
    stim[9] = 12'hd32;
    stim[10] = 12'ha4b;
    stim[11] = 12'h825;
    stim[12] = 12'h971;
    stim[13] = 12'haa2;
    stim[14] = 12'hca6;
    stim[15] = 12'hf08;
    stim[16] = 12'h935;
    stim[17] = 12'h822;
    stim[18] = 12'h9f1;
    stim[19] = 12'h8de;
    stim[20] = 12'hd69;
    stim[21] = 12'hca2;
    stim[22] = 12'hed9;
    stim[23] = 12'heb3;
    stim[24] = 12'hc0e;
    stim[25] = 12'h986;
    stim[26] = 12'ha6a;
    stim[27] = 12'hec8;
    stim[28] = 12'h4a1;
    stim[29] = 12'hf23;
    stim[30] = 12'hd8d;
    stim[31] = 12'h864;
    stim[32] = 12'hc4e;
    stim[33] = 12'hcd8;
    stim[34] = 12'hf6d;
    stim[35] = 12'hd8f;
    stim[36] = 12'hb82;
    stim[37] = 12'ha02;
    stim[38] = 12'h0a4;
    stim[39] = 12'hb57;
    stim[40] = 12'hea7;
    stim[41] = 12'hd61;
    stim[42] = 12'h9e1;
    stim[43] = 12'hd6d;
    stim[44] = 12'hca2;
    stim[45] = 12'h8ee;
    stim[46] = 12'h88c;
    stim[47] = 12'he35;
    stim[48] = 12'h80b;
    stim[49] = 12'hcaa;
    stim[50] = 12'hccd;
    stim[51] = 12'hfd6;
    stim[52] = 12'he47;
    stim[53] = 12'hf00;
    stim[54] = 12'hcfc;
    stim[55] = 12'ha07;
    stim[56] = 12'hb7e;
    stim[57] = 12'h8c4;
    stim[58] = 12'hf8e;
    stim[59] = 12'hd12;
    stim[60] = 12'hd5c;
    stim[61] = 12'hbac;
    stim[62] = 12'hb71;
    stim[63] = 12'hfc4;
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
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxx0;
      expv[16] = 10'hxx0;
      expv[17] = 10'hxx0;
      expv[18] = 10'hxx0;
      expv[19] = 10'hxx0;
      expv[20] = 10'hxx0;
      expv[21] = 10'hxx0;
      expv[22] = 10'hxx0;
      expv[23] = 10'hxx0;
      expv[24] = 10'hxx0;
      expv[25] = 10'hxx0;
      expv[26] = 10'hxx0;
      expv[27] = 10'hxx0;
      expv[28] = 10'hxx0;
      expv[29] = 10'hxx0;
      expv[30] = 10'hxx0;
      expv[31] = 10'hxx0;
      expv[32] = 10'hxx0;
      expv[33] = 10'hxx0;
      expv[34] = 10'hxx0;
      expv[35] = 10'hxx0;
      expv[36] = 10'hxx0;
      expv[37] = 10'hxx0;
      expv[38] = 10'hxx2;
      expv[39] = 10'hxx2;
      expv[40] = 10'hxx2;
      expv[41] = 10'hxx6;
      expv[42] = 10'hxx6;
      expv[43] = 10'hxx6;
      expv[44] = 10'hxx6;
      expv[45] = 10'hxx6;
      expv[46] = 10'hxx6;
      expv[47] = 10'hxx6;
      expv[48] = 10'hxx6;
      expv[49] = 10'hxx6;
      expv[50] = 10'hxx6;
      expv[51] = 10'hxx6;
      expv[52] = 10'hxx6;
      expv[53] = 10'hxx6;
      expv[54] = 10'hxx6;
      expv[55] = 10'hxx6;
      expv[56] = 10'hxx6;
      expv[57] = 10'hx0c;
      expv[58] = 10'hx0c;
      expv[59] = 10'hx0c;
      expv[60] = 10'hx0c;
      expv[61] = 10'hx0c;
      expv[62] = 10'hx0c;
      expv[63] = 10'hx1a;
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
