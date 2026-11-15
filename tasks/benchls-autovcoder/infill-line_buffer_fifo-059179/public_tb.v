// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059179 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .fifo_enable(in_vec[64:64]),
    .fifo_data_in(in_vec[63:32]),
    .fifo_data_in_2(in_vec[31:0]),
    .fifo_data_out_1(out_vec[127:96]),
    .fifo_data_out_2(out_vec[95:64]),
    .fifo_data_out_3(out_vec[63:32]),
    .fifo_data_out_4(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h233ea3d681d230fc7;
    stim[1] = 66'h25659725fb0bf0840;
    stim[2] = 66'h0e2d66b79463b0b30;
    stim[3] = 66'h0e71afeb60d1c4ea5;
    stim[4] = 66'h1df36b24a6a4b21e7;
    stim[5] = 66'h0f18642f6ce6d1736;
    stim[6] = 66'h17310d2c93dabdb2c;
    stim[7] = 66'h03d765d6fe9b063e5;
    stim[8] = 66'h0622f6ab3148b48c9;
    stim[9] = 66'h112320945c630a238;
    stim[10] = 66'h091135109eb6af980;
    stim[11] = 66'h08c44210f4e5e5626;
    stim[12] = 66'h18419f8493c4ff974;
    stim[13] = 66'h08c6255695e8f19e1;
    stim[14] = 66'h0ddc0662fc3f2e487;
    stim[15] = 66'h150de7f4e250864ab;
    stim[16] = 66'h0e174fb0f83eacf6a;
    stim[17] = 66'h00675486f3360118a;
    stim[18] = 66'h0aed72415a12e0f92;
    stim[19] = 66'h06c29c2e1f744b4fd;
    stim[20] = 66'h0450f727ca8a65e9f;
    stim[21] = 66'h08bdffc0b3a3529af;
    stim[22] = 66'h13540267af43326b3;
    stim[23] = 66'h13296881e62183973;
    stim[24] = 66'h3b0eae59e8b61e10d;
    stim[25] = 66'h0cb6068d4b38dbb50;
    stim[26] = 66'h07275a402eeb1050d;
    stim[27] = 66'h1e7fca9688c28cc6a;
    stim[28] = 66'h09af735391951a788;
    stim[29] = 66'h04cac955f707d9dea;
    stim[30] = 66'h1a8d9a3f6d4519f00;
    stim[31] = 66'h032d342a47c449225;
    stim[32] = 66'h07eb80ec8511ffd25;
    stim[33] = 66'h1d034f8415a184e69;
    stim[34] = 66'h0e55780e4a2e3f635;
    stim[35] = 66'h19f87735a7373bfe5;
    stim[36] = 66'h138f90ea956b30d3a;
    stim[37] = 66'h026546dd9b0adf8d1;
    stim[38] = 66'h1acf4786a8b38a02f;
    stim[39] = 66'h0dd5f6ca59d80c2d9;
    stim[40] = 66'h1f74bcb2c54fd55f6;
    stim[41] = 66'h0c62678e2b881a016;
    stim[42] = 66'h09f91cbcd32a756a0;
    stim[43] = 66'h19fee7dd48ee59f4f;
    stim[44] = 66'h049717e6ac3ea22cd;
    stim[45] = 66'h0f9ab579e678a31aa;
    stim[46] = 66'h122c30f790214876c;
    stim[47] = 66'h0bb44ebecb353bdbd;
    stim[48] = 66'h06f9826213605aaeb;
    stim[49] = 66'h12f91b1fbb1e727df;
    stim[50] = 66'h1273b6dc6468780d5;
    stim[51] = 66'h144f88b3636a34c3d;
    stim[52] = 66'h15f4d7850d0d87731;
    stim[53] = 66'h08f4b1c4f328ccddc;
    stim[54] = 66'h181f64d502c60fb68;
    stim[55] = 66'h10883e96e6a9dab4f;
    stim[56] = 66'h0c17a4530862c92da;
    stim[57] = 66'h07d6c984b92ea2c2b;
    stim[58] = 66'h11f5afd0b602d605a;
    stim[59] = 66'h1bceb8509d4d67ef0;
    stim[60] = 66'h1a7cee1c1fabfca97;
    stim[61] = 66'h12e1580c7044c49bb;
    stim[62] = 66'h1925a74009602a847;
    stim[63] = 66'h16998e5bc406a6aa4;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'h00000000000000000000000000000000;
      expv[4] = 128'h00000000000000000000000000000000;
      expv[5] = 128'h0000000000000000df36b24a6a4b21e7;
      expv[6] = 128'h0000000000000000df36b24a6a4b21e7;
      expv[7] = 128'h00000000000000007310d2c93dabdb2c;
      expv[8] = 128'h00000000000000007310d2c93dabdb2c;
      expv[9] = 128'h00000000000000007310d2c93dabdb2c;
      expv[10] = 128'h000000000000000012320945c630a238;
      expv[11] = 128'h000000000000000012320945c630a238;
      expv[12] = 128'h000000000000000012320945c630a238;
      expv[13] = 128'h00000000000000008419f8493c4ff974;
      expv[14] = 128'h00000000000000008419f8493c4ff974;
      expv[15] = 128'h00000000000000008419f8493c4ff974;
      expv[16] = 128'h000000000000000050de7f4e250864ab;
      expv[17] = 128'h000000000000000050de7f4e250864ab;
      expv[18] = 128'h000000000000000050de7f4e250864ab;
      expv[19] = 128'h000000000000000050de7f4e250864ab;
      expv[20] = 128'h000000000000000050de7f4e250864ab;
      expv[21] = 128'h000000000000000050de7f4e250864ab;
      expv[22] = 128'h000000000000000050de7f4e250864ab;
      expv[23] = 128'h00000000000000003540267af43326b3;
      expv[24] = 128'h00000000000000000000000000000000;
      expv[25] = 128'h00000000000000000000000000000000;
      expv[26] = 128'h00000000000000000000000000000000;
      expv[27] = 128'h00000000000000000000000000000000;
      expv[28] = 128'h0000000000000000e7fca9688c28cc6a;
      expv[29] = 128'h0000000000000000e7fca9688c28cc6a;
      expv[30] = 128'h0000000000000000e7fca9688c28cc6a;
      expv[31] = 128'h0000000000000000a8d9a3f6d4519f00;
      expv[32] = 128'h0000000000000000a8d9a3f6d4519f00;
      expv[33] = 128'h0000000000000000a8d9a3f6d4519f00;
      expv[34] = 128'h0000000000000000d034f8415a184e69;
      expv[35] = 128'h0000000000000000d034f8415a184e69;
      expv[36] = 128'h00000000000000009f87735a7373bfe5;
      expv[37] = 128'h000000000000000038f90ea956b30d3a;
      expv[38] = 128'h000000000000000038f90ea956b30d3a;
      expv[39] = 128'h0000000000000000acf4786a8b38a02f;
      expv[40] = 128'h0000000000000000acf4786a8b38a02f;
      expv[41] = 128'h0000000000000000f74bcb2c54fd55f6;
      expv[42] = 128'h0000000000000000f74bcb2c54fd55f6;
      expv[43] = 128'h0000000000000000f74bcb2c54fd55f6;
      expv[44] = 128'h00000000000000009fee7dd48ee59f4f;
      expv[45] = 128'h00000000000000009fee7dd48ee59f4f;
      expv[46] = 128'h00000000000000009fee7dd48ee59f4f;
      expv[47] = 128'h000000000000000022c30f790214876c;
      expv[48] = 128'h000000000000000022c30f790214876c;
      expv[49] = 128'h000000000000000022c30f790214876c;
      expv[50] = 128'h00000000000000002f91b1fbb1e727df;
      expv[51] = 128'h0000000000000000273b6dc6468780d5;
      expv[52] = 128'h000000000000000044f88b3636a34c3d;
      expv[53] = 128'h00000000000000005f4d7850d0d87731;
      expv[54] = 128'h00000000000000005f4d7850d0d87731;
      expv[55] = 128'he7fca9688c28cc6a81f64d502c60fb68;
      expv[56] = 128'ha8d9a3f6d4519f000883e96e6a9dab4f;
      expv[57] = 128'ha8d9a3f6d4519f000883e96e6a9dab4f;
      expv[58] = 128'ha8d9a3f6d4519f000883e96e6a9dab4f;
      expv[59] = 128'hd034f8415a184e691f5afd0b602d605a;
      expv[60] = 128'h9f87735a7373bfe5bceb8509d4d67ef0;
      expv[61] = 128'h38f90ea956b30d3aa7cee1c1fabfca97;
      expv[62] = 128'hacf4786a8b38a02f2e1580c7044c49bb;
      expv[63] = 128'hf74bcb2c54fd55f6925a74009602a847;
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
