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

  rtlpp_09585 dut (
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
    stim[0] = 70'h232833987ac047ba41;
    stim[1] = 70'h2fcb04be5ba6986f5d;
    stim[2] = 70'h0ba3e0ef4f393748d4;
    stim[3] = 70'h1de997b42817ce3155;
    stim[4] = 70'h08f8f16921e1a7a4a3;
    stim[5] = 70'h0053f2ba8be1580c19;
    stim[6] = 70'h1ff8f6f4f7daadd551;
    stim[7] = 70'h1ee60e0ba6848e21b7;
    stim[8] = 70'h18826dc184796f4249;
    stim[9] = 70'h15e9be23523abf8dd9;
    stim[10] = 70'h0c56fdff582c84c086;
    stim[11] = 70'h075919133579ef929e;
    stim[12] = 70'h1893073376ff4899d4;
    stim[13] = 70'h1924b0871975f81812;
    stim[14] = 70'h042832c9356557727e;
    stim[15] = 70'h1a56bac6ee2b6917be;
    stim[16] = 70'h11e6349284125368eb;
    stim[17] = 70'h0522adf4eab161c495;
    stim[18] = 70'h055c3a54b5b53f9375;
    stim[19] = 70'h1f93a879c57ecf5fff;
    stim[20] = 70'h000038350db42ceb54;
    stim[21] = 70'h02a48ca96567420ba3;
    stim[22] = 70'h001cc06cc385492bd5;
    stim[23] = 70'h050ebba99ec8a724af;
    stim[24] = 70'h0ad090b535e144f384;
    stim[25] = 70'h0221f137dd1cf30dbf;
    stim[26] = 70'h109ddf0536722ee5cb;
    stim[27] = 70'h0f52f03ba72c021670;
    stim[28] = 70'h0f53720bd1e09a0677;
    stim[29] = 70'h1fd642e0a340e8c89c;
    stim[30] = 70'h02210aa20521c89a58;
    stim[31] = 70'h1e3a1fdc2301202193;
    stim[32] = 70'h1cc03e0a7422b0298c;
    stim[33] = 70'h04d6f4b5d74438ed4e;
    stim[34] = 70'h0cf36f244c7a66d016;
    stim[35] = 70'h0c7c5cdf9cb487772a;
    stim[36] = 70'h1f4fd216c9d1a267e6;
    stim[37] = 70'h051a4f94d3ecbe3675;
    stim[38] = 70'h03a6069155227147f9;
    stim[39] = 70'h143bee7324a3df7ea7;
    stim[40] = 70'h06ca74f266ba727ebb;
    stim[41] = 70'h16f9db3d4066a08b51;
    stim[42] = 70'h15ca00041e78835b9f;
    stim[43] = 70'h1484f872fc6bfc2b64;
    stim[44] = 70'h0d336d79d433de6f43;
    stim[45] = 70'h07673fe0dd400003c6;
    stim[46] = 70'h0feefab95df51ee57e;
    stim[47] = 70'h026af6ff772b41edfd;
    stim[48] = 70'h08614d59589a18be30;
    stim[49] = 70'h1f3608596727f1e7b8;
    stim[50] = 70'h0f0e6e9f48a34c79af;
    stim[51] = 70'h1a5a04af77ce5e1059;
    stim[52] = 70'h184f15a374020ecc6f;
    stim[53] = 70'h14f636827116addd7f;
    stim[54] = 70'h1e36cac95ef540038b;
    stim[55] = 70'h042fb684a2c885e18d;
    stim[56] = 70'h0861e54caf4cbcf9d4;
    stim[57] = 70'h12c1ae629ccd2cbf78;
    stim[58] = 70'h09356b773028a5dfa8;
    stim[59] = 70'h185830d1f8eb50b225;
    stim[60] = 70'h10551a0f61b8df0b96;
    stim[61] = 70'h1a0f8b41f19949a3a5;
    stim[62] = 70'h0946215af90a08fa35;
    stim[63] = 70'h1a0143f31c5cb1e99f;
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
      expv[0] = 33'h0c047ba40;
      expv[1] = 33'h1a6986f5c;
      expv[2] = 33'h1393748d4;
      expv[3] = 33'h017ce3154;
      expv[4] = 33'h1e1a7a4a2;
      expv[5] = 33'h1e1580c18;
      expv[6] = 33'h1daadd550;
      expv[7] = 33'h0848e21b6;
      expv[8] = 33'h0796f4248;
      expv[9] = 33'h03abf8dd8;
      expv[10] = 33'h02c84c086;
      expv[11] = 33'h179ef929e;
      expv[12] = 33'h0ff4899d4;
      expv[13] = 33'h175f81813;
      expv[14] = 33'h16557727e;
      expv[15] = 33'h02b6917be;
      expv[16] = 33'h0125368ea;
      expv[17] = 33'h0b161c494;
      expv[18] = 33'h1b53f9374;
      expv[19] = 33'h17ecf5ffe;
      expv[20] = 33'h1b42ceb54;
      expv[21] = 33'h167420ba2;
      expv[22] = 33'h185492bd4;
      expv[23] = 33'h0c8a724ae;
      expv[24] = 33'h1e144f384;
      expv[25] = 33'h11cf30dbe;
      expv[26] = 33'h0722ee5ca;
      expv[27] = 33'h12c021670;
      expv[28] = 33'h1e09a0676;
      expv[29] = 33'h140e8c89c;
      expv[30] = 33'h121c89a58;
      expv[31] = 33'h101202192;
      expv[32] = 33'h022b0298c;
      expv[33] = 33'h14438ed4e;
      expv[34] = 33'h07a66d016;
      expv[35] = 33'h0b487772a;
      expv[36] = 33'h1d1a267e7;
      expv[37] = 33'h1ecbe3674;
      expv[38] = 33'h1227147f8;
      expv[39] = 33'h0a3df7ea6;
      expv[40] = 33'h0ba727eba;
      expv[41] = 33'h066a08b50;
      expv[42] = 33'h078835b9e;
      expv[43] = 33'h06bfc2b64;
      expv[44] = 33'h033de6f42;
      expv[45] = 33'h1400003c6;
      expv[46] = 33'h1f51ee57e;
      expv[47] = 33'h12b41edfc;
      expv[48] = 33'h09a18be30;
      expv[49] = 33'h127f1e7b8;
      expv[50] = 33'h0a34c79ae;
      expv[51] = 33'h1ce5e1058;
      expv[52] = 33'h0020ecc6e;
      expv[53] = 33'h116addd7e;
      expv[54] = 33'h0f540038a;
      expv[55] = 33'h0c885e18c;
      expv[56] = 33'h14cbcf9d4;
      expv[57] = 33'h0cd2cbf78;
      expv[58] = 33'h028a5dfa8;
      expv[59] = 33'h0eb50b224;
      expv[60] = 33'h1b8df0b97;
      expv[61] = 33'h19949a3a4;
      expv[62] = 33'h10a08fa34;
      expv[63] = 33'h05cb1e99e;
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
