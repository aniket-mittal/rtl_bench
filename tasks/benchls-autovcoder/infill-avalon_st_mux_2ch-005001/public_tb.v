// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 113;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005001 dut (
    .clk(clk),
    .reset_n(in_vec[112:112]),
    .in_data_0(in_vec[111:80]),
    .in_valid_0(in_vec[79:79]),
    .in_startofpacket_0(in_vec[78:78]),
    .in_endofpacket_0(in_vec[77:77]),
    .in_empty_0(in_vec[76:75]),
    .in_error_0(in_vec[74:74]),
    .in_data_1(in_vec[73:42]),
    .in_valid_1(in_vec[41:41]),
    .in_startofpacket_1(in_vec[40:40]),
    .in_endofpacket_1(in_vec[39:39]),
    .in_empty_1(in_vec[38:37]),
    .in_error_1(in_vec[36:36]),
    .out_ready(in_vec[35:35]),
    .control_address(in_vec[34:34]),
    .control_write(in_vec[33:33]),
    .control_read(in_vec[32:32]),
    .control_writedata(in_vec[31:0]),
    .in_ready_0(out_vec[71:71]),
    .in_ready_1(out_vec[70:70]),
    .out_data(out_vec[69:38]),
    .out_valid(out_vec[37:37]),
    .out_startofpacket(out_vec[36:36]),
    .out_endofpacket(out_vec[35:35]),
    .out_empty(out_vec[34:33]),
    .out_error(out_vec[32:32]),
    .control_readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 113'h0a3b9cc755316f3d556bebfd9c462;
    stim[1] = 113'h0d7d3a7c50b256090f25bae9167ff;
    stim[2] = 113'h1829ad9237f4b10dc1fdd320e7c06;
    stim[3] = 113'h1755e6e4433951c545ffdb1ea73eb;
    stim[4] = 113'h1c8fd3094a1f306a7a738c942dd21;
    stim[5] = 113'h18623879170c7a67714a9b95223a4;
    stim[6] = 113'h13d2ad8488eb49db25914e4f7948d;
    stim[7] = 113'h175f9e463c24200e5a7029648c195;
    stim[8] = 113'h1ecfef4086c43007c9e3015643f25;
    stim[9] = 113'h1860981d1ed7a4dc1cb76a02b573a;
    stim[10] = 113'h19281d34835905785d96db1ac98c0;
    stim[11] = 113'h1741be76f90cd92f868cadf0869b3;
    stim[12] = 113'h18381f1411b698ceebcfffccd5377;
    stim[13] = 113'h136a2ed4cf25ffbac37a7d9652fce;
    stim[14] = 113'h1ce52781b4f5d6870adf67d04db10;
    stim[15] = 113'h15d8768078ee0ead1ca8e40b060dd;
    stim[16] = 113'h13099688e402e7743f2cad88cb417;
    stim[17] = 113'h1681e402a81af64d92291f03ee04f;
    stim[18] = 113'h188c41751fa42870101dd688a2ce9;
    stim[19] = 113'h19b22d5c776d790798ce015182006;
    stim[20] = 113'h1526811b4faa0605a17ce4794a6ba;
    stim[21] = 113'h129f4278b1cb3aaefc382c8bb96bc;
    stim[22] = 113'h197948f3df7daf978eea59a905ed5;
    stim[23] = 113'h1ac4d12d1c1492f75c97beee215fb;
    stim[24] = 113'h101a6d54c9675b3bbd29cfa46e275;
    stim[25] = 113'h1046e51d49ca7aa064efdf938b394;
    stim[26] = 113'h1fd8ccde74f9817476e81e5fff9a5;
    stim[27] = 113'h12ce3d2fc1d9c889dca13e4ab025d;
    stim[28] = 113'h10428809e9c720a5cc0ffc695e1a0;
    stim[29] = 113'h125a4d34f31a860cf2c7e1c8cbb71;
    stim[30] = 113'h1011e10bdf5c14a68a7578126637e;
    stim[31] = 113'h107f4f7951efefdeae6fa63385073;
    stim[32] = 113'h18f6351d3d682172fc8ee2f35a5f5;
    stim[33] = 113'h1045dbc736c47ffd3ec0b01fdd120;
    stim[34] = 113'h1f84af18f4da54f4fdbaffd6db678;
    stim[35] = 113'h108956eceaa9274ba716e0f5d9579;
    stim[36] = 113'h11ef215aee74d3ae9e8ae79b89bea;
    stim[37] = 113'h106aa151caead91a69423547eb67f;
    stim[38] = 113'h1cf95ffda0fe3e4a5fdfdb82b2dc4;
    stim[39] = 113'h12300faba751c4c27037dda43f672;
    stim[40] = 113'h1b169e62450835a5d59e5420c8530;
    stim[41] = 113'h1baf861e97bd1941b4212f26021a2;
    stim[42] = 113'h139b300a284de96362bd208ddd4ba;
    stim[43] = 113'h15fce378eaf2036a4be2962746d70;
    stim[44] = 113'h1796361523662bca6792b7b65a04b;
    stim[45] = 113'h1a793c5f21d35aec0d1243f4a06b9;
    stim[46] = 113'h1956a850a28659f92b124803dca17;
    stim[47] = 113'h15b6c256690ef4f077c4ca3bf2597;
    stim[48] = 113'h1cdd926078d2af8b3ef382790d53b;
    stim[49] = 113'h167d9ef514f096df1f78a692bb246;
    stim[50] = 113'h1a462d7e59b76f07e0ac3da08a903;
    stim[51] = 113'h1df907c349da3424dd28f9299c6a0;
    stim[52] = 113'h11f6cd28bf1c628ad365466ab30d6;
    stim[53] = 113'h18b9ecc8c5810592d0b902b10f859;
    stim[54] = 113'h100a5e941e11877b7ffad794fb462;
    stim[55] = 113'h139d6f1dc5e056ee3bfcba62a0d21;
    stim[56] = 113'h1d3fe9a0a2cec143729020d441d1e;
    stim[57] = 113'h19d1ea231dd744eacaf07d0e8cdba;
    stim[58] = 113'h154c280db2263cbb1c2a515c78608;
    stim[59] = 113'h1aaf45cdebdbb3e9f8626d4a1d127;
    stim[60] = 113'h19951bb897ec7805229f68a353d5d;
    stim[61] = 113'h168636883464f9838b01875677cf5;
    stim[62] = 113'h15ca58e1e09170a758361abea5cc3;
    stim[63] = 113'h1a0e077f4e2302fb01f800aedfa68;
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
      expv[0] = 72'ha8ee731d5400000000;
      expv[1] = 72'hb5f4e9f14200000000;
      expv[2] = 72'ha0a6b648df00000000;
      expv[3] = 72'h9d579b910c00000000;
      expv[4] = 72'hb23f4c252800000000;
      expv[5] = 72'ha188e1e45c00000000;
      expv[6] = 72'h0f4ab6122300000000;
      expv[7] = 72'h1d7e7918f000000000;
      expv[8] = 72'h043007c9e300000000;
      expv[9] = 72'h17a4dc1cb700000000;
      expv[10] = 72'ha4a074d20d00000000;
      expv[11] = 72'h9d06f9dbe400000000;
      expv[12] = 72'h7698ceebcf00000000;
      expv[13] = 72'h25ffbac37a00000000;
      expv[14] = 72'h33949e06d300000000;
      expv[15] = 72'h9761da01e300000000;
      expv[16] = 72'h42e7743f2c00000000;
      expv[17] = 72'h1af64d922900000000;
      expv[18] = 72'h642870101d00000001;
      expv[19] = 72'h2d790798ce00000001;
      expv[20] = 72'h6a0605a17c00000001;
      expv[21] = 72'h0a7d09e2c700000001;
      expv[22] = 72'h25e523cf7d00000001;
      expv[23] = 72'hab1344b47000000000;
      expv[24] = 72'h675b3bbd2900000000;
      expv[25] = 72'h4a7aa064ef00000000;
      expv[26] = 72'h39817476e800000001;
      expv[27] = 72'h19c889dca100000001;
      expv[28] = 72'h4720a5cc0f00000001;
      expv[29] = 72'h896934d3cc00000001;
      expv[30] = 72'h1c14a68a7500000001;
      expv[31] = 72'h81fd3de54700000001;
      expv[32] = 72'h682172fc8e00000001;
      expv[33] = 72'h447ffd3ec000000001;
      expv[34] = 72'hbe12bc63d300000001;
      expv[35] = 72'h82255bb3aa00000001;
      expv[36] = 72'h74d3ae9e8a00000001;
      expv[37] = 72'h01aa85472b00000001;
      expv[38] = 72'h7e3e4a5fdf00000001;
      expv[39] = 72'h51c4c2703700000001;
      expv[40] = 72'h0835a5d59e00000001;
      expv[41] = 72'h3d1941b42100000001;
      expv[42] = 72'h0e6cc028a100000001;
      expv[43] = 72'h97f38de3ab00000001;
      expv[44] = 72'h9e58d8548d00000000;
      expv[45] = 72'h135aec0d1200000000;
      expv[46] = 72'h0659f92b1200000000;
      expv[47] = 72'h4ef4f077c400000000;
      expv[48] = 72'h52af8b3ef300000000;
      expv[49] = 72'h7096df1f7800000000;
      expv[50] = 72'h2918b5f96600000000;
      expv[51] = 72'h5a3424dd2800000000;
      expv[52] = 72'h07db34a2fc00000000;
      expv[53] = 72'h22e7b3231600000000;
      expv[54] = 72'h80297a507800000000;
      expv[55] = 72'h8e75bc771700000000;
      expv[56] = 72'h0ec143729000000000;
      expv[57] = 72'h2747a88c7700000000;
      expv[58] = 72'h1530a036c800000000;
      expv[59] = 72'h2abd1737af00000000;
      expv[60] = 72'h2c7805229f00000000;
      expv[61] = 72'h64f9838b0100000000;
      expv[62] = 72'h1170a7583600000000;
      expv[63] = 72'h2302fb01f800000001;
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
