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

  rtlpp_06569 dut (
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
    stim[0] = 40'hd19450e1c7;
    stim[1] = 40'h991b1b8d55;
    stim[2] = 40'hfb2866b392;
    stim[3] = 40'h737b94d942;
    stim[4] = 40'hb7827a43f4;
    stim[5] = 40'h47572b33f9;
    stim[6] = 40'h3fd4787c4d;
    stim[7] = 40'h76fbd33d7f;
    stim[8] = 40'h15c74b3717;
    stim[9] = 40'h263050e000;
    stim[10] = 40'h52cffd1c6c;
    stim[11] = 40'h767bdc6f12;
    stim[12] = 40'h0efbd60127;
    stim[13] = 40'hb7869028dd;
    stim[14] = 40'h77b4e418dd;
    stim[15] = 40'h0649e7e629;
    stim[16] = 40'hff50c58455;
    stim[17] = 40'h7a6fd8152b;
    stim[18] = 40'h672a532de2;
    stim[19] = 40'h8a2f19822d;
    stim[20] = 40'h27db09b370;
    stim[21] = 40'h7f37de5925;
    stim[22] = 40'h0ab000beb2;
    stim[23] = 40'hba8533dd4b;
    stim[24] = 40'h32e90f5ce2;
    stim[25] = 40'h36622b8d75;
    stim[26] = 40'h5e600099cf;
    stim[27] = 40'h23d77144ca;
    stim[28] = 40'h72c774c101;
    stim[29] = 40'h1e1c63b400;
    stim[30] = 40'hdeeb3e88a4;
    stim[31] = 40'h673d3b54bb;
    stim[32] = 40'hdf2a65549f;
    stim[33] = 40'he757bc83ad;
    stim[34] = 40'hbfcd6330a7;
    stim[35] = 40'h4397982677;
    stim[36] = 40'h16a8c699bf;
    stim[37] = 40'h47adb78739;
    stim[38] = 40'h77ad0edc6f;
    stim[39] = 40'hdeca63de22;
    stim[40] = 40'h5ff155a992;
    stim[41] = 40'h02dc912ed8;
    stim[42] = 40'h0bc52fe4c7;
    stim[43] = 40'h5e76e84397;
    stim[44] = 40'hb2c9f0b603;
    stim[45] = 40'hc454f758be;
    stim[46] = 40'h0aa2a44d11;
    stim[47] = 40'ha78534d07f;
    stim[48] = 40'h622fe9e586;
    stim[49] = 40'h94a12ed680;
    stim[50] = 40'h22213d95aa;
    stim[51] = 40'h3752005944;
    stim[52] = 40'h6a2d02122f;
    stim[53] = 40'h6e2209c609;
    stim[54] = 40'h838d4f7d56;
    stim[55] = 40'hab59364d85;
    stim[56] = 40'h0e110273d8;
    stim[57] = 40'h5a02b5a4c1;
    stim[58] = 40'hc7f163c9a3;
    stim[59] = 40'h176bd6bc0c;
    stim[60] = 40'h4fd78777b2;
    stim[61] = 40'h1ead9dc051;
    stim[62] = 40'h1276be401d;
    stim[63] = 40'h3680c3138f;
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
      expv[7] = 33'h000000007;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000003;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000007;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000002;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000004;
      expv[26] = 33'h100000005;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000007;
      expv[31] = 33'h100000007;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000007;
      expv[34] = 33'h100000007;
      expv[35] = 33'h100000003;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000005;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000007;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000002;
      expv[44] = 33'h100000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000002;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000005;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000003;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000007;
      expv[60] = 33'h000000005;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000007;
      expv[63] = 33'h000000004;
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
