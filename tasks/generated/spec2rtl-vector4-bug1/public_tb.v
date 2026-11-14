// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'he7;
    stim[1] = 8'h62;
    stim[2] = 8'h3f;
    stim[3] = 8'hbf;
    stim[4] = 8'h36;
    stim[5] = 8'h9a;
    stim[6] = 8'ha2;
    stim[7] = 8'he3;
    stim[8] = 8'hcb;
    stim[9] = 8'h7c;
    stim[10] = 8'h42;
    stim[11] = 8'hcf;
    stim[12] = 8'h6a;
    stim[13] = 8'h07;
    stim[14] = 8'h96;
    stim[15] = 8'h61;
    stim[16] = 8'hf1;
    stim[17] = 8'h0f;
    stim[18] = 8'h2d;
    stim[19] = 8'hb3;
    stim[20] = 8'h07;
    stim[21] = 8'hb5;
    stim[22] = 8'hdc;
    stim[23] = 8'he0;
    stim[24] = 8'h7f;
    stim[25] = 8'h34;
    stim[26] = 8'h06;
    stim[27] = 8'h14;
    stim[28] = 8'hb8;
    stim[29] = 8'hba;
    stim[30] = 8'h4a;
    stim[31] = 8'hbd;
    stim[32] = 8'h9e;
    stim[33] = 8'hdf;
    stim[34] = 8'hd0;
    stim[35] = 8'hf2;
    stim[36] = 8'h4f;
    stim[37] = 8'h25;
    stim[38] = 8'h4b;
    stim[39] = 8'h9f;
    stim[40] = 8'h68;
    stim[41] = 8'h36;
    stim[42] = 8'h5f;
    stim[43] = 8'he9;
    stim[44] = 8'h70;
    stim[45] = 8'h2f;
    stim[46] = 8'he7;
    stim[47] = 8'h9f;
    stim[48] = 8'he1;
    stim[49] = 8'hf5;
    stim[50] = 8'hca;
    stim[51] = 8'h66;
    stim[52] = 8'h24;
    stim[53] = 8'hc6;
    stim[54] = 8'h7f;
    stim[55] = 8'h6f;
    stim[56] = 8'h9c;
    stim[57] = 8'he1;
    stim[58] = 8'h36;
    stim[59] = 8'h9f;
    stim[60] = 8'h05;
    stim[61] = 8'h43;
    stim[62] = 8'h42;
    stim[63] = 8'ha1;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h7fffffe7;
      expv[1] = 32'h00000062;
      expv[2] = 32'h0000003f;
      expv[3] = 32'h7fffffbf;
      expv[4] = 32'h00000036;
      expv[5] = 32'h7fffff9a;
      expv[6] = 32'h7fffffa2;
      expv[7] = 32'h7fffffe3;
      expv[8] = 32'h7fffffcb;
      expv[9] = 32'h0000007c;
      expv[10] = 32'h00000042;
      expv[11] = 32'h7fffffcf;
      expv[12] = 32'h0000006a;
      expv[13] = 32'h00000007;
      expv[14] = 32'h7fffff96;
      expv[15] = 32'h00000061;
      expv[16] = 32'h7ffffff1;
      expv[17] = 32'h0000000f;
      expv[18] = 32'h0000002d;
      expv[19] = 32'h7fffffb3;
      expv[20] = 32'h00000007;
      expv[21] = 32'h7fffffb5;
      expv[22] = 32'h7fffffdc;
      expv[23] = 32'h7fffffe0;
      expv[24] = 32'h0000007f;
      expv[25] = 32'h00000034;
      expv[26] = 32'h00000006;
      expv[27] = 32'h00000014;
      expv[28] = 32'h7fffffb8;
      expv[29] = 32'h7fffffba;
      expv[30] = 32'h0000004a;
      expv[31] = 32'h7fffffbd;
      expv[32] = 32'h7fffff9e;
      expv[33] = 32'h7fffffdf;
      expv[34] = 32'h7fffffd0;
      expv[35] = 32'h7ffffff2;
      expv[36] = 32'h0000004f;
      expv[37] = 32'h00000025;
      expv[38] = 32'h0000004b;
      expv[39] = 32'h7fffff9f;
      expv[40] = 32'h00000068;
      expv[41] = 32'h00000036;
      expv[42] = 32'h0000005f;
      expv[43] = 32'h7fffffe9;
      expv[44] = 32'h00000070;
      expv[45] = 32'h0000002f;
      expv[46] = 32'h7fffffe7;
      expv[47] = 32'h7fffff9f;
      expv[48] = 32'h7fffffe1;
      expv[49] = 32'h7ffffff5;
      expv[50] = 32'h7fffffca;
      expv[51] = 32'h00000066;
      expv[52] = 32'h00000024;
      expv[53] = 32'h7fffffc6;
      expv[54] = 32'h0000007f;
      expv[55] = 32'h0000006f;
      expv[56] = 32'h7fffff9c;
      expv[57] = 32'h7fffffe1;
      expv[58] = 32'h00000036;
      expv[59] = 32'h7fffff9f;
      expv[60] = 32'h00000005;
      expv[61] = 32'h00000043;
      expv[62] = 32'h00000042;
      expv[63] = 32'h7fffffa1;
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
