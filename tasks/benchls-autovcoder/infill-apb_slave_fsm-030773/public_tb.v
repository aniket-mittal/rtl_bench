// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_030773 dut (
    .CLK(clk),
    .RST(in_vec[36:36]),
    .i__tmp_2(in_vec[35:35]),
    .i__tmp_1(in_vec[34:34]),
    .i__tmp_0(in_vec[33:2]),
    .i_saxi_rready(in_vec[1:1]),
    .i_saxi_rvalid(in_vec[0:0]),
    ._saxi_register_fsm(out_vec[35:4]),
    ._tmp_5(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1eccc6d16a;
    stim[1] = 37'h1153a9ccd8;
    stim[2] = 37'h017ae2164d;
    stim[3] = 37'h0d2f9996c1;
    stim[4] = 37'h0af5b254c3;
    stim[5] = 37'h07e05aca70;
    stim[6] = 37'h0aa2a3288a;
    stim[7] = 37'h0d897fbe1a;
    stim[8] = 37'h0d1c0c60ed;
    stim[9] = 37'h0c24564a53;
    stim[10] = 37'h0fb0966831;
    stim[11] = 37'h0d349c299d;
    stim[12] = 37'h0fa7a19fdf;
    stim[13] = 37'h052dafa742;
    stim[14] = 37'h0dbccb3840;
    stim[15] = 37'h0981f42b5e;
    stim[16] = 37'h07013dd222;
    stim[17] = 37'h0681b9e0e0;
    stim[18] = 37'h05b1733112;
    stim[19] = 37'h0c94385ed1;
    stim[20] = 37'h0f53ed4855;
    stim[21] = 37'h0b9625af39;
    stim[22] = 37'h004e84e631;
    stim[23] = 37'h08925eb21c;
    stim[24] = 37'h047f66c8b2;
    stim[25] = 37'h01b3846f3b;
    stim[26] = 37'h0d85949adf;
    stim[27] = 37'h0abdfe8854;
    stim[28] = 37'h01f7ce1d2d;
    stim[29] = 37'h095c015ac2;
    stim[30] = 37'h07d8ad9dbe;
    stim[31] = 37'h1fd9e1e036;
    stim[32] = 37'h022f2b7203;
    stim[33] = 37'h087a075667;
    stim[34] = 37'h03ac1b5139;
    stim[35] = 37'h0942ec0e92;
    stim[36] = 37'h0ef5ab9068;
    stim[37] = 37'h0a9cb99f74;
    stim[38] = 37'h0e7410106d;
    stim[39] = 37'h03d31503e0;
    stim[40] = 37'h00b590ecc1;
    stim[41] = 37'h0981b454ea;
    stim[42] = 37'h0f863e1493;
    stim[43] = 37'h0781e60a48;
    stim[44] = 37'h095fef1f2b;
    stim[45] = 37'h0020bb8379;
    stim[46] = 37'h0be8bf11d7;
    stim[47] = 37'h0cf7edc23c;
    stim[48] = 37'h0774e7c443;
    stim[49] = 37'h0e8e6a75de;
    stim[50] = 37'h0a4dc214e4;
    stim[51] = 37'h064346c198;
    stim[52] = 37'h011c5f7698;
    stim[53] = 37'h0ee639efa9;
    stim[54] = 37'h0bb12d07b3;
    stim[55] = 37'h0f58686160;
    stim[56] = 37'h0a93c91b67;
    stim[57] = 37'h099ee73ce1;
    stim[58] = 37'h0a112eeb2f;
    stim[59] = 37'h08c38fda02;
    stim[60] = 37'h04f359f4cb;
    stim[61] = 37'h0d09879921;
    stim[62] = 37'h032e2b00c1;
    stim[63] = 37'h03079b438e;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'h00000000x;
      expv[2] = 36'h00000000x;
      expv[3] = 36'h00000000x;
      expv[4] = 36'h00000002c;
      expv[5] = 36'h00000000c;
      expv[6] = 36'h000000027;
      expv[7] = 36'h000000007;
      expv[8] = 36'h000000021;
      expv[9] = 36'h000000001;
      expv[10] = 36'h000000025;
      expv[11] = 36'h000000005;
      expv[12] = 36'h000000029;
      expv[13] = 36'h000000009;
      expv[14] = 36'h000000024;
      expv[15] = 36'h000000004;
      expv[16] = 36'h000000015;
      expv[17] = 36'h000000005;
      expv[18] = 36'h00000002e;
      expv[19] = 36'h00000000e;
      expv[20] = 36'h00000002d;
      expv[21] = 36'h00000000d;
      expv[22] = 36'h000000013;
      expv[23] = 36'h000000013;
      expv[24] = 36'h000000003;
      expv[25] = 36'h00000002b;
      expv[26] = 36'h00000000b;
      expv[27] = 36'h00000002d;
      expv[28] = 36'h00000000d;
      expv[29] = 36'h00000000d;
      expv[30] = 36'h00000001c;
      expv[31] = 36'h00000000c;
      expv[32] = 36'h00000000c;
      expv[33] = 36'h00000000c;
      expv[34] = 36'h000000016;
      expv[35] = 36'h000000016;
      expv[36] = 36'h000000006;
      expv[37] = 36'h000000026;
      expv[38] = 36'h000000006;
      expv[39] = 36'h000000026;
      expv[40] = 36'h000000006;
      expv[41] = 36'h000000006;
      expv[42] = 36'h00000001e;
      expv[43] = 36'h00000000e;
      expv[44] = 36'h000000024;
      expv[45] = 36'h000000004;
      expv[46] = 36'h000000004;
      expv[47] = 36'h00000001d;
      expv[48] = 36'h00000000d;
      expv[49] = 36'h000000024;
      expv[50] = 36'h000000004;
      expv[51] = 36'h00000001e;
      expv[52] = 36'h00000000e;
      expv[53] = 36'h00000000e;
      expv[54] = 36'h00000002a;
      expv[55] = 36'h00000000a;
      expv[56] = 36'h000000026;
      expv[57] = 36'h000000006;
      expv[58] = 36'h00000001e;
      expv[59] = 36'h00000000e;
      expv[60] = 36'h000000010;
      expv[61] = 36'h000000000;
      expv[62] = 36'h000000022;
      expv[63] = 36'h000000002;
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
