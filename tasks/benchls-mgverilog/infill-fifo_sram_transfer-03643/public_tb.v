// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03643 dut (
    .wb_clk(clk),
    .wb_rst(in_vec[48:48]),
    .empty(in_vec[47:47]),
    .full(in_vec[46:46]),
    .grant(in_vec[45:45]),
    .fifo_number_samples(in_vec[44:39]),
    .fifo_number_samples_terminal(in_vec[38:33]),
    .data_done(in_vec[32:32]),
    .fifo_data_in(in_vec[31:0]),
    .pop(out_vec[33:33]),
    .sram_data_out(out_vec[32:1]),
    .sram_start(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h13b246c307574;
    stim[1] = 49'h1163bc5004221;
    stim[2] = 49'h0ffb04632d8bd;
    stim[3] = 49'h04ed05323d79f;
    stim[4] = 49'h02bae8e83aa19;
    stim[5] = 49'h0bae96c57e588;
    stim[6] = 49'h00e21ac15081a;
    stim[7] = 49'h0df28b490d9c6;
    stim[8] = 49'h0b73b67436177;
    stim[9] = 49'h07fa3210fa21c;
    stim[10] = 49'h0c0410c86738a;
    stim[11] = 49'h0de6ada83dff9;
    stim[12] = 49'h0e2dd27ddc565;
    stim[13] = 49'h08b87c9c26fcd;
    stim[14] = 49'h02421e3892a5a;
    stim[15] = 49'h088a6d6816744;
    stim[16] = 49'h069672199be35;
    stim[17] = 49'h00bcac00b0fd6;
    stim[18] = 49'h0a1a4cf82dc44;
    stim[19] = 49'h01ef54deea2ba;
    stim[20] = 49'h03a1bdd3ebab8;
    stim[21] = 49'h0cc40e9deca0a;
    stim[22] = 49'h059b54a7990e4;
    stim[23] = 49'h006778f28032c;
    stim[24] = 49'h0ef5db91db80c;
    stim[25] = 49'h0e67c7e1ef154;
    stim[26] = 49'h023f8981724de;
    stim[27] = 49'h00075b05854ac;
    stim[28] = 49'h00c6a145a8992;
    stim[29] = 49'h1d1f29e1678fb;
    stim[30] = 49'h0417f4bfcfeb0;
    stim[31] = 49'h041b595b1815d;
    stim[32] = 49'h0e95d943043ff;
    stim[33] = 49'h0ef2aa8d84e25;
    stim[34] = 49'h0e011abbc3800;
    stim[35] = 49'h02e1a4b798d6c;
    stim[36] = 49'h0a7c279c1b84a;
    stim[37] = 49'h03193cd31ef07;
    stim[38] = 49'h030d909a9ac49;
    stim[39] = 49'h02c7f35e8184c;
    stim[40] = 49'h05c0bc2bb3f06;
    stim[41] = 49'h046108f5c7f8b;
    stim[42] = 49'h08a8954dadabd;
    stim[43] = 49'h068f2d5806957;
    stim[44] = 49'h01b2e93a218a8;
    stim[45] = 49'h0d71e1c22f792;
    stim[46] = 49'h01daf803e7d25;
    stim[47] = 49'h0bc69cddbf82d;
    stim[48] = 49'h0c526fb50d429;
    stim[49] = 49'h098c4101cf17e;
    stim[50] = 49'h0d111df0279b3;
    stim[51] = 49'h016f9306c9180;
    stim[52] = 49'h0e5522e01e58e;
    stim[53] = 49'h0ba2930498303;
    stim[54] = 49'h02887d4091987;
    stim[55] = 49'h0666599167902;
    stim[56] = 49'h01db7e6676654;
    stim[57] = 49'h00c812f9334bf;
    stim[58] = 49'h0d21114e8a0b5;
    stim[59] = 49'h09fed74b5c57a;
    stim[60] = 49'h0a0584b8605da;
    stim[61] = 49'h0e6a0624d2d5e;
    stim[62] = 49'h07880d2d3d90a;
    stim[63] = 49'h05415b6bddf85;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h200000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h1582a1035;
      expv[8] = 34'h36921b38d;
      expv[9] = 34'h36921b38c;
      expv[10] = 34'h2421f4439;
      expv[11] = 34'h0421f4439;
      expv[12] = 34'h2421f4439;
      expv[13] = 34'h2421f4438;
      expv[14] = 34'h2421f4438;
      expv[15] = 34'h1c71254b5;
      expv[16] = 34'h3c71254b5;
      expv[17] = 34'h043337c6b;
      expv[18] = 34'h043337c6b;
      expv[19] = 34'h243337c6a;
      expv[20] = 34'h29bdd4575;
      expv[21] = 34'h1ba7d7571;
      expv[22] = 34'h3d3bd9415;
      expv[23] = 34'h294f321c9;
      expv[24] = 34'h31e500659;
      expv[25] = 34'h11e500658;
      expv[26] = 34'h11e500658;
      expv[27] = 34'h31e500658;
      expv[28] = 34'h160b0a959;
      expv[29] = 34'h160b0a959;
      expv[30] = 34'h200000000;
      expv[31] = 34'h297f9fd61;
      expv[32] = 34'h32b6302bb;
      expv[33] = 34'h12b6302ba;
      expv[34] = 34'h32b6302ba;
      expv[35] = 34'h12b6302ba;
      expv[36] = 34'h12b6302ba;
      expv[37] = 34'h2f3837095;
      expv[38] = 34'h39a63de0f;
      expv[39] = 34'h213535893;
      expv[40] = 34'h26bd03099;
      expv[41] = 34'h185767e0d;
      expv[42] = 34'h31eb8ff17;
      expv[43] = 34'h11eb8ff17;
      expv[44] = 34'h11eb8ff16;
      expv[45] = 34'h11eb8ff16;
      expv[46] = 34'h23845ef25;
      expv[47] = 34'h3007cfa4b;
      expv[48] = 34'h1007cfa4a;
      expv[49] = 34'h1007cfa4a;
      expv[50] = 34'h3007cfa4a;
      expv[51] = 34'h3007cfa4a;
      expv[52] = 34'h060d92301;
      expv[53] = 34'h260d92300;
      expv[54] = 34'h260d92300;
      expv[55] = 34'h3a812330f;
      expv[56] = 34'h3322cf205;
      expv[57] = 34'h3cccecca9;
      expv[58] = 34'h25f26697f;
      expv[59] = 34'h25f26697f;
      expv[60] = 34'h05f26697f;
      expv[61] = 34'h05f26697e;
      expv[62] = 34'h05f26697e;
      expv[63] = 34'h25f26697e;
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
