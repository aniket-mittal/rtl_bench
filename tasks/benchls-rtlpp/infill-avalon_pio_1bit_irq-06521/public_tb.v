// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06521 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
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
    stim[0] = 38'h2c346d35aa;
    stim[1] = 38'h0d16f8e1fa;
    stim[2] = 38'h2b5734e6c0;
    stim[3] = 38'h3e3676ff38;
    stim[4] = 38'h179b332a3a;
    stim[5] = 38'h1e727707ae;
    stim[6] = 38'h27c03431db;
    stim[7] = 38'h23a48c0832;
    stim[8] = 38'h2778abdc27;
    stim[9] = 38'h2e66dea170;
    stim[10] = 38'h3213b0a53a;
    stim[11] = 38'h1361fa544e;
    stim[12] = 38'h3bca17b22e;
    stim[13] = 38'h2f4051ef9f;
    stim[14] = 38'h3a559fbda6;
    stim[15] = 38'h0660cde049;
    stim[16] = 38'h32ca823cca;
    stim[17] = 38'h36840bb30d;
    stim[18] = 38'h2b0b6873ac;
    stim[19] = 38'h0ed42cf310;
    stim[20] = 38'h03a457d4f5;
    stim[21] = 38'h329c91a4ac;
    stim[22] = 38'h1e1c938bff;
    stim[23] = 38'h12a88d661a;
    stim[24] = 38'h02af062b63;
    stim[25] = 38'h2bf7165fce;
    stim[26] = 38'h17c79006ab;
    stim[27] = 38'h13dc5bd4a1;
    stim[28] = 38'h0b703ed974;
    stim[29] = 38'h3366b44a6d;
    stim[30] = 38'h0e780b7ed7;
    stim[31] = 38'h16a134f934;
    stim[32] = 38'h13623befb3;
    stim[33] = 38'h0e8dbfc3e2;
    stim[34] = 38'h3af773a096;
    stim[35] = 38'h33bc42ee39;
    stim[36] = 38'h13d6a70d93;
    stim[37] = 38'h33a0fe387e;
    stim[38] = 38'h0a49bbb94b;
    stim[39] = 38'h1ee644c882;
    stim[40] = 38'h0f2570324d;
    stim[41] = 38'h068d57c949;
    stim[42] = 38'h12734f3193;
    stim[43] = 38'h333bee8606;
    stim[44] = 38'h26d07f7565;
    stim[45] = 38'h1ec6c2f8fc;
    stim[46] = 38'h322f93f702;
    stim[47] = 38'h2e1f11c86a;
    stim[48] = 38'h3ea28f5792;
    stim[49] = 38'h363ea0c349;
    stim[50] = 38'h0e4b1dcd7c;
    stim[51] = 38'h0e7fd749a9;
    stim[52] = 38'h074ce3063d;
    stim[53] = 38'h12bcd53aeb;
    stim[54] = 38'h2b509cd5b7;
    stim[55] = 38'h173f2ebf4c;
    stim[56] = 38'h26528a9010;
    stim[57] = 38'h23e7f33a35;
    stim[58] = 38'h22234e55f7;
    stim[59] = 38'h361fb857f9;
    stim[60] = 38'h2e8884d192;
    stim[61] = 38'h3f32bb5c94;
    stim[62] = 38'h0b9ceb0bb6;
    stim[63] = 38'h32416c2eaa;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
