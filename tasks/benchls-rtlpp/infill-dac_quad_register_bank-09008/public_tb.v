// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09008 dut (
    .clk_i(clk),
    .rstn_i(in_vec[66:66]),
    .sys_addr(in_vec[65:34]),
    .sys_wdata(in_vec[33:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h733e61f04ce820cc4;
    stim[1] = 67'h713fcb67139b5643e;
    stim[2] = 67'h19d65cf08aa9e3ac8;
    stim[3] = 67'h0835547bf466698af;
    stim[4] = 67'h2b3f858186db6c08a;
    stim[5] = 67'h348776fef55301011;
    stim[6] = 67'h2e0b7836d6d0ad54e;
    stim[7] = 67'h241c79f67f5320f55;
    stim[8] = 67'h3ad91c79222fe9515;
    stim[9] = 67'h0239ea83cb937596d;
    stim[10] = 67'h00498c170d84f8249;
    stim[11] = 67'h02906958593dd36d5;
    stim[12] = 67'h36523c90ffb2b0a43;
    stim[13] = 67'h2a3920f943fc460ba;
    stim[14] = 67'h49cabd9d92758e26d;
    stim[15] = 67'h1ed33e760bd0b957f;
    stim[16] = 67'h3bc7af3d1a0cfe73c;
    stim[17] = 67'h146ddd020d4b1b48b;
    stim[18] = 67'h37e0e538fa25e2883;
    stim[19] = 67'h034af8a2c408594ec;
    stim[20] = 67'h3fbaa078fd4364cf4;
    stim[21] = 67'h399c5804e86cd5312;
    stim[22] = 67'h05e44884d38af68a9;
    stim[23] = 67'h0b7eb927edce57b54;
    stim[24] = 67'h3527cb91d5aed49c5;
    stim[25] = 67'h22d93fa1c74237f34;
    stim[26] = 67'h22670a920b10d21cc;
    stim[27] = 67'h1abb7ba7ec8c800d6;
    stim[28] = 67'h3a9f45a115f1e90f5;
    stim[29] = 67'h1354058e78809a902;
    stim[30] = 67'h18e23401d2cc661aa;
    stim[31] = 67'h0cc497f499d1387c2;
    stim[32] = 67'h2271b0f29fda2a6e7;
    stim[33] = 67'h1c5c8bfea21fca157;
    stim[34] = 67'h0a55a83b32f42b6d4;
    stim[35] = 67'h297b0c858da23110f;
    stim[36] = 67'h2b12ced2491f43df8;
    stim[37] = 67'h14e328a98074329f3;
    stim[38] = 67'h1fefb865bb1a2469a;
    stim[39] = 67'h2937705b0629d864c;
    stim[40] = 67'h04d9acc2be95d2405;
    stim[41] = 67'h365bb7c62335dcad0;
    stim[42] = 67'h0852d792cf03c301e;
    stim[43] = 67'h23c0460fd406779b7;
    stim[44] = 67'h1cdedf84bfc125be4;
    stim[45] = 67'h3c45cfbd96c1cc21e;
    stim[46] = 67'h35e93e9c312cdb1c7;
    stim[47] = 67'h3014315815b2707f0;
    stim[48] = 67'h1273fb72ec506bfc6;
    stim[49] = 67'h0d2724a133c0582cf;
    stim[50] = 67'h3febc48402445d544;
    stim[51] = 67'h23c825c567db89468;
    stim[52] = 67'h183651ee1ed766b83;
    stim[53] = 67'h3b72ca5a565d3da05;
    stim[54] = 67'h1720e0babb4dafdc2;
    stim[55] = 67'h35e0d764af235472c;
    stim[56] = 67'h33bc087a15345fad4;
    stim[57] = 67'h20fe6cc490ad97fc7;
    stim[58] = 67'h0ad40865c066bd4fb;
    stim[59] = 67'h1e5263005ce4794cb;
    stim[60] = 67'h36b775864d60c730f;
    stim[61] = 67'h0d0908225fc3f95fb;
    stim[62] = 67'h2f7eaa9e68272cf22;
    stim[63] = 67'h1432455f908a53536;
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
      expv[0] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000000;
      expv[2] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000001;
      expv[3] = 130'h03c0001380001d4000270000000000000;
      expv[4] = 130'h03c0001380001d4000270000000000000;
      expv[5] = 130'h03c0001380001d4000270000000000000;
      expv[6] = 130'h03c0001380001d4000270000000000000;
      expv[7] = 130'h03c0001380001d4000270000000000000;
      expv[8] = 130'h03c0001380001d4000270000000000000;
      expv[9] = 130'h03c0001380001d4000270000000000000;
      expv[10] = 130'h03c0001380001d4000270000000000000;
      expv[11] = 130'h03c0001380001d4000270000000000000;
      expv[12] = 130'h03c0001380001d4000270000000000000;
      expv[13] = 130'h03c0001380001d4000270000000000000;
      expv[14] = 130'h03c0001380001d4000270000000000000;
      expv[15] = 130'h03c0001380001d4000270000000000001;
      expv[16] = 130'h03c0001380001d4000270000000000000;
      expv[17] = 130'h03c0001380001d4000270000000000000;
      expv[18] = 130'h03c0001380001d4000270000000000000;
      expv[19] = 130'h03c0001380001d4000270000000000000;
      expv[20] = 130'h03c0001380001d4000270000000000000;
      expv[21] = 130'h03c0001380001d4000270000000000000;
      expv[22] = 130'h03c0001380001d4000270000000000000;
      expv[23] = 130'h03c0001380001d4000270000000000000;
      expv[24] = 130'h03c0001380001d4000270000000000000;
      expv[25] = 130'h03c0001380001d4000270000000000000;
      expv[26] = 130'h03c0001380001d4000270000000000000;
      expv[27] = 130'h03c0001380001d4000270000000000000;
      expv[28] = 130'h03c0001380001d4000270000000000000;
      expv[29] = 130'h03c0001380001d4000270000000000000;
      expv[30] = 130'h03c0001380001d4000270000000000000;
      expv[31] = 130'h03c0001380001d4000270000000000000;
      expv[32] = 130'h03c0001380001d4000270000000000000;
      expv[33] = 130'h03c0001380001d4000270000000000000;
      expv[34] = 130'h03c0001380001d4000270000000000000;
      expv[35] = 130'h03c0001380001d4000270000000000000;
      expv[36] = 130'h03c0001380001d4000270000000000000;
      expv[37] = 130'h03c0001380001d4000270000000000000;
      expv[38] = 130'h03c0001380001d4000270000000000000;
      expv[39] = 130'h03c0001380001d4000270000000000000;
      expv[40] = 130'h03c0001380001d4000270000000000000;
      expv[41] = 130'h03c0001380001d4000270000000000000;
      expv[42] = 130'h03c0001380001d4000270000000000000;
      expv[43] = 130'h03c0001380001d4000270000000000000;
      expv[44] = 130'h03c0001380001d4000270000000000000;
      expv[45] = 130'h03c0001380001d4000270000000000000;
      expv[46] = 130'h03c0001380001d4000270000000000000;
      expv[47] = 130'h03c0001380001d4000270000000000000;
      expv[48] = 130'h03c0001380001d4000270000000000000;
      expv[49] = 130'h03c0001380001d4000270000000000000;
      expv[50] = 130'h03c0001380001d4000270000000000000;
      expv[51] = 130'h03c0001380001d4000270000000000000;
      expv[52] = 130'h03c0001380001d4000270000000000000;
      expv[53] = 130'h03c0001380001d4000270000000000000;
      expv[54] = 130'h03c0001380001d4000270000000000000;
      expv[55] = 130'h03c0001380001d4000270000000000000;
      expv[56] = 130'h03c0001380001d4000270000000000000;
      expv[57] = 130'h03c0001380001d4000270000000000000;
      expv[58] = 130'h03c0001380001d4000270000000000000;
      expv[59] = 130'h03c0001380001d4000270000000000000;
      expv[60] = 130'h03c0001380001d4000270000000000000;
      expv[61] = 130'h03c0001380001d4000270000000000000;
      expv[62] = 130'h03c0001380001d4000270000000000000;
      expv[63] = 130'h03c0001380001d4000270000000000000;
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
