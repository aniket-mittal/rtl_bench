// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11267 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .rx_byte_start(in_vec[10:10]),
    .rx_byte_stop(in_vec[9:9]),
    .rx_byte_rdy(in_vec[8:8]),
    .rx_byte_d(in_vec[7:0]),
    .subslot_ctrl(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9b7;
    stim[1] = 12'hbad;
    stim[2] = 12'h6ff;
    stim[3] = 12'h21e;
    stim[4] = 12'h76f;
    stim[5] = 12'h081;
    stim[6] = 12'h61a;
    stim[7] = 12'h6b4;
    stim[8] = 12'h3e4;
    stim[9] = 12'h62f;
    stim[10] = 12'h14b;
    stim[11] = 12'h7ce;
    stim[12] = 12'h6ed;
    stim[13] = 12'h0bf;
    stim[14] = 12'h69a;
    stim[15] = 12'h64d;
    stim[16] = 12'h0d0;
    stim[17] = 12'h546;
    stim[18] = 12'h36b;
    stim[19] = 12'h00a;
    stim[20] = 12'h702;
    stim[21] = 12'h4ec;
    stim[22] = 12'h567;
    stim[23] = 12'h2a5;
    stim[24] = 12'h707;
    stim[25] = 12'h4ac;
    stim[26] = 12'h01c;
    stim[27] = 12'h3bf;
    stim[28] = 12'h653;
    stim[29] = 12'h737;
    stim[30] = 12'h61e;
    stim[31] = 12'h471;
    stim[32] = 12'h5cf;
    stim[33] = 12'h060;
    stim[34] = 12'h50e;
    stim[35] = 12'h7fe;
    stim[36] = 12'h5fd;
    stim[37] = 12'h3ae;
    stim[38] = 12'h293;
    stim[39] = 12'h7c4;
    stim[40] = 12'h7b2;
    stim[41] = 12'h057;
    stim[42] = 12'h063;
    stim[43] = 12'h318;
    stim[44] = 12'h155;
    stim[45] = 12'h46b;
    stim[46] = 12'h4f9;
    stim[47] = 12'h7a4;
    stim[48] = 12'h58e;
    stim[49] = 12'h4f0;
    stim[50] = 12'h7d9;
    stim[51] = 12'h77a;
    stim[52] = 12'h41b;
    stim[53] = 12'h1b0;
    stim[54] = 12'h403;
    stim[55] = 12'h4ee;
    stim[56] = 12'h417;
    stim[57] = 12'h190;
    stim[58] = 12'h41c;
    stim[59] = 12'h7d0;
    stim[60] = 12'h179;
    stim[61] = 12'h7f0;
    stim[62] = 12'h20a;
    stim[63] = 12'h582;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
