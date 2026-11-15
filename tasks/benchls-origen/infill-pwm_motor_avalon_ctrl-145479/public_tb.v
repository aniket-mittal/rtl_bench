// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145479 dut (
    .csi_MCLK_clk(clk),
    .rsi_MRST_reset(in_vec[43:43]),
    .avs_ctrl_writedata(in_vec[42:11]),
    .avs_ctrl_byteenable(in_vec[10:7]),
    .avs_ctrl_address(in_vec[6:4]),
    .avs_ctrl_write(in_vec[3:3]),
    .avs_ctrl_read(in_vec[2:2]),
    .rsi_PWMRST_reset(in_vec[1:1]),
    .csi_PWMCLK_clk(in_vec[0:0]),
    .avs_ctrl_readdata(out_vec[34:3]),
    .avs_ctrl_waitrequest(out_vec[2:2]),
    .HX(out_vec[1:1]),
    .HY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'hd9bc10a0da9;
    stim[1] = 44'h89e5d46accf;
    stim[2] = 44'h7e0178d635f;
    stim[3] = 44'h73a1a011756;
    stim[4] = 44'h28c1049f5ee;
    stim[5] = 44'h01fd6e36399;
    stim[6] = 44'h06b1c30e878;
    stim[7] = 44'h546cba9db0a;
    stim[8] = 44'h2227d1f44e8;
    stim[9] = 44'h50516c8255a;
    stim[10] = 44'h76d465cf686;
    stim[11] = 44'h3b9c603c8d1;
    stim[12] = 44'h26f0381052c;
    stim[13] = 44'h2e00c0f9023;
    stim[14] = 44'h090ca7d87db;
    stim[15] = 44'h22c58ba5a1d;
    stim[16] = 44'h45284a97d61;
    stim[17] = 44'h0cd38eb6a4e;
    stim[18] = 44'h6b9ca6b47b2;
    stim[19] = 44'h4a65e1211d5;
    stim[20] = 44'h3905a32d7cc;
    stim[21] = 44'h2b1b21068c4;
    stim[22] = 44'h371493c49be;
    stim[23] = 44'h2c22b1490f1;
    stim[24] = 44'h1211b7c9ae2;
    stim[25] = 44'h1588ba0bd65;
    stim[26] = 44'h3ff9a071e40;
    stim[27] = 44'h4d91aba33e9;
    stim[28] = 44'h2d765332d7a;
    stim[29] = 44'h7bad0fa0ba7;
    stim[30] = 44'h5b571e7b704;
    stim[31] = 44'h1a1f7e88957;
    stim[32] = 44'h5da80cbfb79;
    stim[33] = 44'h7883a28b310;
    stim[34] = 44'h551f0c76720;
    stim[35] = 44'h1dcb85298f3;
    stim[36] = 44'h1cf79178c0a;
    stim[37] = 44'h1db3ffa218f;
    stim[38] = 44'h503b06e4aec;
    stim[39] = 44'h58016fad4a7;
    stim[40] = 44'h1e5f176c2f4;
    stim[41] = 44'h35ea9b0d618;
    stim[42] = 44'h24a70fee8da;
    stim[43] = 44'h68db90e3512;
    stim[44] = 44'h08f7eb093d8;
    stim[45] = 44'h2e1d2a3c4a6;
    stim[46] = 44'h29ca9073960;
    stim[47] = 44'h3c6e6cb0cae;
    stim[48] = 44'h1bd677f539b;
    stim[49] = 44'h6d791805548;
    stim[50] = 44'h77ce388e22e;
    stim[51] = 44'h08d849fd4ae;
    stim[52] = 44'h513dd6c9bcc;
    stim[53] = 44'h58ded4b81a7;
    stim[54] = 44'h2f2e1206743;
    stim[55] = 44'h64770126048;
    stim[56] = 44'h1aa17ccf8cc;
    stim[57] = 44'h70f48df2ae1;
    stim[58] = 44'h3dd3b304719;
    stim[59] = 44'h141c43c38d7;
    stim[60] = 44'h56ce7299cf2;
    stim[61] = 44'h160021c919a;
    stim[62] = 44'h5b10878a149;
    stim[63] = 44'h65e87147b00;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h006cba800;
      expv[12] = 35'h006cba800;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h007d6e360;
      expv[17] = 35'h007d6e360;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h000000000;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h000000002;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000002;
      expv[26] = 35'h000000002;
      expv[27] = 35'h000000002;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h006cba800;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h1cecba800;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000008;
      expv[52] = 35'h000000008;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000002;
      expv[58] = 35'h000000002;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000002;
      expv[63] = 35'h000000002;
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
