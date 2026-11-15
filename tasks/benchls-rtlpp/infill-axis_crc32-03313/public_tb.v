// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03313 dut (
    .clk(clk),
    .reset_n(in_vec[35:35]),
    .s0_axis_tdata(in_vec[34:3]),
    .s0_axis_tvalid(in_vec[2:2]),
    .s0_axis_tlast(in_vec[1:1]),
    .m0_axis_tready(in_vec[0:0]),
    .s0_axis_tready(out_vec[34:34]),
    .m0_axis_tdata(out_vec[33:2]),
    .m0_axis_tvalid(out_vec[1:1]),
    .m0_axis_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h079c54ded;
    stim[1] = 36'h448eec206;
    stim[2] = 36'he9f8b804b;
    stim[3] = 36'heb512ae2e;
    stim[4] = 36'h813b1eb25;
    stim[5] = 36'hf89e0792e;
    stim[6] = 36'h99c5219a8;
    stim[7] = 36'h879f5235f;
    stim[8] = 36'hbaec8e18d;
    stim[9] = 36'h97d396ca9;
    stim[10] = 36'hd1badc331;
    stim[11] = 36'hfc34e3070;
    stim[12] = 36'he4109f29e;
    stim[13] = 36'hb25e0118a;
    stim[14] = 36'hd52c4bf25;
    stim[15] = 36'hd26b7c73d;
    stim[16] = 36'hf609ddf01;
    stim[17] = 36'hc74757ba7;
    stim[18] = 36'hb88015b6b;
    stim[19] = 36'h814198e28;
    stim[20] = 36'h808791223;
    stim[21] = 36'hd9b4f2ad0;
    stim[22] = 36'h9d423d284;
    stim[23] = 36'hc037a423d;
    stim[24] = 36'he727f175f;
    stim[25] = 36'hc4ffac174;
    stim[26] = 36'hfb899e65f;
    stim[27] = 36'hdd2d83c2a;
    stim[28] = 36'hd23a034df;
    stim[29] = 36'hd6e639109;
    stim[30] = 36'h9e68e28bc;
    stim[31] = 36'hea48481c3;
    stim[32] = 36'hf9b25100f;
    stim[33] = 36'heda555be3;
    stim[34] = 36'hc3d66f6c9;
    stim[35] = 36'h9ee22003e;
    stim[36] = 36'hafa6f2008;
    stim[37] = 36'he6e65ba08;
    stim[38] = 36'hb21c329b4;
    stim[39] = 36'h9558f555d;
    stim[40] = 36'h98fedf944;
    stim[41] = 36'h90e21fbdc;
    stim[42] = 36'hc0e321cdf;
    stim[43] = 36'hfd582afac;
    stim[44] = 36'ha42cb8d6b;
    stim[45] = 36'hf61055cf3;
    stim[46] = 36'hfb379cf94;
    stim[47] = 36'hca4f9d617;
    stim[48] = 36'h8cd9eae66;
    stim[49] = 36'hf5a87291a;
    stim[50] = 36'hadb0f4a19;
    stim[51] = 36'h8eabc1a43;
    stim[52] = 36'hc44a40440;
    stim[53] = 36'hf4818a8e0;
    stim[54] = 36'hd11bc8dbd;
    stim[55] = 36'hafc2c175d;
    stim[56] = 36'hae09fa884;
    stim[57] = 36'hbacbd6f4a;
    stim[58] = 36'hece90dce1;
    stim[59] = 36'hc34002b6c;
    stim[60] = 36'h873cfc2fe;
    stim[61] = 36'hb2dca5035;
    stim[62] = 36'hcdd00dd73;
    stim[63] = 36'hdeec2e4c1;
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
      expv[0] = 35'h400000000;
      expv[1] = 35'h400000000;
      expv[2] = 35'h400000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h000000000;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h000000000;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
