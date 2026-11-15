// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06909 dut (
    .HCLK(clk),
    .HRESETn(in_vec[20:20]),
    .READ(in_vec[19:19]),
    .HRDATA(in_vec[18:3]),
    .HREADY(in_vec[2:2]),
    .HRESP(in_vec[1:0]),
    .DATAOUT(out_vec[96:81]),
    .HADDR(out_vec[80:49]),
    .HTRANS(out_vec[48:47]),
    .HWRITE(out_vec[46:46]),
    .HSIZE(out_vec[45:43]),
    .HBURST(out_vec[42:40]),
    .HPROT(out_vec[39:36]),
    .HWDATA(out_vec[35:4]),
    .RESP_err(out_vec[3:2]),
    .AHB_BUSY(out_vec[1:1]),
    .VALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h09ece0;
    stim[1] = 21'h0181d0;
    stim[2] = 21'h0d7cc7;
    stim[3] = 21'h183f5c;
    stim[4] = 21'h1f167d;
    stim[5] = 21'h11c7fb;
    stim[6] = 21'h1ba9cb;
    stim[7] = 21'h1cbb34;
    stim[8] = 21'h14c5d9;
    stim[9] = 21'h1e1ce4;
    stim[10] = 21'h10e30c;
    stim[11] = 21'h1ac497;
    stim[12] = 21'h1d6f9d;
    stim[13] = 21'h1f0986;
    stim[14] = 21'h18874f;
    stim[15] = 21'h19d86a;
    stim[16] = 21'h190b71;
    stim[17] = 21'h1c3ebe;
    stim[18] = 21'h12d571;
    stim[19] = 21'h184a08;
    stim[20] = 21'h1eb45d;
    stim[21] = 21'h1e2552;
    stim[22] = 21'h1aa9ff;
    stim[23] = 21'h1249de;
    stim[24] = 21'h1ebed2;
    stim[25] = 21'h1271b4;
    stim[26] = 21'h105559;
    stim[27] = 21'h157933;
    stim[28] = 21'h1b81d0;
    stim[29] = 21'h1007a8;
    stim[30] = 21'h1cfb34;
    stim[31] = 21'h0f2ca9;
    stim[32] = 21'h1be92e;
    stim[33] = 21'h1e9423;
    stim[34] = 21'h1b70cd;
    stim[35] = 21'h13f2da;
    stim[36] = 21'h18606a;
    stim[37] = 21'h1b536b;
    stim[38] = 21'h143bbd;
    stim[39] = 21'h121275;
    stim[40] = 21'h1a67c5;
    stim[41] = 21'h1eec14;
    stim[42] = 21'h13def6;
    stim[43] = 21'h103951;
    stim[44] = 21'h19043c;
    stim[45] = 21'h14da34;
    stim[46] = 21'h192e83;
    stim[47] = 21'h14bf5f;
    stim[48] = 21'h11739d;
    stim[49] = 21'h11d381;
    stim[50] = 21'h170794;
    stim[51] = 21'h1e9715;
    stim[52] = 21'h1dfd81;
    stim[53] = 21'h1cf60f;
    stim[54] = 21'h157a06;
    stim[55] = 21'h16ed29;
    stim[56] = 21'h1933e8;
    stim[57] = 21'h162277;
    stim[58] = 21'h1c4a77;
    stim[59] = 21'h1464cf;
    stim[60] = 21'h1b5d6e;
    stim[61] = 21'h1697b7;
    stim[62] = 21'h12540c;
    stim[63] = 21'h196f6d;
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
      expv[0] = 97'h0000000000000483000000000;
      expv[1] = 97'h0000000000000483000000000;
      expv[2] = 97'h000000000000048300000000c;
      expv[3] = 97'h0000000000000483000000000;
      expv[4] = 97'h0000040010000083000000006;
      expv[5] = 97'h000004001000148300000000e;
      expv[6] = 97'h000004001000148300000000e;
      expv[7] = 97'h0000040010001483000000002;
      expv[8] = 97'h0000000000000483000000006;
      expv[9] = 97'h0000000000000483000000002;
      expv[10] = 97'h1873800000000483000000001;
      expv[11] = 97'h187380000000048300000000d;
      expv[12] = 97'h1873840010000083000000006;
      expv[13] = 97'h187384001000148300000000a;
      expv[14] = 97'h187380000000048300000000e;
      expv[15] = 97'h021d200000000483000000009;
      expv[16] = 97'h021d200000000483000000005;
      expv[17] = 97'h021d24001000008300000000a;
      expv[18] = 97'h021d240010001483000000006;
      expv[19] = 97'h021d240010001483000000002;
      expv[20] = 97'h021d240010001483000000006;
      expv[21] = 97'h021d20000000048300000000a;
      expv[22] = 97'h021d20000000048300000000e;
      expv[23] = 97'h0aa7e00000000483000000009;
      expv[24] = 97'h0aa7e00000000483000000009;
      expv[25] = 97'h0aa7e40010000083000000002;
      expv[26] = 97'h0aa7e40010001483000000006;
      expv[27] = 97'h0aa7e4001000148300000000e;
      expv[28] = 97'h0aa7e40010001483000000002;
      expv[29] = 97'h0aa7e40010001483000000002;
      expv[30] = 97'h0aa7e40010001483000000002;
      expv[31] = 97'h0000000000000483000000004;
      expv[32] = 97'h0000000000000483000000008;
      expv[33] = 97'h000004001000008300000000e;
      expv[34] = 97'h0000040010001483000000006;
      expv[35] = 97'h000000000000048300000000a;
      expv[36] = 97'h000000000000048300000000a;
      expv[37] = 97'h000000000000048300000000e;
      expv[38] = 97'h0000000000000483000000006;
      expv[39] = 97'h10eee00000000483000000005;
      expv[40] = 97'h10eee00000000483000000005;
      expv[41] = 97'h10eee40010000083000000002;
      expv[42] = 97'h10eee4001000148300000000a;
      expv[43] = 97'h10eee00000000483000000006;
      expv[44] = 97'h10eee00000000483000000002;
      expv[45] = 97'h0410e00000000483000000001;
      expv[46] = 97'h0410e0000000048300000000d;
      expv[47] = 97'h0410e4001000008300000000e;
      expv[48] = 97'h0410e40010001483000000006;
      expv[49] = 97'h0410e00000000483000000006;
      expv[50] = 97'h0410e00000000483000000002;
      expv[51] = 97'h1c1e400000000483000000005;
      expv[52] = 97'h1c1e400000000483000000005;
      expv[53] = 97'h1c1e44001000008300000000e;
      expv[54] = 97'h1c1e44001000148300000000a;
      expv[55] = 97'h1c1e400000000483000000006;
      expv[56] = 97'h1c1e400000000483000000002;
      expv[57] = 97'h1c1e40000000048300000000e;
      expv[58] = 97'h1889c0000000048300000000d;
      expv[59] = 97'h1889c0000000048300000000d;
      expv[60] = 97'h1889c00000000483000000008;
      expv[61] = 97'h1889c4001000008300000000e;
      expv[62] = 97'h1889c40010001483000000002;
      expv[63] = 97'h1889c00000000483000000006;
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
