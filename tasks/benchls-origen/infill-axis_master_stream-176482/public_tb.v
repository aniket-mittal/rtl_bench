// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176482 dut (
    .M_AXIS_ACLK(clk),
    .pi_r_data(in_vec[4:4]),
    .pi_tlast(in_vec[3:3]),
    .pi_data_avaliable(in_vec[2:2]),
    .M_AXIS_ARESETN(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .po_read_data(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TSTRB(out_vec[4:1]),
    .M_AXIS_TLAST(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h19;
    stim[1] = 5'h09;
    stim[2] = 5'h0e;
    stim[3] = 5'h06;
    stim[4] = 5'h0a;
    stim[5] = 5'h07;
    stim[6] = 5'h1b;
    stim[7] = 5'h1f;
    stim[8] = 5'h0f;
    stim[9] = 5'h17;
    stim[10] = 5'h17;
    stim[11] = 5'h13;
    stim[12] = 5'h02;
    stim[13] = 5'h02;
    stim[14] = 5'h1a;
    stim[15] = 5'h02;
    stim[16] = 5'h02;
    stim[17] = 5'h06;
    stim[18] = 5'h0e;
    stim[19] = 5'h17;
    stim[20] = 5'h16;
    stim[21] = 5'h02;
    stim[22] = 5'h0f;
    stim[23] = 5'h1e;
    stim[24] = 5'h1f;
    stim[25] = 5'h07;
    stim[26] = 5'h06;
    stim[27] = 5'h12;
    stim[28] = 5'h0a;
    stim[29] = 5'h02;
    stim[30] = 5'h0e;
    stim[31] = 5'h03;
    stim[32] = 5'h0a;
    stim[33] = 5'h03;
    stim[34] = 5'h12;
    stim[35] = 5'h1f;
    stim[36] = 5'h0a;
    stim[37] = 5'h1b;
    stim[38] = 5'h12;
    stim[39] = 5'h0b;
    stim[40] = 5'h06;
    stim[41] = 5'h0a;
    stim[42] = 5'h1b;
    stim[43] = 5'h11;
    stim[44] = 5'h1f;
    stim[45] = 5'h06;
    stim[46] = 5'h1f;
    stim[47] = 5'h0f;
    stim[48] = 5'h0b;
    stim[49] = 5'h0a;
    stim[50] = 5'h03;
    stim[51] = 5'h1a;
    stim[52] = 5'h06;
    stim[53] = 5'h1f;
    stim[54] = 5'h17;
    stim[55] = 5'h1b;
    stim[56] = 5'h1a;
    stim[57] = 5'h07;
    stim[58] = 5'h0f;
    stim[59] = 5'h16;
    stim[60] = 5'h1b;
    stim[61] = 5'h0a;
    stim[62] = 5'h1f;
    stim[63] = 5'h17;
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
      expv[0] = 39'hxxxxxxxxxx;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h0000000000;
      expv[4] = 39'h0000000000;
      expv[5] = 39'h0000000000;
      expv[6] = 39'h600000001f;
      expv[7] = 39'h600000001f;
      expv[8] = 39'h600000001f;
      expv[9] = 39'h600000001f;
      expv[10] = 39'h7fffffffff;
      expv[11] = 39'h7fffffffff;
      expv[12] = 39'h1fffffffff;
      expv[13] = 39'h1fffffffff;
      expv[14] = 39'h1fffffffff;
      expv[15] = 39'h1fffffffff;
      expv[16] = 39'h1fffffffff;
      expv[17] = 39'h1fffffffff;
      expv[18] = 39'h1fffffffff;
      expv[19] = 39'h1fffffffff;
      expv[20] = 39'h600000001e;
      expv[21] = 39'h000000001e;
      expv[22] = 39'h000000001e;
      expv[23] = 39'h600000001e;
      expv[24] = 39'h000000001e;
      expv[25] = 39'h600000001e;
      expv[26] = 39'h600000001e;
      expv[27] = 39'h000000001e;
      expv[28] = 39'h000000001e;
      expv[29] = 39'h000000001e;
      expv[30] = 39'h000000001e;
      expv[31] = 39'h000000001e;
      expv[32] = 39'h600000001e;
      expv[33] = 39'h000000001e;
      expv[34] = 39'h600000001e;
      expv[35] = 39'h000000001e;
      expv[36] = 39'h600000001e;
      expv[37] = 39'h000000001e;
      expv[38] = 39'h600000001e;
      expv[39] = 39'h000000001e;
      expv[40] = 39'h600000001e;
      expv[41] = 39'h000000001e;
      expv[42] = 39'h000000001e;
      expv[43] = 39'h600000001e;
      expv[44] = 39'h0000000000;
      expv[45] = 39'h0000000000;
      expv[46] = 39'h0000000000;
      expv[47] = 39'h7fffffffff;
      expv[48] = 39'h7fffffffff;
      expv[49] = 39'h1fffffffff;
      expv[50] = 39'h1fffffffff;
      expv[51] = 39'h1fffffffff;
      expv[52] = 39'h1fffffffff;
      expv[53] = 39'h1fffffffff;
      expv[54] = 39'h1fffffffff;
      expv[55] = 39'h600000001e;
      expv[56] = 39'h600000001e;
      expv[57] = 39'h000000001e;
      expv[58] = 39'h600000001e;
      expv[59] = 39'h600000001e;
      expv[60] = 39'h000000001e;
      expv[61] = 39'h600000001e;
      expv[62] = 39'h000000001e;
      expv[63] = 39'h600000001e;
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
