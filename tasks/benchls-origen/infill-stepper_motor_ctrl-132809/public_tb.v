// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132809 dut (
    .csi_MCLK_clk(clk),
    .rsi_MRST_reset(in_vec[41:41]),
    .avs_ctrl_writedata(in_vec[40:9]),
    .avs_ctrl_byteenable(in_vec[8:5]),
    .avs_ctrl_address(in_vec[4:2]),
    .avs_ctrl_write(in_vec[1:1]),
    .avs_ctrl_read(in_vec[0:0]),
    .avs_ctrl_readdata(out_vec[38:7]),
    .avs_ctrl_waitrequest(out_vec[6:6]),
    .AX(out_vec[5:5]),
    .AY(out_vec[4:4]),
    .BX(out_vec[3:3]),
    .BY(out_vec[2:2]),
    .AE(out_vec[1:1]),
    .BE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h326383fe7ac;
    stim[1] = 42'h25f589b26b7;
    stim[2] = 42'h0ff568796ba;
    stim[3] = 42'h04ba7aa8935;
    stim[4] = 42'h02d1a0ed7bd;
    stim[5] = 42'h1211f91ad20;
    stim[6] = 42'h13945248989;
    stim[7] = 42'h1627d51c81a;
    stim[8] = 42'h0891542899e;
    stim[9] = 42'h1e6b5f36a07;
    stim[10] = 42'h16361814f66;
    stim[11] = 42'h0045613a349;
    stim[12] = 42'h096aade0126;
    stim[13] = 42'h0f7409c65fc;
    stim[14] = 42'h14e587bc4bc;
    stim[15] = 42'h09cec1b89d8;
    stim[16] = 42'h0da764862ea;
    stim[17] = 42'h1ef3caa6cfa;
    stim[18] = 42'h12d96c7ce7a;
    stim[19] = 42'h09270d88757;
    stim[20] = 42'h12ebb84c289;
    stim[21] = 42'h113c0726b8a;
    stim[22] = 42'h1ee01712e81;
    stim[23] = 42'h14514fc3c65;
    stim[24] = 42'h1dc4db36c2c;
    stim[25] = 42'h0ff0657b671;
    stim[26] = 42'h0f139dd7d81;
    stim[27] = 42'h06e2821d8e2;
    stim[28] = 42'h1bb67f2676c;
    stim[29] = 42'h1720c5d492b;
    stim[30] = 42'h0b47fcb14bd;
    stim[31] = 42'h14904203b96;
    stim[32] = 42'h03360105e8b;
    stim[33] = 42'h0ab1aac51e2;
    stim[34] = 42'h1d63166201e;
    stim[35] = 42'h00d5a418883;
    stim[36] = 42'h1911f2f84fc;
    stim[37] = 42'h17a51b58dd6;
    stim[38] = 42'h135bd464bb1;
    stim[39] = 42'h07b7f126075;
    stim[40] = 42'h09e064e1e92;
    stim[41] = 42'h191b5faf253;
    stim[42] = 42'h16e0b4fe967;
    stim[43] = 42'h009bc2dc0f1;
    stim[44] = 42'h1e60d9310f4;
    stim[45] = 42'h08f9cb52a57;
    stim[46] = 42'h16c866ad8af;
    stim[47] = 42'h04032f2b8b3;
    stim[48] = 42'h1b08e4a9a3e;
    stim[49] = 42'h1defbd213fb;
    stim[50] = 42'h100a65e7c7a;
    stim[51] = 42'h0b0cef6c129;
    stim[52] = 42'h0c42ae9e580;
    stim[53] = 42'h1e50c589d41;
    stim[54] = 42'h114dfcd34a5;
    stim[55] = 42'h0b26908ce0a;
    stim[56] = 42'h153a97ca088;
    stim[57] = 42'h0eccafd941d;
    stim[58] = 42'h1fd9b700ae3;
    stim[59] = 42'h0bbcef41e07;
    stim[60] = 42'h1ffb6d14b26;
    stim[61] = 42'h181ec535c38;
    stim[62] = 42'h1a1755ec934;
    stim[63] = 42'h1fc006c88f9;
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
      expv[0] = 39'h0000000000;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h0000000000;
      expv[4] = 39'h0000000000;
      expv[5] = 39'h0000000000;
      expv[6] = 39'h0000000000;
      expv[7] = 39'h0000000000;
      expv[8] = 39'h0000000000;
      expv[9] = 39'h0000000000;
      expv[10] = 39'h0000000000;
      expv[11] = 39'h0000000000;
      expv[12] = 39'h0000000000;
      expv[13] = 39'h0000000000;
      expv[14] = 39'h0000000000;
      expv[15] = 39'h0000000000;
      expv[16] = 39'h0000000000;
      expv[17] = 39'h0000000000;
      expv[18] = 39'h000000000b;
      expv[19] = 39'h0000000003;
      expv[20] = 39'h000000002b;
      expv[21] = 39'h00000000a3;
      expv[22] = 39'h000000008b;
      expv[23] = 39'h000001f403;
      expv[24] = 39'h25aab7802b;
      expv[25] = 39'h25aab78023;
      expv[26] = 39'h000000000b;
      expv[27] = 39'h000001f403;
      expv[28] = 39'h000001f42b;
      expv[29] = 39'h000001f423;
      expv[30] = 39'h000001f40b;
      expv[31] = 39'h0000000000;
      expv[32] = 39'h0000000000;
      expv[33] = 39'h0000000000;
      expv[34] = 39'h0000000003;
      expv[35] = 39'h000000002b;
      expv[36] = 39'h0000000023;
      expv[37] = 39'h000000000b;
      expv[38] = 39'h0000000003;
      expv[39] = 39'h000000002b;
      expv[40] = 39'h0000000023;
      expv[41] = 39'h000000000b;
      expv[42] = 39'h0000000003;
      expv[43] = 39'h000000002b;
      expv[44] = 39'h0000000023;
      expv[45] = 39'h000000000b;
      expv[46] = 39'h0000000003;
      expv[47] = 39'h000000002b;
      expv[48] = 39'h0000000023;
      expv[49] = 39'h000000000b;
      expv[50] = 39'h0000000003;
      expv[51] = 39'h000000002b;
      expv[52] = 39'h00000000a3;
      expv[53] = 39'h000000008b;
      expv[54] = 39'h0356906203;
      expv[55] = 39'h5b82d3fa2b;
      expv[56] = 39'h5b82d3fa23;
      expv[57] = 39'h5b82d3fa0b;
      expv[58] = 39'h0000000003;
      expv[59] = 39'h000000002b;
      expv[60] = 39'h0000000023;
      expv[61] = 39'h000000000b;
      expv[62] = 39'h0000000003;
      expv[63] = 39'h000000002b;
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
