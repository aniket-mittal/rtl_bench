// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_066883 dut (
    .flit_in(in_vec[38:1]),
    .flit_in_we(in_vec[0:0]),
    .src_e_addr_o(out_vec[26:24]),
    .dest_e_addr_o(out_vec[23:21]),
    .destport_o(out_vec[20:17]),
    .class_o(out_vec[16:15]),
    .weight_o(out_vec[14:11]),
    .data_o(out_vec[10:10]),
    .tail_flg_o(out_vec[9:9]),
    .hdr_flg_o(out_vec[8:8]),
    .vc_num_o(out_vec[7:4]),
    .hdr_flit_wr_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h707c43ed6d;
    stim[1] = 39'h1aa937bf3d;
    stim[2] = 39'h64f16aef05;
    stim[3] = 39'h056acb4ed9;
    stim[4] = 39'h5cc5d79526;
    stim[5] = 39'h53a41214b9;
    stim[6] = 39'h17bd7b6e38;
    stim[7] = 39'h75a3e1aa0d;
    stim[8] = 39'h4b3157bd4d;
    stim[9] = 39'h4f0d6ca6d1;
    stim[10] = 39'h525cb9ba83;
    stim[11] = 39'h680d1c0186;
    stim[12] = 39'h79e7be4a96;
    stim[13] = 39'h5a632aac3b;
    stim[14] = 39'h01b4a9f1fa;
    stim[15] = 39'h06874489ca;
    stim[16] = 39'h679e1fced0;
    stim[17] = 39'h745c22db41;
    stim[18] = 39'h65539d0673;
    stim[19] = 39'h51414e318b;
    stim[20] = 39'h4cd775da96;
    stim[21] = 39'h72cc9248a0;
    stim[22] = 39'h37dd79b9f4;
    stim[23] = 39'h24950aa499;
    stim[24] = 39'h448a6efcdd;
    stim[25] = 39'h11ad951fed;
    stim[26] = 39'h2000016f54;
    stim[27] = 39'h71d9b1a526;
    stim[28] = 39'h64921fdeda;
    stim[29] = 39'h1e480fd309;
    stim[30] = 39'h6df1e4bf69;
    stim[31] = 39'h70a2518a2a;
    stim[32] = 39'h1730a7d46e;
    stim[33] = 39'h484bf1a4ff;
    stim[34] = 39'h54706c529e;
    stim[35] = 39'h73953512a2;
    stim[36] = 39'h09894108b2;
    stim[37] = 39'h772f8656af;
    stim[38] = 39'h2fad95bf24;
    stim[39] = 39'h72643c1f70;
    stim[40] = 39'h7774005baf;
    stim[41] = 39'h2f83849c99;
    stim[42] = 39'h4d83abb760;
    stim[43] = 39'h1bebdd94d6;
    stim[44] = 39'h128de513e8;
    stim[45] = 39'h53b21d1077;
    stim[46] = 39'h2ac25de74f;
    stim[47] = 39'h3562e86aee;
    stim[48] = 39'h4e078254fc;
    stim[49] = 39'h23d475c222;
    stim[50] = 39'h3c180f4b22;
    stim[51] = 39'h59b35a4582;
    stim[52] = 39'h6a7fa11ad0;
    stim[53] = 39'h14ee453091;
    stim[54] = 39'h37c6d221ce;
    stim[55] = 39'h7105c1ef25;
    stim[56] = 39'h5fcc11871a;
    stim[57] = 39'h7d189ba1ad;
    stim[58] = 39'h2fd265f42e;
    stim[59] = 39'h39861ebaba;
    stim[60] = 39'h4c6050c0af;
    stim[61] = 39'h0d23aa9526;
    stim[62] = 39'h2f2c47eef1;
    stim[63] = 39'h39de430ef4;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 27'h6d4xx88;
      expv[1] = 27'h67dxxd0;
      expv[2] = 27'h21cxx22;
      expv[3] = 27'h4baxx20;
      expv[4] = 27'h355xxe0;
      expv[5] = 27'h473xx99;
      expv[6] = 27'h478xxb0;
      expv[7] = 27'h608xxaa;
      expv[8] = 27'h695xx55;
      expv[9] = 27'h0baxx77;
      expv[10] = 27'h10bxx99;
      expv[11] = 27'h306xx40;
      expv[12] = 27'h32axxc0;
      expv[13] = 27'h570xxdd;
      expv[14] = 27'h5e7xx00;
      expv[15] = 27'h586xx30;
      expv[16] = 27'h0baxx30;
      expv[17] = 27'h08dxxaa;
      expv[18] = 27'h1f8xx22;
      expv[19] = 27'h507xx88;
      expv[20] = 27'h32bxx60;
      expv[21] = 27'h042xx90;
      expv[22] = 27'h2e7xxb0;
      expv[23] = 27'h432xx20;
      expv[24] = 27'h6b3xx22;
      expv[25] = 27'h6dfxx80;
      expv[26] = 27'h2bcxx00;
      expv[27] = 27'h354xx80;
      expv[28] = 27'h5bbxx20;
      expv[29] = 27'h40dxxf0;
      expv[30] = 27'h4ddxx66;
      expv[31] = 27'h548xx80;
      expv[32] = 27'h7d1xxb0;
      expv[33] = 27'h7f2xx44;
      expv[34] = 27'h72bxxa0;
      expv[35] = 27'h14bxx90;
      expv[36] = 27'h162xx40;
      expv[37] = 27'h75bxxbb;
      expv[38] = 27'h25dxx70;
      expv[39] = 27'h0fdxx90;
      expv[40] = 27'h74fxxbb;
      expv[41] = 27'h433xx70;
      expv[42] = 27'h0ddxx60;
      expv[43] = 27'h3b3xxd0;
      expv[44] = 27'h4cfxx90;
      expv[45] = 27'h3e1xx99;
      expv[46] = 27'h79cxx50;
      expv[47] = 27'h7caxxa0;
      expv[48] = 27'h6f3xx70;
      expv[49] = 27'h148xx10;
      expv[50] = 27'h14cxxe0;
      expv[51] = 27'h116xxc0;
      expv[52] = 27'h0abxx50;
      expv[53] = 27'h023xxa0;
      expv[54] = 27'h786xxb0;
      expv[55] = 27'h25cxx88;
      expv[56] = 27'h53cxxf0;
      expv[57] = 27'h646xxee;
      expv[58] = 27'h751xx70;
      expv[59] = 27'h56bxxc0;
      expv[60] = 27'h742xx66;
      expv[61] = 27'h355xx60;
      expv[62] = 27'h0faxx70;
      expv[63] = 27'h2faxxc0;
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
