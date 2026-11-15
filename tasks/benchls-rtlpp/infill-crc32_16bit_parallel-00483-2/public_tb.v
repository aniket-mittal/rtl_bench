// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00483 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[47:16]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hed2b7;
    stim[1] = 20'h8cfdf;
    stim[2] = 20'hecb7e;
    stim[3] = 20'h956f6;
    stim[4] = 20'hf65fe;
    stim[5] = 20'h922b0;
    stim[6] = 20'h1415a;
    stim[7] = 20'hc426a;
    stim[8] = 20'h2e5b0;
    stim[9] = 20'h1a6c4;
    stim[10] = 20'h0f78c;
    stim[11] = 20'h0f156;
    stim[12] = 20'hd615a;
    stim[13] = 20'hb2964;
    stim[14] = 20'h4bc20;
    stim[15] = 20'hb5de4;
    stim[16] = 20'h2083e;
    stim[17] = 20'h1e8c0;
    stim[18] = 20'h7a584;
    stim[19] = 20'h5f562;
    stim[20] = 20'h2113a;
    stim[21] = 20'ha1a42;
    stim[22] = 20'h82bf8;
    stim[23] = 20'hb2290;
    stim[24] = 20'h10b10;
    stim[25] = 20'h9292c;
    stim[26] = 20'h8b002;
    stim[27] = 20'h77ec0;
    stim[28] = 20'ha3dc6;
    stim[29] = 20'hf7096;
    stim[30] = 20'h99c46;
    stim[31] = 20'h1ca3a;
    stim[32] = 20'ha12c4;
    stim[33] = 20'hd3ca0;
    stim[34] = 20'h36ce4;
    stim[35] = 20'h0674c;
    stim[36] = 20'h9f8aa;
    stim[37] = 20'h825f6;
    stim[38] = 20'hc6c98;
    stim[39] = 20'h8ad44;
    stim[40] = 20'h4c1fe;
    stim[41] = 20'h91f6e;
    stim[42] = 20'hcbf90;
    stim[43] = 20'hfcdc6;
    stim[44] = 20'ha1752;
    stim[45] = 20'h187d6;
    stim[46] = 20'hc36f0;
    stim[47] = 20'hf3604;
    stim[48] = 20'hcda0e;
    stim[49] = 20'h81960;
    stim[50] = 20'h28f7c;
    stim[51] = 20'hf304e;
    stim[52] = 20'h41ed4;
    stim[53] = 20'h5a934;
    stim[54] = 20'h74e9a;
    stim[55] = 20'h1824c;
    stim[56] = 20'hb1c10;
    stim[57] = 20'h4167a;
    stim[58] = 20'hc63aa;
    stim[59] = 20'h4177c;
    stim[60] = 20'h49be4;
    stim[61] = 20'h684a0;
    stim[62] = 20'h750cc;
    stim[63] = 20'hd2dc6;
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
      expv[0] = 48'hffffffffffff;
      expv[1] = 48'hffffffffffff;
      expv[2] = 48'hffffffffffff;
      expv[3] = 48'hffffffffffff;
      expv[4] = 48'hffffffffffff;
      expv[5] = 48'hffffffffffff;
      expv[6] = 48'hffffffffffff;
      expv[7] = 48'h96fb92c92096;
      expv[8] = 48'hf69021bff690;
      expv[9] = 48'hf69021bff690;
      expv[10] = 48'hffffffffffff;
      expv[11] = 48'hffffffffffff;
      expv[12] = 48'hffffffffffff;
      expv[13] = 48'haf3ec467830a;
      expv[14] = 48'hffffffffffff;
      expv[15] = 48'hffffffffffff;
      expv[16] = 48'hffffffffffff;
      expv[17] = 48'hffffffffffff;
      expv[18] = 48'hffffffffffff;
      expv[19] = 48'hffffffffffff;
      expv[20] = 48'hffffffff0000;
      expv[21] = 48'h333d05c94333;
      expv[22] = 48'h05c9ffff6c5f;
      expv[23] = 48'h05c9ffff6c5f;
      expv[24] = 48'h05c9ffff6c5f;
      expv[25] = 48'h05c9ffff6c5f;
      expv[26] = 48'hffffffffffff;
      expv[27] = 48'hffffffff0000;
      expv[28] = 48'hffffffff0000;
      expv[29] = 48'hffffffffffff;
      expv[30] = 48'hffffffffffff;
      expv[31] = 48'hffffffffffff;
      expv[32] = 48'ha67ab0f4a19a;
      expv[33] = 48'hffffffffffff;
      expv[34] = 48'hffffffffffff;
      expv[35] = 48'hffffffffffff;
      expv[36] = 48'hffffffffffff;
      expv[37] = 48'h28c85ff8eceb;
      expv[38] = 48'hffffffffffff;
      expv[39] = 48'hffffffffffff;
      expv[40] = 48'hffffffffffff;
      expv[41] = 48'hffffffffffff;
      expv[42] = 48'hffffffffffff;
      expv[43] = 48'hffffffffffff;
      expv[44] = 48'hffffffffffff;
      expv[45] = 48'hffffffff0000;
      expv[46] = 48'hffffffffffff;
      expv[47] = 48'hffffffffffff;
      expv[48] = 48'hffffffffffff;
      expv[49] = 48'hffffffffffff;
      expv[50] = 48'hffffffffffff;
      expv[51] = 48'hffffffffffff;
      expv[52] = 48'hffffffffffff;
      expv[53] = 48'hffffffffffff;
      expv[54] = 48'hffffffffffff;
      expv[55] = 48'h01084f66ef7f;
      expv[56] = 48'hffffffffffff;
      expv[57] = 48'hffffffffffff;
      expv[58] = 48'h668682a99e99;
      expv[59] = 48'h4a8d3d7a4ead;
      expv[60] = 48'hffffffffffff;
      expv[61] = 48'hffffffffffff;
      expv[62] = 48'hffffffffffff;
      expv[63] = 48'hffffffffffff;
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
