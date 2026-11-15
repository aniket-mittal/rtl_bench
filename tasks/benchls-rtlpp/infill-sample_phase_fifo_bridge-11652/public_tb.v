// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11652 dut (
    .clk(clk),
    .resetn(in_vec[46:46]),
    .processing_resetn(in_vec[45:45]),
    .s_axis_sample_valid(in_vec[44:44]),
    .s_axis_sample_data(in_vec[43:36]),
    .sample_has_stat(in_vec[35:35]),
    .conv_done(in_vec[34:34]),
    .phase(in_vec[33:2]),
    .m_axis_sample_ready(in_vec[1:1]),
    .m_axis_phase_ready(in_vec[0:0]),
    .s_axis_sample_ready(out_vec[59:59]),
    .m_axis_sample_valid(out_vec[58:58]),
    .m_axis_sample_data(out_vec[57:34]),
    .m_axis_phase_valid(out_vec[33:33]),
    .m_axis_phase_data(out_vec[32:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h345443192fc2;
    stim[1] = 47'h2493c1a860c2;
    stim[2] = 47'h74fdd4a6c8f7;
    stim[3] = 47'h4f0e6e3ee267;
    stim[4] = 47'h6a408a314bbe;
    stim[5] = 47'h6cf14d947b4c;
    stim[6] = 47'h4c589935baf9;
    stim[7] = 47'h75875dac2647;
    stim[8] = 47'h53b8020e0db6;
    stim[9] = 47'h7a8cc5c372fd;
    stim[10] = 47'h6c489345f474;
    stim[11] = 47'h4f6e5d116cd8;
    stim[12] = 47'h25fc28166e6e;
    stim[13] = 47'h533e11f5b38f;
    stim[14] = 47'h52deaf5addc6;
    stim[15] = 47'h5021de8f34c8;
    stim[16] = 47'h770fe0c3f925;
    stim[17] = 47'h4c9cf4c8bc60;
    stim[18] = 47'h7175fc3fea4d;
    stim[19] = 47'h4073383c7705;
    stim[20] = 47'h7eb6520f4c51;
    stim[21] = 47'h52344f3db682;
    stim[22] = 47'h73e020235889;
    stim[23] = 47'h7af9c112f503;
    stim[24] = 47'h5bd6b110b25b;
    stim[25] = 47'h5e4820464ef3;
    stim[26] = 47'h74d323436415;
    stim[27] = 47'h6281278e1d87;
    stim[28] = 47'h4014608430a2;
    stim[29] = 47'h6b7d893fb942;
    stim[30] = 47'h4f4ccab5d826;
    stim[31] = 47'h41c5690e66a3;
    stim[32] = 47'h47e80b2c7780;
    stim[33] = 47'h6b1ba1fbda7b;
    stim[34] = 47'h54bb17107b5b;
    stim[35] = 47'h590d91835492;
    stim[36] = 47'h5903d76e64cf;
    stim[37] = 47'h440d0b7171aa;
    stim[38] = 47'h7b985b7024db;
    stim[39] = 47'h483a2165a5a2;
    stim[40] = 47'h5acfa538eeee;
    stim[41] = 47'h544756c5921b;
    stim[42] = 47'h5374d8a7acec;
    stim[43] = 47'h6bf418184df9;
    stim[44] = 47'h6ea8b2bababc;
    stim[45] = 47'h5a4a569f7abf;
    stim[46] = 47'h49c53b19adf8;
    stim[47] = 47'h2adb48d52cca;
    stim[48] = 47'h7fc8d5660abd;
    stim[49] = 47'h7fe10a026aac;
    stim[50] = 47'h5afb23fd3478;
    stim[51] = 47'h65737384d7ec;
    stim[52] = 47'h5efc5f0735a8;
    stim[53] = 47'h6ceeea31b130;
    stim[54] = 47'h71675fa562be;
    stim[55] = 47'h488f06bb4a6f;
    stim[56] = 47'h73cf3c0de3a7;
    stim[57] = 47'h4adadd98fca1;
    stim[58] = 47'h7f26e576de8e;
    stim[59] = 47'h7c51c079cda4;
    stim[60] = 47'h6433d8c857d9;
    stim[61] = 47'h624c6fc98875;
    stim[62] = 47'h4d90a0a9c5e7;
    stim[63] = 47'h787bda278d26;
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
      expv[0] = 60'hx00000x0000000x;
      expv[1] = 60'ha00011x218c97e0;
      expv[2] = 60'ha00011x218c97e0;
      expv[3] = 60'ha01153cea53647a;
      expv[4] = 60'ha01153cea53647a;
      expv[5] = 60'ha01153cea53647a;
      expv[6] = 60'ha01153cea53647a;
      expv[7] = 60'ha01153cea53647a;
      expv[8] = 60'hb153d61aed61322;
      expv[9] = 60'hb3d60edaed61322;
      expv[10] = 60'hb60eea062e1b97e;
      expv[11] = 60'hb60eea062e1b97e;
      expv[12] = 60'hb60eea062e1b97f;
      expv[13] = 60'hb60eea062e1b97e;
      expv[14] = 60'haeea0cc62e1b97e;
      expv[15] = 60'haeea0cc62e1b97e;
      expv[16] = 60'h8a0cc0862e1b97e;
      expv[17] = 60'hacc09c1f061fc92;
      expv[18] = 60'hacc09c1f061fc92;
      expv[19] = 60'ha09c05df061fc92;
      expv[20] = 60'ha09c05df061fc92;
      expv[21] = 60'hbc05fad2907a628;
      expv[22] = 60'ha5fac8d2907a628;
      expv[23] = 60'h9ac8cf92907a628;
      expv[24] = 60'he8cfabf2907a628;
      expv[25] = 60'hafabef52907a629;
      expv[26] = 60'h8bef7912907a628;
      expv[27] = 60'h8bef7912907a628;
      expv[28] = 60'h8bef7912907a628;
      expv[29] = 60'h8bef7912907a629;
      expv[30] = 60'h8bef7912907a628;
      expv[31] = 60'h8bef7912907a628;
      expv[32] = 60'h8bef7912907a628;
      expv[33] = 60'h8bef7912907a628;
      expv[34] = 60'h8bef7912907a628;
      expv[35] = 60'h8f7912d2907a628;
      expv[36] = 60'h9912e412907a629;
      expv[37] = 60'hb2e42412907a628;
      expv[38] = 60'hb2e42412907a629;
      expv[39] = 60'h84242e52907a628;
      expv[40] = 60'h84242e52907a628;
      expv[41] = 60'h842e6b12907a629;
      expv[42] = 60'h8e6b1112907a628;
      expv[43] = 60'h8b110dd2907a628;
      expv[44] = 60'h8b110dd2907a628;
      expv[45] = 60'h8b110dd2907a628;
      expv[46] = 60'hb10de912907a628;
      expv[47] = 60'hb10de912907a629;
      expv[48] = 60'hb10de912907a628;
      expv[49] = 60'hade93f12907a628;
      expv[50] = 60'hade93f12907a628;
      expv[51] = 60'h893f2bd2907a628;
      expv[52] = 60'h893f2bd2907a628;
      expv[53] = 60'h9f2bfbd2907a629;
      expv[54] = 60'h9f2bfbd2907a628;
      expv[55] = 60'h8bfbc592907a628;
      expv[56] = 60'h8bfbc592907a628;
      expv[57] = 60'h9bc58f12907a628;
      expv[58] = 60'h9bc58f12907a628;
      expv[59] = 60'ha58f3c972bb6f46;
      expv[60] = 60'haf3cb1572bb6f46;
      expv[61] = 60'hef3cb1772bb6f46;
      expv[62] = 60'hef3cb1572bb6f47;
      expv[63] = 60'haf3cb1572bb6f46;
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
