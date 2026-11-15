// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08788 dut (
    .clk_i(clk),
    .rst_i(in_vec[35:35]),
    .offset_i(in_vec[34:3]),
    .position_i(in_vec[2:0]),
    .position_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'he2ca4c8b0;
    stim[1] = 36'he7e194d1d;
    stim[2] = 36'h1bb202714;
    stim[3] = 36'h447f7aff9;
    stim[4] = 36'h3286e082b;
    stim[5] = 36'h281885dad;
    stim[6] = 36'h52cb9ff76;
    stim[7] = 36'h387b74072;
    stim[8] = 36'h11e5ada9e;
    stim[9] = 36'h1580ef96d;
    stim[10] = 36'h3d61c121a;
    stim[11] = 36'h7bc9b0b1d;
    stim[12] = 36'h4a50cb2cd;
    stim[13] = 36'h79c2649c2;
    stim[14] = 36'h3982c4005;
    stim[15] = 36'h481377408;
    stim[16] = 36'h336fcbe16;
    stim[17] = 36'h24f705bc6;
    stim[18] = 36'h59f8d257a;
    stim[19] = 36'h013acfa48;
    stim[20] = 36'h1e1c4f52c;
    stim[21] = 36'h36b3f6fde;
    stim[22] = 36'h3c61c0ef8;
    stim[23] = 36'h40a608bbc;
    stim[24] = 36'h38550802a;
    stim[25] = 36'h7c3d6c12d;
    stim[26] = 36'h32843a247;
    stim[27] = 36'h07caf5fc2;
    stim[28] = 36'h20381dd77;
    stim[29] = 36'h6b0d5c903;
    stim[30] = 36'h50717827b;
    stim[31] = 36'h3a54135c6;
    stim[32] = 36'h78f768f79;
    stim[33] = 36'h2b49a798f;
    stim[34] = 36'h4e70bd969;
    stim[35] = 36'h54d7dc0aa;
    stim[36] = 36'h2318ea7af;
    stim[37] = 36'h7b2b15197;
    stim[38] = 36'h4423a56b8;
    stim[39] = 36'h7ef9e5dd6;
    stim[40] = 36'hae179a5a1;
    stim[41] = 36'h34321d308;
    stim[42] = 36'h7ea4df057;
    stim[43] = 36'hc6d7917c5;
    stim[44] = 36'h5c07fc689;
    stim[45] = 36'h20eaed033;
    stim[46] = 36'h106713570;
    stim[47] = 36'h736fae183;
    stim[48] = 36'h798b593be;
    stim[49] = 36'h5c41ada70;
    stim[50] = 36'h07ab1f6fc;
    stim[51] = 36'h0de7bbcde;
    stim[52] = 36'h175d3b4c9;
    stim[53] = 36'h7a82053b2;
    stim[54] = 36'h7771b740e;
    stim[55] = 36'h2bdddaa9a;
    stim[56] = 36'h5d0debcaf;
    stim[57] = 36'h49561a279;
    stim[58] = 36'h280ac6956;
    stim[59] = 36'h032226733;
    stim[60] = 36'h4d74d5ca0;
    stim[61] = 36'h7fc596373;
    stim[62] = 36'h0979db203;
    stim[63] = 36'h1be054a85;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h1;
      expv[8] = 3'h3;
      expv[9] = 3'h3;
      expv[10] = 3'h3;
      expv[11] = 3'h3;
      expv[12] = 3'h3;
      expv[13] = 3'h3;
      expv[14] = 3'h3;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h1;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h1;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h1;
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
