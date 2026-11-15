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

  rtlpp_09549 dut (
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
    stim[0] = 70'h3254fb431ef0641841;
    stim[1] = 70'h30bf69f4cc2de0e33f;
    stim[2] = 70'h176fb14c7bf010ad59;
    stim[3] = 70'h00d083933503cac3ef;
    stim[4] = 70'h0fd0f8bafb2b8010a5;
    stim[5] = 70'h101a5890c50cea828e;
    stim[6] = 70'h07e0730ab89d4cd659;
    stim[7] = 70'h1ef0d13e7a30896687;
    stim[8] = 70'h1813202e7a893b55e2;
    stim[9] = 70'h14af55b90eb9a465f5;
    stim[10] = 70'h10a3d41ae279532481;
    stim[11] = 70'h111312d7b3bca15cfd;
    stim[12] = 70'h1516091af95b0ac7f4;
    stim[13] = 70'h1dbce5b0acb2219850;
    stim[14] = 70'h157150dcd9f777d179;
    stim[15] = 70'h030ffa1b10eb0e440c;
    stim[16] = 70'h03eea8376c3fb7fab8;
    stim[17] = 70'h0a927fda155c04b8e5;
    stim[18] = 70'h03e9cf9863056fd575;
    stim[19] = 70'h1a693876d3762efb83;
    stim[20] = 70'h0cc2ce21db53c6f267;
    stim[21] = 70'h0862015f439eab4862;
    stim[22] = 70'h1f2f14fcba4d5c328b;
    stim[23] = 70'h1d367ab4e446b90804;
    stim[24] = 70'h1fa44063a96d6d157c;
    stim[25] = 70'h0cacb94414cf8326b4;
    stim[26] = 70'h1a27804139d0789c4c;
    stim[27] = 70'h03a959fb5a6564b383;
    stim[28] = 70'h1f2a9e389e653d0344;
    stim[29] = 70'h00e476ebbc666def04;
    stim[30] = 70'h06529032b3cd0ea6ce;
    stim[31] = 70'h32616ba24aa4b0d89d;
    stim[32] = 70'h00599f4c7d12e3172d;
    stim[33] = 70'h00b2756d471f97ee27;
    stim[34] = 70'h09f061fffb133c21f3;
    stim[35] = 70'h0a2efe34b19241e548;
    stim[36] = 70'h1fd380173ef4c10244;
    stim[37] = 70'h0af519c09ed668c067;
    stim[38] = 70'h138887bc6ce92e3521;
    stim[39] = 70'h0c93738b67e91b0cea;
    stim[40] = 70'h0d4de037115660f655;
    stim[41] = 70'h15d6f8d0ee8dde231a;
    stim[42] = 70'h1673bc0311061c9317;
    stim[43] = 70'h15343a8e9c4c6e96dd;
    stim[44] = 70'h0c7388e5700f2f6ba2;
    stim[45] = 70'h1784e6f5e9f91437ce;
    stim[46] = 70'h03ba621ed3e2a010fd;
    stim[47] = 70'h1cf3b0352605ce0793;
    stim[48] = 70'h0c15046d1792936756;
    stim[49] = 70'h179d8b77e656a6323d;
    stim[50] = 70'h0edaceb6238c47c7c1;
    stim[51] = 70'h162b390c7e8aad2e48;
    stim[52] = 70'h1f18cb938188c21578;
    stim[53] = 70'h076c334a9209ed51a8;
    stim[54] = 70'h06642c6ddedbc4744a;
    stim[55] = 70'h1fbd68b2fde7a0eacb;
    stim[56] = 70'h0a329e6d3431dce070;
    stim[57] = 70'h187736761359aa65bf;
    stim[58] = 70'h1de34b908efe60d7fd;
    stim[59] = 70'h1f5e2d07173634fd6b;
    stim[60] = 70'h0fcfeaa0d8c4d2dd1f;
    stim[61] = 70'h1054b6ab5cf9bcb2bd;
    stim[62] = 70'h0b427e35bdec630457;
    stim[63] = 70'h16f0cf7bacab67c856;
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
      expv[0] = 33'h0f0641840;
      expv[1] = 33'h02de0e33e;
      expv[2] = 33'h1f010ad58;
      expv[3] = 33'h103cac3ee;
      expv[4] = 33'h12b8010a4;
      expv[5] = 33'h10cea828e;
      expv[6] = 33'h09d4cd658;
      expv[7] = 33'h030896686;
      expv[8] = 33'h0893b55e2;
      expv[9] = 33'h0b9a465f4;
      expv[10] = 33'h079532480;
      expv[11] = 33'h1bca15cfc;
      expv[12] = 33'h15b0ac7f5;
      expv[13] = 33'h0b2219850;
      expv[14] = 33'h1f777d178;
      expv[15] = 33'h0eb0e440c;
      expv[16] = 33'h03fb7fab8;
      expv[17] = 33'h15c04b8e4;
      expv[18] = 33'h1056fd574;
      expv[19] = 33'h1762efb82;
      expv[20] = 33'h153c6f266;
      expv[21] = 33'h19eab4862;
      expv[22] = 33'h04d5c328a;
      expv[23] = 33'h046b90804;
      expv[24] = 33'h16d6d157d;
      expv[25] = 33'h0cf8326b4;
      expv[26] = 33'h1d0789c4d;
      expv[27] = 33'h06564b382;
      expv[28] = 33'h0653d0344;
      expv[29] = 33'h0666def04;
      expv[30] = 33'h1cd0ea6ce;
      expv[31] = 33'h0a4b0d89c;
      expv[32] = 33'h112e3172c;
      expv[33] = 33'h11f97ee26;
      expv[34] = 33'h1133c21f2;
      expv[35] = 33'h19241e548;
      expv[36] = 33'h0f4c10244;
      expv[37] = 33'h0d668c066;
      expv[38] = 33'h0e92e3520;
      expv[39] = 33'h1e91b0cea;
      expv[40] = 33'h15660f654;
      expv[41] = 33'h08dde231a;
      expv[42] = 33'h1061c9316;
      expv[43] = 33'h04c6e96dc;
      expv[44] = 33'h00f2f6ba2;
      expv[45] = 33'h1f91437cf;
      expv[46] = 33'h1e2a010fc;
      expv[47] = 33'h005ce0792;
      expv[48] = 33'h192936756;
      expv[49] = 33'h056a6323c;
      expv[50] = 33'h18c47c7c0;
      expv[51] = 33'h08aad2e48;
      expv[52] = 33'h188c21579;
      expv[53] = 33'h009ed51a8;
      expv[54] = 33'h0dbc4744a;
      expv[55] = 33'h1e7a0eaca;
      expv[56] = 33'h031dce070;
      expv[57] = 33'h159aa65be;
      expv[58] = 33'h0fe60d7fc;
      expv[59] = 33'h13634fd6a;
      expv[60] = 33'h0c4d2dd1e;
      expv[61] = 33'h0f9bcb2bc;
      expv[62] = 33'h1ec630456;
      expv[63] = 33'h0ab67c856;
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
