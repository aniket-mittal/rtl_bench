// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_086697 dut (
    .clk(clk),
    .jrst_n(in_vec[52:52]),
    .trc_ctrl(in_vec[51:36]),
    .tw(in_vec[35:0]),
    .tracemem_on(out_vec[46:46]),
    .tracemem_trcdata(out_vec[45:10]),
    .tracemem_tw(out_vec[9:9]),
    .trc_im_addr(out_vec[8:2]),
    .trc_wrap(out_vec[1:1]),
    .xbrk_wrap_traceoff(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h0c5f739de62667;
    stim[1] = 53'h04e448183b7f88;
    stim[2] = 53'h1f581f9c8f71a6;
    stim[3] = 53'h160efbf34b9715;
    stim[4] = 53'h182205e9a06204;
    stim[5] = 53'h1cdaef498802ac;
    stim[6] = 53'h12fde7747fa86f;
    stim[7] = 53'h15e192ea4421b9;
    stim[8] = 53'h1e829e04916e6d;
    stim[9] = 53'h1c855f643a954f;
    stim[10] = 53'h1175fe7c5f0c37;
    stim[11] = 53'h11c3235e25f6cf;
    stim[12] = 53'h172d853dcfbb7f;
    stim[13] = 53'h16ccfedacea715;
    stim[14] = 53'h194b121651876b;
    stim[15] = 53'h122d14abeeb9d4;
    stim[16] = 53'h1b00e07115a22a;
    stim[17] = 53'h10a0368dfba8df;
    stim[18] = 53'h11e05c7eab0ee8;
    stim[19] = 53'h1a65d0a8a8bf4d;
    stim[20] = 53'h1067afcb131cf7;
    stim[21] = 53'h19f626328b0599;
    stim[22] = 53'h14c460a87cc04d;
    stim[23] = 53'h1445bff44bcbf2;
    stim[24] = 53'h1e72f61cb62d05;
    stim[25] = 53'h16085cd7d3ba22;
    stim[26] = 53'h1f47a1e0c1091e;
    stim[27] = 53'h1844a1577999e5;
    stim[28] = 53'h1d557354dfe71d;
    stim[29] = 53'h170632ff2e641d;
    stim[30] = 53'h1ddf369f851ca7;
    stim[31] = 53'h1d6d435060bcef;
    stim[32] = 53'h1097647f4711eb;
    stim[33] = 53'h1751de51605f31;
    stim[34] = 53'h1af6978b3baae9;
    stim[35] = 53'h1fec30b32db1db;
    stim[36] = 53'h1aab61003dc480;
    stim[37] = 53'h15d0dbbf1b17de;
    stim[38] = 53'h191efc7d976a89;
    stim[39] = 53'h1930b1abe5b519;
    stim[40] = 53'h15c3ea6e73854e;
    stim[41] = 53'h10e29830ef0e98;
    stim[42] = 53'h181e415ce7b17e;
    stim[43] = 53'h1bb99f3f57c6e9;
    stim[44] = 53'h1f72ee58774032;
    stim[45] = 53'h116b7875e6aea1;
    stim[46] = 53'h15975a83ad6f55;
    stim[47] = 53'h18ccb1a85b0e2a;
    stim[48] = 53'h1ee6812de38905;
    stim[49] = 53'h1d6da8f4c3a2f7;
    stim[50] = 53'h1e582a1999140e;
    stim[51] = 53'h14d012c0685502;
    stim[52] = 53'h197d03327ac8a5;
    stim[53] = 53'h19b7cd1a18a199;
    stim[54] = 53'h166dff21cc3119;
    stim[55] = 53'h1bfe89aeb80b05;
    stim[56] = 53'h03c443c6208e0e;
    stim[57] = 53'h1fee0fce98938c;
    stim[58] = 53'h1b35f05942c59b;
    stim[59] = 53'h11df0ac6238d87;
    stim[60] = 53'h1a3a69fb9398f6;
    stim[61] = 53'h1a7b5075738aec;
    stim[62] = 53'h13ee3583728920;
    stim[63] = 53'h168dd43d7452ef;
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
      expv[0] = 47'hx00000000x00;
      expv[1] = 47'hx00000000x00;
      expv[2] = 47'hx00000000x00;
      expv[3] = 47'hx00000000x00;
      expv[4] = 47'hx00000000x00;
      expv[5] = 47'hx00000000x00;
      expv[6] = 47'hx00000000x00;
      expv[7] = 47'hx00000000x00;
      expv[8] = 47'hx00000000x00;
      expv[9] = 47'hx00000000x00;
      expv[10] = 47'hx00000000x00;
      expv[11] = 47'hx00000000x00;
      expv[12] = 47'hx00000000x00;
      expv[13] = 47'hx00000000x00;
      expv[14] = 47'hx00000000x00;
      expv[15] = 47'hx00000000x00;
      expv[16] = 47'hx00000000x00;
      expv[17] = 47'hx00000000x00;
      expv[18] = 47'hx00000000x00;
      expv[19] = 47'hx00000000x00;
      expv[20] = 47'hx00000000x00;
      expv[21] = 47'hx00000000x00;
      expv[22] = 47'hx00000000x00;
      expv[23] = 47'hx00000000x00;
      expv[24] = 47'hx00000000x00;
      expv[25] = 47'hx00000000x00;
      expv[26] = 47'hx00000000x00;
      expv[27] = 47'hx00000000x00;
      expv[28] = 47'hx00000000x00;
      expv[29] = 47'hx00000000x00;
      expv[30] = 47'hx00000000x00;
      expv[31] = 47'hx00000000x00;
      expv[32] = 47'hx00000000x00;
      expv[33] = 47'hx00000000x00;
      expv[34] = 47'hx00000000x00;
      expv[35] = 47'hx00000000x00;
      expv[36] = 47'hx00000000x00;
      expv[37] = 47'hx00000000x00;
      expv[38] = 47'hx00000000x00;
      expv[39] = 47'hx00000000x00;
      expv[40] = 47'hx00000000x00;
      expv[41] = 47'hx00000000x00;
      expv[42] = 47'hx00000000x00;
      expv[43] = 47'hx00000000x00;
      expv[44] = 47'hx00000000x00;
      expv[45] = 47'hx00000000x00;
      expv[46] = 47'hx00000000x00;
      expv[47] = 47'hx00000000x00;
      expv[48] = 47'hx00000000x00;
      expv[49] = 47'hx00000000x00;
      expv[50] = 47'hx00000000x00;
      expv[51] = 47'hx00000000x00;
      expv[52] = 47'hx00000000x00;
      expv[53] = 47'hx00000000x00;
      expv[54] = 47'hx00000000x00;
      expv[55] = 47'hx00000000x00;
      expv[56] = 47'hx00000000x00;
      expv[57] = 47'hx00000000x00;
      expv[58] = 47'hx00000000x00;
      expv[59] = 47'hx00000000x00;
      expv[60] = 47'hx00000000x00;
      expv[61] = 47'hx00000000x00;
      expv[62] = 47'hx00000000x00;
      expv[63] = 47'hx00000000x00;
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
