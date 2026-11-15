// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134941 dut (
    .csi_clock_clk(clk),
    .csi_clock_reset(in_vec[40:40]),
    .avs_ctrl_address(in_vec[39:37]),
    .avs_ctrl_read(in_vec[36:36]),
    .avs_ctrl_write(in_vec[35:35]),
    .avs_ctrl_writedata(in_vec[34:3]),
    .sync(in_vec[2:2]),
    .phase(in_vec[1:1]),
    .rda(in_vec[0:0]),
    .avs_ctrl_readdata(out_vec[33:2]),
    .send(out_vec[1:1]),
    .sda(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h12b787b72bf;
    stim[1] = 41'h1f9e94005a2;
    stim[2] = 41'h0762cf54e31;
    stim[3] = 41'h049908af1fc;
    stim[4] = 41'h044c26bc4f3;
    stim[5] = 41'h0c1a118754c;
    stim[6] = 41'h0f5ebd4fad0;
    stim[7] = 41'h045bb7b7af7;
    stim[8] = 41'h0438a81bfc2;
    stim[9] = 41'h00990733b4c;
    stim[10] = 41'h049f83dc8af;
    stim[11] = 41'h07b36cc7a66;
    stim[12] = 41'h07b0fbb43fd;
    stim[13] = 41'h087276697d7;
    stim[14] = 41'h0a73d8b2c84;
    stim[15] = 41'h126feed991f;
    stim[16] = 41'h0f632392574;
    stim[17] = 41'h02605f9ff41;
    stim[18] = 41'h064ce27696e;
    stim[19] = 41'h0ca6e47193c;
    stim[20] = 41'h063a9286e8f;
    stim[21] = 41'h0f619a60d01;
    stim[22] = 41'h0be4f15a6b1;
    stim[23] = 41'h0ffcc788753;
    stim[24] = 41'h0eff4d8f8ae;
    stim[25] = 41'h0b593403162;
    stim[26] = 41'h0192522e345;
    stim[27] = 41'h0c52ad62250;
    stim[28] = 41'h0d4fc69d5d9;
    stim[29] = 41'h0841bea19e3;
    stim[30] = 41'h0f5cf4315c6;
    stim[31] = 41'h06ec51ddd8e;
    stim[32] = 41'h0670fcbae11;
    stim[33] = 41'h0e54690a3d1;
    stim[34] = 41'h015790da18d;
    stim[35] = 41'h0be1f66c1a7;
    stim[36] = 41'h11bb7498270;
    stim[37] = 41'h01111b40974;
    stim[38] = 41'h0f4c6a465fb;
    stim[39] = 41'h0cb2f7d74d2;
    stim[40] = 41'h0719511dbcf;
    stim[41] = 41'h049a07c7cc7;
    stim[42] = 41'h00147214ddb;
    stim[43] = 41'h0c6df6b4d09;
    stim[44] = 41'h05d35fa217a;
    stim[45] = 41'h0217f6e238f;
    stim[46] = 41'h0d8681946f6;
    stim[47] = 41'h0018eccf8c4;
    stim[48] = 41'h046b1190468;
    stim[49] = 41'h05de8ccb2b7;
    stim[50] = 41'h0bc48d27fec;
    stim[51] = 41'h0b7ca7f2c93;
    stim[52] = 41'h0d1ea750b52;
    stim[53] = 41'h0a8461ebe1f;
    stim[54] = 41'h08de130e7f3;
    stim[55] = 41'h0f82c1f52c5;
    stim[56] = 41'h09e921da365;
    stim[57] = 41'h05a9fe68d70;
    stim[58] = 41'h0139f44c101;
    stim[59] = 41'h0a82060a1ed;
    stim[60] = 41'h0cab9b9bcb6;
    stim[61] = 41'h0378d8f9979;
    stim[62] = 41'h098ee9714d6;
    stim[63] = 41'h0ca35f3fde1;
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
      expv[4] = 34'h00000000x;
      expv[5] = 34'h000000002;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000002;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000003;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000002;
      expv[12] = 34'h000000002;
      expv[13] = 34'h000000002;
      expv[14] = 34'h000000002;
      expv[15] = 34'h000000001;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h000000003;
      expv[19] = 34'h000000002;
      expv[20] = 34'h000000003;
      expv[21] = 34'h000000003;
      expv[22] = 34'h000000003;
      expv[23] = 34'h000000003;
      expv[24] = 34'h000000003;
      expv[25] = 34'h000000003;
      expv[26] = 34'h000000002;
      expv[27] = 34'h000000002;
      expv[28] = 34'h000000002;
      expv[29] = 34'h000000003;
      expv[30] = 34'h000000003;
      expv[31] = 34'h3191c92ba;
      expv[32] = 34'h3191c92bb;
      expv[33] = 34'h3191c92b9;
      expv[34] = 34'h3191c92ba;
      expv[35] = 34'h3191c92b8;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000002;
      expv[40] = 34'h000000002;
      expv[41] = 34'h000000002;
      expv[42] = 34'h000000002;
      expv[43] = 34'h000000002;
      expv[44] = 34'h000000003;
      expv[45] = 34'h000000002;
      expv[46] = 34'h000000002;
      expv[47] = 34'h000000003;
      expv[48] = 34'h000000002;
      expv[49] = 34'h000000002;
      expv[50] = 34'h000000003;
      expv[51] = 34'h000000002;
      expv[52] = 34'h088da04ba;
      expv[53] = 34'h088da04bb;
      expv[54] = 34'h088da04b9;
      expv[55] = 34'h088da04ba;
      expv[56] = 34'h088da04ba;
      expv[57] = 34'h088da04bb;
      expv[58] = 34'h088da04ba;
      expv[59] = 34'h088da04bb;
      expv[60] = 34'h088da04ba;
      expv[61] = 34'h088da04ba;
      expv[62] = 34'h088da04ba;
      expv[63] = 34'h088da04ba;
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
