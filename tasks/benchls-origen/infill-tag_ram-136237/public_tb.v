// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136237 dut (
    .cst_one(clk),
    .tagram_data_b(in_vec[42:11]),
    .tagram_wren_b(in_vec[10:10]),
    .tagram_address_b(in_vec[9:2]),
    .cst_zero(in_vec[1:1]),
    .cst_std_logic_vector_type_one(in_vec[0:0]),
    .tagram_q_b(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h613da1e242e;
    stim[1] = 43'h687bfa57926;
    stim[2] = 43'h03a5158633e;
    stim[3] = 43'h1ef4d74d489;
    stim[4] = 43'h65443484627;
    stim[5] = 43'h2bb471f8969;
    stim[6] = 43'h6f8f1a661bc;
    stim[7] = 43'h507008a6780;
    stim[8] = 43'h1f529b2ad78;
    stim[9] = 43'h06e2cb40e18;
    stim[10] = 43'h0785b3c795f;
    stim[11] = 43'h35fc03e45fc;
    stim[12] = 43'h4ab61d01192;
    stim[13] = 43'h36ceafc6457;
    stim[14] = 43'h4407fa66d1b;
    stim[15] = 43'h27cde475041;
    stim[16] = 43'h6c68fa18d6a;
    stim[17] = 43'h0b9ecbd880a;
    stim[18] = 43'h07a89305b35;
    stim[19] = 43'h19a5085df0f;
    stim[20] = 43'h6ba4cb6d32e;
    stim[21] = 43'h5011035d068;
    stim[22] = 43'h43f05266800;
    stim[23] = 43'h0ba45aa4816;
    stim[24] = 43'h7f8ef5f1da0;
    stim[25] = 43'h4bc504bed3f;
    stim[26] = 43'h13a62a05c5b;
    stim[27] = 43'h35242f23c16;
    stim[28] = 43'h2e8e8a7ed4a;
    stim[29] = 43'h00d861c7210;
    stim[30] = 43'h60b71058d74;
    stim[31] = 43'h3ace0b5b1d4;
    stim[32] = 43'h418596f7832;
    stim[33] = 43'h7cf4e95c0ad;
    stim[34] = 43'h0db014e78d0;
    stim[35] = 43'h7e5190e7f85;
    stim[36] = 43'h21256d391e8;
    stim[37] = 43'h4b538f94971;
    stim[38] = 43'h137813b2017;
    stim[39] = 43'h13e73006f54;
    stim[40] = 43'h0a2eda7848d;
    stim[41] = 43'h7bd1e4f5d49;
    stim[42] = 43'h17af7772d35;
    stim[43] = 43'h4bc1b4283cf;
    stim[44] = 43'h7b715c8f9c3;
    stim[45] = 43'h4697f6d9428;
    stim[46] = 43'h6b65c95729c;
    stim[47] = 43'h1b1c1143f2c;
    stim[48] = 43'h766ff100b6b;
    stim[49] = 43'h7dd970dd81f;
    stim[50] = 43'h77eacb5227f;
    stim[51] = 43'h5190197d220;
    stim[52] = 43'h56dbfa3777c;
    stim[53] = 43'h3aba49319f3;
    stim[54] = 43'h30b7c568ebb;
    stim[55] = 43'h24c447e7888;
    stim[56] = 43'h09c91a2cb63;
    stim[57] = 43'h739f5be8952;
    stim[58] = 43'h2154e5b2e61;
    stim[59] = 43'h61330a5ff54;
    stim[60] = 43'h052cb7bdc84;
    stim[61] = 43'h6480c1a93c1;
    stim[62] = 43'h35f06fc01aa;
    stim[63] = 43'h142895303d3;
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
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'h6a485e47;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'h5d1d14fd;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'h3de9ae9a;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'h27ce600d;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
