// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141450 dut (
    .tx_clk(clk),
    .tx_data(in_vec[19:4]),
    .tx_enable(in_vec[3:3]),
    .rx_data(in_vec[2:2]),
    .rx_enable(in_vec[1:1]),
    .rx_clk(in_vec[0:0]),
    .tx_out(out_vec[18:18]),
    .tx_busy(out_vec[17:17]),
    .rx_out(out_vec[16:1]),
    .rx_busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h88ee5;
    stim[1] = 20'h96a38;
    stim[2] = 20'h33fa0;
    stim[3] = 20'h81a37;
    stim[4] = 20'h9c720;
    stim[5] = 20'he8a81;
    stim[6] = 20'h9a6aa;
    stim[7] = 20'h0b297;
    stim[8] = 20'h2bee6;
    stim[9] = 20'h22137;
    stim[10] = 20'h7637b;
    stim[11] = 20'hbdda2;
    stim[12] = 20'hd1d0c;
    stim[13] = 20'ha2c6c;
    stim[14] = 20'hce976;
    stim[15] = 20'h71641;
    stim[16] = 20'h8ba1c;
    stim[17] = 20'ha5e9b;
    stim[18] = 20'h60fc7;
    stim[19] = 20'h6b56b;
    stim[20] = 20'hf2ddf;
    stim[21] = 20'h69a50;
    stim[22] = 20'hac4b6;
    stim[23] = 20'h5ba6d;
    stim[24] = 20'h5b902;
    stim[25] = 20'h5709c;
    stim[26] = 20'hb169e;
    stim[27] = 20'h90fa6;
    stim[28] = 20'h7c4b9;
    stim[29] = 20'ha4adf;
    stim[30] = 20'h5025a;
    stim[31] = 20'h07e95;
    stim[32] = 20'h74c11;
    stim[33] = 20'hb5eef;
    stim[34] = 20'ha8ee8;
    stim[35] = 20'haf082;
    stim[36] = 20'hb609e;
    stim[37] = 20'h462ff;
    stim[38] = 20'h60fa4;
    stim[39] = 20'hb0b60;
    stim[40] = 20'h6cc2f;
    stim[41] = 20'h09d67;
    stim[42] = 20'hddf9c;
    stim[43] = 20'h682df;
    stim[44] = 20'hea0ff;
    stim[45] = 20'h34934;
    stim[46] = 20'h4b93a;
    stim[47] = 20'h51cc0;
    stim[48] = 20'hf2a79;
    stim[49] = 20'ha7395;
    stim[50] = 20'h41c00;
    stim[51] = 20'h5cb13;
    stim[52] = 20'h247c3;
    stim[53] = 20'h3d16e;
    stim[54] = 20'he9df9;
    stim[55] = 20'h1c2d2;
    stim[56] = 20'h3e57a;
    stim[57] = 20'h5298a;
    stim[58] = 20'h1494b;
    stim[59] = 20'h511f8;
    stim[60] = 20'hccf9b;
    stim[61] = 20'h03d30;
    stim[62] = 20'h8395f;
    stim[63] = 20'h7caa5;
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
      expv[0] = 19'hx0000;
      expv[1] = 19'h00000;
      expv[2] = 19'h20000;
      expv[3] = 19'h00001;
      expv[4] = 19'h00001;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h20001;
      expv[8] = 19'h00001;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h20000;
      expv[12] = 19'h00000;
      expv[13] = 19'h20000;
      expv[14] = 19'h20000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h20001;
      expv[18] = 19'h20001;
      expv[19] = 19'h00001;
      expv[20] = 19'h20001;
      expv[21] = 19'h20001;
      expv[22] = 19'h00001;
      expv[23] = 19'h00000;
      expv[24] = 19'h20000;
      expv[25] = 19'h00000;
      expv[26] = 19'h20000;
      expv[27] = 19'h20000;
      expv[28] = 19'h00000;
      expv[29] = 19'h20000;
      expv[30] = 19'h20000;
      expv[31] = 19'h60000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h20000;
      expv[35] = 19'h20000;
      expv[36] = 19'h00000;
      expv[37] = 19'h20001;
      expv[38] = 19'h20001;
      expv[39] = 19'h00001;
      expv[40] = 19'h00000;
      expv[41] = 19'h20000;
      expv[42] = 19'h00000;
      expv[43] = 19'h20001;
      expv[44] = 19'h20001;
      expv[45] = 19'h60001;
      expv[46] = 19'h00001;
      expv[47] = 19'h20001;
      expv[48] = 19'h00000;
      expv[49] = 19'h20000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00001;
      expv[52] = 19'h00001;
      expv[53] = 19'h00001;
      expv[54] = 19'h20000;
      expv[55] = 19'h20000;
      expv[56] = 19'h00000;
      expv[57] = 19'h20000;
      expv[58] = 19'h20001;
      expv[59] = 19'h60001;
      expv[60] = 19'h20001;
      expv[61] = 19'h60001;
      expv[62] = 19'h00001;
      expv[63] = 19'h20001;
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
