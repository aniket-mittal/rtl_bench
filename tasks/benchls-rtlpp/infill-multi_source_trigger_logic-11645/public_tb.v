// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 118;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11645 dut (
    .clk(clk),
    .reset(in_vec[117:117]),
    .data(in_vec[116:101]),
    .data_valid(in_vec[100:100]),
    .trigger_i(in_vec[99:98]),
    .trigger_in(in_vec[97:97]),
    .edge_detect_enable(in_vec[96:79]),
    .rise_edge_enable(in_vec[78:61]),
    .fall_edge_enable(in_vec[60:43]),
    .low_level_enable(in_vec[42:25]),
    .high_level_enable(in_vec[24:7]),
    .trigger_logic(in_vec[6:0]),
    .trigger_out(out_vec[1:1]),
    .trigger_out_adc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 118'h279fb4c37b3dfb3d909ae9c8743aee;
    stim[1] = 118'h2cdffd83d905f5f240224790cdadf3;
    stim[2] = 118'h15492aa924efbf7134a5cf09e8db68;
    stim[3] = 118'h13d0ea82a60fc7489b743a047d58b7;
    stim[4] = 118'h17e6f892e319c8e48a4c0dcfdd7aa1;
    stim[5] = 118'h1a1b441e58b529102abf23d106ed9c;
    stim[6] = 118'h0af97296b4dc458dc4f310e1ffbe02;
    stim[7] = 118'h07f974761e98cc49bc676b10ccb38c;
    stim[8] = 118'h106d2b070b1b98b6c0d619156b8157;
    stim[9] = 118'h1cfb19de217127082d961eef707bbc;
    stim[10] = 118'h1945234e3a6a0fd2e5317e762904ea;
    stim[11] = 118'h081b68ade9cde78b69f510fae1a4fc;
    stim[12] = 118'h095c6af448d264d434791ffb21d1b7;
    stim[13] = 118'h03060e78aff1856aa0d60c3a132cc2;
    stim[14] = 118'h1d72af6b9abdcf786d080f773a6eda;
    stim[15] = 118'h049a8092909a9a7c23c4d4d2cbd6ff;
    stim[16] = 118'h04cdcbb32806252e9cd48b92ce7898;
    stim[17] = 118'h19550dedd8a580a7ff5eacc71cd3a9;
    stim[18] = 118'h0191a25dbb0945f1ede0ee7df5b806;
    stim[19] = 118'h1837a17916bdc7699e3b0fdc6dffd4;
    stim[20] = 118'h030170a6eba71bef55463e4c759dfd;
    stim[21] = 118'h1256c1bca2ed4b3505077fbdcaef5b;
    stim[22] = 118'h1c765de080b8124931e599412afce7;
    stim[23] = 118'h1aed1344170dfe5d91605d85cf4577;
    stim[24] = 118'h0c86d22496c39f6eaef49fb72bfece;
    stim[25] = 118'h01e34c66661dd9abab90d6f162dd66;
    stim[26] = 118'h1b2717b576fbab648485d70b3f481d;
    stim[27] = 118'h1d1be211dac4ebc1fc4b97c5a1bab5;
    stim[28] = 118'h119dc9d5e233ff51923acbfd38b365;
    stim[29] = 118'h00fdae92fc42976fa00eeb911a3386;
    stim[30] = 118'h0f54746957c664fe07f3dc3cef088d;
    stim[31] = 118'h035108ec01fbbbc05111602494acc2;
    stim[32] = 118'h0f9d93e3b3340f7cbc850704b74d6e;
    stim[33] = 118'h16fd4aa0eef9c38ccdfa0510b9a584;
    stim[34] = 118'h17505af7288e8a895013bac2c5929d;
    stim[35] = 118'h087a48473ee3e6b8f7cd8bcb66798f;
    stim[36] = 118'h1108652aeb402f9dfac79a826d6404;
    stim[37] = 118'h191016099f0b646e6cdc9ad53b4143;
    stim[38] = 118'h1d3f22adb8be627c7f829bcf114d26;
    stim[39] = 118'h0be20b91059fbeb719ed75d5dd2d4d;
    stim[40] = 118'h09d11275a9a8a51de32ce246f287ee;
    stim[41] = 118'h19b9625783a6a199f442a600503207;
    stim[42] = 118'h055ffa0a42ab2e19adf7e369236ea2;
    stim[43] = 118'h0702e3aa1c507f673ae6e7c8ca6e29;
    stim[44] = 118'h2dd9da1aebcb0c965595320608abb8;
    stim[45] = 118'h077fef7589c2132a3f854b992ef7a3;
    stim[46] = 118'h1a2d0caf83e9d37f589e453002f403;
    stim[47] = 118'h197f1ce5e62191c5be7dfc58fdb107;
    stim[48] = 118'h0fee5d18af1e61323a362818c4cef4;
    stim[49] = 118'h11cd52fc600fdd32385461d4f70ad6;
    stim[50] = 118'h038ce53a8a3df6e3e51190ce96bc74;
    stim[51] = 118'h0924e80c3ce0277066a777d253c93f;
    stim[52] = 118'h17988e5b63f226789d4919a1bc6643;
    stim[53] = 118'h136754decb5b83f3ce5acddc420e05;
    stim[54] = 118'h09f89ff02140c7a936b193422f41fc;
    stim[55] = 118'h394b23ff7f733152821ecfcb5e5fef;
    stim[56] = 118'h1adc36ce30806754cb15a26d5cc074;
    stim[57] = 118'h03867cd42168fc94555ef3db96dc5e;
    stim[58] = 118'h0fe29f4ff9b3462e3eb948efbd7d9a;
    stim[59] = 118'h15627667ba69efb0c111fbcb29035b;
    stim[60] = 118'h1ccc89958f49d76a3c42f83dd1309a;
    stim[61] = 118'h1aeb5f661160ba1ac90807358b2427;
    stim[62] = 118'h1e8e31a44648b5cc3d01099ccee561;
    stim[63] = 118'h09be6ad1bed9429bdf62a8282d0d51;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'hx;
      expv[9] = 2'hx;
      expv[10] = 2'hx;
      expv[11] = 2'hx;
      expv[12] = 2'hx;
      expv[13] = 2'hx;
      expv[14] = 2'hx;
      expv[15] = 2'hx;
      expv[16] = 2'hx;
      expv[17] = 2'hx;
      expv[18] = 2'hx;
      expv[19] = 2'hx;
      expv[20] = 2'hx;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h2;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h1;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h1;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
