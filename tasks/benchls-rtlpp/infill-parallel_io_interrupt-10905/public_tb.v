// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10905 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
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
    stim[0] = 41'h0756552bf83;
    stim[1] = 41'h091f8a9048b;
    stim[2] = 41'h0dba11656ea;
    stim[3] = 41'h13740621538;
    stim[4] = 41'h08f398630d8;
    stim[5] = 41'h066564fd819;
    stim[6] = 41'h0325b2e1dfb;
    stim[7] = 41'h11a15cab038;
    stim[8] = 41'h05b9994ac3c;
    stim[9] = 41'h0739605b271;
    stim[10] = 41'h1a317d0172c;
    stim[11] = 41'h0365c946493;
    stim[12] = 41'h01adf203dcf;
    stim[13] = 41'h0b23e838201;
    stim[14] = 41'h176092903af;
    stim[15] = 41'h0a230685339;
    stim[16] = 41'h1df18085109;
    stim[17] = 41'h1c62d8a2082;
    stim[18] = 41'h042a42fdcd2;
    stim[19] = 41'h1c6f518fba5;
    stim[20] = 41'h1f6c72dbc1e;
    stim[21] = 41'h003509d14ad;
    stim[22] = 41'h08ba5fda964;
    stim[23] = 41'h07befc7c164;
    stim[24] = 41'h0bb5b7f9c06;
    stim[25] = 41'h0dee42fbbfc;
    stim[26] = 41'h1aebd668c29;
    stim[27] = 41'h00a0df840a2;
    stim[28] = 41'h07ec08a248a;
    stim[29] = 41'h0524ead2d01;
    stim[30] = 41'h0788a939765;
    stim[31] = 41'h08258ee8fab;
    stim[32] = 41'h197cd98600e;
    stim[33] = 41'h01e2929bda0;
    stim[34] = 41'h03675451e72;
    stim[35] = 41'h02f190abe27;
    stim[36] = 41'h12e313c9fe0;
    stim[37] = 41'h036132f042a;
    stim[38] = 41'h0cba9da0bb1;
    stim[39] = 41'h1ba9b5dcec2;
    stim[40] = 41'h1afa7ea2de1;
    stim[41] = 41'h03e8a99db6b;
    stim[42] = 41'h08668c35c9d;
    stim[43] = 41'h00e3227871e;
    stim[44] = 41'h12235262fdb;
    stim[45] = 41'h19af205df27;
    stim[46] = 41'h01ac1ecee46;
    stim[47] = 41'h0ae84984a9c;
    stim[48] = 41'h033c3551b0d;
    stim[49] = 41'h0e67c83152d;
    stim[50] = 41'h14be9a32913;
    stim[51] = 41'h0c67295dec5;
    stim[52] = 41'h1e360951480;
    stim[53] = 41'h063b8a38a88;
    stim[54] = 41'h13303d2aad9;
    stim[55] = 41'h02a02dd9bf1;
    stim[56] = 41'h1db5db8572e;
    stim[57] = 41'h11373593194;
    stim[58] = 41'h062e7d3aa12;
    stim[59] = 41'h0040acfb150;
    stim[60] = 41'h0473731c244;
    stim[61] = 41'h156e1b6edbe;
    stim[62] = 41'h183d80f5ab9;
    stim[63] = 41'h06603238089;
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
      expv[6] = 33'h000000009;
      expv[7] = 33'h00000000c;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000006;
      expv[10] = 33'h00000000c;
      expv[11] = 33'h00000000f;
      expv[12] = 33'h00000000d;
      expv[13] = 33'h000000006;
      expv[14] = 33'h000000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h10000000f;
      expv[18] = 33'h10000000f;
      expv[19] = 33'h100000000;
      expv[20] = 33'h10000000f;
      expv[21] = 33'h10000000a;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h10000000e;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h10000000f;
      expv[28] = 33'h100000002;
      expv[29] = 33'h10000000f;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000007;
      expv[35] = 33'h00000000d;
      expv[36] = 33'h00000000b;
      expv[37] = 33'h000000000;
      expv[38] = 33'h00000000d;
      expv[39] = 33'h000000000;
      expv[40] = 33'h00000000f;
      expv[41] = 33'h00000000f;
      expv[42] = 33'h00000000f;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000003;
      expv[45] = 33'h000000000;
      expv[46] = 33'h00000000f;
      expv[47] = 33'h000000006;
      expv[48] = 33'h000000000;
      expv[49] = 33'h00000000c;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h00000000f;
      expv[54] = 33'h000000008;
      expv[55] = 33'h000000000;
      expv[56] = 33'h00000000a;
      expv[57] = 33'h00000000f;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000000;
      expv[63] = 33'h100000001;
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
