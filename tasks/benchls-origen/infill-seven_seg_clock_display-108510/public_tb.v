// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108510 dut (
    .h(in_vec[17:13]),
    .m(in_vec[12:7]),
    .s(in_vec[6:1]),
    .dot(in_vec[0:0]),
    .led0(out_vec[47:40]),
    .led1(out_vec[39:32]),
    .led2(out_vec[31:24]),
    .led3(out_vec[23:16]),
    .led4(out_vec[15:8]),
    .led5(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h0a1f2;
    stim[1] = 18'h2e5c1;
    stim[2] = 18'h13d5d;
    stim[3] = 18'h1e5d2;
    stim[4] = 18'h1c658;
    stim[5] = 18'h21b29;
    stim[6] = 18'h1d242;
    stim[7] = 18'h287ae;
    stim[8] = 18'h3444d;
    stim[9] = 18'h2e4c1;
    stim[10] = 18'h22a93;
    stim[11] = 18'h02909;
    stim[12] = 18'h27807;
    stim[13] = 18'h0d93c;
    stim[14] = 18'h10af3;
    stim[15] = 18'h227c2;
    stim[16] = 18'h121b7;
    stim[17] = 18'h33746;
    stim[18] = 18'h0c215;
    stim[19] = 18'h09ab1;
    stim[20] = 18'h10352;
    stim[21] = 18'h37bbd;
    stim[22] = 18'h3f5d3;
    stim[23] = 18'h1597f;
    stim[24] = 18'h1a2c1;
    stim[25] = 18'h0a52f;
    stim[26] = 18'h35306;
    stim[27] = 18'h0c29b;
    stim[28] = 18'h37c5e;
    stim[29] = 18'h2d07b;
    stim[30] = 18'h071f2;
    stim[31] = 18'h0c11d;
    stim[32] = 18'h3d0ed;
    stim[33] = 18'h28a17;
    stim[34] = 18'h111af;
    stim[35] = 18'h0d75f;
    stim[36] = 18'h1b81f;
    stim[37] = 18'h31d03;
    stim[38] = 18'h2b76b;
    stim[39] = 18'h09821;
    stim[40] = 18'h120c2;
    stim[41] = 18'h26dd0;
    stim[42] = 18'h0a4b6;
    stim[43] = 18'h26c6c;
    stim[44] = 18'h1f0be;
    stim[45] = 18'h0e445;
    stim[46] = 18'h27d90;
    stim[47] = 18'h1f78c;
    stim[48] = 18'h321ce;
    stim[49] = 18'h03b1c;
    stim[50] = 18'h0772f;
    stim[51] = 18'h02006;
    stim[52] = 18'h2553c;
    stim[53] = 18'h0bb37;
    stim[54] = 18'h29e49;
    stim[55] = 18'h0246a;
    stim[56] = 18'h247e6;
    stim[57] = 18'h3370d;
    stim[58] = 18'h11dfc;
    stim[59] = 18'h01a75;
    stim[60] = 18'h3039d;
    stim[61] = 18'h2fbf3;
    stim[62] = 18'h0cab1;
    stim[63] = 18'h0c031;
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
      expv[0] = 48'hf892b0c092ff;
      expv[1] = 48'ha4b079f930a4;
      expv[2] = 48'h8299009210ff;
      expv[3] = 48'hf999f9f992f9;
      expv[4] = 48'h9999a4f999f9;
      expv[5] = 48'hc0a4199202f9;
      expv[6] = 48'hb0b082b099f9;
      expv[7] = 48'hb0a492f9c0a4;
      expv[8] = 48'h80b000c002a4;
      expv[9] = 48'ha4b010c030a4;
      expv[10] = 48'h90c079a478f9;
      expv[11] = 48'h99c000f979ff;
      expv[12] = 48'hb0c0009910f9;
      expv[13] = 48'hc0b0c09282ff;
      expv[14] = 48'hf89279a400ff;
      expv[15] = 48'hb0b092f9f8f9;
      expv[16] = 48'hf8a430c010ff;
      expv[17] = 48'h92b0829992a4;
      expv[18] = 48'hc0f919c002ff;
      expv[19] = 48'h99a4309219ff;
      expv[20] = 48'hf99982c080ff;
      expv[21] = 48'hc0b0129278a4;
      expv[22] = 48'hf999309979ff;
      expv[23] = 48'hb0ff409240f9;
      expv[24] = 48'ha4b012c030f9;
      expv[25] = 48'hb0a440f912ff;
      expv[26] = 48'hb0c080b082a4;
      expv[27] = 48'hb0f912c002ff;
      expv[28] = 48'hf8998292f8a4;
      expv[29] = 48'hf9ff24b024a4;
      expv[30] = 48'hf89292b0b0ff;
      expv[31] = 48'h99f924c002ff;
      expv[32] = 48'h999230b040ff;
      expv[33] = 48'hf9f940a440a4;
      expv[34] = 48'hb0a412b000ff;
      expv[35] = 48'hf899029902ff;
      expv[36] = 48'h92f9009930f9;
      expv[37] = 48'hf9c0009219a4;
      expv[38] = 48'hb092029979a4;
      expv[39] = 48'h82f9009919ff;
      expv[40] = 48'hb0b0f9c090ff;
      expv[41] = 48'hc099f8a490f9;
      expv[42] = 48'hf8a490c092ff;
      expv[43] = 48'h999299a490f9;
      expv[44] = 48'hf9b0b0b092f9;
      expv[45] = 48'h99b000c078ff;
      expv[46] = 48'h80c0909290f9;
      expv[47] = 48'h82c0f89992f9;
      expv[48] = 48'h90b0b0c092a4;
      expv[49] = 48'h99f99992f9ff;
      expv[50] = 48'hb0a4029930ff;
      expv[51] = 48'hb0c0c0c0f9ff;
      expv[52] = 48'hc0b0a49980f9;
      expv[53] = 48'hf8a4199212ff;
      expv[54] = 48'h82b040ff40a4;
      expv[55] = 48'hb09280c0f9ff;
      expv[56] = 48'hf99292f980f9;
      expv[57] = 48'h82c0029912a4;
      expv[58] = 48'ha4ff909280ff;
      expv[59] = 48'h8092249240ff;
      expv[60] = 48'h99f978c019a4;
      expv[61] = 48'hf892129230a4;
      expv[62] = 48'h99a479a402ff;
      expv[63] = 48'h99a440c002ff;
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
