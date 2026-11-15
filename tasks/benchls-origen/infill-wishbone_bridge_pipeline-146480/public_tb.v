// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146480 dut (
    .wbs_clk_i(clk),
    .sys_rst(in_vec[59:59]),
    .wbs_adr_i(in_vec[58:40]),
    .wbs_dat_i(in_vec[39:24]),
    .wbs_sel_i(in_vec[23:22]),
    .wbs_tga_i(in_vec[21:21]),
    .wbs_stb_i(in_vec[20:20]),
    .wbs_cyc_i(in_vec[19:19]),
    .wbs_we_i(in_vec[18:18]),
    .wbm_clk_i(in_vec[17:17]),
    .wbm_dat_i(in_vec[16:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wbs_dat_o(out_vec[57:42]),
    .wbs_ack_o(out_vec[41:41]),
    .wbm_adr_o(out_vec[40:22]),
    .wbm_dat_o(out_vec[21:6]),
    .wbm_sel_o(out_vec[5:4]),
    .wbm_tga_o(out_vec[3:3]),
    .wbm_stb_o(out_vec[2:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_we_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h84b63e633063605;
    stim[1] = 60'ha76d96ceebc5fc2;
    stim[2] = 60'h440d4a4e490e8fb;
    stim[3] = 60'h6569cc4ec46c2d0;
    stim[4] = 60'h5ce5de3e8550752;
    stim[5] = 60'h7351f566fd8bfdf;
    stim[6] = 60'h6c093d7ac8c00b4;
    stim[7] = 60'h724a84d39f3d9b2;
    stim[8] = 60'h2847230d1bbf257;
    stim[9] = 60'h43485911720001a;
    stim[10] = 60'h6511762632fc316;
    stim[11] = 60'h0c791dc7e4d6441;
    stim[12] = 60'h666fd156cb4dcef;
    stim[13] = 60'h2875054c87fc7e1;
    stim[14] = 60'h763c8c97b92c78d;
    stim[15] = 60'h7f9a1e4ae63a7f5;
    stim[16] = 60'h30a3c044c7b561b;
    stim[17] = 60'h054aafdbc81498f;
    stim[18] = 60'h2bc9c8f78065723;
    stim[19] = 60'h75d91263b73bb48;
    stim[20] = 60'h3782c0a1018cd84;
    stim[21] = 60'h62e95bcdc1d3c74;
    stim[22] = 60'h4afb268a14ae1cf;
    stim[23] = 60'h20e48fcde4eecf5;
    stim[24] = 60'h7bf36b54d088c28;
    stim[25] = 60'h0ff925e662ff64c;
    stim[26] = 60'h6a9ca64baf946fc;
    stim[27] = 60'h19d3ccd8c074a3d;
    stim[28] = 60'h24d387cac7901f9;
    stim[29] = 60'h4cea913b1d6be05;
    stim[30] = 60'h7e87a57856154a6;
    stim[31] = 60'h42eb16d22d8edfb;
    stim[32] = 60'h67176af3f240b43;
    stim[33] = 60'h57a3079da7501b7;
    stim[34] = 60'h521c2bf8813bee4;
    stim[35] = 60'h6782d0062961d09;
    stim[36] = 60'h292d57c3ec0ddcd;
    stim[37] = 60'h11b495dd4730e02;
    stim[38] = 60'h74de9a419b3fe10;
    stim[39] = 60'h143286438f391a1;
    stim[40] = 60'h193e74188ea8aec;
    stim[41] = 60'h08eddc6926e0ebf;
    stim[42] = 60'h6366db0a93e4e09;
    stim[43] = 60'h56ae736b86eab66;
    stim[44] = 60'h642ce5fa0ba2870;
    stim[45] = 60'h6d3c2b73112bab7;
    stim[46] = 60'h71432505f3ed740;
    stim[47] = 60'h5a997ee4359dfbb;
    stim[48] = 60'h696554c5775b081;
    stim[49] = 60'h48656dae124c534;
    stim[50] = 60'h679b01460013beb;
    stim[51] = 60'h73f93f68e189710;
    stim[52] = 60'h48df9d965aa9b10;
    stim[53] = 60'h04059b5f814259e;
    stim[54] = 60'h4befa3da7749733;
    stim[55] = 60'h0c5e77ece7f3e8b;
    stim[56] = 60'h5a19c2e644e730b;
    stim[57] = 60'h716605c7504cd5d;
    stim[58] = 60'h27d6cf22161f52f;
    stim[59] = 60'h210ec6fa69e0443;
    stim[60] = 60'h065a0816295a524;
    stim[61] = 60'h37619650bab5211;
    stim[62] = 60'h71898ea7001e17b;
    stim[63] = 60'h130755915af6c18;
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
      expv[0] = 58'h000000000000000;
      expv[1] = 58'h000000000000000;
      expv[2] = 58'h000000000000000;
      expv[3] = 58'h000000000000000;
      expv[4] = 58'h000000000000000;
      expv[5] = 58'h000000000000000;
      expv[6] = 58'h000000000000000;
      expv[7] = 58'h0016bcd47d59bfe;
      expv[8] = 58'h00169cd47d59bfe;
      expv[9] = 58'h00169cd47d59bfe;
      expv[10] = 58'h00036a11c8c346e;
      expv[11] = 58'h00034a11c8c346e;
      expv[12] = 58'h00034a11c8c346e;
      expv[13] = 58'h00034a11c8c346e;
      expv[14] = 58'h00034a11c8c346e;
      expv[15] = 58'h15322a11c8c346e;
      expv[16] = 58'h15320a11c8c346e;
      expv[17] = 58'h15320a11c8c346e;
      expv[18] = 58'h2931ec28f01131e;
      expv[19] = 58'h2931cc28f01131e;
      expv[20] = 58'h2931cc28f01131e;
      expv[21] = 58'h2931cc28f01131e;
      expv[22] = 58'h278eac28f011310;
      expv[23] = 58'h1c39ec28f011310;
      expv[24] = 58'h1c39cc28f011310;
      expv[25] = 58'h1c39cde0b02840e;
      expv[26] = 58'h1c39cde0b02840e;
      expv[27] = 58'h1c39cde0b028400;
      expv[28] = 58'h2947ade0b028400;
      expv[29] = 58'h29478de0b028400;
      expv[30] = 58'h17c0ade0b028400;
      expv[31] = 58'h17c08de0b028400;
      expv[32] = 58'h17c08de0b028400;
      expv[33] = 58'h01686de0b028400;
      expv[34] = 58'h016850bac5b48be;
      expv[35] = 58'h016850bac5b48be;
      expv[36] = 58'h016850bac5b48be;
      expv[37] = 58'h016850bac5b48be;
      expv[38] = 58'h016850bac5b48be;
      expv[39] = 58'h016850bac5b48be;
      expv[40] = 58'h016850bac5b48be;
      expv[41] = 58'h016850bac5b48be;
      expv[42] = 58'h016850bac5b48be;
      expv[43] = 58'h016850bac5b48be;
      expv[44] = 58'h2c2a70bac5b48be;
      expv[45] = 58'h2c2a50bac5b48be;
      expv[46] = 58'h1756f0bac5b48be;
      expv[47] = 58'h1756d0bac5b48be;
      expv[48] = 58'h1417f0bac5b48be;
      expv[49] = 58'h1417f0bac5b48be;
      expv[50] = 58'h1417d0bac5b48be;
      expv[51] = 58'h1417d0bac5b48be;
      expv[52] = 58'h1417d0bac5b48b0;
      expv[53] = 58'h136230bac5b48b0;
      expv[54] = 58'h136210bac5b48b0;
      expv[55] = 58'h13621cfe4fda38e;
      expv[56] = 58'h13621cfe4fda38e;
      expv[57] = 58'h1fb3bcfe4fda38e;
      expv[58] = 58'h1fb39cfe4fda38e;
      expv[59] = 58'h1fb383179dfb39f;
      expv[60] = 58'h1fb383179dfb39f;
      expv[61] = 58'h1be9a843b1be9af;
      expv[62] = 58'h1be98843b1be9af;
      expv[63] = 58'h1be98843b1be9af;
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
