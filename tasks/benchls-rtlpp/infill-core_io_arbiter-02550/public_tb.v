// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02550 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .req_core0(in_vec[32:32]),
    .data_core0(in_vec[31:0]),
    .print_hex_enable(out_vec[33:33]),
    .print_output(out_vec[32:1]),
    .is_ready_core0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h28c703608;
    stim[1] = 34'h293b41506;
    stim[2] = 34'h062c27d8d;
    stim[3] = 34'h001d633fd;
    stim[4] = 34'h03ccac4fd;
    stim[5] = 34'h0ce2f4b9e;
    stim[6] = 34'h1ec4724c3;
    stim[7] = 34'h13e67e0a0;
    stim[8] = 34'h07acebc07;
    stim[9] = 34'h1d6c5e1ae;
    stim[10] = 34'h1d846f796;
    stim[11] = 34'h01eb958e2;
    stim[12] = 34'h028043d93;
    stim[13] = 34'h0a8b59720;
    stim[14] = 34'h0c943b3e2;
    stim[15] = 34'h015d9e8f7;
    stim[16] = 34'h188e0a249;
    stim[17] = 34'h09a6abd38;
    stim[18] = 34'h1cabfb53f;
    stim[19] = 34'h13fea35ac;
    stim[20] = 34'h0ae5f1c62;
    stim[21] = 34'h0fc36c9dd;
    stim[22] = 34'h056f0c4c2;
    stim[23] = 34'h1342a76bb;
    stim[24] = 34'h1ceac481d;
    stim[25] = 34'h0c88e67ee;
    stim[26] = 34'h02b75823c;
    stim[27] = 34'h00569125a;
    stim[28] = 34'h1c3542271;
    stim[29] = 34'h1d359c32e;
    stim[30] = 34'h300691a6c;
    stim[31] = 34'h01d5e002a;
    stim[32] = 34'h15dccbcf4;
    stim[33] = 34'h14b85bc16;
    stim[34] = 34'h1c7e73b0c;
    stim[35] = 34'h117fd2c69;
    stim[36] = 34'h0b7a19635;
    stim[37] = 34'h07adf04bc;
    stim[38] = 34'h113c120a0;
    stim[39] = 34'h181b1111c;
    stim[40] = 34'h0e52c54ab;
    stim[41] = 34'h02b683bfd;
    stim[42] = 34'h19231559b;
    stim[43] = 34'h1b30e1e46;
    stim[44] = 34'h08e115960;
    stim[45] = 34'h193829f81;
    stim[46] = 34'h1aa034853;
    stim[47] = 34'h063790b94;
    stim[48] = 34'h083691726;
    stim[49] = 34'h103e2f546;
    stim[50] = 34'h0b3fc6fa5;
    stim[51] = 34'h0d178119d;
    stim[52] = 34'h097485e5d;
    stim[53] = 34'h1d1f1aee0;
    stim[54] = 34'h14371b9f9;
    stim[55] = 34'h1aaf38b6e;
    stim[56] = 34'h1818c3053;
    stim[57] = 34'h0f62a0ac5;
    stim[58] = 34'h0ace6fd1b;
    stim[59] = 34'h1478abbbe;
    stim[60] = 34'h09a04ca2e;
    stim[61] = 34'h02f2094c1;
    stim[62] = 34'h1f3937cd2;
    stim[63] = 34'h07a8a7473;
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
      expv[0] = 34'h000000001;
      expv[1] = 34'h000000001;
      expv[2] = 34'h000000001;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000001;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000000;
      expv[7] = 34'h27ccfc141;
      expv[8] = 34'h000000001;
      expv[9] = 34'h000000000;
      expv[10] = 34'h3b08def2d;
      expv[11] = 34'h000000001;
      expv[12] = 34'h000000001;
      expv[13] = 34'h000000001;
      expv[14] = 34'h000000001;
      expv[15] = 34'h000000001;
      expv[16] = 34'h000000000;
      expv[17] = 34'h334d57a71;
      expv[18] = 34'h000000000;
      expv[19] = 34'h27fd46b59;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000000;
      expv[24] = 34'h39d58903b;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000001;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000000;
      expv[29] = 34'h3a6b3865d;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h000000000;
      expv[33] = 34'h2970b782d;
      expv[34] = 34'h000000000;
      expv[35] = 34'h22ffa58d3;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000000;
      expv[39] = 34'h303622239;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000000;
      expv[43] = 34'h3661c3c8d;
      expv[44] = 34'h000000001;
      expv[45] = 34'h000000000;
      expv[46] = 34'h3540690a7;
      expv[47] = 34'h000000001;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000000;
      expv[50] = 34'h367f8df4b;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000001;
      expv[53] = 34'h000000000;
      expv[54] = 34'h286e373f3;
      expv[55] = 34'h000000000;
      expv[56] = 34'h3031860a7;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h000000000;
      expv[60] = 34'h33409945d;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000000;
      expv[63] = 34'h2f514e8e7;
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
