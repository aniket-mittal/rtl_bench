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
    stim[0] = 47'h3cb2d68c2e2f;
    stim[1] = 47'h06ca1373f870;
    stim[2] = 47'h72232327db58;
    stim[3] = 47'h57dda59695ec;
    stim[4] = 47'h7968809f3485;
    stim[5] = 47'h67a8637df916;
    stim[6] = 47'h7a5ac8df20ed;
    stim[7] = 47'h6d208bbdee0e;
    stim[8] = 47'h7852e851078d;
    stim[9] = 47'h650900b2cfa4;
    stim[10] = 47'h7cfaf2d2a253;
    stim[11] = 47'h7a4252a41414;
    stim[12] = 47'h57023d789101;
    stim[13] = 47'h6c2f319c83a3;
    stim[14] = 47'h57c7af927747;
    stim[15] = 47'h7a28d3ff73f8;
    stim[16] = 47'h55a78f0d0725;
    stim[17] = 47'h585138526373;
    stim[18] = 47'h64928612be28;
    stim[19] = 47'h424e6b2bac07;
    stim[20] = 47'h54183596e70a;
    stim[21] = 47'h63c20d11375c;
    stim[22] = 47'h6d814d1fdd21;
    stim[23] = 47'h60e9cd40d1d8;
    stim[24] = 47'h4e79fc0f87a0;
    stim[25] = 47'h03593f489b6c;
    stim[26] = 47'h535889cb0b5c;
    stim[27] = 47'h43c2615fdb9a;
    stim[28] = 47'h5e6c9b49f574;
    stim[29] = 47'h5943c9a31aa4;
    stim[30] = 47'h624cde4fc2f4;
    stim[31] = 47'h40cd7de2c9bc;
    stim[32] = 47'h5048b07ba340;
    stim[33] = 47'h4a70310de30c;
    stim[34] = 47'h4f75324f530e;
    stim[35] = 47'h68aac2cdd51d;
    stim[36] = 47'h44a84547683a;
    stim[37] = 47'h69016da0070e;
    stim[38] = 47'h5b89076ee9e6;
    stim[39] = 47'h57c89fb2eca8;
    stim[40] = 47'h67ff0f7b0373;
    stim[41] = 47'h79fd96e61dfb;
    stim[42] = 47'h5ee76a292bff;
    stim[43] = 47'h402fff10e4e7;
    stim[44] = 47'h50134c1b8f76;
    stim[45] = 47'h5e4cc9eeb320;
    stim[46] = 47'h568c2bf589bc;
    stim[47] = 47'h6ebb6db3e1e7;
    stim[48] = 47'h40cf72af1cc0;
    stim[49] = 47'h4beab41ce177;
    stim[50] = 47'h77ffc69a868d;
    stim[51] = 47'h475d3774138b;
    stim[52] = 47'h40cbf98f5cb0;
    stim[53] = 47'h550a4964c141;
    stim[54] = 47'h6c4d124fa09c;
    stim[55] = 47'h6f64c8599822;
    stim[56] = 47'h763d40921da1;
    stim[57] = 47'h7516d22896a9;
    stim[58] = 47'h5b721fb0d7af;
    stim[59] = 47'h78a1017d4303;
    stim[60] = 47'h71ada42fa0ad;
    stim[61] = 47'h6e0832f0dce5;
    stim[62] = 47'h50588e6de304;
    stim[63] = 47'h6e9c0b1a7a2e;
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
      expv[1] = 60'ha00032c00000000;
      expv[2] = 60'ha00032c00000000;
      expv[3] = 60'ha032c8800000000;
      expv[4] = 60'h92c89f400000001;
      expv[5] = 60'h92c89f400000000;
      expv[6] = 60'h92c89f400000000;
      expv[7] = 60'ha89f69400000000;
      expv[8] = 60'ha89f69400000000;
      expv[9] = 60'hbf6961400000000;
      expv[10] = 60'hbf6961400000000;
      expv[11] = 60'h896173c00000000;
      expv[12] = 60'h896173c00000000;
      expv[13] = 60'h8173dc000000000;
      expv[14] = 60'h8173dc198ce41d0;
      expv[15] = 60'h93dc1f198ce41d0;
      expv[16] = 60'hbc1f28998ce41d0;
      expv[17] = 60'hbc1f28998ce41d1;
      expv[18] = 60'hbf28a1598ce41d0;
      expv[19] = 60'hbf28a1598ce41d0;
      expv[20] = 60'hbf28a1598ce41d1;
      expv[21] = 60'h88a150598ce41d0;
      expv[22] = 60'h88a150598ce41d0;
      expv[23] = 60'h88a150598ce41d0;
      expv[24] = 60'h88a150598ce41d0;
      expv[25] = 60'h88a150598ce41d0;
      expv[26] = 60'h88a150598ce41d0;
      expv[27] = 60'h81504d598ce41d0;
      expv[28] = 60'h81504d598ce41d0;
      expv[29] = 60'h81504d598ce41d1;
      expv[30] = 60'hb04d65198ce41d0;
      expv[31] = 60'hb04d6506f27e17a;
      expv[32] = 60'hb04d6506f27e17a;
      expv[33] = 60'had650106f27e17a;
      expv[34] = 60'had650106f27e17a;
      expv[35] = 60'had650106f27e17b;
      expv[36] = 60'had650106f27e17a;
      expv[37] = 60'had650106f27e17a;
      expv[38] = 60'had650106f27e17a;
      expv[39] = 60'h85012e06f27e17a;
      expv[40] = 60'h85012e06f27e17a;
      expv[41] = 60'h85012e187bd81b8;
      expv[42] = 60'ha12e27d87bd81b8;
      expv[43] = 60'h8e27fb987bd81b8;
      expv[44] = 60'h8e27fb987bd81b8;
      expv[45] = 60'h87fb80587bd81b8;
      expv[46] = 60'h9b8079187bd81b9;
      expv[47] = 60'ha0791a187bd81b8;
      expv[48] = 60'ha0791a187bd81b8;
      expv[49] = 60'ha0791a187bd81b9;
      expv[50] = 60'ha0791a187bd81b8;
      expv[51] = 60'h991a1fde34d4346;
      expv[52] = 60'h991a1fde34d4346;
      expv[53] = 60'h991a1fde34d4346;
      expv[54] = 60'h991a1fde34d4346;
      expv[55] = 60'hd91a1fe8927d04e;
      expv[56] = 60'h991a1fe8927d04e;
      expv[57] = 60'hba1fd8c8927d04e;
      expv[58] = 60'hbfd8d448927d04e;
      expv[59] = 60'hb8d46dc8927d04e;
      expv[60] = 60'hf46de2a8927d04e;
      expv[61] = 60'hcde28688927d04f;
      expv[62] = 60'hcde28688927d04e;
      expv[63] = 60'h82868148927d04e;
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
