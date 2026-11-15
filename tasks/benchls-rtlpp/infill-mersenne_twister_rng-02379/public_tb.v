// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02379 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .output_axis_tready(in_vec[65:65]),
    .seed_val(in_vec[64:1]),
    .seed_start(in_vec[0:0]),
    .output_axis_tdata(out_vec[65:2]),
    .output_axis_tvalid(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4a57a243223e567b8;
    stim[1] = 67'h77e385ac71d564f34;
    stim[2] = 67'h05907d4e59d4423d3;
    stim[3] = 67'h0120a81e5501b01dd;
    stim[4] = 67'h276bb66461ad58768;
    stim[5] = 67'h39d8530924d3ad0a4;
    stim[6] = 67'h37718e09de18b3aa3;
    stim[7] = 67'h0ba9b5567d90255f5;
    stim[8] = 67'h25b7085690d45b577;
    stim[9] = 67'h1008978fa9802bb08;
    stim[10] = 67'h12d5538be8ed7f6bc;
    stim[11] = 67'h3907d6d59bf7e2527;
    stim[12] = 67'h30c742879a2286243;
    stim[13] = 67'h23146ce58c62d8936;
    stim[14] = 67'h3c3047a4e304c8090;
    stim[15] = 67'h37794f4ad42fb75c5;
    stim[16] = 67'h0b67661b6327c4108;
    stim[17] = 67'h00af1bb0b260adb29;
    stim[18] = 67'h234e3c4e0e49c41ea;
    stim[19] = 67'h0d3f9f330a553a6ac;
    stim[20] = 67'h349814e232501b3b2;
    stim[21] = 67'h3278ce35af3d32042;
    stim[22] = 67'h1ed89e1a66352ab22;
    stim[23] = 67'h12b603edf5020e091;
    stim[24] = 67'h1fdab72ad1c6f703b;
    stim[25] = 67'h1b0c02b5d133dbf61;
    stim[26] = 67'h1534906fc7a788606;
    stim[27] = 67'h35daef56f531f0915;
    stim[28] = 67'h0d7a87d617d0663bd;
    stim[29] = 67'h36da8d113ec4a5654;
    stim[30] = 67'h1f7c257573b58dae0;
    stim[31] = 67'h4f2b96dfc8a801e01;
    stim[32] = 67'h17e6bec4e2f00b62f;
    stim[33] = 67'h16f1500969c1f4cd2;
    stim[34] = 67'h0eff0d7ba17df4357;
    stim[35] = 67'h2dd2aed320f66b274;
    stim[36] = 67'h3e1ed18e43daaa9e5;
    stim[37] = 67'h3345c70186fb5f55e;
    stim[38] = 67'h1c08fb518a9672de6;
    stim[39] = 67'h2b5cb7d18dc473951;
    stim[40] = 67'h368d5188c13a1942f;
    stim[41] = 67'h1aaf627b6cb73322d;
    stim[42] = 67'h1c367e5bcc4e1e9fd;
    stim[43] = 67'h19d89ad775ad5e440;
    stim[44] = 67'h25c4ad6dd44249faa;
    stim[45] = 67'h09d7ab43850aa9a7d;
    stim[46] = 67'h1b5b723ed14e05e8a;
    stim[47] = 67'h0957a536b2a4d8404;
    stim[48] = 67'h0a11bfb1922bbbad0;
    stim[49] = 67'h053f04583b91b6de0;
    stim[50] = 67'h1c795e43ef3afd6cc;
    stim[51] = 67'h02340db59c6497002;
    stim[52] = 67'h3450647120319956f;
    stim[53] = 67'h1999e2c3792e1c549;
    stim[54] = 67'h0957abbef987149cb;
    stim[55] = 67'h0831227c13203de7f;
    stim[56] = 67'h0b49877e76de4974c;
    stim[57] = 67'h261e67ea819e9d70d;
    stim[58] = 67'h2a576e87bc94cda55;
    stim[59] = 67'h0b15242032245018b;
    stim[60] = 67'h27dfbc093e6023d87;
    stim[61] = 67'h14c4ee69c2a2c50b6;
    stim[62] = 67'h3903d80224091f718;
    stim[63] = 67'h0ad1d18c0b3250a31;
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
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h00000000000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h00000000000000001;
      expv[4] = 66'h00000000000000001;
      expv[5] = 66'h00000000000000001;
      expv[6] = 66'h00000000000000001;
      expv[7] = 66'h00000000000000001;
      expv[8] = 66'h00000000000000001;
      expv[9] = 66'h00000000000000001;
      expv[10] = 66'h00000000000000001;
      expv[11] = 66'h00000000000000001;
      expv[12] = 66'h00000000000000001;
      expv[13] = 66'h00000000000000001;
      expv[14] = 66'h00000000000000001;
      expv[15] = 66'h00000000000000001;
      expv[16] = 66'h00000000000000001;
      expv[17] = 66'h00000000000000001;
      expv[18] = 66'h00000000000000001;
      expv[19] = 66'h00000000000000001;
      expv[20] = 66'h00000000000000001;
      expv[21] = 66'h00000000000000001;
      expv[22] = 66'h00000000000000001;
      expv[23] = 66'h00000000000000001;
      expv[24] = 66'h00000000000000001;
      expv[25] = 66'h00000000000000001;
      expv[26] = 66'h00000000000000001;
      expv[27] = 66'h00000000000000001;
      expv[28] = 66'h00000000000000001;
      expv[29] = 66'h00000000000000001;
      expv[30] = 66'h00000000000000001;
      expv[31] = 66'h00000000000000001;
      expv[32] = 66'h00000000000000000;
      expv[33] = 66'h00000000000000001;
      expv[34] = 66'h00000000000000001;
      expv[35] = 66'h00000000000000001;
      expv[36] = 66'h00000000000000001;
      expv[37] = 66'h00000000000000001;
      expv[38] = 66'h00000000000000001;
      expv[39] = 66'h00000000000000001;
      expv[40] = 66'h00000000000000001;
      expv[41] = 66'h00000000000000001;
      expv[42] = 66'h00000000000000001;
      expv[43] = 66'h00000000000000001;
      expv[44] = 66'h00000000000000001;
      expv[45] = 66'h00000000000000001;
      expv[46] = 66'h00000000000000001;
      expv[47] = 66'h00000000000000001;
      expv[48] = 66'h00000000000000001;
      expv[49] = 66'h00000000000000001;
      expv[50] = 66'h00000000000000001;
      expv[51] = 66'h00000000000000001;
      expv[52] = 66'h00000000000000001;
      expv[53] = 66'h00000000000000001;
      expv[54] = 66'h00000000000000001;
      expv[55] = 66'h00000000000000001;
      expv[56] = 66'h00000000000000001;
      expv[57] = 66'h00000000000000001;
      expv[58] = 66'h00000000000000001;
      expv[59] = 66'h00000000000000001;
      expv[60] = 66'h00000000000000001;
      expv[61] = 66'h00000000000000001;
      expv[62] = 66'h00000000000000001;
      expv[63] = 66'h00000000000000001;
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
