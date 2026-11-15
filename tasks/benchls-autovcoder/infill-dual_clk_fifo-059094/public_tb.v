// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059094 dut (
    .a_clk(clk),
    .a_wdata(in_vec[28:21]),
    .a_addr(in_vec[20:17]),
    .a_rinc(in_vec[16:16]),
    .a_winc(in_vec[15:15]),
    .b_clk(in_vec[14:14]),
    .b_wdata(in_vec[13:6]),
    .b_addr(in_vec[5:2]),
    .b_rinc(in_vec[1:1]),
    .b_winc(in_vec[0:0]),
    .a_rdata(out_vec[15:8]),
    .b_rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h00e96bb0;
    stim[1] = 29'h1a256c66;
    stim[2] = 29'h0d98a439;
    stim[3] = 29'h148ca2ea;
    stim[4] = 29'h01bb0014;
    stim[5] = 29'h105be489;
    stim[6] = 29'h09d109c3;
    stim[7] = 29'h0a41175b;
    stim[8] = 29'h124ec118;
    stim[9] = 29'h03d2a736;
    stim[10] = 29'h1330c9d9;
    stim[11] = 29'h15d1f95b;
    stim[12] = 29'h11cd205a;
    stim[13] = 29'h10e14de7;
    stim[14] = 29'h1e217fa0;
    stim[15] = 29'h05695918;
    stim[16] = 29'h1e67d29d;
    stim[17] = 29'h0666e330;
    stim[18] = 29'h1d947b7b;
    stim[19] = 29'h07b58962;
    stim[20] = 29'h074559c4;
    stim[21] = 29'h0dd93723;
    stim[22] = 29'h0653dbac;
    stim[23] = 29'h0cf4336a;
    stim[24] = 29'h1e51db87;
    stim[25] = 29'h15be3dce;
    stim[26] = 29'h1213c5ae;
    stim[27] = 29'h143aae22;
    stim[28] = 29'h132f6cc1;
    stim[29] = 29'h03425441;
    stim[30] = 29'h128f9647;
    stim[31] = 29'h0c369e71;
    stim[32] = 29'h1924ff8e;
    stim[33] = 29'h191ea63e;
    stim[34] = 29'h01d007a0;
    stim[35] = 29'h017da093;
    stim[36] = 29'h09203a15;
    stim[37] = 29'h00d24bd6;
    stim[38] = 29'h1547877c;
    stim[39] = 29'h01af1853;
    stim[40] = 29'h1045f12b;
    stim[41] = 29'h196bc66c;
    stim[42] = 29'h15c15a11;
    stim[43] = 29'h134fe7fd;
    stim[44] = 29'h04b59a0c;
    stim[45] = 29'h0b78400b;
    stim[46] = 29'h1a84aaa8;
    stim[47] = 29'h1c95b7fb;
    stim[48] = 29'h0c032563;
    stim[49] = 29'h075b0eaa;
    stim[50] = 29'h1dad1b15;
    stim[51] = 29'h036c441a;
    stim[52] = 29'h12e1ba6b;
    stim[53] = 29'h190b68c7;
    stim[54] = 29'h0b263d89;
    stim[55] = 29'h076846ad;
    stim[56] = 29'h1be6f20a;
    stim[57] = 29'h14f01ec5;
    stim[58] = 29'h11949e3a;
    stim[59] = 29'h18d1837b;
    stim[60] = 29'h00954db5;
    stim[61] = 29'h1978dc67;
    stim[62] = 29'h1859f881;
    stim[63] = 29'h1f264c10;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxx92;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxa4;
      expv[8] = 16'hxxa4;
      expv[9] = 16'hxx82;
      expv[10] = 16'hxx27;
      expv[11] = 16'h9927;
      expv[12] = 16'h2727;
      expv[13] = 16'hxx37;
      expv[14] = 16'hxxae;
      expv[15] = 16'hxx27;
      expv[16] = 16'hxx92;
      expv[17] = 16'hf36c;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxae;
      expv[20] = 16'h92xx;
      expv[21] = 16'h6cae;
      expv[22] = 16'h37xx;
      expv[23] = 16'h3d3d;
      expv[24] = 16'hae6e;
      expv[25] = 16'hxx33;
      expv[26] = 16'h32xx;
      expv[27] = 16'h82f2;
      expv[28] = 16'h92b3;
      expv[29] = 16'h6eb3;
      expv[30] = 16'h926e;
      expv[31] = 16'hxx6c;
      expv[32] = 16'h9233;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hf2f2;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hb3xx;
      expv[37] = 16'h90xx;
      expv[38] = 16'h33c8;
      expv[39] = 16'h94xx;
      expv[40] = 16'hc9c4;
      expv[41] = 16'hxx61;
      expv[42] = 16'hb3xx;
      expv[43] = 16'h94c8;
      expv[44] = 16'hc4aa;
      expv[45] = 16'h6c00;
      expv[46] = 16'h0025;
      expv[47] = 16'h250b;
      expv[48] = 16'h6ef2;
      expv[49] = 16'ha1e4;
      expv[50] = 16'h27cb;
      expv[51] = 16'h2727;
      expv[52] = 16'hb3e4;
      expv[53] = 16'hcba3;
      expv[54] = 16'haad4;
      expv[55] = 16'hxx1a;
      expv[56] = 16'haad4;
      expv[57] = 16'hf2a3;
      expv[58] = 16'he40b;
      expv[59] = 16'hf20b;
      expv[60] = 16'h8c36;
      expv[61] = 16'h6c90;
      expv[62] = 16'hcb97;
      expv[63] = 16'hdfxx;
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
