// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104621 dut (
    .in1(in_vec[63:32]),
    .in2(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h6f9d504bea63db53;
    stim[1] = 64'h427619f1a71ecae0;
    stim[2] = 64'h6e968952689bcae8;
    stim[3] = 64'ha2fb1436cb70cce5;
    stim[4] = 64'h6cf75f686dc16957;
    stim[5] = 64'hbed0c375a5fcc61d;
    stim[6] = 64'hef1c6f166712cb81;
    stim[7] = 64'h28bb0cd5bfb374cb;
    stim[8] = 64'ha66d34b86c53c17c;
    stim[9] = 64'h6b2098fb00fac37b;
    stim[10] = 64'hcfc9427336e05e6d;
    stim[11] = 64'hf8bfdacf6da06bb3;
    stim[12] = 64'hdc4f78dac498d8b4;
    stim[13] = 64'h7963ee1226ac4722;
    stim[14] = 64'h5ee5d41240e5c44f;
    stim[15] = 64'heba14aeb01b0ccea;
    stim[16] = 64'hab271d34f2e6096c;
    stim[17] = 64'hb8da97d5bfe0e38e;
    stim[18] = 64'h0e6cd15831f0302e;
    stim[19] = 64'ha6985b5f76e26cba;
    stim[20] = 64'hb9d87436daeb1a99;
    stim[21] = 64'h9591dbda38107bcd;
    stim[22] = 64'h33fd61b91e24cc76;
    stim[23] = 64'ha4ed3c72dceb410b;
    stim[24] = 64'h80afb3c9451c28d6;
    stim[25] = 64'hf9fe2bb6cab1c3dc;
    stim[26] = 64'hf9abfdd7b9fc1637;
    stim[27] = 64'h3c0ee5eb3b56b101;
    stim[28] = 64'ha28e8e0e819a8213;
    stim[29] = 64'hc6f72af355819473;
    stim[30] = 64'h77b2bbcbbd3e25ec;
    stim[31] = 64'hf97ef6d731447013;
    stim[32] = 64'h281f3f0ef1b21119;
    stim[33] = 64'h26c8add3bf11bb0f;
    stim[34] = 64'h18464d1e9d738cfc;
    stim[35] = 64'h17f9070d3a321c7b;
    stim[36] = 64'h1ed980951dc2f42b;
    stim[37] = 64'hf5776e92dc345889;
    stim[38] = 64'hd5fe445b18f822fe;
    stim[39] = 64'hd0bcbaf7a928b726;
    stim[40] = 64'h0d53fc409c59d0cf;
    stim[41] = 64'hba969fe8b994bd5f;
    stim[42] = 64'hce796b6253270277;
    stim[43] = 64'hd9baccb919a9e432;
    stim[44] = 64'hdbfc31933054d69a;
    stim[45] = 64'h3366055fd2aad648;
    stim[46] = 64'h4fc09931f5b303f3;
    stim[47] = 64'h023f4142679cc6ac;
    stim[48] = 64'hfed74e7bd528cbb6;
    stim[49] = 64'h9fce2ea7224b8c52;
    stim[50] = 64'h9e00f0542c176070;
    stim[51] = 64'hb884c92f952288f7;
    stim[52] = 64'h31a99b95d96de8cc;
    stim[53] = 64'h28c4dee230839f55;
    stim[54] = 64'he7c6ee936c91e882;
    stim[55] = 64'h57d20a5e3374f0ed;
    stim[56] = 64'h796f97b052eddd70;
    stim[57] = 64'h7ea4201790b1d9c9;
    stim[58] = 64'h74db3fcbde98562c;
    stim[59] = 64'h2ddc324c01f40cb8;
    stim[60] = 64'hed34a814fd97e9b6;
    stim[61] = 64'h053522e0bd3e730b;
    stim[62] = 64'h1de001586c9d1888;
    stim[63] = 64'h82114b97831f702d;
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
      expv[0] = 32'h9ac6027d;
      expv[1] = 32'haa4c5385;
      expv[2] = 32'h17db9c75;
      expv[3] = 32'h2ef615f4;
      expv[4] = 32'h1b5d725c;
      expv[5] = 32'h256710fb;
      expv[6] = 32'h96d9b3b5;
      expv[7] = 32'ha9418fa8;
      expv[8] = 32'hd3621ade;
      expv[9] = 32'h2ccea803;
      expv[10] = 32'hc7583230;
      expv[11] = 32'ha6f83978;
      expv[12] = 32'h617bdf61;
      expv[13] = 32'h60ccb1a5;
      expv[14] = 32'h60672379;
      expv[15] = 32'hadef649d;
      expv[16] = 32'h5ecb1532;
      expv[17] = 32'h39600394;
      expv[18] = 32'h00ef186a;
      expv[19] = 32'hde4360b0;
      expv[20] = 32'h55636495;
      expv[21] = 32'h8e525234;
      expv[22] = 32'h12d18e7d;
      expv[23] = 32'h426d0162;
      expv[24] = 32'h866b2d95;
      expv[25] = 32'h05583f57;
      expv[26] = 32'h7454ae66;
      expv[27] = 32'h37f7d700;
      expv[28] = 32'h64d609e3;
      expv[29] = 32'hdcfd1bf8;
      expv[30] = 32'hf5c260ed;
      expv[31] = 32'heb61d24e;
      expv[32] = 32'hda6ec47a;
      expv[33] = 32'ha6723d17;
      expv[34] = 32'hf65e5434;
      expv[35] = 32'h12d6a14e;
      expv[36] = 32'h7d52d172;
      expv[37] = 32'h125727a9;
      expv[38] = 32'haf7b3a7d;
      expv[39] = 32'h3a7c61b8;
      expv[40] = 32'hea5a2edd;
      expv[41] = 32'h34d783de;
      expv[42] = 32'he2515bba;
      expv[43] = 32'hb3fbf7a9;
      expv[44] = 32'hcce8d63b;
      expv[45] = 32'hc6ccc00d;
      expv[46] = 32'h8643570b;
      expv[47] = 32'h2a752031;
      expv[48] = 32'h14c6fb6b;
      expv[49] = 32'h82d1f801;
      expv[50] = 32'h8acc3e54;
      expv[51] = 32'h0e544e5b;
      expv[52] = 32'hcbcecfa3;
      expv[53] = 32'h19e53895;
      expv[54] = 32'h94f161ce;
      expv[55] = 32'h4be47bc7;
      expv[56] = 32'h0cef4f56;
      expv[57] = 32'hcff205d0;
      expv[58] = 32'h94413bd7;
      expv[59] = 32'h7068f571;
      expv[60] = 32'h2b6b3411;
      expv[61] = 32'h834360a4;
      expv[62] = 32'h4b44bb25;
      expv[63] = 32'h45da7d9d;
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
