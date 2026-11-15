// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_060735 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[38:38]),
    .wb_dat_i(in_vec[37:22]),
    .wb_we_i(in_vec[21:21]),
    .wb_adr_i(in_vec[20:20]),
    .wb_sel_i(in_vec[19:18]),
    .wb_stb_i(in_vec[17:17]),
    .wb_cyc_i(in_vec[16:16]),
    .flash_data_(in_vec[15:0]),
    .wb_dat_o(out_vec[42:27]),
    .wb_ack_o(out_vec[26:26]),
    .flash_addr_(out_vec[25:4]),
    .flash_we_n_(out_vec[3:3]),
    .flash_oe_n_(out_vec[2:2]),
    .flash_ce_n_(out_vec[1:1]),
    .flash_rst_n_(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h591cba4914;
    stim[1] = 39'h55bccdd98a;
    stim[2] = 39'h2111b19932;
    stim[3] = 39'h1e0e17da6c;
    stim[4] = 39'h1d8372b0e6;
    stim[5] = 39'h304a804ca7;
    stim[6] = 39'h286e7cc2cf;
    stim[7] = 39'h1ab5864cbc;
    stim[8] = 39'h1affb5c26c;
    stim[9] = 39'h074ad9e3ff;
    stim[10] = 39'h19448ee781;
    stim[11] = 39'h019d170c12;
    stim[12] = 39'h3498e80269;
    stim[13] = 39'h38d0a57488;
    stim[14] = 39'h014060b9ca;
    stim[15] = 39'h260a3d88a3;
    stim[16] = 39'h360297f389;
    stim[17] = 39'h23b733153e;
    stim[18] = 39'h1d812da463;
    stim[19] = 39'h1fd7d92d7e;
    stim[20] = 39'h09ddd744d8;
    stim[21] = 39'h527612fd1f;
    stim[22] = 39'h125527fc53;
    stim[23] = 39'h736da5c6ec;
    stim[24] = 39'h2d299e28c1;
    stim[25] = 39'h0a3fef73a6;
    stim[26] = 39'h0e02c47b7e;
    stim[27] = 39'h006c311094;
    stim[28] = 39'h1fef6b8e70;
    stim[29] = 39'h13d89b7c19;
    stim[30] = 39'h0cd7da0b32;
    stim[31] = 39'h07100aeef4;
    stim[32] = 39'h0b3495f35a;
    stim[33] = 39'h05023d7cb3;
    stim[34] = 39'h058aeac911;
    stim[35] = 39'h0a2ecfcfc6;
    stim[36] = 39'h381ccb4d8b;
    stim[37] = 39'h1b45e6489d;
    stim[38] = 39'h39c598c59f;
    stim[39] = 39'h1f24904e1f;
    stim[40] = 39'h22fefe62ae;
    stim[41] = 39'h3fe480a2a4;
    stim[42] = 39'h31f803342f;
    stim[43] = 39'h397caed16d;
    stim[44] = 39'h2efbc5296a;
    stim[45] = 39'h254fa66003;
    stim[46] = 39'h3b9d034ad8;
    stim[47] = 39'h0693676eac;
    stim[48] = 39'h3b9e8b6ae8;
    stim[49] = 39'h1cd730e85a;
    stim[50] = 39'h18e54e2220;
    stim[51] = 39'h103fab23b6;
    stim[52] = 39'h0d21833c73;
    stim[53] = 39'h0179fc7575;
    stim[54] = 39'h278bdee57a;
    stim[55] = 39'h169301398c;
    stim[56] = 39'h2f581c3954;
    stim[57] = 39'h1442612114;
    stim[58] = 39'h1f9edf5ae4;
    stim[59] = 39'h11bd56070f;
    stim[60] = 39'h1194c89dd8;
    stim[61] = 39'h3e049f801a;
    stim[62] = 39'h11d15549e7;
    stim[63] = 39'h253d8f44a6;
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
      expv[0] = 43'h248axxxxxxf;
      expv[1] = 43'h6cc5000000f;
      expv[2] = 43'h4c99000000f;
      expv[3] = 43'h6d364000009;
      expv[4] = 43'h5873000000f;
      expv[5] = 43'h2653800000f;
      expv[6] = 43'h6167800000f;
      expv[7] = 43'h265e000000f;
      expv[8] = 43'h6136000000f;
      expv[9] = 43'h71ff800000f;
      expv[10] = 43'h73c0800000f;
      expv[11] = 43'h06094000009;
      expv[12] = 43'h0134800000f;
      expv[13] = 43'h3a44000000f;
      expv[14] = 43'h5ce5000000f;
      expv[15] = 43'h4451800000f;
      expv[16] = 43'h79c4c000009;
      expv[17] = 43'h0a9f4000009;
      expv[18] = 43'h52319c0000f;
      expv[19] = 43'h16bf1c0000f;
      expv[20] = 43'h226c5c00009;
      expv[21] = 43'h7e8f9c0000f;
      expv[22] = 43'h7e29c000009;
      expv[23] = 43'h6376004954f;
      expv[24] = 43'h1460800000f;
      expv[25] = 43'h39d34000009;
      expv[26] = 43'h3dbf0028fff;
      expv[27] = 43'h084a0028fff;
      expv[28] = 43'h47384028ff9;
      expv[29] = 43'h3e0cc07fbd9;
      expv[30] = 43'h0599007fbdf;
      expv[31] = 43'h777a007fbdf;
      expv[32] = 43'h79ad007fbdf;
      expv[33] = 43'h3e59807fbdf;
      expv[34] = 43'h6488807fbdf;
      expv[35] = 43'h67e3407fbd9;
      expv[36] = 43'h26c5c07fbd9;
      expv[37] = 43'h244e807fbdf;
      expv[38] = 43'h62cf807fbdf;
      expv[39] = 43'h270f807fbdf;
      expv[40] = 43'h3157007fbdf;
      expv[41] = 43'h5152007fbdf;
      expv[42] = 43'h1a17c07fbd9;
      expv[43] = 43'h68b6807fbdf;
      expv[44] = 43'h14b5007fbdf;
      expv[45] = 43'h3001807fbdf;
      expv[46] = 43'h256c407fbd9;
      expv[47] = 43'h3756407fbd9;
      expv[48] = 43'h3574401a4d9;
      expv[49] = 43'h742d001a4df;
      expv[50] = 43'h1110001a4df;
      expv[51] = 43'h11db401a4d9;
      expv[52] = 43'h1e39c040fe9;
      expv[53] = 43'h3aba8040fef;
      expv[54] = 43'h72bd0040fef;
      expv[55] = 43'h1cc60040fef;
      expv[56] = 43'h1caa0040fef;
      expv[57] = 43'h108a0040fef;
      expv[58] = 43'h2d724040fe9;
      expv[59] = 43'h03878040fef;
      expv[60] = 43'h4eec0040fef;
      expv[61] = 43'h400d4040fe9;
      expv[62] = 43'h24f38040fef;
      expv[63] = 43'h22534040fe9;
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
