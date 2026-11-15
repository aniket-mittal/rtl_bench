// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_166796 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .s_read_req(in_vec[29:29]),
    .s_read_addr(in_vec[28:19]),
    .s_write_req(in_vec[18:18]),
    .s_write_addr(in_vec[17:8]),
    .s_write_data(in_vec[7:0]),
    .s_read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h6969670e;
    stim[1] = 31'h6fdbd69b;
    stim[2] = 31'h10b579fc;
    stim[3] = 31'h303de3c0;
    stim[4] = 31'h2a799ada;
    stim[5] = 31'h38f356b7;
    stim[6] = 31'h3e822f90;
    stim[7] = 31'h20d4a10c;
    stim[8] = 31'h3c58fb40;
    stim[9] = 31'h116cad5a;
    stim[10] = 31'h379ddcd6;
    stim[11] = 31'h338b7780;
    stim[12] = 31'h28ae8dad;
    stim[13] = 31'h1792a71e;
    stim[14] = 31'h0ff53584;
    stim[15] = 31'h3fd5f7de;
    stim[16] = 31'h34972926;
    stim[17] = 31'h04bfeaf8;
    stim[18] = 31'h1edcf93c;
    stim[19] = 31'h20e60db6;
    stim[20] = 31'h0248d084;
    stim[21] = 31'h15a3ef6f;
    stim[22] = 31'h2c6370e5;
    stim[23] = 31'h0a67de6f;
    stim[24] = 31'h3d64778d;
    stim[25] = 31'h0b3aa93f;
    stim[26] = 31'h183a5fde;
    stim[27] = 31'h22db8833;
    stim[28] = 31'h0288a11c;
    stim[29] = 31'h0cabf617;
    stim[30] = 31'h26e9068f;
    stim[31] = 31'h331ce53b;
    stim[32] = 31'h30dcbf9d;
    stim[33] = 31'h3e3cd6ce;
    stim[34] = 31'h0b99d76b;
    stim[35] = 31'h2448651c;
    stim[36] = 31'h05279fb8;
    stim[37] = 31'h230cd8d8;
    stim[38] = 31'h20088784;
    stim[39] = 31'h3aa83529;
    stim[40] = 31'h29c41bc2;
    stim[41] = 31'h308510a6;
    stim[42] = 31'h14663121;
    stim[43] = 31'h1cd2dbe0;
    stim[44] = 31'h16fe85cb;
    stim[45] = 31'h1daffa4e;
    stim[46] = 31'h35609cf7;
    stim[47] = 31'h338da796;
    stim[48] = 31'h3062b4c8;
    stim[49] = 31'h0bc03763;
    stim[50] = 31'h17498ba8;
    stim[51] = 31'h099ca84d;
    stim[52] = 31'h3f888e03;
    stim[53] = 31'h0c3cc271;
    stim[54] = 31'h10880007;
    stim[55] = 31'h16b4a92c;
    stim[56] = 31'h2912b955;
    stim[57] = 31'h18c90845;
    stim[58] = 31'h2c09270a;
    stim[59] = 31'h17d514bc;
    stim[60] = 31'h2c196c4c;
    stim[61] = 31'h31789e7b;
    stim[62] = 31'h3187695a;
    stim[63] = 31'h3cef8f99;
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
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
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
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
