// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04785 dut (
    .clk(clk),
    .wr_en(in_vec[16:16]),
    .wr_addr(in_vec[15:12]),
    .wr_value(in_vec[11:4]),
    .rd_addr(in_vec[3:0]),
    .rd_value(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h19e9f;
    stim[1] = 17'h04098;
    stim[2] = 17'h11a4f;
    stim[3] = 17'h05f85;
    stim[4] = 17'h027ae;
    stim[5] = 17'h0b2dd;
    stim[6] = 17'h1808b;
    stim[7] = 17'h048ce;
    stim[8] = 17'h058e1;
    stim[9] = 17'h1e994;
    stim[10] = 17'h0d064;
    stim[11] = 17'h07efa;
    stim[12] = 17'h10fb9;
    stim[13] = 17'h12ddc;
    stim[14] = 17'h04193;
    stim[15] = 17'h0ab88;
    stim[16] = 17'h0a222;
    stim[17] = 17'h1f7e4;
    stim[18] = 17'h0de3d;
    stim[19] = 17'h00b14;
    stim[20] = 17'h1ec1f;
    stim[21] = 17'h0f9e5;
    stim[22] = 17'h1ab0d;
    stim[23] = 17'h07956;
    stim[24] = 17'h06177;
    stim[25] = 17'h1b8c9;
    stim[26] = 17'h05989;
    stim[27] = 17'h0a14f;
    stim[28] = 17'h1b7df;
    stim[29] = 17'h09ba3;
    stim[30] = 17'h18e79;
    stim[31] = 17'h07a28;
    stim[32] = 17'h0ebf1;
    stim[33] = 17'h0896f;
    stim[34] = 17'h10fb3;
    stim[35] = 17'h106d4;
    stim[36] = 17'h102eb;
    stim[37] = 17'h027f6;
    stim[38] = 17'h06865;
    stim[39] = 17'h0d5ca;
    stim[40] = 17'h1e652;
    stim[41] = 17'h14dc6;
    stim[42] = 17'h01b11;
    stim[43] = 17'h0ed22;
    stim[44] = 17'h0c78f;
    stim[45] = 17'h02338;
    stim[46] = 17'h102c6;
    stim[47] = 17'h0386c;
    stim[48] = 17'h0617a;
    stim[49] = 17'h0436b;
    stim[50] = 17'h0c878;
    stim[51] = 17'h12a51;
    stim[52] = 17'h15708;
    stim[53] = 17'h0b928;
    stim[54] = 17'h0f53f;
    stim[55] = 17'h03dec;
    stim[56] = 17'h1ab65;
    stim[57] = 17'h08107;
    stim[58] = 17'h16152;
    stim[59] = 17'h12cfb;
    stim[60] = 17'h06a95;
    stim[61] = 17'h08759;
    stim[62] = 17'h1cdc8;
    stim[63] = 17'h0089a;
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
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'ha4;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'he9;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h08;
      expv[17] = 8'hdd;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'h7e;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'he9;
      expv[27] = 8'he9;
      expv[28] = 8'h7e;
      expv[29] = 8'h7e;
      expv[30] = 8'hxx;
      expv[31] = 8'he9;
      expv[32] = 8'he7;
      expv[33] = 8'ha4;
      expv[34] = 8'h7e;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'h7d;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hb0;
      expv[41] = 8'hdd;
      expv[42] = 8'hxx;
      expv[43] = 8'ha4;
      expv[44] = 8'hdd;
      expv[45] = 8'h7e;
      expv[46] = 8'he7;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hb0;
      expv[50] = 8'h7d;
      expv[51] = 8'he7;
      expv[52] = 8'ha4;
      expv[53] = 8'he7;
      expv[54] = 8'he7;
      expv[55] = 8'h7e;
      expv[56] = 8'hxx;
      expv[57] = 8'h70;
      expv[58] = 8'hxx;
      expv[59] = 8'ha5;
      expv[60] = 8'h7d;
      expv[61] = 8'h70;
      expv[62] = 8'he9;
      expv[63] = 8'he7;
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
