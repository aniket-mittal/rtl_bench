// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02013 dut (
    .clk(clk),
    .start(in_vec[100:100]),
    .n(in_vec[99:96]),
    .c0(in_vec[95:88]),
    .c1(in_vec[87:80]),
    .c2(in_vec[79:72]),
    .c3(in_vec[71:64]),
    .c4(in_vec[63:56]),
    .c5(in_vec[55:48]),
    .c6(in_vec[47:40]),
    .c7(in_vec[39:32]),
    .c8(in_vec[31:24]),
    .c9(in_vec[23:16]),
    .c10(in_vec[15:8]),
    .c11(in_vec[7:0]),
    .outchan(out_vec[2:2]),
    .result(out_vec[1:1]),
    .result_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1573cb11e684d2764fae6d90dc;
    stim[1] = 101'h16d47d1b019e908b80055bdc9d;
    stim[2] = 101'h0ebeac0acb85df0dfe8809b740;
    stim[3] = 101'h18e83dbc0d1aecb604ef5f6c2b;
    stim[4] = 101'h0b97861cd3e0f66cb814854967;
    stim[5] = 101'h1274ede8fd1a4048ab9d0be1ff;
    stim[6] = 101'h1d2f62dc731eb2ddcfd59c1eaf;
    stim[7] = 101'h0793c14893d1c3e510b4074865;
    stim[8] = 101'h1261705af0109dd8b7be0fade6;
    stim[9] = 101'h07d7a639b4eb5df8b38b976272;
    stim[10] = 101'h1971cc97299afa5a07e9b245bb;
    stim[11] = 101'h04c96841cb9b46e41de60d4027;
    stim[12] = 101'h0da2b57db1f1e370f0475f4bba;
    stim[13] = 101'h0a1bf6df0390e1735bbdfd4939;
    stim[14] = 101'h08518cb25726fee087677031d6;
    stim[15] = 101'h01a4ddaea6f301582ca895bc81;
    stim[16] = 101'h004f01b46ed62886fbc0c09946;
    stim[17] = 101'h15039b9669026adb30b2669d8a;
    stim[18] = 101'h0594671a350b2c761c7f3e8414;
    stim[19] = 101'h00d0a3626177fecd50e044147e;
    stim[20] = 101'h1c3d164532038f324522cfdb39;
    stim[21] = 101'h19b1b93e512ab84068541c5bce;
    stim[22] = 101'h1a1128bd3f8f3c217fddad3e6c;
    stim[23] = 101'h12913022072b4ca854e79e7ea7;
    stim[24] = 101'h0264ee95e80e3bf18a349bac8d;
    stim[25] = 101'h149f2a4d95e9c530c396ff76dc;
    stim[26] = 101'h04912ea8c31d6520857d05d0ec;
    stim[27] = 101'h02df4a7410fc4ee822e4acfa0f;
    stim[28] = 101'h1b0193d1b5f5c4c03259c38155;
    stim[29] = 101'h027630383921b59c52748e281d;
    stim[30] = 101'h079cbbe367221c11b49002bfa7;
    stim[31] = 101'h1b92a8308294d1759aa8df85c0;
    stim[32] = 101'h0ab9034ceb6d7bb422aaeff640;
    stim[33] = 101'h011f3908739d2d35b4fee6e264;
    stim[34] = 101'h0a14bb043d489ffa195f6b8931;
    stim[35] = 101'h04219bde39284bbfc3a5e44fde;
    stim[36] = 101'h030474174e4d0aeb74ce576594;
    stim[37] = 101'h001cd55f1cc9e44dea93b7eea7;
    stim[38] = 101'h1c1efe4c278e3ea80b4a1c4379;
    stim[39] = 101'h1b2d89e1e6411213afa0835eda;
    stim[40] = 101'h032bab513b81da6c6b88f38de6;
    stim[41] = 101'h1f3e15519cc20891dabc9ae1fb;
    stim[42] = 101'h0457414f908591d36b9af8d73c;
    stim[43] = 101'h165e7728f039a286ff49dff645;
    stim[44] = 101'h06c030e101c17ed375bf259edf;
    stim[45] = 101'h089289b4dda60d7a4cd59301c2;
    stim[46] = 101'h1412ff582901139c5fa05f35f0;
    stim[47] = 101'h00764c8ca64c2c834e3815b62e;
    stim[48] = 101'h1ca05019b23e8e32c0d1852b50;
    stim[49] = 101'h15766a85fd219c120b5d8655f0;
    stim[50] = 101'h00cf868a071e05237d40757cdb;
    stim[51] = 101'h03a570fb81a0f8dcd103746098;
    stim[52] = 101'h08a9305d58f89162b645c3231e;
    stim[53] = 101'h11ad0de5b5da508270e820815b;
    stim[54] = 101'h048298a0459b326614d643817e;
    stim[55] = 101'h151b22e773a96a11b12e5e7d01;
    stim[56] = 101'h009b4da6e3fa91f9c733e8bf32;
    stim[57] = 101'h1b8c4c8ce823d2475f96268e13;
    stim[58] = 101'h04343ebe72509b61e1b2eb27c1;
    stim[59] = 101'h1b8188d922e7daef988c14fcfd;
    stim[60] = 101'h0eb825d2d12b4b3025ad6c6b00;
    stim[61] = 101'h14240211dcf49a8ef2c272a788;
    stim[62] = 101'h055a78be0379a5bfbabc3efe1d;
    stim[63] = 101'h0caff7572e650765c197c06393;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'hx;
      expv[8] = 3'hx;
      expv[9] = 3'hx;
      expv[10] = 3'hx;
      expv[11] = 3'hx;
      expv[12] = 3'hx;
      expv[13] = 3'hx;
      expv[14] = 3'hx;
      expv[15] = 3'hx;
      expv[16] = 3'hx;
      expv[17] = 3'hx;
      expv[18] = 3'hx;
      expv[19] = 3'hx;
      expv[20] = 3'hx;
      expv[21] = 3'hx;
      expv[22] = 3'hx;
      expv[23] = 3'hx;
      expv[24] = 3'hx;
      expv[25] = 3'hx;
      expv[26] = 3'hx;
      expv[27] = 3'hx;
      expv[28] = 3'hx;
      expv[29] = 3'hx;
      expv[30] = 3'hx;
      expv[31] = 3'hx;
      expv[32] = 3'hx;
      expv[33] = 3'hx;
      expv[34] = 3'hx;
      expv[35] = 3'hx;
      expv[36] = 3'hx;
      expv[37] = 3'hx;
      expv[38] = 3'hx;
      expv[39] = 3'hx;
      expv[40] = 3'hx;
      expv[41] = 3'hx;
      expv[42] = 3'hx;
      expv[43] = 3'hx;
      expv[44] = 3'hx;
      expv[45] = 3'hx;
      expv[46] = 3'hx;
      expv[47] = 3'hx;
      expv[48] = 3'hx;
      expv[49] = 3'hx;
      expv[50] = 3'hx;
      expv[51] = 3'hx;
      expv[52] = 3'hx;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h2;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h2;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
