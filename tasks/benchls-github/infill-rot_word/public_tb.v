// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rot_word dut (
    .in(in_vec[31:0]),
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
    stim[0] = 32'h91becaaa;
    stim[1] = 32'h116a2253;
    stim[2] = 32'h0fe02aef;
    stim[3] = 32'h4e75a710;
    stim[4] = 32'h653a0686;
    stim[5] = 32'hc9d8a93c;
    stim[6] = 32'h01503ce3;
    stim[7] = 32'h3f1fd0cf;
    stim[8] = 32'he409c0db;
    stim[9] = 32'hd2251330;
    stim[10] = 32'h9a914993;
    stim[11] = 32'h5a1b20d7;
    stim[12] = 32'h54151ea3;
    stim[13] = 32'h77d428b9;
    stim[14] = 32'h0d6866b3;
    stim[15] = 32'h0910f9fa;
    stim[16] = 32'h2d3f130e;
    stim[17] = 32'h3fde03bf;
    stim[18] = 32'hef1b5e1a;
    stim[19] = 32'h59a9fdad;
    stim[20] = 32'h33029af7;
    stim[21] = 32'h99c63c64;
    stim[22] = 32'h546b6773;
    stim[23] = 32'h607560e2;
    stim[24] = 32'hf0401256;
    stim[25] = 32'h3985c2b6;
    stim[26] = 32'h6bc62636;
    stim[27] = 32'hbf268766;
    stim[28] = 32'h2a5eea1e;
    stim[29] = 32'hdb8eac3c;
    stim[30] = 32'ha6f66b0a;
    stim[31] = 32'h49ee4636;
    stim[32] = 32'h7ddaa5de;
    stim[33] = 32'h303a54af;
    stim[34] = 32'hb50aff69;
    stim[35] = 32'h582c39d7;
    stim[36] = 32'hb101d855;
    stim[37] = 32'h2ad10dc2;
    stim[38] = 32'haf982b24;
    stim[39] = 32'h010bbdc7;
    stim[40] = 32'h7f170d1e;
    stim[41] = 32'hdfd2caf6;
    stim[42] = 32'h4c70587a;
    stim[43] = 32'hc7872477;
    stim[44] = 32'h7fa085b2;
    stim[45] = 32'h240c83b1;
    stim[46] = 32'h53786977;
    stim[47] = 32'hab7f03cf;
    stim[48] = 32'h554b7d2b;
    stim[49] = 32'h5a23ec2c;
    stim[50] = 32'hc0c8ecc3;
    stim[51] = 32'hdc3b8985;
    stim[52] = 32'hffa32f13;
    stim[53] = 32'h795ad446;
    stim[54] = 32'h891bed05;
    stim[55] = 32'hd8661d0e;
    stim[56] = 32'h778a412d;
    stim[57] = 32'h60894131;
    stim[58] = 32'h8abbca2c;
    stim[59] = 32'h60a472c3;
    stim[60] = 32'h22ab89e4;
    stim[61] = 32'h5798a236;
    stim[62] = 32'h3b687fc5;
    stim[63] = 32'h586f5a31;
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
      expv[0] = 32'hbecaaa91;
      expv[1] = 32'h6a225311;
      expv[2] = 32'he02aef0f;
      expv[3] = 32'h75a7104e;
      expv[4] = 32'h3a068665;
      expv[5] = 32'hd8a93cc9;
      expv[6] = 32'h503ce301;
      expv[7] = 32'h1fd0cf3f;
      expv[8] = 32'h09c0dbe4;
      expv[9] = 32'h251330d2;
      expv[10] = 32'h9149939a;
      expv[11] = 32'h1b20d75a;
      expv[12] = 32'h151ea354;
      expv[13] = 32'hd428b977;
      expv[14] = 32'h6866b30d;
      expv[15] = 32'h10f9fa09;
      expv[16] = 32'h3f130e2d;
      expv[17] = 32'hde03bf3f;
      expv[18] = 32'h1b5e1aef;
      expv[19] = 32'ha9fdad59;
      expv[20] = 32'h029af733;
      expv[21] = 32'hc63c6499;
      expv[22] = 32'h6b677354;
      expv[23] = 32'h7560e260;
      expv[24] = 32'h401256f0;
      expv[25] = 32'h85c2b639;
      expv[26] = 32'hc626366b;
      expv[27] = 32'h268766bf;
      expv[28] = 32'h5eea1e2a;
      expv[29] = 32'h8eac3cdb;
      expv[30] = 32'hf66b0aa6;
      expv[31] = 32'hee463649;
      expv[32] = 32'hdaa5de7d;
      expv[33] = 32'h3a54af30;
      expv[34] = 32'h0aff69b5;
      expv[35] = 32'h2c39d758;
      expv[36] = 32'h01d855b1;
      expv[37] = 32'hd10dc22a;
      expv[38] = 32'h982b24af;
      expv[39] = 32'h0bbdc701;
      expv[40] = 32'h170d1e7f;
      expv[41] = 32'hd2caf6df;
      expv[42] = 32'h70587a4c;
      expv[43] = 32'h872477c7;
      expv[44] = 32'ha085b27f;
      expv[45] = 32'h0c83b124;
      expv[46] = 32'h78697753;
      expv[47] = 32'h7f03cfab;
      expv[48] = 32'h4b7d2b55;
      expv[49] = 32'h23ec2c5a;
      expv[50] = 32'hc8ecc3c0;
      expv[51] = 32'h3b8985dc;
      expv[52] = 32'ha32f13ff;
      expv[53] = 32'h5ad44679;
      expv[54] = 32'h1bed0589;
      expv[55] = 32'h661d0ed8;
      expv[56] = 32'h8a412d77;
      expv[57] = 32'h89413160;
      expv[58] = 32'hbbca2c8a;
      expv[59] = 32'ha472c360;
      expv[60] = 32'hab89e422;
      expv[61] = 32'h98a23657;
      expv[62] = 32'h687fc53b;
      expv[63] = 32'h6f5a3158;
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
