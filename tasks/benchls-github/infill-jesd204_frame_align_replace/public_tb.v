// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_frame_align_replace dut (
    .clk(clk),
    .reset(in_vec[58:58]),
    .cfg_octets_per_frame(in_vec[57:50]),
    .cfg_disable_char_replacement(in_vec[49:49]),
    .cfg_disable_scrambler(in_vec[48:48]),
    .data(in_vec[47:16]),
    .eof(in_vec[15:12]),
    .rx_char_is_a(in_vec[11:8]),
    .rx_char_is_f(in_vec[7:4]),
    .tx_eomf(in_vec[3:0]),
    .data_out(out_vec[35:4]),
    .charisk_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h62f84835e867487;
    stim[1] = 59'h4bb502b9d01fecb;
    stim[2] = 59'h111bb97bfc40f4d;
    stim[3] = 59'h18ec5066272d13d;
    stim[4] = 59'h3bd5eb0b07e66f8;
    stim[5] = 59'h19d9961fbdc9efd;
    stim[6] = 59'h36114329c0ce04e;
    stim[7] = 59'h33e991f1567c1a0;
    stim[8] = 59'h36d6690e8f1dee6;
    stim[9] = 59'h36fbb55a078b721;
    stim[10] = 59'h0dbf2eec8de4e2c;
    stim[11] = 59'h3cd27ebba84b36c;
    stim[12] = 59'h2d2a40b4cd99870;
    stim[13] = 59'h3ac98cb359ec403;
    stim[14] = 59'h2d034a6e21c116c;
    stim[15] = 59'h39d7c3f8671956d;
    stim[16] = 59'h1d3935f2a58e1be;
    stim[17] = 59'h032ab36f7ccff98;
    stim[18] = 59'h13ce3c10ac351be;
    stim[19] = 59'h39c18cb7e06494f;
    stim[20] = 59'h29bd3553550e3a4;
    stim[21] = 59'h15110822a564004;
    stim[22] = 59'h018dc02fc2d42ea;
    stim[23] = 59'h179deb1f9113f03;
    stim[24] = 59'h0b80464fb07a6db;
    stim[25] = 59'h1222e59300dc4cd;
    stim[26] = 59'h03d58e8dfafd4b2;
    stim[27] = 59'h0dcd5deb43b8d48;
    stim[28] = 59'h3391bccb3fae92e;
    stim[29] = 59'h2deb6128be886d9;
    stim[30] = 59'h143847dc80c9479;
    stim[31] = 59'h32d0163ca27c919;
    stim[32] = 59'h3717d775957fcd4;
    stim[33] = 59'h2066f29fae0d400;
    stim[34] = 59'h3e52ed5c9dbe57c;
    stim[35] = 59'h078889f18888826;
    stim[36] = 59'h31688cb661d8839;
    stim[37] = 59'h1737aa22650db21;
    stim[38] = 59'h0eaef7c67ae0011;
    stim[39] = 59'h16cdb803d8201f2;
    stim[40] = 59'h1db99d7355f363c;
    stim[41] = 59'h274838dc8fdec9e;
    stim[42] = 59'h30561dd088a30b7;
    stim[43] = 59'h12875a2e1d19ab6;
    stim[44] = 59'h3518b66142749a8;
    stim[45] = 59'h076db6e63098a6c;
    stim[46] = 59'h3809e40f9026961;
    stim[47] = 59'h098754e4bf7515e;
    stim[48] = 59'h16a71175a4508fd;
    stim[49] = 59'h2461f2a5ec0c7a1;
    stim[50] = 59'h2e7aa724df16b8b;
    stim[51] = 59'h0bc053ca21a5cba;
    stim[52] = 59'h29630f430114342;
    stim[53] = 59'h0422d601ad5c194;
    stim[54] = 59'h0f434f319f1b3a1;
    stim[55] = 59'h02687a7b3dabfa2;
    stim[56] = 59'h397eee8e61c8690;
    stim[57] = 59'h2792b3b65f73836;
    stim[58] = 59'h18660de448ca5f0;
    stim[59] = 59'h297f25cbea4402c;
    stim[60] = 59'h14bd732e7efe89d;
    stim[61] = 59'h1f3664ca805e4e6;
    stim[62] = 59'h290b3475469e7ac;
    stim[63] = 59'h2061176047cde29;
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
      expv[0] = 36'h84835e860;
      expv[1] = 36'h502b9d010;
      expv[2] = 36'h000000000;
      expv[3] = 36'hc50662720;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000000;
      expv[6] = 36'h14009c0c0;
      expv[7] = 36'h991f15670;
      expv[8] = 36'h000000f10;
      expv[9] = 36'hbb55a0780;
      expv[10] = 36'hf2eec8de0;
      expv[11] = 36'h270000000;
      expv[12] = 36'ha40b4cd90;
      expv[13] = 36'h98cb359e0;
      expv[14] = 36'h34a6e21c0;
      expv[15] = 36'h7c0000000;
      expv[16] = 36'h935f2a580;
      expv[17] = 36'hab36f7cc0;
      expv[18] = 36'he3c10ac30;
      expv[19] = 36'h18cb7e060;
      expv[20] = 36'hd35535500;
      expv[21] = 36'h10822a560;
      expv[22] = 36'hdc02fc2d0;
      expv[23] = 36'h828282820;
      expv[24] = 36'h0464fb070;
      expv[25] = 36'h2e59300d0;
      expv[26] = 36'h828282820;
      expv[27] = 36'hd5deb43b0;
      expv[28] = 36'h82cc82820;
      expv[29] = 36'hb6128be80;
      expv[30] = 36'h847dc80c0;
      expv[31] = 36'h8263ca820;
      expv[32] = 36'h828259820;
      expv[33] = 36'h6f29fae00;
      expv[34] = 36'h2e8282820;
      expv[35] = 36'h889f18880;
      expv[36] = 36'h88cb661d0;
      expv[37] = 36'h7aa226500;
      expv[38] = 36'hef7c67ae0;
      expv[39] = 36'hdb803d820;
      expv[40] = 36'h99d7355f0;
      expv[41] = 36'h838dc8fd0;
      expv[42] = 36'h82dd82820;
      expv[43] = 36'h75a2e1d10;
      expv[44] = 36'h826682820;
      expv[45] = 36'hdb6e63090;
      expv[46] = 36'h9e40f9020;
      expv[47] = 36'h754e4bf70;
      expv[48] = 36'h71175a450;
      expv[49] = 36'h1f2a5ec00;
      expv[50] = 36'haa724df10;
      expv[51] = 36'h053ca21a0;
      expv[52] = 36'h30f430110;
      expv[53] = 36'h2d601ad50;
      expv[54] = 36'h34f319f10;
      expv[55] = 36'h87a7b3da0;
      expv[56] = 36'heee8e61c0;
      expv[57] = 36'h823b82820;
      expv[58] = 36'h60de448c0;
      expv[59] = 36'hf25cbea40;
      expv[60] = 36'hd732e7ef0;
      expv[61] = 36'h664ca8050;
      expv[62] = 36'hb34754690;
      expv[63] = 36'h1176047c0;
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
