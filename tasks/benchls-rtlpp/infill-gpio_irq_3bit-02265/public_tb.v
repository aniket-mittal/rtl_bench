// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02265 dut (
    .clk(clk),
    .address(in_vec[39:38]),
    .chipselect(in_vec[37:37]),
    .in_port(in_vec[36:34]),
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
    stim[0] = 40'h08b157b023;
    stim[1] = 40'h8cad4b3046;
    stim[2] = 40'h12ffdbd3f2;
    stim[3] = 40'h9b2c6ad25c;
    stim[4] = 40'hf726208b6f;
    stim[5] = 40'h52b0a3586e;
    stim[6] = 40'hbad33ffcad;
    stim[7] = 40'he2d1f2e932;
    stim[8] = 40'h0fdde7bbdd;
    stim[9] = 40'haea3dd576b;
    stim[10] = 40'hf3ac40c4e3;
    stim[11] = 40'ha3984d3507;
    stim[12] = 40'h0a988530da;
    stim[13] = 40'h67e0d6badc;
    stim[14] = 40'h3e3b7b30ca;
    stim[15] = 40'hebf4bb609a;
    stim[16] = 40'h1edf43217c;
    stim[17] = 40'hbfd060dac5;
    stim[18] = 40'h726678a799;
    stim[19] = 40'h534e8b1c91;
    stim[20] = 40'h06d25aa590;
    stim[21] = 40'heeb4878f3f;
    stim[22] = 40'hfe084fb1aa;
    stim[23] = 40'hfa8ba02319;
    stim[24] = 40'h5245449578;
    stim[25] = 40'hc73769d6d2;
    stim[26] = 40'h92b2caa402;
    stim[27] = 40'h2e17a286b3;
    stim[28] = 40'h3786cdaa7b;
    stim[29] = 40'hcaf6c31abf;
    stim[30] = 40'he6d155ca69;
    stim[31] = 40'hafb72f6f83;
    stim[32] = 40'h6628d16a77;
    stim[33] = 40'h06ed013c97;
    stim[34] = 40'h370b821ec9;
    stim[35] = 40'hd2cac63129;
    stim[36] = 40'hae75d8a1ec;
    stim[37] = 40'h5c811adef1;
    stim[38] = 40'h1f47f14c00;
    stim[39] = 40'hefa7d14d35;
    stim[40] = 40'h3799df537e;
    stim[41] = 40'h2e8442a663;
    stim[42] = 40'h8ebafbfe12;
    stim[43] = 40'h74a02f413f;
    stim[44] = 40'hc356795319;
    stim[45] = 40'h1f5c69fa72;
    stim[46] = 40'hb20a70d0c4;
    stim[47] = 40'ha785b57f42;
    stim[48] = 40'hfb0a1370d7;
    stim[49] = 40'h0fd211efb8;
    stim[50] = 40'h4a9b16937d;
    stim[51] = 40'h5f995a40a2;
    stim[52] = 40'hbaf52b4178;
    stim[53] = 40'haf2ea3a5da;
    stim[54] = 40'h221612de04;
    stim[55] = 40'h424328ee27;
    stim[56] = 40'h0ba0eae293;
    stim[57] = 40'h0313fc67ef;
    stim[58] = 40'h2f0d7aeaa5;
    stim[59] = 40'h2a17aaf657;
    stim[60] = 40'h1e2ef7a329;
    stim[61] = 40'hf33bf1ebe5;
    stim[62] = 40'h22fe19a757;
    stim[63] = 40'hae2d349691;
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
      expv[3] = 33'h000000004;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000004;
      expv[6] = 33'h000000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h000000007;
      expv[9] = 33'h000000003;
      expv[10] = 33'h100000005;
      expv[11] = 33'h100000003;
      expv[12] = 33'h100000003;
      expv[13] = 33'h100000002;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000007;
      expv[16] = 33'h100000007;
      expv[17] = 33'h100000007;
      expv[18] = 33'h100000003;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000001;
      expv[22] = 33'h000000007;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h100000003;
      expv[28] = 33'h100000003;
      expv[29] = 33'h100000005;
      expv[30] = 33'h100000007;
      expv[31] = 33'h000000007;
      expv[32] = 33'h100000003;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000001;
      expv[35] = 33'h100000005;
      expv[36] = 33'h100000003;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000007;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000005;
      expv[42] = 33'h000000003;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000007;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000004;
      expv[49] = 33'h100000007;
      expv[50] = 33'h100000003;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h000000004;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000002;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000003;
      expv[60] = 33'h000000002;
      expv[61] = 33'h000000007;
      expv[62] = 33'h000000007;
      expv[63] = 33'h000000000;
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
