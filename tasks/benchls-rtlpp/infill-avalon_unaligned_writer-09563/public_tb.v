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

  rtlpp_09563 dut (
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
    stim[0] = 70'h351f88de2b8a0106b4;
    stim[1] = 70'h393db56d93a672efe2;
    stim[2] = 70'h066c10cf360bdefd72;
    stim[3] = 70'h08da61bbd575ab78ef;
    stim[4] = 70'h19043ebfba89415d51;
    stim[5] = 70'h1a9068c303e24b1e05;
    stim[6] = 70'h18a65c240d040ca1bc;
    stim[7] = 70'h09af4c40423c773b8e;
    stim[8] = 70'h0b9d274da7f29cfd7f;
    stim[9] = 70'h0af8b3ebdceea870b2;
    stim[10] = 70'h0d1ac2cbebc436a5f8;
    stim[11] = 70'h00612ac753f98fa265;
    stim[12] = 70'h1f69bbefec23008107;
    stim[13] = 70'h046db923e9d2c694c2;
    stim[14] = 70'h0127fb2538428c30f6;
    stim[15] = 70'h10bbeb1fb1ad15d040;
    stim[16] = 70'h18c05ee96d3b4c1992;
    stim[17] = 70'h1c0b46ea4fad2bcb89;
    stim[18] = 70'h048a26398d6959a818;
    stim[19] = 70'h1c696564c11d1493ce;
    stim[20] = 70'h02312dc7dcaf0b2fd9;
    stim[21] = 70'h165cc745ce3efc367d;
    stim[22] = 70'h0a3ce749be3f9c6704;
    stim[23] = 70'h0a4d8e69907cb45fe6;
    stim[24] = 70'h130c354bf0f8a040b5;
    stim[25] = 70'h0d76642946bf3b6853;
    stim[26] = 70'h1b278a69f6075f74fe;
    stim[27] = 70'h03540ab6c194819042;
    stim[28] = 70'h0e04001cee55913dbd;
    stim[29] = 70'h17ed874c27db210c4b;
    stim[30] = 70'h1f111f3fa0644bc0d4;
    stim[31] = 70'h1a0fa9b28c4c547b77;
    stim[32] = 70'h10501643c0d498a802;
    stim[33] = 70'h11797e8fa102d2cdb9;
    stim[34] = 70'h07e93ccb8e6d3db3fa;
    stim[35] = 70'h14a6f824827734299f;
    stim[36] = 70'h05cb0e2b89ac4e9e87;
    stim[37] = 70'h05447423ef7993a9a6;
    stim[38] = 70'h0450b9e05d7ce6358d;
    stim[39] = 70'h164f7d8a42f2940a76;
    stim[40] = 70'h0a32c3179e1655a5bc;
    stim[41] = 70'h2f0c2c32ad68527a55;
    stim[42] = 70'h17e1137d6f174e7cfe;
    stim[43] = 70'h0e092905786e720df8;
    stim[44] = 70'h1c3f614fe7d55ac2b9;
    stim[45] = 70'h14ed55d2e5b3acc45a;
    stim[46] = 70'h07eef9f0c3a50611ce;
    stim[47] = 70'h1c4561ff51b80edb34;
    stim[48] = 70'h02ea74d835abf37c29;
    stim[49] = 70'h17c4d11b68c24ac59f;
    stim[50] = 70'h0e2d9dbdcb6143e487;
    stim[51] = 70'h1ed28806d3d8a40035;
    stim[52] = 70'h17a766bce07dd03ff6;
    stim[53] = 70'h0d1df5da656047c9c4;
    stim[54] = 70'h112a4161ba9c581b53;
    stim[55] = 70'h1839aa14e1b2215cea;
    stim[56] = 70'h0cd2b21e2f693a6e70;
    stim[57] = 70'h0238cde9045fc64137;
    stim[58] = 70'h004ed43df6c7425dc3;
    stim[59] = 70'h0412502fc636b69b9e;
    stim[60] = 70'h07bd54448c66548fd4;
    stim[61] = 70'h1e4885ed804d692ce9;
    stim[62] = 70'h1fe14a022ddd822048;
    stim[63] = 70'h03460384745562e81e;
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
      expv[0] = 33'h18a0106b4;
      expv[1] = 33'h1a672efe2;
      expv[2] = 33'h00bdefd72;
      expv[3] = 33'h175ab78ee;
      expv[4] = 33'h089415d50;
      expv[5] = 33'h1e24b1e04;
      expv[6] = 33'h1040ca1bc;
      expv[7] = 33'h03c773b8e;
      expv[8] = 33'h1f29cfd7e;
      expv[9] = 33'h0eea870b2;
      expv[10] = 33'h1c436a5f8;
      expv[11] = 33'h1f98fa264;
      expv[12] = 33'h023008106;
      expv[13] = 33'h1d2c694c2;
      expv[14] = 33'h0428c30f6;
      expv[15] = 33'h1ad15d041;
      expv[16] = 33'h13b4c1992;
      expv[17] = 33'h1ad2bcb88;
      expv[18] = 33'h16959a818;
      expv[19] = 33'h11d1493cf;
      expv[20] = 33'h0af0b2fd8;
      expv[21] = 33'h03efc367c;
      expv[22] = 33'h03f9c6704;
      expv[23] = 33'h07cb45fe6;
      expv[24] = 33'h0f8a040b4;
      expv[25] = 33'h0bf3b6852;
      expv[26] = 33'h0075f74fe;
      expv[27] = 33'h194819042;
      expv[28] = 33'h055913dbc;
      expv[29] = 33'h1db210c4a;
      expv[30] = 33'h0644bc0d5;
      expv[31] = 33'h04c547b76;
      expv[32] = 33'h0d498a803;
      expv[33] = 33'h102d2cdb8;
      expv[34] = 33'h06d3db3fa;
      expv[35] = 33'h07734299e;
      expv[36] = 33'h1ac4e9e86;
      expv[37] = 33'h17993a9a6;
      expv[38] = 33'h17ce6358c;
      expv[39] = 33'h0f2940a76;
      expv[40] = 33'h01655a5bc;
      expv[41] = 33'h168527a54;
      expv[42] = 33'h1174e7cfe;
      expv[43] = 33'h06e720df8;
      expv[44] = 33'h1d55ac2b8;
      expv[45] = 33'h1b3acc45a;
      expv[46] = 33'h1a50611ce;
      expv[47] = 33'h1b80edb35;
      expv[48] = 33'h1abf37c28;
      expv[49] = 33'h0c24ac59e;
      expv[50] = 33'h16143e486;
      expv[51] = 33'h1d8a40034;
      expv[52] = 33'h07dd03ff7;
      expv[53] = 33'h16047c9c4;
      expv[54] = 33'h09c581b52;
      expv[55] = 33'h1b2215ceb;
      expv[56] = 33'h1693a6e70;
      expv[57] = 33'h05fc64136;
      expv[58] = 33'h0c7425dc2;
      expv[59] = 33'h036b69b9e;
      expv[60] = 33'h066548fd4;
      expv[61] = 33'h04d692ce8;
      expv[62] = 33'h1dd822048;
      expv[63] = 33'h05562e81e;
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
