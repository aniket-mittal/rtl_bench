// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_082440 dut (
    .iCLK(clk),
    .iRST_N(in_vec[30:30]),
    .iRed(in_vec[29:20]),
    .iGreen(in_vec[19:10]),
    .iBlue(in_vec[9:0]),
    .oVGA_R(out_vec[54:45]),
    .oVGA_G(out_vec[44:35]),
    .oVGA_B(out_vec[34:25]),
    .oVGA_HS(out_vec[24:24]),
    .oVGA_VS(out_vec[23:23]),
    .oVGA_SYNC(out_vec[22:22]),
    .oVGA_BLANK(out_vec[21:21]),
    .oVGA_CLOCK(out_vec[20:20]),
    .oCurrent_X(out_vec[19:10]),
    .oCurrent_Y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h39aca85b;
    stim[1] = 31'h0439abe5;
    stim[2] = 31'h4021a4e2;
    stim[3] = 31'h76c5e448;
    stim[4] = 31'h5dadd213;
    stim[5] = 31'h4ab20752;
    stim[6] = 31'h3b3ca877;
    stim[7] = 31'h7e681501;
    stim[8] = 31'h6a1e347f;
    stim[9] = 31'h6e72f746;
    stim[10] = 31'h49595b7f;
    stim[11] = 31'h4003fb0d;
    stim[12] = 31'h5e6514fd;
    stim[13] = 31'h5fe68979;
    stim[14] = 31'h551a4742;
    stim[15] = 31'h45b399a9;
    stim[16] = 31'h76474ab0;
    stim[17] = 31'h7307f0b9;
    stim[18] = 31'h42de126e;
    stim[19] = 31'h4a1f6a23;
    stim[20] = 31'h6a335716;
    stim[21] = 31'h5d885261;
    stim[22] = 31'h52edf2ab;
    stim[23] = 31'h526a46b0;
    stim[24] = 31'h4e76eb6c;
    stim[25] = 31'h0f18507b;
    stim[26] = 31'h5bcf3022;
    stim[27] = 31'h552c3c53;
    stim[28] = 31'h68cadea8;
    stim[29] = 31'h686a0c6b;
    stim[30] = 31'h5ce6472c;
    stim[31] = 31'h4dc2a7bd;
    stim[32] = 31'h78245755;
    stim[33] = 31'h7452749f;
    stim[34] = 31'h6cbf6ffc;
    stim[35] = 31'h4dc621eb;
    stim[36] = 31'h70612822;
    stim[37] = 31'h666b87d2;
    stim[38] = 31'h40d1dc43;
    stim[39] = 31'h5b3b43cf;
    stim[40] = 31'h7d845c04;
    stim[41] = 31'h466f3667;
    stim[42] = 31'h537c4633;
    stim[43] = 31'h58fecba5;
    stim[44] = 31'h671833f8;
    stim[45] = 31'h43e34287;
    stim[46] = 31'h54d7d42c;
    stim[47] = 31'h7183d63c;
    stim[48] = 31'h6d66c314;
    stim[49] = 31'h6c0832c6;
    stim[50] = 31'h7e9994d3;
    stim[51] = 31'h419b0559;
    stim[52] = 31'h436bc7c3;
    stim[53] = 31'h4dce118d;
    stim[54] = 31'h563d1b58;
    stim[55] = 31'h7155f467;
    stim[56] = 31'h4ccd2972;
    stim[57] = 31'h73a82aa2;
    stim[58] = 31'h584ffdf2;
    stim[59] = 31'h5b2fd60b;
    stim[60] = 31'h493bd597;
    stim[61] = 31'h48d1360b;
    stim[62] = 31'h657a0f6e;
    stim[63] = 31'h70703059;
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
      expv[0] = 55'h00000001800000;
      expv[1] = 55'h00000001800000;
      expv[2] = 55'h00000001800000;
      expv[3] = 55'h004349c5800000;
      expv[4] = 55'h6d8bc891800400;
      expv[5] = 55'h3b5ba427800800;
      expv[6] = 55'h00000001800000;
      expv[7] = 55'h00000001800000;
      expv[8] = 55'h7cd02a03800000;
      expv[9] = 55'h543c68ff800400;
      expv[10] = 55'h5ce5ee8d800800;
      expv[11] = 55'h12b2b6ff800c00;
      expv[12] = 55'h0007f61b801000;
      expv[13] = 55'h3cca29fb801400;
      expv[14] = 55'h3fcd12f3801800;
      expv[15] = 55'h2a348e85801c00;
      expv[16] = 55'h0b673353802000;
      expv[17] = 55'h6c8e9561802400;
      expv[18] = 55'h660fe173802800;
      expv[19] = 55'h05bc24dd802c00;
      expv[20] = 55'h143ed447803000;
      expv[21] = 55'h5466ae2d803400;
      expv[22] = 55'h3b10a4c3803800;
      expv[23] = 55'h25dbe557803c00;
      expv[24] = 55'h24d48d61804000;
      expv[25] = 55'h00000001800000;
      expv[26] = 55'h00000001800000;
      expv[27] = 55'h379e6045800000;
      expv[28] = 55'h2a5878a7800400;
      expv[29] = 55'h5195bd51800800;
      expv[30] = 55'h50d418d7800c00;
      expv[31] = 55'h39cc8e59801000;
      expv[32] = 55'h1b854f7b801400;
      expv[33] = 55'h7048aeab801800;
      expv[34] = 55'h68a4e93f801c00;
      expv[35] = 55'h597edff9802000;
      expv[36] = 55'h1b8c43d7802400;
      expv[37] = 55'h60c25045802800;
      expv[38] = 55'h4cd70fa5802c00;
      expv[39] = 55'h01a3b887803000;
      expv[40] = 55'h3676879f803400;
      expv[41] = 55'h7b08b809803800;
      expv[42] = 55'h0cde6ccf803c00;
      expv[43] = 55'h26f88c67804000;
      expv[44] = 55'h31fd974b804400;
      expv[45] = 55'h4e3067f1804800;
      expv[46] = 55'h07c6850f804c00;
      expv[47] = 55'h29afa859805000;
      expv[48] = 55'h6307ac79805400;
      expv[49] = 55'h5acd8629805800;
      expv[50] = 55'h5810658d805c00;
      expv[51] = 55'h7d3329a7806000;
      expv[52] = 55'h03360ab3806400;
      expv[53] = 55'h06d78f87806800;
      expv[54] = 55'h1b9c231b806c00;
      expv[55] = 55'h2c7a36b1807000;
      expv[56] = 55'h62abe8cf807400;
      expv[57] = 55'h199a52e5807800;
      expv[58] = 55'h67505545807c00;
      expv[59] = 55'h309ffbe5808000;
      expv[60] = 55'h365fac17808400;
      expv[61] = 55'h1277ab2f808800;
      expv[62] = 55'h11a26c17808c00;
      expv[63] = 55'h4af41edd809000;
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
