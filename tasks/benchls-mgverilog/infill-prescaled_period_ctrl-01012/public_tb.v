// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01012 dut (
    .clk(clk),
    .en_in(in_vec[29:29]),
    .pre_first(in_vec[28:28]),
    .process(in_vec[27:27]),
    .inc_dec(in_vec[26:26]),
    .cycle_div(in_vec[25:14]),
    .decr_on_pulse(in_vec[13:9]),
    .period_cur(in_vec[8:0]),
    .period_new(out_vec[13:5]),
    .encoded_period(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h1595e39d;
    stim[1] = 30'h165b1f24;
    stim[2] = 30'h1652b312;
    stim[3] = 30'h0def34ef;
    stim[4] = 30'h0ad5de55;
    stim[5] = 30'h0f8de774;
    stim[6] = 30'h25fe8fe2;
    stim[7] = 30'h2e4ef17b;
    stim[8] = 30'h009acfc3;
    stim[9] = 30'h2f7c9c15;
    stim[10] = 30'h086c5a25;
    stim[11] = 30'h257d5f91;
    stim[12] = 30'h03d2d544;
    stim[13] = 30'h2add0c8f;
    stim[14] = 30'h0459210e;
    stim[15] = 30'h04684f56;
    stim[16] = 30'h048209cf;
    stim[17] = 30'h24b0652d;
    stim[18] = 30'h2faf0372;
    stim[19] = 30'h01ebc196;
    stim[20] = 30'h0e57b421;
    stim[21] = 30'h0c53d7d8;
    stim[22] = 30'h0804054d;
    stim[23] = 30'h2690964b;
    stim[24] = 30'h014d75fb;
    stim[25] = 30'h2e5cfda3;
    stim[26] = 30'h2609172d;
    stim[27] = 30'h09c36c20;
    stim[28] = 30'h09ad33dd;
    stim[29] = 30'h2e3d7016;
    stim[30] = 30'h02ac5006;
    stim[31] = 30'h0cb18d76;
    stim[32] = 30'h28fe6f05;
    stim[33] = 30'h0cab2d3d;
    stim[34] = 30'h25921939;
    stim[35] = 30'h2d5e6a02;
    stim[36] = 30'h24b39c84;
    stim[37] = 30'h28861e42;
    stim[38] = 30'h07a675e5;
    stim[39] = 30'h24c47c9d;
    stim[40] = 30'h256e65af;
    stim[41] = 30'h00783f91;
    stim[42] = 30'h0c8b273c;
    stim[43] = 30'h04776546;
    stim[44] = 30'h04ff4b75;
    stim[45] = 30'h0614fc13;
    stim[46] = 30'h0524ff63;
    stim[47] = 30'h0f7f58cb;
    stim[48] = 30'h26247539;
    stim[49] = 30'h271ff6e1;
    stim[50] = 30'h06e69914;
    stim[51] = 30'h04ef1726;
    stim[52] = 30'h0befc5a8;
    stim[53] = 30'h20633d91;
    stim[54] = 30'h350fff44;
    stim[55] = 30'h06603a23;
    stim[56] = 30'h23c7540b;
    stim[57] = 30'h00bb51b8;
    stim[58] = 30'h29e287f0;
    stim[59] = 30'h0be3acf2;
    stim[60] = 30'h2cff5c3b;
    stim[61] = 30'h00ba64e7;
    stim[62] = 30'h0df590d3;
    stim[63] = 30'h2679d467;
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
      expv[0] = 14'h00xx;
      expv[1] = 14'h00xx;
      expv[2] = 14'h00xx;
      expv[3] = 14'h00xx;
      expv[4] = 14'h0axx;
      expv[5] = 14'h000c;
      expv[6] = 14'h0015;
      expv[7] = 14'h0016;
      expv[8] = 14'h3876;
      expv[9] = 14'h0016;
      expv[10] = 14'h04x6;
      expv[11] = 14'h0000;
      expv[12] = 14'h28x0;
      expv[13] = 14'h1xx0;
      expv[14] = 14'h0010;
      expv[15] = 14'h0018;
      expv[16] = 14'h0018;
      expv[17] = 14'h0018;
      expv[18] = 14'h0018;
      expv[19] = 14'h32x8;
      expv[20] = 14'h001d;
      expv[21] = 14'h001d;
      expv[22] = 14'h29x5;
      expv[23] = 14'h001d;
      expv[24] = 14'h3f7d;
      expv[25] = 14'h001d;
      expv[26] = 14'h001d;
      expv[27] = 14'h04x3;
      expv[28] = 14'h3bb3;
      expv[29] = 14'h0010;
      expv[30] = 14'h00xf;
      expv[31] = 14'h0005;
      expv[32] = 14'h20x5;
      expv[33] = 14'h0006;
      expv[34] = 14'h001c;
      expv[35] = 14'h0010;
      expv[36] = 14'h0010;
      expv[37] = 14'h08x0;
      expv[38] = 14'h0000;
      expv[39] = 14'h0014;
      expv[40] = 14'h0014;
      expv[41] = 14'h32x4;
      expv[42] = 14'h0014;
      expv[43] = 14'h0014;
      expv[44] = 14'h000a;
      expv[45] = 14'h000a;
      expv[46] = 14'h000a;
      expv[47] = 14'h000a;
      expv[48] = 14'h000a;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h35x0;
      expv[53] = 14'h32x0;
      expv[54] = 14'h001e;
      expv[55] = 14'h001e;
      expv[56] = 14'h01xe;
      expv[57] = 14'h37xe;
      expv[58] = 14'h3e1e;
      expv[59] = 14'h1exe;
      expv[60] = 14'h001f;
      expv[61] = 14'h1xxb;
      expv[62] = 14'h0001;
      expv[63] = 14'h0001;
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
