// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194211 dut (
    .ClkEngress(clk),
    .ARst(in_vec[33:33]),
    .WriteData(in_vec[32:1]),
    .WriteDataValid(in_vec[0:0]),
    .Data(out_vec[9:2]),
    .DataValid(out_vec[1:1]),
    .Ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2f73dd9ba;
    stim[1] = 34'h2c0ce616a;
    stim[2] = 34'h1f1d097e5;
    stim[3] = 34'h0923a7b70;
    stim[4] = 34'h0cab4aacf;
    stim[5] = 34'h1c3b31c52;
    stim[6] = 34'h1282801a0;
    stim[7] = 34'h14654f244;
    stim[8] = 34'h03d59204f;
    stim[9] = 34'h13578b35e;
    stim[10] = 34'h01b762fb8;
    stim[11] = 34'h06805dddd;
    stim[12] = 34'h2300b487a;
    stim[13] = 34'h02cdae8c6;
    stim[14] = 34'h18dfdd7de;
    stim[15] = 34'h0c3e8201a;
    stim[16] = 34'h053202480;
    stim[17] = 34'h145116522;
    stim[18] = 34'h067310ccf;
    stim[19] = 34'h0cf30c105;
    stim[20] = 34'h0ed6dda7b;
    stim[21] = 34'h053f05dc1;
    stim[22] = 34'h09016bb78;
    stim[23] = 34'h1862f3dc4;
    stim[24] = 34'h147aa476d;
    stim[25] = 34'h18acca2a9;
    stim[26] = 34'h1d050ba16;
    stim[27] = 34'h014244c49;
    stim[28] = 34'h0d56d3921;
    stim[29] = 34'h084d0eef0;
    stim[30] = 34'h196f78bb0;
    stim[31] = 34'h1c64c58fe;
    stim[32] = 34'h083a3d914;
    stim[33] = 34'h1559a60ef;
    stim[34] = 34'h1bffdd4d2;
    stim[35] = 34'h0fd6dd46f;
    stim[36] = 34'h02b9846de;
    stim[37] = 34'h047a69771;
    stim[38] = 34'h0a02d22ef;
    stim[39] = 34'h084f2c488;
    stim[40] = 34'h20c77dfe3;
    stim[41] = 34'h1e08978d5;
    stim[42] = 34'h17ad7334c;
    stim[43] = 34'h130f28cf7;
    stim[44] = 34'h02b068b30;
    stim[45] = 34'h015807df3;
    stim[46] = 34'h0ec73bc94;
    stim[47] = 34'h04e0a05d6;
    stim[48] = 34'h1b961b6f5;
    stim[49] = 34'h01a38bc8f;
    stim[50] = 34'h08b42ee27;
    stim[51] = 34'h06f27d225;
    stim[52] = 34'h048a7cb61;
    stim[53] = 34'h0de856275;
    stim[54] = 34'h060453be1;
    stim[55] = 34'h381a647ad;
    stim[56] = 34'h1ea687119;
    stim[57] = 34'h147d62b91;
    stim[58] = 34'h153877b20;
    stim[59] = 34'h11e0ada77;
    stim[60] = 34'h0f3d33bbd;
    stim[61] = 34'h0184c241d;
    stim[62] = 34'h1f5b59dcd;
    stim[63] = 34'h0155f31f9;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'h12e;
      expv[5] = 10'h3a3;
      expv[6] = 10'h3e3;
      expv[7] = 10'h3cb;
      expv[8] = 10'h12f;
      expv[9] = 10'h3a3;
      expv[10] = 10'h07b;
      expv[11] = 10'h09f;
      expv[12] = 10'h241;
      expv[13] = 10'h241;
      expv[14] = 10'h3bb;
      expv[15] = 10'h3bb;
      expv[16] = 10'h00b;
      expv[17] = 10'h0d3;
      expv[18] = 10'h3bb;
      expv[19] = 10'h3ba;
      expv[20] = 10'h263;
      expv[21] = 10'h0ce;
      expv[22] = 10'h0f6;
      expv[23] = 10'h3b6;
      expv[24] = 10'h2db;
      expv[25] = 10'h1da;
      expv[26] = 10'h2da;
      expv[27] = 10'h08e;
      expv[28] = 10'h357;
      expv[29] = 10'h28e;
      expv[30] = 10'h242;
      expv[31] = 10'h272;
      expv[32] = 10'h2db;
      expv[33] = 10'h1ab;
      expv[34] = 10'h242;
      expv[35] = 10'h0c2;
      expv[36] = 10'h337;
      expv[37] = 10'h2ab;
      expv[38] = 10'h1de;
      expv[39] = 10'h12e;
      expv[40] = 10'h34d;
      expv[41] = 10'h34d;
      expv[42] = 10'h2e2;
      expv[43] = 10'h2f2;
      expv[44] = 10'h113;
      expv[45] = 10'h3c3;
      expv[46] = 10'h1aa;
      expv[47] = 10'h0fa;
      expv[48] = 10'h303;
      expv[49] = 10'h02a;
      expv[50] = 10'h1ea;
      expv[51] = 10'h36e;
      expv[52] = 10'h2c3;
      expv[53] = 10'h372;
      expv[54] = 10'h2c2;
      expv[55] = 10'h395;
      expv[56] = 10'h395;
      expv[57] = 10'h2c2;
      expv[58] = 10'h0e2;
      expv[59] = 10'h0d3;
      expv[60] = 10'h3d6;
      expv[61] = 10'h0ee;
      expv[62] = 10'h1b6;
      expv[63] = 10'h017;
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
