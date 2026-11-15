// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02205 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h39bdca37581293e8c3;
    stim[1] = 70'h36d0c6a6442aa0f9f7;
    stim[2] = 70'h048eb7776b1b597326;
    stim[3] = 70'h1366eee4fb5954209d;
    stim[4] = 70'h13263a8e5b310cb8fe;
    stim[5] = 70'h197577ffa7a4a1418b;
    stim[6] = 70'h166be357da0f2d4719;
    stim[7] = 70'h0ee0da863462ab0e92;
    stim[8] = 70'h1eb6bef04dc7e76395;
    stim[9] = 70'h050e0ef5f8a346eeaa;
    stim[10] = 70'h0d27f9150c5830cd9d;
    stim[11] = 70'h0f9a9e86eebe40cba9;
    stim[12] = 70'h046b3c8e3a99be6602;
    stim[13] = 70'h063a772bdd0036f1b5;
    stim[14] = 70'h1b52bb78a32f9f8f93;
    stim[15] = 70'h0d4bf84832b5eb1c7d;
    stim[16] = 70'h078cad986e7711ebef;
    stim[17] = 70'h11a691c9a5e91c5f98;
    stim[18] = 70'h059d106ad2e3362cc2;
    stim[19] = 70'h09bf15517c0ee3da55;
    stim[20] = 70'h080dfec70ae3fb6d56;
    stim[21] = 70'h1ab3b8489ad7b23093;
    stim[22] = 70'h15db209deedb5892b8;
    stim[23] = 70'h1cb2e4c4a07b9061b9;
    stim[24] = 70'h05e80fdcfbe786e74b;
    stim[25] = 70'h18164f0a6c7f97db64;
    stim[26] = 70'h1337925caf93a32541;
    stim[27] = 70'h186b7626f1a5b77d10;
    stim[28] = 70'h100da507e14f7c91d9;
    stim[29] = 70'h02851d95977b835f68;
    stim[30] = 70'h015012738ef093dce9;
    stim[31] = 70'h03d8ee7a45686f7997;
    stim[32] = 70'h11a37f50fe01382527;
    stim[33] = 70'h166776b4e92d28ea4a;
    stim[34] = 70'h16c4e1b41d09b563bb;
    stim[35] = 70'h157145793ba01c61be;
    stim[36] = 70'h0dd0d7e801e3e7609e;
    stim[37] = 70'h15232dcba971999e21;
    stim[38] = 70'h0ca79a5bf7e098aa2d;
    stim[39] = 70'h08159e85782ce637c8;
    stim[40] = 70'h1373679615f562362d;
    stim[41] = 70'h0b89cd978e138cfb3f;
    stim[42] = 70'h058b8af8ba29cdacff;
    stim[43] = 70'h0e9af28aa3b2c308a8;
    stim[44] = 70'h12b1531f05cd0c746c;
    stim[45] = 70'h07ed3bac58b38b666d;
    stim[46] = 70'h1b593e328a363c49e7;
    stim[47] = 70'h01b85fe4d892e152c7;
    stim[48] = 70'h11f56cbdabfee08968;
    stim[49] = 70'h0a520351941fc782b6;
    stim[50] = 70'h0b9310209f5a64bd1c;
    stim[51] = 70'h1a0064d2f40db018ac;
    stim[52] = 70'h171f142b2448874470;
    stim[53] = 70'h0132fe5abc98706095;
    stim[54] = 70'h1b2e4b886fafc5f6d7;
    stim[55] = 70'h10b7ba51e1fc53601d;
    stim[56] = 70'h1f8b439922e31647f5;
    stim[57] = 70'h132893ea0f75030026;
    stim[58] = 70'h1736f6e2b2005ad214;
    stim[59] = 70'h18885876b5daf62fda;
    stim[60] = 70'h008e7c119773ffa112;
    stim[61] = 70'h18c021401b6beb361b;
    stim[62] = 70'h1a24c2d0fc20bb5eb6;
    stim[63] = 70'h1c5bdd28ab04dd71c4;
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
      expv[0] = 33'h01293e8c2;
      expv[1] = 33'h02aa0f9f6;
      expv[2] = 33'h11b597326;
      expv[3] = 33'h15954209c;
      expv[4] = 33'h1310cb8fe;
      expv[5] = 33'h1a4a1418a;
      expv[6] = 33'h00f2d4718;
      expv[7] = 33'h062ab0e92;
      expv[8] = 33'h1c7e76394;
      expv[9] = 33'h0a346eeaa;
      expv[10] = 33'h05830cd9c;
      expv[11] = 33'h0be40cba8;
      expv[12] = 33'h099be6602;
      expv[13] = 33'h10036f1b4;
      expv[14] = 33'h12f9f8f92;
      expv[15] = 33'h0b5eb1c7c;
      expv[16] = 33'h07711ebee;
      expv[17] = 33'h1e91c5f98;
      expv[18] = 33'h0e3362cc2;
      expv[19] = 33'h00ee3da54;
      expv[20] = 33'h0e3fb6d56;
      expv[21] = 33'h0d7b23092;
      expv[22] = 33'h0db5892b8;
      expv[23] = 33'h07b9061b8;
      expv[24] = 33'h1e786e74a;
      expv[25] = 33'h07f97db64;
      expv[26] = 33'h193a32540;
      expv[27] = 33'h1a5b77d11;
      expv[28] = 33'h14f7c91d8;
      expv[29] = 33'h17b835f68;
      expv[30] = 33'h0f093dce8;
      expv[31] = 33'h1686f7996;
      expv[32] = 33'h001382526;
      expv[33] = 33'h12d28ea4b;
      expv[34] = 33'h109b563ba;
      expv[35] = 33'h1a01c61be;
      expv[36] = 33'h1e3e7609e;
      expv[37] = 33'h171999e20;
      expv[38] = 33'h1e098aa2c;
      expv[39] = 33'h02ce637c8;
      expv[40] = 33'h1f562362c;
      expv[41] = 33'h0138cfb3e;
      expv[42] = 33'h029cdacfe;
      expv[43] = 33'h1b2c308a8;
      expv[44] = 33'h1cd0c746c;
      expv[45] = 33'h0b38b666c;
      expv[46] = 33'h0363c49e6;
      expv[47] = 33'h092e152c6;
      expv[48] = 33'h1fee08968;
      expv[49] = 33'h01fc782b6;
      expv[50] = 33'h15a64bd1c;
      expv[51] = 33'h00db018ac;
      expv[52] = 33'h048874470;
      expv[53] = 33'h098706094;
      expv[54] = 33'h1afc5f6d6;
      expv[55] = 33'h1fc53601c;
      expv[56] = 33'h0e31647f4;
      expv[57] = 33'h175030026;
      expv[58] = 33'h0005ad214;
      expv[59] = 33'h1daf62fda;
      expv[60] = 33'h173ffa112;
      expv[61] = 33'h16beb361a;
      expv[62] = 33'h020bb5eb6;
      expv[63] = 33'h104dd71c4;
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
