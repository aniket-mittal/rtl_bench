// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07580 dut (
    .clk(clk),
    .d(in_vec[31:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7c2aa473;
    stim[1] = 32'hec1c49d1;
    stim[2] = 32'hd13462ab;
    stim[3] = 32'h3a647682;
    stim[4] = 32'hd612bdda;
    stim[5] = 32'h0f00383c;
    stim[6] = 32'h73dd196c;
    stim[7] = 32'h799e05eb;
    stim[8] = 32'h478d5d59;
    stim[9] = 32'h5365822f;
    stim[10] = 32'h79bbd948;
    stim[11] = 32'h4a68ce44;
    stim[12] = 32'hf525d41b;
    stim[13] = 32'h184155e5;
    stim[14] = 32'h0b859c0c;
    stim[15] = 32'h500950d7;
    stim[16] = 32'hcc79371c;
    stim[17] = 32'h727b2611;
    stim[18] = 32'h2fb32d46;
    stim[19] = 32'hb84c31a9;
    stim[20] = 32'h49a7d9c9;
    stim[21] = 32'h951f9c12;
    stim[22] = 32'heeee32c5;
    stim[23] = 32'hbac62225;
    stim[24] = 32'h105b684b;
    stim[25] = 32'h0cdc65f7;
    stim[26] = 32'h42915ddd;
    stim[27] = 32'h370ef4a4;
    stim[28] = 32'h4dea55b5;
    stim[29] = 32'h9c4f9fcb;
    stim[30] = 32'h271ae495;
    stim[31] = 32'h0679b6f3;
    stim[32] = 32'hbb0a8edd;
    stim[33] = 32'h130ca8c7;
    stim[34] = 32'ha9e9f3ca;
    stim[35] = 32'h9c2bf56f;
    stim[36] = 32'ha04fd619;
    stim[37] = 32'h03ed5831;
    stim[38] = 32'h89aa4a5c;
    stim[39] = 32'haf33d690;
    stim[40] = 32'h5b5586f6;
    stim[41] = 32'h37ae0977;
    stim[42] = 32'h170a411e;
    stim[43] = 32'hd3bb0446;
    stim[44] = 32'h925fe840;
    stim[45] = 32'hdd6d09cb;
    stim[46] = 32'h83c86e61;
    stim[47] = 32'h512a9d91;
    stim[48] = 32'h8735c1ee;
    stim[49] = 32'h8086c88e;
    stim[50] = 32'hc8163545;
    stim[51] = 32'he73234bb;
    stim[52] = 32'h33f28106;
    stim[53] = 32'hd71419f9;
    stim[54] = 32'h91c382fb;
    stim[55] = 32'h55ab7daf;
    stim[56] = 32'h6b596a9f;
    stim[57] = 32'h49cbe752;
    stim[58] = 32'h47957043;
    stim[59] = 32'h77951eef;
    stim[60] = 32'h2f7d090e;
    stim[61] = 32'h9bc673ff;
    stim[62] = 32'ha5feae0c;
    stim[63] = 32'hbdaa8c79;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h7c2aa473;
      expv[2] = 32'hec1c49d1;
      expv[3] = 32'hd13462ab;
      expv[4] = 32'h3a647682;
      expv[5] = 32'hd612bdda;
      expv[6] = 32'h0f00383c;
      expv[7] = 32'h73dd196c;
      expv[8] = 32'h799e05eb;
      expv[9] = 32'h478d5d59;
      expv[10] = 32'h5365822f;
      expv[11] = 32'h79bbd948;
      expv[12] = 32'h4a68ce44;
      expv[13] = 32'hf525d41b;
      expv[14] = 32'h184155e5;
      expv[15] = 32'h0b859c0c;
      expv[16] = 32'h500950d7;
      expv[17] = 32'hcc79371c;
      expv[18] = 32'h727b2611;
      expv[19] = 32'h2fb32d46;
      expv[20] = 32'hb84c31a9;
      expv[21] = 32'h49a7d9c9;
      expv[22] = 32'h951f9c12;
      expv[23] = 32'heeee32c5;
      expv[24] = 32'hbac62225;
      expv[25] = 32'h105b684b;
      expv[26] = 32'h0cdc65f7;
      expv[27] = 32'h42915ddd;
      expv[28] = 32'h370ef4a4;
      expv[29] = 32'h4dea55b5;
      expv[30] = 32'h9c4f9fcb;
      expv[31] = 32'h271ae495;
      expv[32] = 32'h0679b6f3;
      expv[33] = 32'hbb0a8edd;
      expv[34] = 32'h130ca8c7;
      expv[35] = 32'ha9e9f3ca;
      expv[36] = 32'h9c2bf56f;
      expv[37] = 32'ha04fd619;
      expv[38] = 32'h03ed5831;
      expv[39] = 32'h89aa4a5c;
      expv[40] = 32'haf33d690;
      expv[41] = 32'h5b5586f6;
      expv[42] = 32'h37ae0977;
      expv[43] = 32'h170a411e;
      expv[44] = 32'hd3bb0446;
      expv[45] = 32'h925fe840;
      expv[46] = 32'hdd6d09cb;
      expv[47] = 32'h83c86e61;
      expv[48] = 32'h512a9d91;
      expv[49] = 32'h8735c1ee;
      expv[50] = 32'h8086c88e;
      expv[51] = 32'hc8163545;
      expv[52] = 32'he73234bb;
      expv[53] = 32'h33f28106;
      expv[54] = 32'hd71419f9;
      expv[55] = 32'h91c382fb;
      expv[56] = 32'h55ab7daf;
      expv[57] = 32'h6b596a9f;
      expv[58] = 32'h49cbe752;
      expv[59] = 32'h47957043;
      expv[60] = 32'h77951eef;
      expv[61] = 32'h2f7d090e;
      expv[62] = 32'h9bc673ff;
      expv[63] = 32'ha5feae0c;
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
