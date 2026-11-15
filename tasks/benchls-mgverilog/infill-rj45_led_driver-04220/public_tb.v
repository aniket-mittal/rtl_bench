// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04220 dut (
    .clk(clk),
    .reset(in_vec[60:60]),
    .write_req(in_vec[59:59]),
    .read_req(in_vec[58:58]),
    .data_write(in_vec[57:26]),
    .address(in_vec[25:0]),
    .data_read(out_vec[36:5]),
    .busy(out_vec[4:4]),
    .rj45_led_sck(out_vec[3:3]),
    .rj45_led_sin(out_vec[2:2]),
    .rj45_led_lat(out_vec[1:1]),
    .rj45_led_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h1a112a94a90f83fd;
    stim[1] = 61'h19aada3f9af152b0;
    stim[2] = 61'h05fecc07d94f0533;
    stim[3] = 61'h0234ead030c7b5c1;
    stim[4] = 61'h0e9bd5eb9090ef79;
    stim[5] = 61'h006a8a0edda2b432;
    stim[6] = 61'h0f3cfe0fb648bfc4;
    stim[7] = 61'h0dd00cbed81c46ab;
    stim[8] = 61'h0e348a7b437c3a49;
    stim[9] = 61'h03e36bed69b54cef;
    stim[10] = 61'h071e9494ef1dcee0;
    stim[11] = 61'h01dc9f82cdc908bc;
    stim[12] = 61'h0e5ebe8f9c15e979;
    stim[13] = 61'h04d1556d26c4e944;
    stim[14] = 61'h07c0093ededfeb87;
    stim[15] = 61'h0483e3a697a392f2;
    stim[16] = 61'h0843dbf7291dd35c;
    stim[17] = 61'h00fdcd007f0e11e2;
    stim[18] = 61'h0844b3d50b853cca;
    stim[19] = 61'h05978ada287e8018;
    stim[20] = 61'h0d81325e257c5cdf;
    stim[21] = 61'h032aa84daaf8aae4;
    stim[22] = 61'h0f77063312a70db9;
    stim[23] = 61'h09546e6dd697d4b1;
    stim[24] = 61'h0f278c658cf58315;
    stim[25] = 61'h07781b435edfdae1;
    stim[26] = 61'h0e09a8551e3bfc87;
    stim[27] = 61'h0638ef5c43b46b4c;
    stim[28] = 61'h04c09d287b7db564;
    stim[29] = 61'h03be7bf33ab496f5;
    stim[30] = 61'h0545c04ee0df9f71;
    stim[31] = 61'h0f793af6c52830be;
    stim[32] = 61'h06470018fbde3a91;
    stim[33] = 61'h0fb9117ad15d0f96;
    stim[34] = 61'h05e41d8d12fee3d7;
    stim[35] = 61'h0018b750ccd948e4;
    stim[36] = 61'h0a40b181d448c483;
    stim[37] = 61'h07022378816adbeb;
    stim[38] = 61'h0dc701cdfe8960a9;
    stim[39] = 61'h0f79e13f0913f02c;
    stim[40] = 61'h09cda1f445dd221d;
    stim[41] = 61'h00ccd5e480625077;
    stim[42] = 61'h093c55c8e3d3012e;
    stim[43] = 61'h0bbf4ff033aa3c65;
    stim[44] = 61'h01062a88166f4c27;
    stim[45] = 61'h05d560d958909650;
    stim[46] = 61'h0714bc347f08f170;
    stim[47] = 61'h0135fa52139d8e31;
    stim[48] = 61'h0eba8ec47d99fca7;
    stim[49] = 61'h0df33cf0d6ae8c3e;
    stim[50] = 61'h085378039f2024da;
    stim[51] = 61'h060f60a67ef03a1e;
    stim[52] = 61'h074ac6f6c8f8e963;
    stim[53] = 61'h0b2e02ec302a20b3;
    stim[54] = 61'h063f47c8c5b24ece;
    stim[55] = 61'h02a27ef5b32603f6;
    stim[56] = 61'h0aec427feb0d0478;
    stim[57] = 61'h0f3ba2f96d2f25a2;
    stim[58] = 61'h0836dc471d9171cc;
    stim[59] = 61'h07b53ac2fb31a38a;
    stim[60] = 61'h05c6f70fc52f5461;
    stim[61] = 61'h0893027f6f85e988;
    stim[62] = 61'h0aa7713c21ad1a42;
    stim[63] = 61'h0098fa6a5e12fb4f;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxx0;
      expv[2] = 37'hxxxxxxxxx0;
      expv[3] = 37'h0000000010;
      expv[4] = 37'h0000000010;
      expv[5] = 37'h0000000010;
      expv[6] = 37'h0000000010;
      expv[7] = 37'h0000000010;
      expv[8] = 37'h0000000010;
      expv[9] = 37'h0000000010;
      expv[10] = 37'h0000000010;
      expv[11] = 37'h0000000010;
      expv[12] = 37'h0000000010;
      expv[13] = 37'h0000000010;
      expv[14] = 37'h0000000010;
      expv[15] = 37'h0000000010;
      expv[16] = 37'h0000000010;
      expv[17] = 37'h0000000010;
      expv[18] = 37'h0000000010;
      expv[19] = 37'h0000000010;
      expv[20] = 37'h0000000010;
      expv[21] = 37'h0000000010;
      expv[22] = 37'h0000000010;
      expv[23] = 37'h0000000010;
      expv[24] = 37'h0000000010;
      expv[25] = 37'h0000000010;
      expv[26] = 37'h0000000010;
      expv[27] = 37'h0000000018;
      expv[28] = 37'h0000000018;
      expv[29] = 37'h0000000018;
      expv[30] = 37'h0000000018;
      expv[31] = 37'h0000000018;
      expv[32] = 37'h0000000018;
      expv[33] = 37'h0000000018;
      expv[34] = 37'h0000000018;
      expv[35] = 37'h0000000010;
      expv[36] = 37'h0000000010;
      expv[37] = 37'h0000000010;
      expv[38] = 37'h0000000010;
      expv[39] = 37'h0000000010;
      expv[40] = 37'h0000000010;
      expv[41] = 37'h0000000010;
      expv[42] = 37'h0000000010;
      expv[43] = 37'h0000000018;
      expv[44] = 37'h0000000018;
      expv[45] = 37'h0000000018;
      expv[46] = 37'h0000000018;
      expv[47] = 37'h0000000018;
      expv[48] = 37'h0000000018;
      expv[49] = 37'h0000000018;
      expv[50] = 37'h0000000018;
      expv[51] = 37'h0000000010;
      expv[52] = 37'h0000000010;
      expv[53] = 37'h0000000010;
      expv[54] = 37'h0000000010;
      expv[55] = 37'h0000000010;
      expv[56] = 37'h0000000010;
      expv[57] = 37'h0000000010;
      expv[58] = 37'h0000000010;
      expv[59] = 37'h0000000018;
      expv[60] = 37'h0000000018;
      expv[61] = 37'h0000000018;
      expv[62] = 37'h0000000018;
      expv[63] = 37'h0000000018;
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
