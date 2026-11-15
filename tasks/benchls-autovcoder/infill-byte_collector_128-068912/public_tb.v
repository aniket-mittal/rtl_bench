// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068912 dut (
    .ic_clk(clk),
    .ic_res(in_vec[28:28]),
    .ic_stb(in_vec[27:27]),
    .ic_sel(in_vec[26:25]),
    .ic_data_in_0(in_vec[24:17]),
    .ic_data_in_1(in_vec[16:9]),
    .ic_data_in_2(in_vec[8:1]),
    .ic_data_valid_in(in_vec[0:0]),
    .ic_data_out_0(out_vec[159:152]),
    .ic_data_out_1(out_vec[151:144]),
    .ic_data_out_2(out_vec[143:136]),
    .ic_data_out_3(out_vec[135:128]),
    .ic_data_collected(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h155b563a;
    stim[1] = 29'h1c836d6e;
    stim[2] = 29'h0fecf281;
    stim[3] = 29'h09497e00;
    stim[4] = 29'h054aea10;
    stim[5] = 29'h0d0db380;
    stim[6] = 29'h0d51c4dd;
    stim[7] = 29'h03548c30;
    stim[8] = 29'h0eed87b6;
    stim[9] = 29'h19d3325e;
    stim[10] = 29'h09dd4824;
    stim[11] = 29'h0b5777d1;
    stim[12] = 29'h05c1e3a5;
    stim[13] = 29'h0026a106;
    stim[14] = 29'h0e57058a;
    stim[15] = 29'h048b459a;
    stim[16] = 29'h060dd1e7;
    stim[17] = 29'h084bc6c3;
    stim[18] = 29'h01345750;
    stim[19] = 29'h06221b9d;
    stim[20] = 29'h00d9e630;
    stim[21] = 29'h0e1a0f04;
    stim[22] = 29'h01b2c9cc;
    stim[23] = 29'h1794c1cf;
    stim[24] = 29'h1088d21a;
    stim[25] = 29'h02b88ef0;
    stim[26] = 29'h006e685d;
    stim[27] = 29'h0dfaffe2;
    stim[28] = 29'h03586e27;
    stim[29] = 29'h0eaa1a93;
    stim[30] = 29'h0120264c;
    stim[31] = 29'h075ae211;
    stim[32] = 29'h0070012a;
    stim[33] = 29'h04d7c002;
    stim[34] = 29'h0250d34f;
    stim[35] = 29'h0c622986;
    stim[36] = 29'h005d79e5;
    stim[37] = 29'h0eb66067;
    stim[38] = 29'h07ce0f49;
    stim[39] = 29'h092b131a;
    stim[40] = 29'h077f4e23;
    stim[41] = 29'h09dadc9c;
    stim[42] = 29'h05310493;
    stim[43] = 29'h087c72e3;
    stim[44] = 29'h0c9ad920;
    stim[45] = 29'h0582f977;
    stim[46] = 29'h01a53545;
    stim[47] = 29'h00b8237b;
    stim[48] = 29'h0ed5787e;
    stim[49] = 29'h082a3ac9;
    stim[50] = 29'h02385dd2;
    stim[51] = 29'h04b7f031;
    stim[52] = 29'h06de516a;
    stim[53] = 29'h08f31f26;
    stim[54] = 29'h08667ff3;
    stim[55] = 29'h0f4684e8;
    stim[56] = 29'h00a96df1;
    stim[57] = 29'h0993f887;
    stim[58] = 29'h07262cac;
    stim[59] = 29'h01eb3a43;
    stim[60] = 29'h0618a3ec;
    stim[61] = 29'h02e7c43f;
    stim[62] = 29'h02409c82;
    stim[63] = 29'h04b7193b;
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
      expv[0] = 160'h0000000000000000000000000000000000000000;
      expv[1] = 160'h0000000000000000000000000000000000000000;
      expv[2] = 160'h0000000000000000000000000000000000000000;
      expv[3] = 160'h0000000000000000000000000000000000000000;
      expv[4] = 160'h0000000080000000000000000000000000000000;
      expv[5] = 160'h0000000080000000000000000000000000000000;
      expv[6] = 160'h00000000c0000000000000000000000000000000;
      expv[7] = 160'h00000000c0000000000000000000000000000000;
      expv[8] = 160'h6e000000e0000000000000000000000000000000;
      expv[9] = 160'h0000000000000000000000000000000000000000;
      expv[10] = 160'h0000000000000000000000000000000000000000;
      expv[11] = 160'h0000000080000000000000000000000000000000;
      expv[12] = 160'h0000000080000000000000000000000000000000;
      expv[13] = 160'h0000000080000000000000000000000000000000;
      expv[14] = 160'hbbd20000c0000000000000000000000000000000;
      expv[15] = 160'hbbd20000e0000000000000000000000000000000;
      expv[16] = 160'hbbd20000e0000000000000000000000000000000;
      expv[17] = 160'hbbd20000e0000000000000000000000000000000;
      expv[18] = 160'hbbd20000e0000000000000000000000000000000;
      expv[19] = 160'hbb250000f0000000000000000000000000000000;
      expv[20] = 160'hbb250000f0000000000000000000000000000000;
      expv[21] = 160'hbb250000f0000000000000000000000000000000;
      expv[22] = 160'hbb250000f8000000000000000000000000000000;
      expv[23] = 160'h0000000000000000000000000000000000000000;
      expv[24] = 160'h0000000000000000000000000000000000000000;
      expv[25] = 160'h0000000000000000000000000000000000000000;
      expv[26] = 160'h0000000000000000000000000000000000000000;
      expv[27] = 160'h0000000000000000000000000000000000000000;
      expv[28] = 160'h3700000080000000000000000000000000000000;
      expv[29] = 160'h3700000080000000000000000000000000000000;
      expv[30] = 160'h3700000080000000000000000000000000000000;
      expv[31] = 160'h37000000c0000000000000000000000000000000;
      expv[32] = 160'h37000000c0000000000000000000000000000000;
      expv[33] = 160'h37000000c0000000000000000000000000000000;
      expv[34] = 160'h37000000c0000000000000000000000000000000;
      expv[35] = 160'h37000000c0000000000000000000000000000000;
      expv[36] = 160'h37690000e0000000000000000000000000000000;
      expv[37] = 160'h37690000e0000000000000000000000000000000;
      expv[38] = 160'h37690000e0000000000000000000000000000000;
      expv[39] = 160'h37690000e0000000000000000000000000000000;
      expv[40] = 160'h2e690000f0000000000000000000000000000000;
      expv[41] = 160'h2e690000f0000000000000000000000000000000;
      expv[42] = 160'h2e690000f8000000000000000000000000000000;
      expv[43] = 160'h2e690000f8000000000000000000000000000000;
      expv[44] = 160'h2e690000f8000000000000000000000000000000;
      expv[45] = 160'h493e0000fc000000000000000000000000000000;
      expv[46] = 160'h493e0000fc000000000000000000000000000000;
      expv[47] = 160'h493e0000fc000000000000000000000000000000;
      expv[48] = 160'h493e0000fc000000000000000000000000000000;
      expv[49] = 160'hbbd25c00fe000000000000000000000000000000;
      expv[50] = 160'hbbd25c00fe000000000000000000000000000000;
      expv[51] = 160'h15d25c00ff000000000000000000000000000000;
      expv[52] = 160'h15d25c00ff000000000000000000000000000000;
      expv[53] = 160'h15d25c00ff000000000000000000000000000000;
      expv[54] = 160'h18d25c00ff800000000000000000000000000000;
      expv[55] = 160'h18d25c00ff800000000000000000000000000000;
      expv[56] = 160'h33d25c00ffc00000000000000000000000000000;
      expv[57] = 160'h33d25c00ffc00000000000000000000000000000;
      expv[58] = 160'h33d25c00ffc00000000000000000000000000000;
      expv[59] = 160'h54c95c00ffe00000000000000000000000000000;
      expv[60] = 160'h54c95c00ffe00000000000000000000000000000;
      expv[61] = 160'h54c95c00ffe00000000000000000000000000000;
      expv[62] = 160'h54c95c00ffe00000000000000000000000000000;
      expv[63] = 160'h54c95c00ffe00000000000000000000000000000;
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
