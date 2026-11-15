// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136800 dut (
    .clk(clk),
    .control(in_vec[49:18]),
    .src_adc_valid(in_vec[17:17]),
    .src_adc_data(in_vec[16:1]),
    .src_adc_enable(in_vec[0:0]),
    .status(out_vec[49:18]),
    .dst_adc_valid(out_vec[17:17]),
    .dst_adc_data(out_vec[16:1]),
    .dst_adc_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h379eb7984c688;
    stim[1] = 50'h2261384c34705;
    stim[2] = 50'h31d73d61489a7;
    stim[3] = 50'h18a23780fcabc;
    stim[4] = 50'h30332bc939448;
    stim[5] = 50'h3ae6fbea85c41;
    stim[6] = 50'h2dccacd07a310;
    stim[7] = 50'h3fd6d83207167;
    stim[8] = 50'h18bbd9b887967;
    stim[9] = 50'h1f2252423c137;
    stim[10] = 50'h0e674536b8a21;
    stim[11] = 50'h0962527b28635;
    stim[12] = 50'h3775d907e5a26;
    stim[13] = 50'h204e3dd47b491;
    stim[14] = 50'h29020a58d081b;
    stim[15] = 50'h0148fa4fa6518;
    stim[16] = 50'h21fef47c95414;
    stim[17] = 50'h355174dca314a;
    stim[18] = 50'h00fe5f21dcfbf;
    stim[19] = 50'h087aa50451027;
    stim[20] = 50'h2a57b2a6c059c;
    stim[21] = 50'h19c91a1b42ff9;
    stim[22] = 50'h13f97e5f23358;
    stim[23] = 50'h2e4355d9fb7b9;
    stim[24] = 50'h29fe8e402a25f;
    stim[25] = 50'h123cca7addedf;
    stim[26] = 50'h2da780bd051d6;
    stim[27] = 50'h3c428bdcacfb1;
    stim[28] = 50'h35f91514820b4;
    stim[29] = 50'h080cd87b90eef;
    stim[30] = 50'h1dd648c6916af;
    stim[31] = 50'h2eb744ad533d5;
    stim[32] = 50'h031addc63e5b8;
    stim[33] = 50'h1cfca0d9dca9e;
    stim[34] = 50'h1033cb9041178;
    stim[35] = 50'h22ee0228a8769;
    stim[36] = 50'h14553e18a0518;
    stim[37] = 50'h2a23f147888ba;
    stim[38] = 50'h09ae52a66d1b4;
    stim[39] = 50'h39f0e0f074e3a;
    stim[40] = 50'h39353c1d3514e;
    stim[41] = 50'h33cbf10dad657;
    stim[42] = 50'h0ed9902d39924;
    stim[43] = 50'h0b299eed60153;
    stim[44] = 50'h2e18d2295e14c;
    stim[45] = 50'h1c7d29810f6ad;
    stim[46] = 50'h0373f4a0a201a;
    stim[47] = 50'h20716c72e1706;
    stim[48] = 50'h0f04d1f2fc64d;
    stim[49] = 50'h326ba6428a705;
    stim[50] = 50'h33dc5282bb66a;
    stim[51] = 50'h2247b42814f3a;
    stim[52] = 50'h0970960740d74;
    stim[53] = 50'h2af341f41cccd;
    stim[54] = 50'h0954693b69627;
    stim[55] = 50'h391400f03a28e;
    stim[56] = 50'h24d224f4f60f9;
    stim[57] = 50'h0f04541b71b5a;
    stim[58] = 50'h079f7e3cc2ed7;
    stim[59] = 50'h298e04bf90347;
    stim[60] = 50'h1e6fd3050fd47;
    stim[61] = 50'h2e4fe6dcdaa1b;
    stim[62] = 50'h31220f8bec8c9;
    stim[63] = 50'h1f59c120fa518;
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
      expv[0] = 50'hxxxxxxxxxxxxx;
      expv[1] = 50'h00000000xxxxx;
      expv[2] = 50'h0000000034705;
      expv[3] = 50'h0000000014705;
      expv[4] = 50'h0000000014704;
      expv[5] = 50'h0000000014704;
      expv[6] = 50'h0000000014705;
      expv[7] = 50'h00000000x4704;
      expv[8] = 50'h0000000014705;
      expv[9] = 50'h0000000014705;
      expv[10] = 50'h00000000xxxxx;
      expv[11] = 50'h0000000038a21;
      expv[12] = 50'h00000000xxxxx;
      expv[13] = 50'h00000000xxxxx;
      expv[14] = 50'h0000000028635;
      expv[15] = 50'h0000000008635;
      expv[16] = 50'h0000000008634;
      expv[17] = 50'h0000000008634;
      expv[18] = 50'h0000000008634;
      expv[19] = 50'h0000000008635;
      expv[20] = 50'h0000000008635;
      expv[21] = 50'h0000000008634;
      expv[22] = 50'h0000000008635;
      expv[23] = 50'h0000000008634;
      expv[24] = 50'h000000003b7b9;
      expv[25] = 50'h000000003b491;
      expv[26] = 50'h000000001b491;
      expv[27] = 50'h00000000db490;
      expv[28] = 50'h000000002cfb1;
      expv[29] = 50'h000000000cfb0;
      expv[30] = 50'h000000000cfb1;
      expv[31] = 50'h00000000ccfb1;
      expv[32] = 50'h00000000ccfb1;
      expv[33] = 50'h000000000cfb0;
      expv[34] = 50'h000000000cfb0;
      expv[35] = 50'h000000000cfb0;
      expv[36] = 50'h0000000028769;
      expv[37] = 50'h0000000008768;
      expv[38] = 50'h0000000008768;
      expv[39] = 50'h00000000c8768;
      expv[40] = 50'h0000000008768;
      expv[41] = 50'h0000000008768;
      expv[42] = 50'h000000002d657;
      expv[43] = 50'h000000000d656;
      expv[44] = 50'h0000000020153;
      expv[45] = 50'h0000000000152;
      expv[46] = 50'h0000000000153;
      expv[47] = 50'h0000000000152;
      expv[48] = 50'h0000000000152;
      expv[49] = 50'h00000000f6921;
      expv[50] = 50'h0000000016921;
      expv[51] = 50'h0000000016920;
      expv[52] = 50'h0000000016920;
      expv[53] = 50'h0000000016920;
      expv[54] = 50'h0000000016921;
      expv[55] = 50'h0000000029627;
      expv[56] = 50'h0000000009626;
      expv[57] = 50'h00000000360f9;
      expv[58] = 50'h00000000160f8;
      expv[59] = 50'h00000000160f9;
      expv[60] = 50'h00000000160f9;
      expv[61] = 50'h00000000160f9;
      expv[62] = 50'h00000000160f9;
      expv[63] = 50'h000000003c64d;
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
