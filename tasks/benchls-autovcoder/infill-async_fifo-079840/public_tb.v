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

  autovcoder_079840 dut (
    .wr_clk(clk),
    .rst(in_vec[35:35]),
    .wr_en(in_vec[34:34]),
    .wr_data(in_vec[33:2]),
    .rd_en(in_vec[1:1]),
    .rd_clk(in_vec[0:0]),
    .rd_data(out_vec[34:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .almost_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h8eee77f4a;
    stim[1] = 36'hbe7ed0ab9;
    stim[2] = 36'h2ca06ac59;
    stim[3] = 36'h4fc9dfb2c;
    stim[4] = 36'h2bfcc8de3;
    stim[5] = 36'h5a9fa861d;
    stim[6] = 36'h56f4a8485;
    stim[7] = 36'h5041413f4;
    stim[8] = 36'h2b00e8661;
    stim[9] = 36'h37c4da5e9;
    stim[10] = 36'h5ba4d2498;
    stim[11] = 36'h15c70f2bd;
    stim[12] = 36'h745fbb965;
    stim[13] = 36'h0c5325342;
    stim[14] = 36'h567f542ce;
    stim[15] = 36'h339b1106c;
    stim[16] = 36'h049ecd3b6;
    stim[17] = 36'h3f25da342;
    stim[18] = 36'h523f53359;
    stim[19] = 36'h1332b3fbf;
    stim[20] = 36'h7b78d8e96;
    stim[21] = 36'h24a49ce73;
    stim[22] = 36'h3502183dc;
    stim[23] = 36'h795a21671;
    stim[24] = 36'h196467790;
    stim[25] = 36'h67cfabf11;
    stim[26] = 36'h334bd60d2;
    stim[27] = 36'h05e29c585;
    stim[28] = 36'h5e68fc8c2;
    stim[29] = 36'h2cd646a01;
    stim[30] = 36'h4788351de;
    stim[31] = 36'h0a503cc26;
    stim[32] = 36'h30896126d;
    stim[33] = 36'h16da18cbe;
    stim[34] = 36'h6a430b949;
    stim[35] = 36'h0ef1b50ac;
    stim[36] = 36'h0c363efcd;
    stim[37] = 36'h065d7bb4a;
    stim[38] = 36'h21f7e39ce;
    stim[39] = 36'hab4bb183d;
    stim[40] = 36'h6a7213ad7;
    stim[41] = 36'h438347c97;
    stim[42] = 36'h461a6f248;
    stim[43] = 36'h1dcacf7e0;
    stim[44] = 36'h274c7edae;
    stim[45] = 36'h0c05bf63e;
    stim[46] = 36'h52e9e582d;
    stim[47] = 36'h5cf232faa;
    stim[48] = 36'h3d5700594;
    stim[49] = 36'h28097a9cd;
    stim[50] = 36'h0015f1d7c;
    stim[51] = 36'h3ddc415ec;
    stim[52] = 36'h3d7ee9530;
    stim[53] = 36'h66b9250a8;
    stim[54] = 36'h6f5f20b0b;
    stim[55] = 36'h7a1755411;
    stim[56] = 36'h0c2411016;
    stim[57] = 36'h0ec138675;
    stim[58] = 36'h41ea990e1;
    stim[59] = 36'h337910294;
    stim[60] = 36'h445ea1a6b;
    stim[61] = 36'h351a38846;
    stim[62] = 36'h140bc4ca5;
    stim[63] = 36'h69537f132;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'hxxxxxxxxx;
      expv[4] = 35'hxxxxxxxxx;
      expv[5] = 35'hxxxxxxxxx;
      expv[6] = 35'hxxxxxxxxx;
      expv[7] = 35'hxxxxxxxxx;
      expv[8] = 35'hxxxxxxxxx;
      expv[9] = 35'hxxxxxxxxx;
      expv[10] = 35'hxxxxxxxxx;
      expv[11] = 35'hxxxxxxxxx;
      expv[12] = 35'hxxxxxxxxx;
      expv[13] = 35'hxxxxxxxxx;
      expv[14] = 35'hxxxxxxxxx;
      expv[15] = 35'hxxxxxxxxx;
      expv[16] = 35'hxxxxxxxxx;
      expv[17] = 35'hxxxxxxxxx;
      expv[18] = 35'hxxxxxxxxx;
      expv[19] = 35'hxxxxxxxxx;
      expv[20] = 35'hxxxxxxxxx;
      expv[21] = 35'hxxxxxxxxx;
      expv[22] = 35'hxxxxxxxxx;
      expv[23] = 35'h68bf772c8;
      expv[24] = 35'h68bf772c8;
      expv[25] = 35'h2cfea8598;
      expv[26] = 35'h2cfea8598;
      expv[27] = 35'h2cfea8598;
      expv[28] = 35'hxxxxxxxxx;
      expv[29] = 35'hxxxxxxxxx;
      expv[30] = 35'hxxxxxxxxx;
      expv[31] = 35'hxxxxxxxxx;
      expv[32] = 35'hxxxxxxxxx;
      expv[33] = 35'hxxxxxxxxx;
      expv[34] = 35'hxxxxxxxxx;
      expv[35] = 35'hxxxxxxxxx;
      expv[36] = 35'hxxxxxxxxx;
      expv[37] = 35'hxxxxxxxxx;
      expv[38] = 35'hxxxxxxxxx;
      expv[39] = 35'h3cd1f9182;
      expv[40] = 35'h3cd1f9182;
      expv[41] = 35'h0f106a3ba;
      expv[42] = 35'h0f106a3ba;
      expv[43] = 35'h0f106a3ba;
      expv[44] = 35'h0f106a3ba;
      expv[45] = 35'h548617292;
      expv[46] = 35'h548617292;
      expv[47] = 35'h548617292;
      expv[48] = 35'h548617292;
      expv[49] = 35'h4f9f57e22;
      expv[50] = 35'h4f9f57e22;
      expv[51] = 35'h4f9f57e22;
      expv[52] = 35'h4f9f57e22;
      expv[53] = 35'h4f9f57e22;
      expv[54] = 35'h4f9f57e22;
      expv[55] = 35'h4f9f57e22;
      expv[56] = 35'h4f9f57e20;
      expv[57] = 35'h4f9f57e20;
      expv[58] = 35'h4f9f57e20;
      expv[59] = 35'h4f9f57e20;
      expv[60] = 35'h4f9f57e20;
      expv[61] = 35'h4f9f57e20;
      expv[62] = 35'h4f9f57e20;
      expv[63] = 35'h4f9f57e20;
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
