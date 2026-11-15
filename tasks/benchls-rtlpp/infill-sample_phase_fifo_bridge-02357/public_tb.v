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

  rtlpp_02357 dut (
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
    stim[0] = 47'h0db018063a73;
    stim[1] = 47'h1bf71dfedc9b;
    stim[2] = 47'h6c6f92aea7fc;
    stim[3] = 47'h78f9f6e75f95;
    stim[4] = 47'h48b4b746cb5b;
    stim[5] = 47'h6cc3b1668ab1;
    stim[6] = 47'h64e5a246c3b6;
    stim[7] = 47'h61ee961d5d54;
    stim[8] = 47'h61645cae6d04;
    stim[9] = 47'h5b61d1806a76;
    stim[10] = 47'h52e854426cfd;
    stim[11] = 47'h6ba753771dbc;
    stim[12] = 47'h4d0431bb0f5c;
    stim[13] = 47'h066a9a8c5338;
    stim[14] = 47'h58541ae3db59;
    stim[15] = 47'h5d325ead5d6c;
    stim[16] = 47'h5b8ef484809c;
    stim[17] = 47'h50620eba2799;
    stim[18] = 47'h7796307a7f5f;
    stim[19] = 47'h6ced5b31b1cd;
    stim[20] = 47'h6015d8d61343;
    stim[21] = 47'h4675e3d8790e;
    stim[22] = 47'h656cc2a972af;
    stim[23] = 47'h634c539e8722;
    stim[24] = 47'h42862fee8daf;
    stim[25] = 47'h648e3fe68443;
    stim[26] = 47'h65108ef7e107;
    stim[27] = 47'h78230f2f45e7;
    stim[28] = 47'h6a4c125c3f0d;
    stim[29] = 47'h4a375cb582c4;
    stim[30] = 47'h667fed42b44e;
    stim[31] = 47'h6c90579cff82;
    stim[32] = 47'h7d9e20e9d6af;
    stim[33] = 47'h5f0382dc34cb;
    stim[34] = 47'h582a8f4efb33;
    stim[35] = 47'h419f7993c50f;
    stim[36] = 47'h6ed89a3e53de;
    stim[37] = 47'h5738f40e4cf7;
    stim[38] = 47'h67751cde92b2;
    stim[39] = 47'h68279d504b04;
    stim[40] = 47'h4d44114b28a7;
    stim[41] = 47'h47f0dd4b1a14;
    stim[42] = 47'h6c2959b7ace0;
    stim[43] = 47'h404b1ab559b9;
    stim[44] = 47'h7be2c2b75521;
    stim[45] = 47'h5f19ae3e85dd;
    stim[46] = 47'h53e9d9e2bab4;
    stim[47] = 47'h41996e33a8bf;
    stim[48] = 47'h485ecfdc7277;
    stim[49] = 47'h62e4f01f5607;
    stim[50] = 47'h5db58979f6ca;
    stim[51] = 47'h7a1046797794;
    stim[52] = 47'h43c9460bbb78;
    stim[53] = 47'h65fb306ef4dd;
    stim[54] = 47'h7f110ba7b58b;
    stim[55] = 47'h6ab1e9debd5e;
    stim[56] = 47'h5a3d60c6f47b;
    stim[57] = 47'h41ba3a879b12;
    stim[58] = 47'h532394133931;
    stim[59] = 47'h610bc617eb2a;
    stim[60] = 47'h53ed2a93161f;
    stim[61] = 47'h5a50d61e1422;
    stim[62] = 47'h6f4631e203f4;
    stim[63] = 47'h55dabbe39241;
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
      expv[0] = 60'hxxxxxxxxxxxxxxx;
      expv[1] = 60'hxxxxxxxxxxxxxxx;
      expv[2] = 60'hxxxxxxxxxxxxxxx;
      expv[3] = 60'hxxxxxxxxxxxxxxx;
      expv[4] = 60'hxxxxxxxxxxxxxxx;
      expv[5] = 60'hxxxxxxxxxxxxxxx;
      expv[6] = 60'hxxxxxxxxxxxxxxx;
      expv[7] = 60'hxxxxxxxd12361da;
      expv[8] = 60'hxxxxxxxd12361da;
      expv[9] = 60'hxxxxxxxd12361da;
      expv[10] = 60'hxxxxxxxd12361da;
      expv[11] = 60'hxxxxxxxd12361da;
      expv[12] = 60'hxxxxxxxa9bb8ede;
      expv[13] = 60'hxxxxxxxa9bb8ede;
      expv[14] = 60'hxxxxxxxa9bb8ede;
      expv[15] = 60'hxxxxxxxa9bb8edf;
      expv[16] = 60'hxxxxxxxa9bb8ede;
      expv[17] = 60'hxxxxxxxa9bb8edf;
      expv[18] = 60'hxxxxxxxa9bb8ede;
      expv[19] = 60'hxxxxxxx183d3fae;
      expv[20] = 60'hxxxxxxx183d3fae;
      expv[21] = 60'hxxxxxxx183d3fae;
      expv[22] = 60'hxxxxxxx183d3fae;
      expv[23] = 60'hxxxxxxx183d3fae;
      expv[24] = 60'hxxxxxxx183d3fae;
      expv[25] = 60'hxxxxxxx183d3fae;
      expv[26] = 60'hxxxxxxx183d3fae;
      expv[27] = 60'hxxxxxxx183d3fae;
      expv[28] = 60'hxxxxxxx183d3fae;
      expv[29] = 60'hxxxxxxx092e1f86;
      expv[30] = 60'hxxxxxxx092e1f86;
      expv[31] = 60'hxxxxxxx092e1f86;
      expv[32] = 60'hxxxxxxx092e1f86;
      expv[33] = 60'hxxxxxxx1074eb56;
      expv[34] = 60'hxxxxxxx1074eb56;
      expv[35] = 60'hxxxxxxx1074eb56;
      expv[36] = 60'hxxxxxxx1074eb57;
      expv[37] = 60'hxxxxxxx1074eb56;
      expv[38] = 60'hxxxxxxx1074eb56;
      expv[39] = 60'hxxxxxxx8e6f4958;
      expv[40] = 60'hxxxxxxx8e6f4958;
      expv[41] = 60'hxxxxxxx8e6f4958;
      expv[42] = 60'hxxxxxxx8e6f4958;
      expv[43] = 60'hxxxxxxx8e6f4958;
      expv[44] = 60'hxxxxxxx8e6f4958;
      expv[45] = 60'hxxxxxxx8e6f4958;
      expv[46] = 60'hxxxxxxx8e6f4958;
      expv[47] = 60'hxxxxxxx8e6f4958;
      expv[48] = 60'hxxxxxxx8e6f4958;
      expv[49] = 60'hxxxxxxx8e6f4959;
      expv[50] = 60'hxxxxxxx8e6f4958;
      expv[51] = 60'hxxxxxxx8e6f4958;
      expv[52] = 60'hxxxxxxx8e6f4958;
      expv[53] = 60'hxxxxxxx8e6f4958;
      expv[54] = 60'hxxxxxxx8e6f4958;
      expv[55] = 60'hxxxxxxx8e6f4958;
      expv[56] = 60'hxxxxxxx8e6f4958;
      expv[57] = 60'hxxxxxxx8e6f4959;
      expv[58] = 60'hxxxxxxx8e6f4958;
      expv[59] = 60'hxxxxxxx8e6f4958;
      expv[60] = 60'hxxxxxxx8e6f4958;
      expv[61] = 60'hxxxxxxx8e6f4959;
      expv[62] = 60'hxxxxxxx8e6f4958;
      expv[63] = 60'hxxxxxxx18f101fa;
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
