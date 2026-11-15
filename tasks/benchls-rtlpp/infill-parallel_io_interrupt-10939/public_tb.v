// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10939 dut (
    .clk(clk),
    .address(in_vec[46:45]),
    .chipselect(in_vec[44:44]),
    .in_port(in_vec[43:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h7d555f67e5b4;
    stim[1] = 47'h3058ed21a3dd;
    stim[2] = 47'h2ae74211e12c;
    stim[3] = 47'h08ffabe51c1c;
    stim[4] = 47'h44102f8d14a7;
    stim[5] = 47'h248b3cf52fe7;
    stim[6] = 47'h0bb34632d2f6;
    stim[7] = 47'h550a419e004d;
    stim[8] = 47'h22ef7e90418f;
    stim[9] = 47'h423bf118f26b;
    stim[10] = 47'h21fb825f8aac;
    stim[11] = 47'h750f23813335;
    stim[12] = 47'h77cb58ab94f8;
    stim[13] = 47'h1ed219b5f76c;
    stim[14] = 47'h086b715a58cb;
    stim[15] = 47'h07beea75f9ba;
    stim[16] = 47'h29370b211e4c;
    stim[17] = 47'h67434f1440a5;
    stim[18] = 47'h7e5e14ad5ce3;
    stim[19] = 47'h472e9ac99abb;
    stim[20] = 47'h590329d6e22d;
    stim[21] = 47'h6cca6ea8f494;
    stim[22] = 47'h566eb0b13f2d;
    stim[23] = 47'h020ab43b5ec8;
    stim[24] = 47'h4fc6172b56c3;
    stim[25] = 47'h3b6a46d46169;
    stim[26] = 47'h25f6258d5b9c;
    stim[27] = 47'h33cfb2913a8e;
    stim[28] = 47'h07cac3eca794;
    stim[29] = 47'h135b47483d05;
    stim[30] = 47'h681ff41915a4;
    stim[31] = 47'h4d825ea9bcc2;
    stim[32] = 47'h774bcab2add2;
    stim[33] = 47'h6c2b3e0c5706;
    stim[34] = 47'h312a6c4aa341;
    stim[35] = 47'h463bc7bf4bbb;
    stim[36] = 47'h27cea7852ee0;
    stim[37] = 47'h28f622c1584c;
    stim[38] = 47'h4adbcf22e868;
    stim[39] = 47'h177396703ae0;
    stim[40] = 47'h74f3a171f3ab;
    stim[41] = 47'h4e9af7660e32;
    stim[42] = 47'h7912176856af;
    stim[43] = 47'h3a3f03499723;
    stim[44] = 47'h105af418ce8f;
    stim[45] = 47'h32df980db33a;
    stim[46] = 47'h74e36a5f7192;
    stim[47] = 47'h65aa679362af;
    stim[48] = 47'h5dcaae8bd67f;
    stim[49] = 47'h1ad2547256b8;
    stim[50] = 47'h4316c5539c6c;
    stim[51] = 47'h48773f5e2430;
    stim[52] = 47'h4df28f19eee2;
    stim[53] = 47'h168ba06ca57f;
    stim[54] = 47'h5a463dd4823b;
    stim[55] = 47'h6abf0324c424;
    stim[56] = 47'h03d7d685aad6;
    stim[57] = 47'h28eed1c591a4;
    stim[58] = 47'h7fdeee45c4d7;
    stim[59] = 47'h332ba33f3722;
    stim[60] = 47'h1f2e6061ee49;
    stim[61] = 47'h0b764403de73;
    stim[62] = 47'h16dbdfa9651c;
    stim[63] = 47'h02220ba1922f;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h0000002ec;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h10000004d;
      expv[11] = 33'h100000000;
      expv[12] = 33'h1000003ff;
      expv[13] = 33'h1000003ff;
      expv[14] = 33'h1000003b4;
      expv[15] = 33'h10000021a;
      expv[16] = 33'h1000001ef;
      expv[17] = 33'h100000000;
      expv[18] = 33'h1000003ff;
      expv[19] = 33'h1000003ff;
      expv[20] = 33'h10000004d;
      expv[21] = 33'h00000004d;
      expv[22] = 33'h10000025f;
      expv[23] = 33'h00000004d;
      expv[24] = 33'h100000082;
      expv[25] = 33'h10000032d;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h1000001f2;
      expv[30] = 33'h1000000d6;
      expv[31] = 33'h1000003ff;
      expv[32] = 33'h10000032d;
      expv[33] = 33'h1000003ff;
      expv[34] = 33'h1000003ff;
      expv[35] = 33'h100000000;
      expv[36] = 33'h10000032d;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h10000032d;
      expv[40] = 33'h1000001dc;
      expv[41] = 33'h1000003ff;
      expv[42] = 33'h10000032d;
      expv[43] = 33'h1000003ff;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000016;
      expv[46] = 33'h100000000;
      expv[47] = 33'h1000003fb;
      expv[48] = 33'h1000003fb;
      expv[49] = 33'h10000032d;
      expv[50] = 33'h1000002b4;
      expv[51] = 33'h10000027f;
      expv[52] = 33'h10000027f;
      expv[53] = 33'h10000027f;
      expv[54] = 33'h1000001a2;
      expv[55] = 33'h10000027f;
      expv[56] = 33'h1000003ff;
      expv[57] = 33'h1000000f5;
      expv[58] = 33'h100000000;
      expv[59] = 33'h1000003ff;
      expv[60] = 33'h100000000;
      expv[61] = 33'h1000003cb;
      expv[62] = 33'h1000002dd;
      expv[63] = 33'h1000001b6;
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
