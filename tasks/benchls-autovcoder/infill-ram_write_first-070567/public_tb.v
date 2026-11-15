// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070567 dut (
    .clk(clk),
    .en(in_vec[18:18]),
    .regcke(in_vec[17:17]),
    .we(in_vec[16:16]),
    .addr(in_vec[15:8]),
    .din(in_vec[7:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1ea6a;
    stim[1] = 19'h6774d;
    stim[2] = 19'h00ad5;
    stim[3] = 19'h6b7b0;
    stim[4] = 19'h73c9b;
    stim[5] = 19'h18733;
    stim[6] = 19'h1b7b6;
    stim[7] = 19'h6a0d6;
    stim[8] = 19'h3ea08;
    stim[9] = 19'h0488c;
    stim[10] = 19'h0bb4f;
    stim[11] = 19'h4f9da;
    stim[12] = 19'h0a31d;
    stim[13] = 19'h67e79;
    stim[14] = 19'h42b95;
    stim[15] = 19'h0cf6d;
    stim[16] = 19'h54da2;
    stim[17] = 19'h2bbe7;
    stim[18] = 19'h3fc7d;
    stim[19] = 19'h56d6e;
    stim[20] = 19'h1f951;
    stim[21] = 19'h44c18;
    stim[22] = 19'h293ed;
    stim[23] = 19'h31e51;
    stim[24] = 19'h45776;
    stim[25] = 19'h2e3bf;
    stim[26] = 19'h4e194;
    stim[27] = 19'h4c98e;
    stim[28] = 19'h1a8e6;
    stim[29] = 19'h6af66;
    stim[30] = 19'h60ca8;
    stim[31] = 19'h3da07;
    stim[32] = 19'h7042f;
    stim[33] = 19'h42c6e;
    stim[34] = 19'h0e363;
    stim[35] = 19'h54793;
    stim[36] = 19'h1b8a1;
    stim[37] = 19'h7f5d8;
    stim[38] = 19'h4cac3;
    stim[39] = 19'h06794;
    stim[40] = 19'h2280d;
    stim[41] = 19'h6bd8f;
    stim[42] = 19'h60b6b;
    stim[43] = 19'h24a6c;
    stim[44] = 19'h03548;
    stim[45] = 19'h75756;
    stim[46] = 19'h2b9dd;
    stim[47] = 19'h7e5ee;
    stim[48] = 19'h222bf;
    stim[49] = 19'h10888;
    stim[50] = 19'h07503;
    stim[51] = 19'h364fb;
    stim[52] = 19'h1b9e4;
    stim[53] = 19'h7eda6;
    stim[54] = 19'h360d2;
    stim[55] = 19'h59654;
    stim[56] = 19'h15114;
    stim[57] = 19'h10629;
    stim[58] = 19'h27e4b;
    stim[59] = 19'h0d58c;
    stim[60] = 19'h403c0;
    stim[61] = 19'h622d5;
    stim[62] = 19'h7d28d;
    stim[63] = 19'h333e2;
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
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'h9b;
      expv[6] = 8'h9b;
      expv[7] = 8'h9b;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'ha2;
      expv[18] = 8'ha2;
      expv[19] = 8'ha2;
      expv[20] = 8'h6e;
      expv[21] = 8'h6e;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'h2f;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'h93;
      expv[37] = 8'h93;
      expv[38] = 8'hd8;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'h56;
      expv[47] = 8'h56;
      expv[48] = 8'hee;
      expv[49] = 8'hee;
      expv[50] = 8'hee;
      expv[51] = 8'hee;
      expv[52] = 8'hee;
      expv[53] = 8'hee;
      expv[54] = 8'ha6;
      expv[55] = 8'ha6;
      expv[56] = 8'h54;
      expv[57] = 8'h54;
      expv[58] = 8'h54;
      expv[59] = 8'h54;
      expv[60] = 8'h54;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'h8d;
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
