// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05322 dut (
    .clk(clk),
    .addr(in_vec[72:51]),
    .datain(in_vec[50:19]),
    .req(in_vec[18:18]),
    .write(in_vec[17:17]),
    .spyin(in_vec[16:1]),
    .reset(in_vec[0:0]),
    .dataout(out_vec[55:24]),
    .ack(out_vec[23:23]),
    .decode(out_vec[22:22]),
    .spyout(out_vec[21:6]),
    .spyreg(out_vec[5:2]),
    .spyrd(out_vec[1:1]),
    .spywr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h13d0d4e941fc0c3f7f1;
    stim[1] = 73'h19cb4aca7ac02b3c18b;
    stim[2] = 73'h1923273404c6af08d0a;
    stim[3] = 73'h0a9d3ca8f42eb257a3c;
    stim[4] = 73'h10483eb47835b79f8c6;
    stim[5] = 73'h068988bfd1279c8ee7a;
    stim[6] = 73'h1626032270bd8551d3e;
    stim[7] = 73'h1481d532f518a6397e4;
    stim[8] = 73'h1939723aac93b6886f2;
    stim[9] = 73'h1c3da592ad85ccf3328;
    stim[10] = 73'h156525fca20afc8cfda;
    stim[11] = 73'h1685598f83d94ea5698;
    stim[12] = 73'h1a4c75c60f4f858b8d0;
    stim[13] = 73'h0fe0e46c67953bacb7e;
    stim[14] = 73'h1c44afdbe68d6434d61;
    stim[15] = 73'h1b818acd1e3a64080a2;
    stim[16] = 73'h072fc7e4be196977108;
    stim[17] = 73'h081214e77b7239374ee;
    stim[18] = 73'h037b4dd7b7108be3db8;
    stim[19] = 73'h16a0253a5fa6fae6dac;
    stim[20] = 73'h0252fec8542664ca808;
    stim[21] = 73'h1c93c3697c6add33fd4;
    stim[22] = 73'h1128103a0fa48bb8b7e;
    stim[23] = 73'h1d7e94352e8f0b6c6d4;
    stim[24] = 73'h1c3dad6806c28598e18;
    stim[25] = 73'h0b2d54078f08dbfe4de;
    stim[26] = 73'h161eaaadd60f902f008;
    stim[27] = 73'h1596c05d9c462e530cc;
    stim[28] = 73'h135014062a27d717686;
    stim[29] = 73'h006765980c9d84ee3ee;
    stim[30] = 73'h14edbcb968367e81ca2;
    stim[31] = 73'h0f4c67ae7404a0c9500;
    stim[32] = 73'h0854f25a2a5cf3fa516;
    stim[33] = 73'h0083f00478ee22e4b8c;
    stim[34] = 73'h03986adcdfd10633a84;
    stim[35] = 73'h064f62174c1c07241c6;
    stim[36] = 73'h15e0f7ccec98532f06a;
    stim[37] = 73'h1cbf495fb9fff486aae;
    stim[38] = 73'h152ebd3a0eabd5f9b2c;
    stim[39] = 73'h1ef7e9d194f1b6043e9;
    stim[40] = 73'h17924beaa49d3b1f044;
    stim[41] = 73'h17a69da91682fd0600c;
    stim[42] = 73'h0d78aa17aa15031dbf8;
    stim[43] = 73'h124c5c3feaee373b61c;
    stim[44] = 73'h133835608bde33904b6;
    stim[45] = 73'h0521419322b999f7122;
    stim[46] = 73'h1566bcb2fd7805478e2;
    stim[47] = 73'h18f279b6df6ffce678a;
    stim[48] = 73'h172b4b6eaff6913535a;
    stim[49] = 73'h1c5f5c9b1504a25a39a;
    stim[50] = 73'h1d85e130c15db94b30c;
    stim[51] = 73'h02f547175a553f78bfc;
    stim[52] = 73'h04f94480b106d8fe2ca;
    stim[53] = 73'h11be7b57cc792b74d08;
    stim[54] = 73'h10a58d73045be098e24;
    stim[55] = 73'h09fb265373c8d30a99c;
    stim[56] = 73'h1d142fa006ab02b3e22;
    stim[57] = 73'h16be84b11717a2a7c10;
    stim[58] = 73'h005bcaea9d8ac5b8cdc;
    stim[59] = 73'h174101a4130606575e8;
    stim[60] = 73'h0bf171422a6336a87e4;
    stim[61] = 73'h19736da639591d4a59e;
    stim[62] = 73'h002cd1f0957c660918a;
    stim[63] = 73'h08a8695ad9a41c8f3c0;
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
      expv[0] = 56'hxxxxxxxxxxxxx4;
      expv[1] = 56'hxxxxxxxxxxxxx4;
      expv[2] = 56'hxxxxxxxxxxxxx8;
      expv[3] = 56'hxxxxxxxxxxxxx4;
      expv[4] = 56'hxxxxxxxxxxxxx4;
      expv[5] = 56'hxxxxxxxxxxxxx4;
      expv[6] = 56'hxxxxxxxxxxxxx8;
      expv[7] = 56'hxxxxxxxxxxxxx8;
      expv[8] = 56'hxxxxxxxxxxxxx0;
      expv[9] = 56'hxxxxxxxxxxxxxc;
      expv[10] = 56'hxxxxxxxxxxxxxc;
      expv[11] = 56'hxxxxxxxxxxxxxc;
      expv[12] = 56'hxxxxxxxxxxxxxc;
      expv[13] = 56'hxxxxxxxxxxxxx0;
      expv[14] = 56'hxxxxxxxxxxxxxc;
      expv[15] = 56'hxxxxxxxxxxxxx4;
      expv[16] = 56'hxxxxxxxxxxxxxc;
      expv[17] = 56'hxxxxxxxxxxxxx4;
      expv[18] = 56'hxxxxxxxxxxxxxc;
      expv[19] = 56'hxxxxxxxxxxxxx8;
      expv[20] = 56'hxxxxxxxxxxxxx4;
      expv[21] = 56'hxxxxxxxxxxxxx8;
      expv[22] = 56'hxxxxxxxxxxxxx0;
      expv[23] = 56'hxxxxxxxxxxxxx0;
      expv[24] = 56'hxxxxxxxxxxxxx8;
      expv[25] = 56'hxxxxxxxxxxxxx0;
      expv[26] = 56'hxxxxxxxxxxxxx4;
      expv[27] = 56'hxxxxxxxxxxxxx0;
      expv[28] = 56'hxxxxxxxxxxxxx0;
      expv[29] = 56'hxxxxxxxxxxxxxc;
      expv[30] = 56'hxxxxxxxxxxxxx4;
      expv[31] = 56'hxxxxxxxxxxxxxc;
      expv[32] = 56'hxxxxxxxxxxxxx0;
      expv[33] = 56'hxxxxxxxxxxxxx0;
      expv[34] = 56'hxxxxxxxxxxxxx4;
      expv[35] = 56'hxxxxxxxxxxxxx0;
      expv[36] = 56'hxxxxxxxxxxxxxc;
      expv[37] = 56'hxxxxxxxxxxxxx8;
      expv[38] = 56'hxxxxxxxxxxxxx8;
      expv[39] = 56'hxxxxxxxxxxxxxc;
      expv[40] = 56'hxxxxxxxxxxxxxc;
      expv[41] = 56'hxxxxxxxxxxxxxc;
      expv[42] = 56'hxxxxxxxxxxxxx0;
      expv[43] = 56'hxxxxxxxxxxxxx0;
      expv[44] = 56'hxxxxxxxxxxxxx8;
      expv[45] = 56'hxxxxxxxxxxxxxc;
      expv[46] = 56'hxxxxxxxxxxxxx4;
      expv[47] = 56'hxxxxxxxxxxxxxc;
      expv[48] = 56'hxxxxxxxxxxxxx8;
      expv[49] = 56'hxxxxxxxxxxxxx4;
      expv[50] = 56'hxxxxxxxxxxxxx8;
      expv[51] = 56'hxxxxxxxxxxxxx8;
      expv[52] = 56'hxxxxxxxxxxxxx4;
      expv[53] = 56'hxxxxxxxxxxxxx8;
      expv[54] = 56'hxxxxxxxxxxxxx8;
      expv[55] = 56'hxxxxxxxxxxxxx0;
      expv[56] = 56'hxxxxxxxxxxxxxc;
      expv[57] = 56'hxxxxxxxxxxxxx4;
      expv[58] = 56'hxxxxxxxxxxxxx4;
      expv[59] = 56'hxxxxxxxxxxxxxc;
      expv[60] = 56'hxxxxxxxxxxxxx8;
      expv[61] = 56'hxxxxxxxxxxxxxc;
      expv[62] = 56'hxxxxxxxxxxxxxc;
      expv[63] = 56'hxxxxxxxxxxxxx8;
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
