// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091304 dut (
    .clk(clk),
    .rst(in_vec[36:36]),
    .din0(in_vec[35:28]),
    .din1(in_vec[27:20]),
    .din2(in_vec[19:12]),
    .din3(in_vec[11:4]),
    .inv0(in_vec[3:3]),
    .inv1(in_vec[2:2]),
    .inv2(in_vec[1:1]),
    .inv3(in_vec[0:0]),
    .dout0(out_vec[35:28]),
    .dout1(out_vec[27:20]),
    .dout2(out_vec[19:12]),
    .dout3(out_vec[11:4]),
    .outv0(out_vec[3:3]),
    .outv1(out_vec[2:2]),
    .outv2(out_vec[1:1]),
    .outv3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1494559263;
    stim[1] = 37'h15f7961b0e;
    stim[2] = 37'h0a6ab5874d;
    stim[3] = 37'h1faae21900;
    stim[4] = 37'h0b21ac330c;
    stim[5] = 37'h06bfba3d06;
    stim[6] = 37'h0d64ba9cd8;
    stim[7] = 37'h0b22d650d5;
    stim[8] = 37'h0d462ff877;
    stim[9] = 37'h0a7b26c345;
    stim[10] = 37'h0eda2021fe;
    stim[11] = 37'h0365f62675;
    stim[12] = 37'h02da5247b7;
    stim[13] = 37'h0d8ebc585b;
    stim[14] = 37'h0671e8354c;
    stim[15] = 37'h09b50ec549;
    stim[16] = 37'h063507624a;
    stim[17] = 37'h038e7dca6d;
    stim[18] = 37'h05b64aff84;
    stim[19] = 37'h13c7f81abf;
    stim[20] = 37'h0d9a48b661;
    stim[21] = 37'h0d71c77cf9;
    stim[22] = 37'h084f394794;
    stim[23] = 37'h07bc373658;
    stim[24] = 37'h04715aac9a;
    stim[25] = 37'h05916bc153;
    stim[26] = 37'h07ee155db1;
    stim[27] = 37'h06a157d389;
    stim[28] = 37'h068f1871ad;
    stim[29] = 37'h081d26118e;
    stim[30] = 37'h0ec9e4d52f;
    stim[31] = 37'h0fb4b06bfb;
    stim[32] = 37'h0dd3634583;
    stim[33] = 37'h0460b787a7;
    stim[34] = 37'h097bd724f3;
    stim[35] = 37'h0d74559736;
    stim[36] = 37'h08bb4c7313;
    stim[37] = 37'h04b186608f;
    stim[38] = 37'h02483532a4;
    stim[39] = 37'h0c2f7b7168;
    stim[40] = 37'h011db01db5;
    stim[41] = 37'h0cfe04efd4;
    stim[42] = 37'h093b780e29;
    stim[43] = 37'h01c45f13c4;
    stim[44] = 37'h0753bb342a;
    stim[45] = 37'h0043b56c0a;
    stim[46] = 37'h0eb747d3c6;
    stim[47] = 37'h045799032d;
    stim[48] = 37'h093dd6a9b9;
    stim[49] = 37'h01e6f8d040;
    stim[50] = 37'h066c746e37;
    stim[51] = 37'h06a923e4e9;
    stim[52] = 37'h0fcf2bebbc;
    stim[53] = 37'h0eefc923f8;
    stim[54] = 37'h00258779d1;
    stim[55] = 37'h17beff408b;
    stim[56] = 37'h07f3be48b9;
    stim[57] = 37'h049f017139;
    stim[58] = 37'h0fc9fe556b;
    stim[59] = 37'h06caff22d4;
    stim[60] = 37'h0de8fe4cd5;
    stim[61] = 37'h0507fb357c;
    stim[62] = 37'h0e2b838823;
    stim[63] = 37'h01c65c4924;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000000;
      expv[6] = 36'h1a001a1ab;
      expv[7] = 36'ha3a31aa3d;
      expv[8] = 36'ha3a31aa30;
      expv[9] = 36'ha3d6d6d67;
      expv[10] = 36'h62d66262b;
      expv[11] = 36'hffff62ffd;
      expv[12] = 36'h343434ffe;
      expv[13] = 36'h34ededed7;
      expv[14] = 36'ha5eda5a5b;
      expv[15] = 36'hc5c5a5c5d;
      expv[16] = 36'h858585c5e;
      expv[17] = 36'h859b9b9b7;
      expv[18] = 36'h1e9b1e1eb;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h000000000;
      expv[22] = 36'h000000000;
      expv[23] = 36'h000000000;
      expv[24] = 36'hcfcfcf00e;
      expv[25] = 36'hcf7b7b7b7;
      expv[26] = 36'hf37bf3f3b;
      expv[27] = 36'hbcbcf3bcd;
      expv[28] = 36'hdbdbdbbce;
      expv[29] = 36'hdb6a6a6a7;
      expv[30] = 36'hf16af1f1b;
      expv[31] = 36'h6161f161d;
      expv[32] = 36'h52525261e;
      expv[33] = 36'h52fbfbfb7;
      expv[34] = 36'h9efb9e9eb;
      expv[35] = 36'h78789e78d;
      expv[36] = 36'h4f4f4f78e;
      expv[37] = 36'h4f4f4f780;
      expv[38] = 36'h454f4545b;
      expv[39] = 36'h66664566d;
      expv[40] = 36'h08080866e;
      expv[41] = 36'h08c2c2c27;
      expv[42] = 36'hdbc2dbdbb;
      expv[43] = 36'hdbc2dbdb0;
      expv[44] = 36'he2e2e2dbe;
      expv[45] = 36'he29393937;
      expv[46] = 36'h45934545b;
      expv[47] = 36'h56564556d;
      expv[48] = 36'h565645560;
      expv[49] = 36'h564545457;
      expv[50] = 36'h79457979b;
      expv[51] = 36'h794579790;
      expv[52] = 36'he3e3e379e;
      expv[53] = 36'he36a6a6a7;
      expv[54] = 36'hf26af2f2b;
      expv[55] = 36'h000000000;
      expv[56] = 36'h000000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h000000000;
      expv[60] = 36'h56565600e;
      expv[61] = 36'h56fcfcfc7;
      expv[62] = 36'h8ffc8f8fb;
      expv[63] = 36'he5e58fe5d;
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
