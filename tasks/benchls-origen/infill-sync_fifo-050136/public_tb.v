// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050136 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .rd(in_vec[8:8]),
    .wr_data(in_vec[7:0]),
    .rd_data(out_vec[9:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h283;
    stim[1] = 11'h384;
    stim[2] = 11'h509;
    stim[3] = 11'h697;
    stim[4] = 11'h77c;
    stim[5] = 11'h49a;
    stim[6] = 11'h5ab;
    stim[7] = 11'h614;
    stim[8] = 11'h5d2;
    stim[9] = 11'h79f;
    stim[10] = 11'h7b8;
    stim[11] = 11'h515;
    stim[12] = 11'h6fe;
    stim[13] = 11'h4a1;
    stim[14] = 11'h4ac;
    stim[15] = 11'h422;
    stim[16] = 11'h4bc;
    stim[17] = 11'h6a2;
    stim[18] = 11'h605;
    stim[19] = 11'h723;
    stim[20] = 11'h4aa;
    stim[21] = 11'h486;
    stim[22] = 11'h6aa;
    stim[23] = 11'h555;
    stim[24] = 11'h59e;
    stim[25] = 11'h527;
    stim[26] = 11'h727;
    stim[27] = 11'h716;
    stim[28] = 11'h645;
    stim[29] = 11'h50e;
    stim[30] = 11'h615;
    stim[31] = 11'h563;
    stim[32] = 11'h73a;
    stim[33] = 11'h404;
    stim[34] = 11'h5e1;
    stim[35] = 11'h571;
    stim[36] = 11'h1f2;
    stim[37] = 11'h6f9;
    stim[38] = 11'h625;
    stim[39] = 11'h72b;
    stim[40] = 11'h6c7;
    stim[41] = 11'h510;
    stim[42] = 11'h520;
    stim[43] = 11'h563;
    stim[44] = 11'h6e7;
    stim[45] = 11'h760;
    stim[46] = 11'h747;
    stim[47] = 11'h442;
    stim[48] = 11'h743;
    stim[49] = 11'h4a1;
    stim[50] = 11'h5cb;
    stim[51] = 11'h761;
    stim[52] = 11'h755;
    stim[53] = 11'h6da;
    stim[54] = 11'h64f;
    stim[55] = 11'h515;
    stim[56] = 11'h510;
    stim[57] = 11'h442;
    stim[58] = 11'h53a;
    stim[59] = 11'h419;
    stim[60] = 11'h704;
    stim[61] = 11'h44e;
    stim[62] = 11'h446;
    stim[63] = 11'h699;
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
      expv[0] = 10'h001;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h001;
      expv[4] = 10'h25c;
      expv[5] = 10'h1f0;
      expv[6] = 10'h1f0;
      expv[7] = 10'h001;
      expv[8] = 10'h050;
      expv[9] = 10'h001;
      expv[10] = 10'h27c;
      expv[11] = 10'h2e0;
      expv[12] = 10'h001;
      expv[13] = 10'h3f8;
      expv[14] = 10'h3f8;
      expv[15] = 10'h3f8;
      expv[16] = 10'h3f8;
      expv[17] = 10'h3f8;
      expv[18] = 10'h3f8;
      expv[19] = 10'h3f8;
      expv[20] = 10'h288;
      expv[21] = 10'h288;
      expv[22] = 10'h288;
      expv[23] = 10'h288;
      expv[24] = 10'h014;
      expv[25] = 10'h08c;
      expv[26] = 10'h2a8;
      expv[27] = 10'h09c;
      expv[28] = 10'h058;
      expv[29] = 10'h058;
      expv[30] = 10'h114;
      expv[31] = 10'h114;
      expv[32] = 10'h054;
      expv[33] = 10'h0e8;
      expv[34] = 10'h0e8;
      expv[35] = 10'h001;
      expv[36] = 10'h001;
      expv[37] = 10'h001;
      expv[38] = 10'h3e4;
      expv[39] = 10'h3e4;
      expv[40] = 10'h094;
      expv[41] = 10'h094;
      expv[42] = 10'h0ac;
      expv[43] = 10'h31c;
      expv[44] = 10'h001;
      expv[45] = 10'h39c;
      expv[46] = 10'h180;
      expv[47] = 10'h11c;
      expv[48] = 10'h11c;
      expv[49] = 10'h10c;
      expv[50] = 10'h10c;
      expv[51] = 10'h001;
      expv[52] = 10'h184;
      expv[53] = 10'h154;
      expv[54] = 10'h154;
      expv[55] = 10'h154;
      expv[56] = 10'h368;
      expv[57] = 10'h13c;
      expv[58] = 10'h13c;
      expv[59] = 10'h001;
      expv[60] = 10'h001;
      expv[61] = 10'h010;
      expv[62] = 10'h010;
      expv[63] = 10'h010;
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
