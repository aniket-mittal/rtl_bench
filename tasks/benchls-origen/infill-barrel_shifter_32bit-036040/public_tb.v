// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036040 dut (
    .A(in_vec[65:34]),
    .B(in_vec[33:2]),
    .ctrl(in_vec[1:0]),
    .Shift_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h11d277bf6f4d84e81;
    stim[1] = 66'h34fb81c5dbe668926;
    stim[2] = 66'h38e66bb5782d5143d;
    stim[3] = 66'h33318a70c5348bc08;
    stim[4] = 66'h0332866fe41a09c43;
    stim[5] = 66'h29839716184f30003;
    stim[6] = 66'h085ad0ab6f7fb8d70;
    stim[7] = 66'h13d4a38705cfbb6d8;
    stim[8] = 66'h23e1e5cdc1262bc49;
    stim[9] = 66'h3dc4f43825f2a308f;
    stim[10] = 66'h09562f6ec0c7240be;
    stim[11] = 66'h1c46570ae135458d8;
    stim[12] = 66'h18e9a522f4d6511af;
    stim[13] = 66'h1b46ecf90c77cf452;
    stim[14] = 66'h253d45efc930c48fb;
    stim[15] = 66'h3bb500b787535d2bb;
    stim[16] = 66'h31ee8bd34906b8a9b;
    stim[17] = 66'h11ffb36d075ec2dcd;
    stim[18] = 66'h01d6f74d7fa314b59;
    stim[19] = 66'h3634f874aca0e09d8;
    stim[20] = 66'h2faaeccba120d687e;
    stim[21] = 66'h2be21475986e42fd3;
    stim[22] = 66'h3607dec4225dd43b4;
    stim[23] = 66'h29a3ba0cfb3cb8f19;
    stim[24] = 66'h2b610ba9754d42be3;
    stim[25] = 66'h2dc8fb473fddd32ab;
    stim[26] = 66'h18abdb1269fd177cc;
    stim[27] = 66'h38d94d5dfbfbb7fd1;
    stim[28] = 66'h3472d448848e03d7d;
    stim[29] = 66'h167c8306a61d64e73;
    stim[30] = 66'h0f8110332a83d1780;
    stim[31] = 66'h35585d69c58267f73;
    stim[32] = 66'h38de257dcb1b9580e;
    stim[33] = 66'h3fe5a527fb4223e59;
    stim[34] = 66'h389476c4d442f34b9;
    stim[35] = 66'h278b410d2264662e3;
    stim[36] = 66'h1ed0ec73a19037bbe;
    stim[37] = 66'h3293a798e09e26ad9;
    stim[38] = 66'h35cbc1901a5c46f53;
    stim[39] = 66'h0fbee9080ec5c4bd3;
    stim[40] = 66'h0a9ed640452a5aa2e;
    stim[41] = 66'h1bd70364cca532739;
    stim[42] = 66'h2718715e39957ed24;
    stim[43] = 66'h2c22698a3aaa7bbbe;
    stim[44] = 66'h1a6cc73deec1895c7;
    stim[45] = 66'h27bdf11efbfc5c5e4;
    stim[46] = 66'h1209bc2a766db59e5;
    stim[47] = 66'h09bd09b8397e580a6;
    stim[48] = 66'h254a7879e9c90c3bd;
    stim[49] = 66'h29dcef37d13d51490;
    stim[50] = 66'h0eb843cc44eec6775;
    stim[51] = 66'h0c96abf4961681a46;
    stim[52] = 66'h365927b881fc23e92;
    stim[53] = 66'h23f2f0b3c7006edd2;
    stim[54] = 66'h1b0ead9e3d7d9003c;
    stim[55] = 66'h043e732ba51f68114;
    stim[56] = 66'h0103cc59ebaef3186;
    stim[57] = 66'h033351eecf2bf3e3d;
    stim[58] = 66'h1ada67ec5864b36e0;
    stim[59] = 66'h3d968f961cc0adc43;
    stim[60] = 66'h31c98c201367303e5;
    stim[61] = 66'h05d68d64fd246c566;
    stim[62] = 66'h229ce5291a11d0a3d;
    stim[63] = 66'h11ee2f1917307232d;
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
      expv[0] = 32'h00000005;
      expv[1] = 32'h6f99a249;
      expv[2] = 32'h00000705;
      expv[3] = 32'ha6917810;
      expv[4] = 32'hffffffff;
      expv[5] = 32'h00000061;
      expv[6] = 32'hdc6b8000;
      expv[7] = 32'h60000000;
      expv[8] = 32'h00000009;
      expv[9] = 32'h97ca8c23;
      expv[10] = 32'h031c902f;
      expv[11] = 32'ha8b1b000;
      expv[12] = 32'hfffa6b28;
      expv[13] = 32'h31df3d14;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h000120d7;
      expv[17] = 32'h000001d7;
      expv[18] = 32'h000007f4;
      expv[19] = 32'h09d80000;
      expv[20] = 32'h84835a1f;
      expv[21] = 32'h00000186;
      expv[22] = 32'h50ed0000;
      expv[23] = 32'h00001d9e;
      expv[24] = 32'hfea9a857;
      expv[25] = 32'hffffffff;
      expv[26] = 32'he8bbe600;
      expv[27] = 32'h000001df;
      expv[28] = 32'h048e03d7;
      expv[29] = 32'hffffffe6;
      expv[30] = 32'hf45e0000;
      expv[31] = 32'h002c133f;
      expv[32] = 32'h2c6e5603;
      expv[33] = 32'h00000001;
      expv[34] = 32'h00000a21;
      expv[35] = 32'hfffff899;
      expv[36] = 32'h8640deef;
      expv[37] = 32'h104f1356;
      expv[38] = 32'h69711bd4;
      expv[39] = 32'h3b1712f4;
      expv[40] = 32'h14a96a8b;
      expv[41] = 32'h00000652;
      expv[42] = 32'h49000000;
      expv[43] = 32'heaa9eeef;
      expv[44] = 32'hffffff76;
      expv[45] = 32'hc8000000;
      expv[46] = 32'h006cdb6b;
      expv[47] = 32'he5f96029;
      expv[48] = 32'h014e4861;
      expv[49] = 32'h00000000;
      expv[50] = 32'h000009dd;
      expv[51] = 32'h585a0691;
      expv[52] = 32'h07f08fa4;
      expv[53] = 32'h1c01bb74;
      expv[54] = 32'h0f000000;
      expv[55] = 32'h68114000;
      expv[56] = 32'haebbcc61;
      expv[57] = 32'h00000007;
      expv[58] = 32'h9b700000;
      expv[59] = 32'h00000073;
      expv[60] = 32'h4d9cc0f9;
      expv[61] = 32'hf491b159;
      expv[62] = 32'h06847428;
      expv[63] = 32'h05cc1c8c;
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
