// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018587 dut (
    .PIXCLK(clk),
    .DATA(in_vec[19:12]),
    .ATTR(in_vec[11:4]),
    .PIXEL(in_vec[3:1]),
    .BLANK(in_vec[0:0]),
    .RED(out_vec[7:5]),
    .GREEN(out_vec[4:2]),
    .BLUE(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'he87cf;
    stim[1] = 20'h00cb1;
    stim[2] = 20'h17884;
    stim[3] = 20'h72928;
    stim[4] = 20'hdb39c;
    stim[5] = 20'h1f516;
    stim[6] = 20'h11ff8;
    stim[7] = 20'h5eb1e;
    stim[8] = 20'he77b4;
    stim[9] = 20'h4317f;
    stim[10] = 20'hea49c;
    stim[11] = 20'h16430;
    stim[12] = 20'h249c2;
    stim[13] = 20'h3cd0d;
    stim[14] = 20'hfa6f8;
    stim[15] = 20'h1f80f;
    stim[16] = 20'h2e80b;
    stim[17] = 20'h1e74a;
    stim[18] = 20'h3ebd5;
    stim[19] = 20'h6407e;
    stim[20] = 20'hfaf63;
    stim[21] = 20'h5ee98;
    stim[22] = 20'h4f0b8;
    stim[23] = 20'h0e1cf;
    stim[24] = 20'hfe27e;
    stim[25] = 20'h00d09;
    stim[26] = 20'ha5e15;
    stim[27] = 20'h500f5;
    stim[28] = 20'h16194;
    stim[29] = 20'h4902c;
    stim[30] = 20'h572d3;
    stim[31] = 20'h3afc3;
    stim[32] = 20'h82593;
    stim[33] = 20'hb1fc9;
    stim[34] = 20'h640f9;
    stim[35] = 20'h713ef;
    stim[36] = 20'h5cd4b;
    stim[37] = 20'h13686;
    stim[38] = 20'h4390b;
    stim[39] = 20'h48261;
    stim[40] = 20'h65760;
    stim[41] = 20'h188a2;
    stim[42] = 20'hf5efe;
    stim[43] = 20'hff553;
    stim[44] = 20'h8fa6c;
    stim[45] = 20'h979c5;
    stim[46] = 20'h99d55;
    stim[47] = 20'hf5e79;
    stim[48] = 20'h5c942;
    stim[49] = 20'h1b08f;
    stim[50] = 20'hc8c77;
    stim[51] = 20'hec69c;
    stim[52] = 20'h8c512;
    stim[53] = 20'h83abe;
    stim[54] = 20'h068a0;
    stim[55] = 20'h13811;
    stim[56] = 20'h0e277;
    stim[57] = 20'h32bc0;
    stim[58] = 20'he69b5;
    stim[59] = 20'h0d07d;
    stim[60] = 20'h08b2e;
    stim[61] = 20'hb47af;
    stim[62] = 20'hab84e;
    stim[63] = 20'hf6eac;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h49;
      expv[4] = 8'ha0;
      expv[5] = 8'ha2;
      expv[6] = 8'h16;
      expv[7] = 8'hff;
      expv[8] = 8'h02;
      expv[9] = 8'hb6;
      expv[10] = 8'h00;
      expv[11] = 8'h14;
      expv[12] = 8'ha2;
      expv[13] = 8'h1c;
      expv[14] = 8'h00;
      expv[15] = 8'hb4;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'hb6;
      expv[19] = 8'h00;
      expv[20] = 8'hb6;
      expv[21] = 8'h00;
      expv[22] = 8'hfc;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'hb6;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h03;
      expv[30] = 8'ha0;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'hb4;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'hb4;
      expv[42] = 8'he0;
      expv[43] = 8'hfc;
      expv[44] = 8'h00;
      expv[45] = 8'he0;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h03;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h03;
      expv[53] = 8'h02;
      expv[54] = 8'he0;
      expv[55] = 8'he0;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h1c;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'ha0;
      expv[62] = 8'h00;
      expv[63] = 8'h49;
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
