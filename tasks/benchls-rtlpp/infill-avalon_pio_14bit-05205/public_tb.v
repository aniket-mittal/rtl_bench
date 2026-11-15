// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05205 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[45:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1015b79bc5;
    stim[1] = 37'h09f4e72fae;
    stim[2] = 37'h02937c85a5;
    stim[3] = 37'h17a83a7904;
    stim[4] = 37'h1ed6c3ef66;
    stim[5] = 37'h0b0aed39ae;
    stim[6] = 37'h123d08a95e;
    stim[7] = 37'h0a304c1cd8;
    stim[8] = 37'h1e17bf9c5e;
    stim[9] = 37'h0e279d6447;
    stim[10] = 37'h1b87e42203;
    stim[11] = 37'h130b01478a;
    stim[12] = 37'h120b828462;
    stim[13] = 37'h1f715269d1;
    stim[14] = 37'h161b34f37f;
    stim[15] = 37'h03b37c26da;
    stim[16] = 37'h16bde0297c;
    stim[17] = 37'h177852df25;
    stim[18] = 37'h1e2dc46ce2;
    stim[19] = 37'h0b88b58ed4;
    stim[20] = 37'h036926d43f;
    stim[21] = 37'h1abe9b55ff;
    stim[22] = 37'h17cd14623c;
    stim[23] = 37'h0ade70883b;
    stim[24] = 37'h168404f34a;
    stim[25] = 37'h07fbbfedbb;
    stim[26] = 37'h168523d144;
    stim[27] = 37'h07e5c7120b;
    stim[28] = 37'h12956b1720;
    stim[29] = 37'h129f41389b;
    stim[30] = 37'h06199c229f;
    stim[31] = 37'h13b2d0439b;
    stim[32] = 37'h16b64fec63;
    stim[33] = 37'h062293060c;
    stim[34] = 37'h07a59b6780;
    stim[35] = 37'h1ecd7d8c2e;
    stim[36] = 37'h16a34946ca;
    stim[37] = 37'h12c0c0b1a3;
    stim[38] = 37'h1e374988b8;
    stim[39] = 37'h1e186d6dbc;
    stim[40] = 37'h02467d66ba;
    stim[41] = 37'h16e00d9e03;
    stim[42] = 37'h1e3c03d916;
    stim[43] = 37'h0ac59da8c6;
    stim[44] = 37'h0fe424253f;
    stim[45] = 37'h16bac6f306;
    stim[46] = 37'h0b71cbddc8;
    stim[47] = 37'h1aa12a8e2d;
    stim[48] = 37'h030e9fc990;
    stim[49] = 37'h17656bf193;
    stim[50] = 37'h0e4df2a05c;
    stim[51] = 37'h1a2c598c5c;
    stim[52] = 37'h0e72502f16;
    stim[53] = 37'h033ba2cef8;
    stim[54] = 37'h03326e8064;
    stim[55] = 37'h17636fe71a;
    stim[56] = 37'h136b0e40d2;
    stim[57] = 37'h171f2257d1;
    stim[58] = 37'h0fb569536f;
    stim[59] = 37'h0efd10a9c2;
    stim[60] = 37'h16aea6cb7c;
    stim[61] = 37'h1fbed9ce07;
    stim[62] = 37'h0a8a82b0da;
    stim[63] = 37'h03bf85d898;
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
      expv[0] = 46'h000000000000;
      expv[1] = 46'h000000000000;
      expv[2] = 46'h000000000000;
      expv[3] = 46'h000000000000;
      expv[4] = 46'h000000000000;
      expv[5] = 46'h000000000000;
      expv[6] = 46'h000000000000;
      expv[7] = 46'h000000000000;
      expv[8] = 46'h000000000000;
      expv[9] = 46'h000000000000;
      expv[10] = 46'h000000000000;
      expv[11] = 46'h000000000000;
      expv[12] = 46'h000000000000;
      expv[13] = 46'h000000000000;
      expv[14] = 46'h000000000000;
      expv[15] = 46'h000000000000;
      expv[16] = 46'h000000000000;
      expv[17] = 46'h000000000000;
      expv[18] = 46'h000000000000;
      expv[19] = 46'h000000000000;
      expv[20] = 46'h000000000000;
      expv[21] = 46'h000000000000;
      expv[22] = 46'h000000000000;
      expv[23] = 46'h000000000000;
      expv[24] = 46'h000000000000;
      expv[25] = 46'h000000000000;
      expv[26] = 46'h000000000000;
      expv[27] = 46'h000000000000;
      expv[28] = 46'h000000000000;
      expv[29] = 46'h000000000000;
      expv[30] = 46'h000000000000;
      expv[31] = 46'h229f0000229f;
      expv[32] = 46'h229f0000229f;
      expv[33] = 46'h229f0000229f;
      expv[34] = 46'h060c0000060c;
      expv[35] = 46'h060c0000060c;
      expv[36] = 46'h060c0000060c;
      expv[37] = 46'h060c0000060c;
      expv[38] = 46'h060c0000060c;
      expv[39] = 46'h060c0000060c;
      expv[40] = 46'h060c0000060c;
      expv[41] = 46'h060c0000060c;
      expv[42] = 46'h060c0000060c;
      expv[43] = 46'h060c0000060c;
      expv[44] = 46'h060c0000060c;
      expv[45] = 46'h060c0000060c;
      expv[46] = 46'h060c0000060c;
      expv[47] = 46'h060c0000060c;
      expv[48] = 46'h060c0000060c;
      expv[49] = 46'h060c0000060c;
      expv[50] = 46'h060c0000060c;
      expv[51] = 46'h060c0000060c;
      expv[52] = 46'h060c0000060c;
      expv[53] = 46'h060c0000060c;
      expv[54] = 46'h060c0000060c;
      expv[55] = 46'h060c0000060c;
      expv[56] = 46'h060c0000060c;
      expv[57] = 46'h060c0000060c;
      expv[58] = 46'h060c0000060c;
      expv[59] = 46'h060c0000060c;
      expv[60] = 46'h060c0000060c;
      expv[61] = 46'h060c0000060c;
      expv[62] = 46'h060c0000060c;
      expv[63] = 46'h060c0000060c;
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
